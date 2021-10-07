/**
 * @file mb_slaveregister.h
 * @author Sivashan Naicker
 * @brief 
 * @version 0.1
 * @date 2021-02-01
 * 
 * @copyright Copyright (c) 2021
 * 
 */

#include "stdio.h"
#include "string.h"
#include "stdio.h"
#include <stdint.h> // for standard int types definition
#include <stddef.h> // for NULL and std defines
#include <math.h>

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __MB_SLAVEREGISTER_H
#define __MB_SLAVEREGISTER_H

#ifdef __cplusplus
extern "C"
{
#endif


#define Holding_Register_Read_L 130 // Total size of holding register
#define Input_Register_Read_L 130 // Total size of input register
#define Holding_Register_Offset 0 // Register shift for holding register
#define Input_Register_Offset 0  // Register shift for input register
   typedef struct Holding_Register_Read
   {
      uint16_t Register_Data;
      int Register_Enable ;
   } Holding_Register_Read ;



   typedef struct Input_Register_Read
   {
      uint16_t Register_Data;
      int Register_Enable;
   } Input_Register_Read ;



#endif /* __MB_SLAVEREGISTER_H*/

   /************************ (C) COPYRIGHT Digital Twin Pty Ltd *****END OF FILE****/