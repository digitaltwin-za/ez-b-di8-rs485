/*******************************************************************************
  MPLAB Harmony Application Source File

  Company:
    Microchip Technology Inc.

  File Name:
    app.c

  Summary:
    This file contains the source code for the MPLAB Harmony application.

  Description:
    This file contains the source code for the MPLAB Harmony application.  It
    implements the logic of the application's state machine and it may call
    API routines of other MPLAB Harmony modules in the system, such as drivers,
    system services, and middleware.  However, it does not call any of the
    system interfaces (such as the "Initialize" and "Tasks" functions) of any of
    the modules in the system or make any assumptions about when those functions
    are called.  That is the responsibility of the configuration-specific system
    files.
 *******************************************************************************/

// *****************************************************************************
// *****************************************************************************
// Section: Included Files
// *****************************************************************************
// *****************************************************************************

#include <stdio.h>
#include <string.h>

#include "app.h"
#include "config/development/system/console/sys_console.h"
#include "peripheral/tmr/plib_tmr2.h"
#include "system/time/sys_time.h"
#include "driver/usart/drv_usart.h"
#include "peripheral/gpio/plib_gpio.h"
#include "driver/i2c/drv_i2c.h"
#include "system/debug/sys_debug.h"
#include "peripheral/i2c/plib_i2c1.h"
#include "peripheral/uart/plib_uart1.h"
#include "peripheral/uart/plib_uart3.h"
#include "peripheral/uart/plib_uart4.h"
#include "peripheral/uart/plib_uart2.h"
#include "system/console/src/sys_console_usb_cdc.h"
#include "system/command/sys_command.h"
#include "mb.h"
#include "mbcrc.h"
#include "modbus_inc/mb_slaveregister.h"
#include "modbus_inc/RS485_HAL.h"
// *****************************************************************************
// *****************************************************************************
// Section: Global Data Definitions
// *****************************************************************************
// *****************************************************************************

#define COM_485_1_FC DO_U4FC_PIN; /* Drives the WE/~RE of the 485 TSVR */
#define COM_485_2_FC DO_U2FC_PIN; /* Drives the WE/~RE of the 485 TSVR */

#define SERIAL_PORT_BUFFER_SIZE 512
#define SERIAL_PORT_COUNT 1


volatile static uint8_t comBuffer[SERIAL_PORT_COUNT][SERIAL_PORT_BUFFER_SIZE];
volatile static bool comDataRx[SERIAL_PORT_COUNT];
volatile static uint8_t consoleBuffer[SERIAL_PORT_BUFFER_SIZE];
volatile static uint16_t consoleBufferIndex = 0;

APP_DATA appData;
DRV_HANDLE time;
SYS_CONSOLE_HANDLE console;

static bool tick_1s = false;
static bool tick_10ms = false;

uint8_t i2c_write_buffer[I2C_EEPROM_PAGE_SIZE];
uint8_t i2c_read_buffer[I2C_EEPROM_PAGE_SIZE];
int data_in_buffer;
bool CRC_check;
volatile static uint8_t data_pass_buffer[SERIAL_PORT_BUFFER_SIZE];
uint16_t CRCcheck;
uint16_t CRCcheckIn;
bool data_tx = false;
char set[] = "Set\n\r";
int previous_value[8] = {0};
int current_value[8] = {0};
int debounce_counter = 0;
int temp_debounce = 0;


// *****************************************************************************
// *****************************************************************************
// Section: Application Callback Functions
// *****************************************************************************
// *****************************************************************************
void update_ui();

uint8_t UART_CUSTOM_READ() {
    uint8_t data_byte;
    while (U1STAbits.URXDA) {
        data_byte = U1RXREG;
    }
    return data_byte;
}

void APP_I2C_Callback(uintptr_t context) {

}

static volatile void APP_UART1_Rx_Callback(UART_EVENT event, uintptr_t context) {
    LED_2_Toggle();


    comDataRx[0] = true;
    //  SYS_CONSOLE_MESSAGE("U1 Rx\n\r");
}

static volatile void APP_UART2_Rx_Callback(UART_EVENT event, uintptr_t context) {

    comDataRx[1] = true;
    //        SYS_CONSOLE_MESSAGE("U2 Rx\n\r");
}

static volatile void APP_UART3_Rx_Callback(UART_EVENT event, uintptr_t context) {
    LED_3_Toggle();
    comDataRx[2] = true;
    //        SYS_CONSOLE_MESSAGE("U3 Rx\n\r");
}

static volatile void APP_UART4_Rx_Callback(UART_EVENT event, uintptr_t context) {
    LED_4_Toggle();
    comDataRx[3] = true;
    //        SYS_CONSOLE_MESSAGE("U4 Rx\n\r");
}

// *****************************************************************************
// *****************************************************************************
// Section: Application Local Functions
// *****************************************************************************
// *****************************************************************************

static uint8_t APP_EEPROM_UINT8_Read(
        uint16_t i2c_address,
        uint16_t memory_address) {
    i2c_write_buffer[0] = (memory_address & 0xFF00) >> 8;
    i2c_write_buffer[1] = (memory_address & 0x00FF);
    while (I2C1_IsBusy());
    I2C1_WriteRead(i2c_address, i2c_write_buffer, 2, i2c_read_buffer, 1);
    while (I2C1_IsBusy());
    I2C_ERROR err = I2C1_ErrorGet();
    if (err != I2C_ERROR_NONE) {
        SYS_ERROR_PRINT(SYS_ERROR_ERROR, "I2C READ8 Err: %lu\n\r", err);
        return 0xFF;
    }
    return i2c_read_buffer[0];
}

static uint32_t APP_EEPROM_UINT32_Read(
        uint16_t i2c_address,
        uint16_t memory_address) {
    uint32_t uResult;
    i2c_write_buffer[0] = (memory_address & 0xFF00) >> 8;
    i2c_write_buffer[1] = (memory_address & 0x00FF);
    while (I2C1_IsBusy());
    I2C1_WriteRead(i2c_address, i2c_write_buffer, 2, i2c_read_buffer, 4);
    while (I2C1_IsBusy());
    I2C_ERROR err = I2C1_ErrorGet();
    if (err != I2C_ERROR_NONE) {
        SYS_ERROR_PRINT(SYS_ERROR_ERROR, "I2C READ32 Err: %lu\n\r", err);
        return 0xFFFFFFFF;
    }
    uResult = (i2c_read_buffer[0] << 24) +
            (i2c_read_buffer[1] << 16)+
            (i2c_read_buffer[2] << 8) +
            (i2c_read_buffer[3]);
    return uResult;
}

static bool APP_EEPROM_UINT8_Write(
        uint16_t i2c_address,
        uint16_t memory_address,
        uint8_t data) {
    i2c_write_buffer[0] = (memory_address & 0xFF00) >> 8;
    i2c_write_buffer[1] = (memory_address & 0x00FF);
    i2c_write_buffer[2] = data;
    while (I2C1_IsBusy());
    I2C1_Write(i2c_address, i2c_write_buffer, 3);
    while (I2C1_IsBusy());
    I2C_ERROR err = I2C1_ErrorGet();
    if (err != I2C_ERROR_NONE) {
        SYS_ERROR_PRINT(SYS_ERROR_ERROR, "I2C WRITE Err: %lu\n\r", err);
        return false;
    }
    SYS_TIME_HANDLE hDelay;
    SYS_TIME_DelayMS(5, &hDelay);
    return true;
}

static bool APP_EEPROM_UINT32_Write(
        uint16_t i2c_address,
        uint16_t memory_address,
        uint32_t data) {

    i2c_write_buffer[0] = (memory_address & 0xFF00) >> 8;
    i2c_write_buffer[1] = (memory_address & 0x00FF);
    i2c_write_buffer[2] = (uint8_t) (data >> 24) & 0xFF;
    i2c_write_buffer[3] = (uint8_t) (data >> 16) & 0xFF;
    i2c_write_buffer[4] = (uint8_t) (data >> 8) & 0xFF;
    i2c_write_buffer[5] = (uint8_t) (data) & 0xFF;
    while (I2C1_IsBusy());
    I2C1_Write(i2c_address, i2c_write_buffer, 6);
    while (I2C1_IsBusy());
    I2C_ERROR err = I2C1_ErrorGet();
    if (err != I2C_ERROR_NONE) {
        SYS_ERROR_PRINT(SYS_ERROR_ERROR, "I2C WRITE Err: %lu\n\r", err);
        return false;
    }
    SYS_TIME_HANDLE hDelay;
    SYS_TIME_DelayMS(5, &hDelay);
    return true;

}

static size_t APP_UART1_Write(uint8_t* buf, uint16_t len) {
    DO_U1FC_Set();
    UART1_Write(buf, len);
}

static size_t APP_UART2_Write(uint8_t* buf, uint16_t len) {
    DO_U2FC_Set();
    UART2_Write(buf, len);
}

static size_t APP_UART4_Write(uint8_t* buf, uint16_t len) {
    DO_U4FC_Set();
    UART4_Write(buf, len);
}

static void APP_Load_Settings_From_Eeprom(void) {
    /**
     * Serial port settings for UART 1-4
     * Routing settings for UART 1-4
     */
}

static void App_Save_Settings_To_Eeprom(void) {
    /**
     * Serial port settings for UART 1-4
     * Routing settings for UART 1-4
     */
}

static bool APP_Is_Comm_Rx_Flag(void) {
    uint8_t i;
    for (i = 0; i < SERIAL_PORT_COUNT; i++)
        if (comDataRx[i])
            return true;
    return false;
}

void APP_1s_Tick(uintptr_t context) {
    tick_1s = true;
}

void APP_10ms_Tick(uintptr_t context) {
    tick_10ms = true;
}

static void APP_Parse_Console_Command(const char *data, uint16_t len) {


    uint16_t start = 0;
    while ((data[start] != '<') && (start < len))
        start++;
    if (start >= len)
        return;
    uint32_t baud_rate = 0;
    uint8_t data_bits = 0;
    uint8_t stop_bits = 0;
    uint8_t parity = 0;
    uint8_t id = 0;
    sscanf(&data[start + 1], "%u:%lu,%u,%u,%u", &id, &baud_rate, &data_bits, &stop_bits, &parity);
    SYS_CONSOLE_PRINT("port=%d,baud=%lu,db=%d,sb=%d,prty=%d\n\r",
            id,
            baud_rate,
            data_bits,
            stop_bits,
            parity
            );


}


// *****************************************************************************
// *****************************************************************************
// Section: Application Initialization and State Machine Functions
// *****************************************************************************
// *****************************************************************************

/*******************************************************************************
  Function:
    void APP_Initialize ( void )

  Remarks:
    See prototype in app.h.
 */

void APP_Initialize(void) {
    uint8_t i;
    /* Place the App state machine in its initial state. */
    appData.state = APP_STATE_INIT;
    for (i = 0; i < SERIAL_PORT_COUNT; i++) {
        memset(comBuffer[i], 0x00, SERIAL_PORT_BUFFER_SIZE);
        comDataRx[i] = 0;
    }
    AIO1_InputEnable();
    DIO1_Clear();
    DIO2_Clear();

    AIO2_InputEnable();
    DIO3_Clear();
    DIO4_Clear();

    AIO3_InputEnable();
    DIO5_Clear();
    DIO6_Clear();

    AIO4_InputEnable();
    DIO7_Clear();
    DIO8_Clear();

    AIO5_InputEnable();
    DIO9_Clear();
    DIO10_Clear();

    AIO6_InputEnable();
    DIO11_Clear();
    DIO12_Clear();

    AIO7_InputEnable();
    DIO13_Clear();
    DIO14_Clear();

    AIO8_InputEnable();
    DIO15_Clear();
    DIO16_Clear();


}

/******************************************************************************
  Function:
    void APP_Tasks ( void )

  Remarks:
    See prototype in app.h.
 */

void APP_Tasks(void) {
    uint16_t len = 0, count = 0;

    /* Check the application's current state. */
    switch (appData.state) {
            /* Application's initial state. */
        case APP_STATE_INIT:
        {
            data_in_buffer = 0;
            UART_SERIAL_SETUP uartSetup;
            uartSetup.baudRate = 9600;
            uartSetup.dataWidth = UART_DATA_8_BIT;
            uartSetup.parity = UART_PARITY_NONE;
            uartSetup.stopBits = UART_STOP_1_BIT;

            APP_Load_Settings_From_Eeprom();
            SYS_TIME_CallbackRegisterMS(APP_1s_Tick, NULL, 1000, SYS_TIME_PERIODIC);
            SYS_TIME_CallbackRegisterMS(APP_10ms_Tick, NULL, 10, SYS_TIME_PERIODIC);
            // RS 232 Port (Pin header on base boarD)
            uartSetup.baudRate = 9600;
            uartSetup.dataWidth = UART_DATA_8_BIT;
            uartSetup.parity = UART_PARITY_NONE;
            uartSetup.stopBits = UART_STOP_1_BIT;
            UART1_SerialSetup(&uartSetup, 0);
            UART1_ReadCallbackRegister(APP_UART1_Rx_Callback, NULL);
            UART1_ReadThresholdSet(1);
            UART1_ReadNotificationEnable(true, false);
            previous_value[0] = !AIO1_Get();
            previous_value[1] = !AIO2_Get();
            previous_value[2] = !AIO3_Get();
            previous_value[3] = !AIO4_Get();
            previous_value[4] = !AIO5_Get();
            previous_value[5] = !AIO6_Get();
            previous_value[6] = !AIO7_Get();
            previous_value[7] = !AIO8_Get();




            console = SYS_CONSOLE_HandleGet(0);
            for (int i = 0; i < Holding_Register_Read_L; i++) {
                Modbus_Slave_EnablePoint(MODBUS_FUNCTION_READ_HOLDING_REGISTER, i, 1);
            }
            for (int i = 0; i < Holding_Register_Read_L; i++) {
                Modbus_Slave_Holding_Register_Store(0, i);
            }
            bool appInitialized = true;
            if (appInitialized) {

                appData.state = APP_STATE_SERVICE_TASKS;
            }
            break;
        }

        case APP_STATE_SERVICE_TASKS:
        {
            //
            uint8_t i;
            if (DO_U1FC_Get() && !IEC1bits.U1TXIE && U1STAbits.TRMT)
                DO_U1FC_Clear();
            if (SYS_CONSOLE_Read(console, &consoleBuffer[consoleBufferIndex], 1) >= 1) {
                UART1_Write(&consoleBuffer[consoleBufferIndex], 1);
                SYS_CONSOLE_Write(console, &consoleBuffer[consoleBufferIndex], 1);
                if (consoleBufferIndex < SERIAL_PORT_BUFFER_SIZE)
                    consoleBufferIndex++;
                if ((consoleBuffer[consoleBufferIndex - 1] == '\n') || (consoleBuffer[consoleBufferIndex - 1] == '\r')) {
                    APP_Parse_Console_Command(consoleBuffer, consoleBufferIndex);
                    memset(consoleBuffer, 0x00, SERIAL_PORT_BUFFER_SIZE);
                    consoleBufferIndex = 0;
                }

            }

            if (comDataRx[0]) {
                comDataRx[0] = false;
                memset(comBuffer[0], 0x00, SERIAL_PORT_BUFFER_SIZE);

                len = UART1_ReadCountGet();

                count = UART1_Read(comBuffer[0], 1);
                // RS485_Pass_RX(comBuffer[i],count);
                // Modbus_Tasks();
                data_pass_buffer[data_in_buffer] = comBuffer[0][0];
                if (data_pass_buffer[data_in_buffer] != "\r")
                    data_in_buffer++;
                //                if(count ==0)
                //                   data_in_buffer= 0;  
                // SYS_CONSOLE_Write(console, &comBuffer, 1);
                if (data_tx) {
                    data_tx = false;
                    data_in_buffer = 0;
                }

            }
        }

            if (data_in_buffer > 4) {

                for (int i = 0; i < data_in_buffer; i++) {

                    CRCcheckIn = (uint16_t) (data_pass_buffer[data_in_buffer - 1] << 8) | (data_pass_buffer[data_in_buffer - 2]);
                    CRCcheck = usMBCRC16(&data_pass_buffer[0], data_in_buffer - 2);

                    if (CRCcheckIn == CRCcheck) {
                        LED_1_Toggle();
                        SYS_CONSOLE_Write(console, &data_pass_buffer, data_in_buffer);
                        RS485_Pass_RX(data_pass_buffer, data_in_buffer);
                        Modbus_Tasks();
                        data_in_buffer = 0;
                        data_tx = true;

                    }

                    if (data_in_buffer > 10 && CRCcheckIn != CRCcheck) {
                        data_in_buffer = 0;
                    }



                }

            }

            update_ui();
            for (int i = 0; i < 8; i++) {
                if (current_value[i] != previous_value[i]) {
                    if (tick_10ms) {
                        tick_10ms = false;
                        debounce_counter++;
                        update_ui();
                        temp_debounce = current_value[i];
                    }
                    if (temp_debounce != previous_value[i] && debounce_counter > 5) {
                        previous_value[i] = current_value[i];
                        debounce_counter = 0;
                    }

                }
            }


            for (int i = 1; i <= 8; i++) {
                Modbus_Slave_Holding_Register_Store(previous_value[i - 1], i);

            }





            if (tick_1s) {
                tick_1s = false;
                LED_4_Toggle();
                LED_1_Set();
                LED_2_Set();
            }

            //                tick_1s = false;
            //                //        UART1_Write("UART1", 5);
            //                //        APP_UART2_Write("UART2", 5);
            //                //        UART3_Write("UART3", 5);
            //                //        APP_UART4_Write("UART4", 5);
            //                //                                static bool ping = true;
            //                //                                static uint32_t tick = 0;
            //                //                                if (ping) {
            //                //                                    if (APP_EEPROM_UINT8_Write(0x0051, tick, tick))
            //                //                                        SYS_CONSOLE_PRINT("EEPROM WRITE OK\n\r");
            //                //                                    else
            //                //                                        SYS_ERROR_PRINT(SYS_ERROR_DEBUG, "EEPROM WRITE ERROR @ %X = %x\n\r", tick, tick);
            //                //                                } else {
            //                //                                    uint8_t readback = APP_EEPROM_UINT8_Read(0x0051, tick);
            //                //                                    if (readback == tick)
            //                //                                        SYS_CONSOLE_PRINT("EEPROM READ OK\n\r");
            //                //                                    else
            //                //                                        SYS_ERROR_PRINT(SYS_ERROR_DEBUG, "EEPROM READ ERROR @ %x %02X != %02X\n\r",
            //                //                                            tick,
            //                //                                            readback,
            //                //                                            tick);
            //                //                                    if (++tick > 0xFF)
            //                //                                        tick = 0;
            //                //                                }
            //                //                                ping = !ping;
            //
            //            }
            //
            //            break;
            //        }
            //
            //            /* TODO: implement your application state machine.*/
            //
            //
            //            /* The default state should never be executed. */
            //        default:
            //        {
            //            /* TODO: Handle error in application's state machine. */
            //            break;
    }

}

/*******************************************************************************
 End of File
 */
void update_ui() {
    current_value[0] = !AIO1_Get();
    current_value[1] = !AIO2_Get();
    current_value[2] = !AIO3_Get();
    current_value[3] = !AIO4_Get();
    current_value[4] = !AIO5_Get();
    current_value[5] = !AIO6_Get();
    current_value[6] = !AIO7_Get();
    current_value[7] = !AIO8_Get();
}