/**
 * @file mb_setup.h
 * @author Pratik Mistry
 * @brief The modbus setup will be init modbus and generate JSON output that can be requested by other modules.
 *        Previously was in thingstream module. Now the thingstream and local mqtt can request from this one module.
 * @version 0.1
 * @date 2020-07-21
 * 
 * @copyright Copyright (c) 2020
 * 
 */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __MB_SETUP_H
#define __MB_SETUP_H

#ifdef __cplusplus
extern "C"
{
#endif

   /* Includes ------------------------------------------------------------------*/
#include <stdio.h>
#include <string.h>
#include <stdbool.h>
#include <stdint.h>
   /* Exported types ------------------------------------------------------------*/

   /* Exported constants --------------------------------------------------------*/

   /* Exported macro ------------------------------------------------------------*/

   /**
 * Initialise this layer
 */
   void MB_Setup_init();

   /**
 * The layer tasks function
 */
   void MB_Setup_tasks();

   /**
 * The layer tick function
 */

   void MB_Setup_tick_100ms();
   /**
 * @brief Generates a modbus data payload 
 * 
 * @param payload json payload of the modbus data
 * @param device_id modbus device number
 * @param message_count message id required for thingstream messaging
 */
   bool JSON_Payload_Modbus_Data(char *payload, uint8_t dev_id, uint16_t message_count);
   /**
 * @brief Generates a modbus settings payload 
 * 
 * @param payload json payload of the modbus settings
 * @param message_count message id required for thingstream messaging
 */
   void JSON_Payload_Modbus_Settings(char *payload, uint16_t message_count);

   /**
 * @brief indicates if the modbus cov occured
 * 
 * @return true 
 * @return false 
 */
   bool Modbus_COV_Event();
   /**
 * @brief Clears COV flag
 * 
 */
   void Modbus_Clear_COV_event();

   /**
 * @brief Set COV flag
 * 
 */
void Modbus_Set_COV_event();
   /* Private defines -----------------------------------------------------------*/

#ifdef __cplusplus
}
#endif

#endif /* __MB_SETUP_H */

/************************ (C) COPYRIGHT Digital Twin Pty Ltd *****END OF FILE****/