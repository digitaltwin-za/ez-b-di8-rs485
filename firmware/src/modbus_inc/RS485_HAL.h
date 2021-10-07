/**
 * @file RS485_HAL.h
 * @author Sivashan Naicker
 * @brief 
 * @version 0.1
 * @date 2021-09-13
 * 
 * @copyright Copyright (c) 2021
 * 
 */
#ifndef __RS485_HAL_H
#define __RS485_HAL_H

#ifdef __cplusplus
extern "C"
{
#endif

#define ENABLE_MODBUS 1
    
    /* Includes ------------------------------------------------------------------*/
#include "stdio.h"
#include "string.h"
#include "stdint.h"

#if DESKTOP
#include "modbus.h"
modbus_t *ctx;
#endif
    /* Exported types ------------------------------------------------------------*/

    /* Exported constants --------------------------------------------------------*/

    /* Exported macro ------------------------------------------------------------*/

uint8_t datapass[100];
uint8_t datapass_tx[100];
uint16_t counter;
uint16_t send_counter;
    typedef enum PORT_MODE
    {
        DEFAULT,
        CUSTOM
    } port_mode;

typedef enum PORT_PARITY
{
    PARITY_NONE_MODBUS = 0, /*!< No parity. */
    PARITY_ODD_MODBUS = 1,  /*!< Odd parity. */
    PARITY_EVEN_MODBUS = 2  /*!< Even parity. */
} port_parity;

typedef enum PORT_STOP_BITS
{
    STOP_BITS_1 = 1,
    STOP_BITS_2 = 2
} port_stop_bits;

typedef enum PORT_DATA_BITS
{
    DATA_BITS_8 = 8,
    DATA_BITS_9 = 9 /*esp does not support 9bits on uart*/
} port_data_bits;



void RS485_HAL_Port_Configure(port_mode portmode, uint32_t baud, port_data_bits db, port_stop_bits sb,port_parity prty);

int RS485_HAL_Modbus_Read( uint8_t* buffer, uint32_t buffer_len, int ms_wait);
    /**
 * Write Function 
 */
void RS485_HAL_Modbus_Write(uint8_t *buffer, uint32_t send_len);

void  RS485_HAL_Flush(void);
void RS485_Pass_RX(uint8_t *buffer, uint16_t len);

void RS485_HAL_Port_Init();

#ifdef __cplusplus
}
#endif

#endif /* __RS485_HAL_H */

/************************ (C) COPYRIGHT Digital Twin Pty Ltd *****END OF FILE****/