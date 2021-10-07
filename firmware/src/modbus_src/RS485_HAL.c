/**
 * @file RS485_HAL.c
 * @author Sivashan Naicker
 * @brief 
 * @version 0.1
 * @date 2021-09-13
 * 
 * @copyright Copyright (c) 2020
 * 
 */

//=====================================================================================================================================//
/**
 * Include
 */
#define ESP_32 0

//#include "build_type.h"
#include "RS485_HAL.h"
#include "stdio.h"
#include "string.h"
#include <math.h>
#include <stdint.h>

#if DESKTOP
#include <stdio.h>
#include <windows.h>
#include <conio.h>
#endif
#if ESP_32
#include "IOT_F2_Defines.h"
#include "driver/gpio.h"
#include "driver/uart.h"
#endif


#include "peripheral/i2c/plib_i2c1.h"
#include "peripheral/uart/plib_uart1.h"
#include "peripheral/uart/plib_uart3.h"
#include "peripheral/uart/plib_uart4.h"
#include "peripheral/uart/plib_uart2.h"
#include "driver/usart/drv_usart.h"
#include "config/development/system/console/sys_console.h"
#include "peripheral/gpio/plib_gpio.h"
SYS_CONSOLE_HANDLE console;
//=====================================================================================================================================//
/**
 * Private variables
 */
volatile static uint8_t comBuffer[512];

//=====================================================================================================================================//
/**
 * Private function definitions
 */

//=====================================================================================================================================//

/**
 * Port Configuration 
 */
void RS485_HAL_Port_Init() {
#if ESP_32
    gpio_set_direction(RS485_DIR, GPIO_MODE_OUTPUT);
#endif
}

void RS485_HAL_Port_Configure(port_mode portmode, uint32_t baud, port_data_bits db, port_stop_bits sb, port_parity prty) {
    char prty_char;
#if DESKTOP
    switch (prty) {
        case PARITY_NONE_MODBUS:
            prty_char = 'N';
            break;
        case PARITY_ODD_MODBUS:
            prty_char = 'O';
            break;
        case PARITY_EVEN_MODBUS:
            prty_char = 'E';
            break;
        default:
            break;
    }

#endif
    switch (portmode) {
        case DEFAULT:

#if ESP_32

        {
            uart_config_t uart_config = {
                .baud_rate = 19200,
                .data_bits = UART_DATA_8_BITS,
                .parity = UART_PARITY_DISABLE,
                .stop_bits = UART_STOP_BITS_1,
                .flow_ctrl = UART_HW_FLOWCTRL_DISABLE,
                .rx_flow_ctrl_thresh = 50
            };

            ESP_ERROR_CHECK(uart_driver_install(UART_NUM_1, 1024, 0, 0, NULL, 0));
            ESP_ERROR_CHECK(uart_param_config(UART_NUM_1, &uart_config));
            ESP_ERROR_CHECK(uart_set_pin(UART_NUM_1, RS485_TXD, RS485_RXD, RS485_DIR, UART_PIN_NO_CHANGE));
            uart_set_mode(UART_NUM_1, UART_MODE_RS485_HALF_DUPLEX);
            uart_set_rx_timeout(UART_NUM_1, 1);
        }
#endif

            break;

        case CUSTOM:
#if ESP_32
            uart_set_baudrate(UART_NUM_1, baud);
            uart_set_word_length(UART_NUM_1, UART_DATA_8_BITS); /// esp uart does not support 9 bits
            switch (prty) {
                case PARITY_NONE_MODBUS:
                    uart_set_parity(UART_NUM_1, UART_PARITY_DISABLE);
                    break;
                case PARITY_ODD_MODBUS:
                    uart_set_parity(UART_NUM_1, UART_PARITY_ODD);
                    break;
                case PARITY_EVEN_MODBUS:
                    uart_set_parity(UART_NUM_1, UART_PARITY_EVEN);
                    break;
                default:
                    break;
            }
            uart_set_stop_bits(UART_NUM_1, (sb == STOP_BITS_1) ? STOP_BITS_1 : STOP_BITS_2);
#endif

            break;

        default:
            break;
            // uart_config(flag default or custom, baud,data bits,parity, stop bits)
    }
#if DESKTOP
    if (ctx != NULL) {
        printf("Port Opened, Closing\n");
        modbus_close(ctx);
    }
    ctx = modbus_new_rtu("\\\\.\\COM5", baud, prty_char, db, sb);
    modbus_set_debug(ctx, TRUE);
    if (ctx == NULL) {
        fprintf(stderr, "Unable to create the libmodbus context\n");
    }

    fflush(stdout);

    modbus_connect(ctx);
#endif
}

/**
 * Read Function 
 */

int RS485_HAL_Modbus_Read(uint8_t *buffer, uint32_t buffer_len, int ms_wait) {


#if ESP_32
    int result = uart_read_bytes(UART_NUM_1, buffer, buffer_len, ms_wait / portTICK_PERIOD_MS);

    return result;
#endif
#if DESKTOP
    int result = modbus_receive_confirmation(ctx, buffer);
    // printf("result len %d\n",result);
    return result;
#endif

    memcpy(buffer, datapass, counter);
    // int i;
    // 
    //    for(i = 0; i<counter; i++)
    //    {
    //        buffer[i] = datapass[i];
    //      
    //    }
    //UART1_Write(buffer, counter);

    return counter;


    //
}

/**
 * Write Function 
 */

void RS485_HAL_Modbus_Write(uint8_t *buffer, uint32_t send_len) {
#if ESP_32
    for (int i = 0; i < send_len; i++) {
        uart_write_bytes(UART_NUM_1, buffer[send_len], 1);
    }
#endif
#if DESKTOP
    modbus_set_slave(ctx, buffer[0]);
    modbus_send_raw_request(ctx, buffer, send_len - 2);
#endif

    RS485_Pass_TX(buffer, send_len);
    DO_U1FC_Clear();
    UART1_Write(buffer, send_len);
    DO_U1FC_Set();


}

void RS485_HAL_Flush(void) {
#if ESP_32
    uart_flush(UART_NUM_1);
#endif
}

void RS485_Pass_RX(uint8_t *buffer, uint16_t len) {
    int i;
    counter = len;
    for (i = 0; i < counter; i++) {
        datapass[i] = buffer[i];

    }
    // SYS_CONSOLE_Write(console, &datapass, counter);
}

void RS485_Pass_TX(uint8_t *buffer, uint16_t len) {
    int i;
    send_counter = len;
    for (i = 0; i < counter; i++) {
        datapass_tx[i] = buffer[i];

    }
    // SYS_CONSOLE_Write(console, &datapass, counter);
}
