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

// *****************************************************************************
// *****************************************************************************
// Section: Global Data Definitions
// *****************************************************************************
// *****************************************************************************

#define COM_485_1_FC DO_U4FC_PIN; /* Drives the WE/~RE of the 485 TSVR */
#define COM_485_2_FC DO_U2FC_PIN; /* Drives the WE/~RE of the 485 TSVR */

#define SERIAL_PORT_BUFFER_SIZE 512
#define SERIAL_PORT_COUNT 4


volatile static uint8_t comBuffer[SERIAL_PORT_COUNT][SERIAL_PORT_BUFFER_SIZE];
volatile static bool comDataRx[4];
volatile static uint8_t consoleBuffer[SERIAL_PORT_BUFFER_SIZE];
volatile static uint16_t consoleBufferIndex = 0;

APP_DATA appData;
DRV_HANDLE time;
SYS_CONSOLE_HANDLE console;

static bool tick_1s = false;
uint8_t i2c_write_buffer[I2C_EEPROM_PAGE_SIZE];
uint8_t i2c_read_buffer[I2C_EEPROM_PAGE_SIZE];






// *****************************************************************************
// *****************************************************************************
// Section: Application Callback Functions
// *****************************************************************************
// *****************************************************************************

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
    LED_1_Toggle();
    comDataRx[0] = true;
    SYS_CONSOLE_MESSAGE("U1 Rx\n\r");
}

static volatile void APP_UART2_Rx_Callback(UART_EVENT event, uintptr_t context) {
    LED_2_Toggle();
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

}

/******************************************************************************
  Function:
    void APP_Tasks ( void )

  Remarks:
    See prototype in app.h.
 */

void APP_Tasks(void) {

    /* Check the application's current state. */
    switch (appData.state) {
            /* Application's initial state. */
        case APP_STATE_INIT:
        {
            UART_SERIAL_SETUP uartSetup;
            uartSetup.baudRate = 9600;
            uartSetup.dataWidth = UART_DATA_8_BIT;
            uartSetup.parity = UART_PARITY_NONE;
            uartSetup.stopBits = UART_STOP_1_BIT;
            //
            //
            APP_Load_Settings_From_Eeprom();
            SYS_TIME_CallbackRegisterMS(APP_1s_Tick, NULL, 1000, SYS_TIME_PERIODIC);

            // RS 232 Port (Pin header on base boarD)
            uartSetup.baudRate = 9600;
            uartSetup.dataWidth = UART_DATA_8_BIT;
            uartSetup.parity = UART_PARITY_NONE;
            uartSetup.stopBits = UART_STOP_1_BIT;
            UART1_SerialSetup(&uartSetup, 0);
            UART1_ReadCallbackRegister(APP_UART1_Rx_Callback, NULL);
            UART1_ReadThresholdSet(1);
            UART1_ReadNotificationEnable(true, false);

            //RS485 port # 21
            DO_U2FC_Clear();
            uartSetup.baudRate = 19200;
            uartSetup.dataWidth = UART_DATA_8_BIT;
            uartSetup.parity = UART_PARITY_NONE;
            uartSetup.stopBits = UART_STOP_1_BIT;
            UART2_SerialSetup(&uartSetup, 0);
            UART2_ReadCallbackRegister(APP_UART2_Rx_Callback, NULL);
            UART2_ReadThresholdSet(1);
            UART2_ReadNotificationEnable(true, false);

            // rs232 port on Terminal strip
            uartSetup.baudRate = 38400;
            uartSetup.dataWidth = UART_DATA_8_BIT;
            uartSetup.parity = UART_PARITY_NONE;
            uartSetup.stopBits = UART_STOP_1_BIT;
            UART3_SerialSetup(&uartSetup, 0);
            UART3_ReadCallbackRegister(APP_UART3_Rx_Callback, NULL);
            UART3_ReadThresholdSet(1);
            UART3_ReadNotificationEnable(true, false);

            //RS485 port #1
            DO_U4FC_Clear();
            uartSetup.baudRate = 115200;
            uartSetup.dataWidth = UART_DATA_8_BIT;
            uartSetup.parity = UART_PARITY_NONE;
            uartSetup.stopBits = UART_STOP_1_BIT;
            UART4_SerialSetup(&uartSetup, 0);
            UART4_ReadCallbackRegister(APP_UART4_Rx_Callback, NULL);
            UART4_ReadThresholdSet(1);
            UART4_ReadNotificationEnable(true, false);

            console = SYS_CONSOLE_HandleGet(0);

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
            if (DO_U2FC_Get() && !IEC1bits.U2TXIE && U2STAbits.TRMT)
                DO_U2FC_Clear();
            if (DO_U4FC_Get() && !IEC2bits.U4TXIE && U4STAbits.TRMT)
                DO_U4FC_Clear();
            if (SYS_CONSOLE_Read(console, &consoleBuffer[consoleBufferIndex], 1) >= 1) {
                UART1_Write(&consoleBuffer[consoleBufferIndex], 1);
                //                APP_UART2_Write(&consoleBuffer[consoleBufferIndex],1);
                //                UART3_Write(&consoleBuffer[consoleBufferIndex],1);
                //                APP_UART4_Write(&consoleBuffer[consoleBufferIndex],1);

                SYS_CONSOLE_Write(console, &consoleBuffer[consoleBufferIndex], 1);
                if (consoleBufferIndex < SERIAL_PORT_BUFFER_SIZE)
                    consoleBufferIndex++;
                if ((consoleBuffer[consoleBufferIndex - 1] == '\n') || (consoleBuffer[consoleBufferIndex - 1] == '\r')) {
                    APP_Parse_Console_Command(consoleBuffer, consoleBufferIndex);
                    memset(consoleBuffer, 0x00, SERIAL_PORT_BUFFER_SIZE);
                    consoleBufferIndex = 0;
                }

            }
            char test_in;
            test_in = UART_CUSTOM_READ();
            
            
            for (i = 0; i < SERIAL_PORT_COUNT; i++) {
                if (comDataRx[i]) {
                    comDataRx[i] = false;
                    memset(comBuffer[i], 0x00, SERIAL_PORT_BUFFER_SIZE);
                    uint16_t len = 0, count = 0;
                    switch (i) {
                        case 0:
                            len = UART1_ReadCountGet();
                            count = UART1_Read(comBuffer[i], len);


                            //                            if (count > 0) {
                            //                                
                            //                                APP_UART2_Write(comBuffer[i], len);
                            //                                APP_UART4_Write(comBuffer[i], len);
                            //                                UART3_Write(comBuffer[i], count);
                            //                                SYS_DEBUG_PRINT(SYS_ERROR_INFO, "%s", comBuffer[i]);
                            //                            }
                            break;
                        case 1:
                            //                            len = UART2_ReadCountGet();
                            //                            count = UART2_Read(comBuffer[i], len);
                            //                            if (count > 0) {
                            //                                UART1_Write(comBuffer[i], count);
                            //                                UART3_Write(comBuffer[i], count);
                            //                                APP_UART4_Write(comBuffer[i], len);
                            //                                SYS_DEBUG_PRINT(SYS_ERROR_INFO, "%s", comBuffer[i]);
                            //                            }
                            break;
                        case 2:
                            //                            len = UART3_ReadCountGet();
                            //                            count = UART3_Read(comBuffer[i], len);
                            //                            if (count > 0) {
                            //                                UART1_Write(comBuffer[i], count);
                            //                                APP_UART2_Write(comBuffer[i], len);
                            //                                APP_UART4_Write(comBuffer[i], len);
                            //                                SYS_DEBUG_PRINT(SYS_ERROR_INFO, "%s", comBuffer[i]);
                            //                            }
                            break;
                        case 3:
                            //                            len = UART4_ReadCountGet();
                            //                            count = UART4_Read(comBuffer[i], len);
                            //                            if (count > 0) {
                            //                                UART1_Write(comBuffer[i], count);
                            //                                APP_UART2_Write(comBuffer[i], len);
                            //                                UART3_Write(comBuffer[i], count);
                            //                                SYS_DEBUG_PRINT(SYS_ERROR_INFO, "%s", comBuffer[i]);
                            //                            }
                            break;
                        default:
                            SYS_ERROR(SYS_ERROR_ERROR, "APP-Unhandled COM Port\n\r");
                            break;
                    }
                    break;
                }
            }
            //            if (tick_1s) {
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
}


/*******************************************************************************
 End of File
 */

