/**
 * @file mb_setup.c
 * @author Pratik Mistry
 * @brief The modbus setup will be init modbus and generate JSON output that can be requested by other modules.
 * @version 0.1
 * @date 2020-07-21
 * 
 * @copyright Copyright (c) 2020
 * 
 */

//====================================================================================================================================//
/**
 * Include
 */



//#include "build_type.h"
#include "mb_setup.h"
#include "mb.h"
//#include "cJSON.h"
#include <math.h>
#include "mb_setup.h"
//#include "file_parser.h"
#include "RS485_HAL.h"

#if ROBIN_BUILD
#include "sys_config.h"

#include "PowerManagement.h"
#include "console.h"
#include "rtc.h"

#include "thingStream.h"
#endif

#if ENABLE_MODBUS
//=====================================================================================================================================//
/**
 * Private variables
 */
char *TAG_MB_Setup = "Modbus Setup";

static volatile modbus_device_t *iot_modbus_devices[MODBUS_DEVICE_COUNT];

char Modbus_alarm_time[25];
bool Modbus_alarm_flag = false;
bool Modbus_cov_flag = false;


//=====================================================================================================================================//
/**
 * Private function definitions
 */

/**
 * @brief Loads the modbus settings based on the files stored on the device
 * 
 */
static void Modbus_Load_Settings(void);

/**
 * @brief loads the modbus points from the multiple modbus device files stored on the device.
 * 
 */
static void Modbus_Load_Database(void);

/**
 * @brief Parses json file of the modbus devices
 * 
 * @param file_name state the filename plus extension e.g test.json as this from user defined file system
 * @param dev_id modbus device ID max of 16 points per device
 */
static void Modbus_Parse_Device_Json(char *file_name, uint8_t dev_id);

 void Modbus_Initialize_Port(void);

static void Iot_Modbus_Alarm_Callback(modbus_device_t *device, uint8_t index);
//=====================================================================================================================================//

/**
 * Initialise this layer
 */
void MB_Setup_init()
{
    Modbus_cov_flag = false;
    for (int i = 0; i < MODBUS_DEVICE_COUNT; i++)
    {
        iot_modbus_devices[i] = NULL;
    }
    Modbus_Load_Settings();
    Modbus_Load_Database();
   
    Modbus_Register_Alarm_Callback(Iot_Modbus_Alarm_Callback);
   
   
      uint16_t treg[30];


    //     modbus_set_slave(ctx, 1);
    //     while(1)
    //     {
    // modbus_read_registers(ctx,1,1,treg);
    //     }
 
}

/**
 * The layer tasks function
 */
void MB_Setup_tasks()
{
}

/**
 * The layer tick function
 */

void MB_Setup_tick_100ms()
{
}

/**
 * @brief Loads the modbus settings based on the files stored on the device
 * 
 */
static void Modbus_Load_Settings(void)
{
//     printf("Loading Settings\n");
//    char mb_port_buffer[300];
//    memset(mb_port_buffer, 0x00, sizeof(mb_port_buffer));
//    char file_name[] = "mb_port.json";
//   file_parser_read(file_name,mb_port_buffer);
//   printf("File_read\n");
//    cJSON *payload = cJSON_Parse(mb_port_buffer);
//    if (payload == NULL)
//    {
//        const char *error_ptr = cJSON_GetErrorPtr();
//        if (error_ptr != NULL)
//        {
//            fprintf(stderr, "Error before: %s\n", error_ptr);
//        }
//        goto end;
//    }
//    cJSON *baud = cJSON_GetObjectItem(payload, "baud");
//    cJSON *db = cJSON_GetObjectItem(payload, "db");
//    cJSON *sb = cJSON_GetObjectItem(payload, "sb");
//    cJSON *prty = cJSON_GetObjectItem(payload, "prty");
//    cJSON *plrt = cJSON_GetObjectItem(payload, "plrt");
//    cJSON *mode = cJSON_GetObjectItem(payload, "mode");
//    cJSON *slave_addr = cJSON_GetObjectItem(payload, "slave_addr");
//    baud != NULL ? Modbus_Set_Baud_Rate(baud->valueint) : Modbus_Set_Baud_Rate(MODBUS_DEFAULT_BAUD);
//    db != NULL ?  Modbus_Set_Data_Bits(db->valueint) : Modbus_Set_Data_Bits(MODBUS_DEFAULT_DATA_BITS);
//    sb != NULL ?  Modbus_Set_Stop_Bits(sb->valueint) :  Modbus_Set_Stop_Bits(MODBUS_DEFAULT_STOP_BITS);
//    prty != NULL ? Modbus_Set_Parity(prty->valueint) : Modbus_Set_Parity(MODBUS_DEFAULT_PARITY);
//    plrt != NULL ? Modbus_Set_Poll_Rate(plrt->valueint) : Modbus_Set_Poll_Rate(MODBUS_DEFAULT_POLL_RATE_100MS);
//    mode != NULL ?    Modbus_Set_Mode(mode->valuestring) : Modbus_Set_Mode(MODBUS_DEFAULT_MODE);
//    slave_addr != NULL ? Modbus_Set_SlaveAddr(slave_addr->valueint) : Modbus_Set_SlaveAddr(MODBUS_DEFAULT_SLAVE_ADDRESS);
//   
//   
//    
//
//end:
//    cJSON_Delete(payload);
//    Modbus_Initialize_Port();

}

/**
 * @brief loads the modbus points from the multiple modbus device files stored on the device.
 * 
 */
static void Modbus_Load_Database(void)
{

//    
//    printf("Loading Modbus DB\n");
//
//    int device_count = 0;
//    char file_name[24] = "mb_dev0.json";
//    char temp_buff[5000];
//    for (int i = 1; i <= MODBUS_DEVICE_COUNT; i++)
//    {
//        sprintf(file_name, "mb_dev%d.json", i);
//        if (file_parser_read(file_name,temp_buff) ==1)
//        {
//            printf( "%s exists ", file_name);
//          Modbus_Parse_Device_Json(file_name, device_count);
//            device_count++;
//        }
//    }
//    //ESP_LOGI(TAG_MB_Setup, "Total modbus devices :%d", device_count);
// 
}
/**
 * @brief Parses json file of the modbus devices
 * 
 * @param file_name state the filename plus extension e.g test.json as this from user defined file system
 * @param dev_id modbus device ID max of 16 points per device
 */
static void Modbus_Parse_Device_Json(char *file_name, uint8_t dev_id)
{
//    printf("Device ID:%d\n", dev_id);
//    char json_buffer[1024];
//    memset(json_buffer, 0x00, sizeof(json_buffer));
//    file_parser_read(file_name, json_buffer);
//  
//    cJSON *payload = cJSON_Parse(json_buffer);
//    if (payload == NULL)
//    {
//        const char *error_ptr = cJSON_GetErrorPtr();
//        if (error_ptr != NULL)
//        {
//            fprintf(stderr, "Error before: %s\n", error_ptr);
//        }
//        goto end;
//    }
//    //ESP_LOGI(TAG_MB_Setup, "Parsing %s", file_name);
//    int device_address_val = 0;
//    int device_swap_flags_val = 2047;
//    char *device_name_val = NULL;
//    cJSON *address = cJSON_GetObjectItem(payload, "addr");
//    cJSON *swap_flag = cJSON_GetObjectItem(payload, "swp");
//    cJSON *name = cJSON_GetObjectItem(payload, "nm");
//
//    address != NULL ? device_address_val = address->valueint : 0 && puts("device_address property is not found.");
//    swap_flag != NULL ? device_swap_flags_val = swap_flag->valueint : 2047;
//    name != NULL ? device_name_val = name->valuestring : "";
//
//    iot_modbus_devices[dev_id] = Modbus_Slave_Device_Constructor(
//        device_address_val,
//        device_swap_flags_val,
//        180,
//        NULL);
//
//
//    cJSON *points = cJSON_GetObjectItem(payload, "pts");
//    if (points != NULL)
//    {
//        int point_address_val = 0;
//        int reg_t_val = 0;
//        int dat_t_val = 0;
//        char *point_name_val = NULL;
//        char *point_units_val = NULL;
//        float shift_val = 0.0;
//        float scale_val = 1.0;
//        float low_threshold_val = NAN;
//        float high_threshold_val = NAN;
//        float delta_threshold_val = NAN;
//        uint16_t time_delay_value = 0;
//        int array_index = cJSON_GetArraySize(points);
//        for (int i = 0; i < array_index; i++)
//        {
//            cJSON *element = cJSON_GetArrayItem(points, i);
//            cJSON *ad = cJSON_GetObjectItem(element, "ad");
//            cJSON *register_type = cJSON_GetObjectItem(element, "rt");
//            cJSON *data_type = cJSON_GetObjectItem(element, "dt");
//            cJSON *shift = cJSON_GetObjectItem(element, "sh");
//            cJSON *scale = cJSON_GetObjectItem(element, "sc");
//            cJSON *name_point = cJSON_GetObjectItem(element, "nm");
//            cJSON *units = cJSON_GetObjectItem(element, "un");
//            cJSON *low_thresh = cJSON_GetObjectItem(element, "lt");
//            cJSON *high_thresh = cJSON_GetObjectItem(element, "ht");
//            cJSON *delta_thresh = cJSON_GetObjectItem(element, "ct");
//             cJSON *time_delay = cJSON_GetObjectItem(element, "td");
//
//            ad != NULL ? point_address_val = ad->valueint : 0;
//            register_type != NULL ? reg_t_val = register_type->valueint : 0;
//            data_type != NULL ? dat_t_val = data_type->valueint : 0;
//            shift != NULL ? shift_val = shift->valuedouble : 0;
//            scale != NULL ? scale_val = scale->valuedouble : 1;
//            name_point != NULL ? point_name_val = name_point->valuestring : "";
//            units != NULL ? point_units_val = units->valuestring : "";
//            low_thresh != NULL ? low_threshold_val = low_thresh->valuedouble : NAN;
//            high_thresh != NULL ? high_threshold_val = high_thresh->valuedouble : NAN;
//            delta_thresh != NULL ?    delta_threshold_val = delta_thresh->valuedouble : NAN;
//            time_delay != NULL  ? time_delay_value = time_delay->valueint : 0;
//           
//            Modbus_Slave_Device_Point_Constructor(
//                (modbus_device_t *)iot_modbus_devices[dev_id],
//                reg_t_val,
//                dat_t_val,
//                point_address_val,
//                scale_val,
//                shift_val,
//                low_threshold_val,
//                high_threshold_val,
//                delta_threshold_val,
//                time_delay_value,
//                NULL,
//                NULL);
//        }
//    }
//
//end:
//    cJSON_Delete(payload);
//    
}

/**
 * @brief Generates a modbus data payload 
 * 
 * @param payload json payload of the modbus data
 * @param device_id modbus device number
 * @param message_count message id required for thingstream messaging
 */
bool JSON_Payload_Modbus_Data(char *payload, uint8_t dev_id, uint16_t message_count)
{
#if ROBIN_BUILD
    if ((Modbus_Slave_Device_Is_Valid((modbus_device_t *)iot_modbus_devices[dev_id])))
    {
        cJSON *root, *mb_dev, *pts_array, *pts;
        root = cJSON_CreateObject();
        cJSON_AddNumberToObject(root, "message-id", message_count);
        cJSON_AddStringToObject(root, "iccid", System_Get_Mac_Address());
        cJSON_AddNumberToObject(root, "battery", TWODECIMAL(getBatteryVoltage()));
        cJSON_AddNumberToObject(root, "mains", ACMaindet());
#if ENABLE_RTC
        if (Modbus_alarm_flag)
        {
            Modbus_alarm_flag = false;
            cJSON_AddStringToObject(root, "date", Modbus_alarm_time);
        }
        else
        {
            cJSON_AddStringToObject(root, "date", RTC_Get_Date_Time_ISO_Format());
        }
#endif
        cJSON_AddItemToObject(root, "modbus-dev", mb_dev = cJSON_CreateObject());
        cJSON_AddNumberToObject(mb_dev, "addr", Modbus_Slave_Device_Get_Address((modbus_device_t *)iot_modbus_devices[dev_id]));
        cJSON_AddItemToObject(mb_dev, "pts", pts_array = cJSON_CreateArray());
        for (int i = 0; i < Modbus_Slave_Device_Get_Point_Count((modbus_device_t *)iot_modbus_devices[dev_id]); i++)
        {
            cJSON_AddItemToArray(pts_array, pts = cJSON_CreateObject());
            cJSON_AddNumberToObject(pts, "ad", Modbus_Slave_Device_Point_Get_Address((modbus_device_t *)iot_modbus_devices[dev_id], i));
            modbus_point_status_t point_status = Modbus_Slave_Device_Point_Get_Status((modbus_device_t *)iot_modbus_devices[dev_id], i);
            if (point_status != MODBUS_POINT_STATUS_OK)
                cJSON_AddNumberToObject(pts, "st", (unsigned int)point_status);
            cJSON_AddNumberToObject(pts, "va", TWODECIMAL(Modbus_Slave_Device_Point_Get_Value((modbus_device_t *)iot_modbus_devices[dev_id], i).as_float));
        }
        char *jsonBuffer;
        jsonBuffer = cJSON_PrintUnformatted(root);
        strcpy(payload, jsonBuffer);
        cJSON_Delete(root);
        cJSON_free(jsonBuffer);
        return true;
    }
    return false;
    #endif
}

/**
 * @brief Generates a modbus settings payload 
 * 
 * @param payload json payload of the modbus settings
 * @param message_count message id required for thingstream messaging
 */
void JSON_Payload_Modbus_Settings(char *payload, uint16_t message_count)
{
    #if ROBIN_BUILD
    cJSON *root, *mb_set;
    root = cJSON_CreateObject();
    cJSON_AddNumberToObject(root, "message-id", message_count);
    cJSON_AddStringToObject(root, "iccid", System_Get_Mac_Address());
    cJSON_AddNumberToObject(root, "battery", TWODECIMAL(getBatteryVoltage()));
    cJSON_AddNumberToObject(root, "mains", ACMaindet());
#if ENABLE_RTC
    cJSON_AddStringToObject(root, "date", RTC_Get_Date_Time_ISO_Format());
#endif
    cJSON_AddItemToObject(root, "modbus-set", mb_set = cJSON_CreateObject());
    cJSON_AddNumberToObject(mb_set, "baud", Modbus_Get_Baud_Rate());
    cJSON_AddNumberToObject(mb_set, "db", Modbus_Get_Data_Bits());
    cJSON_AddNumberToObject(mb_set, "sb", Modbus_Get_Stop_Bits());
    cJSON_AddNumberToObject(mb_set, "prty", Modbus_Get_Parity());
    cJSON_AddNumberToObject(mb_set, "plrt", Modbus_Get_Poll_Rate());
    cJSON_AddStringToObject(mb_set, "mode", Modbus_Get_Mode());
    cJSON_AddNumberToObject(mb_set, "slave_addr", Modbus_Get_Slaveaddr());
    char *jsonBuffer;
    jsonBuffer = cJSON_PrintUnformatted(root);
    strcpy(payload, jsonBuffer);
    cJSON_Delete(root);
    cJSON_free(jsonBuffer);
    #endif
}

static void Iot_Modbus_Alarm_Callback(modbus_device_t *device, uint8_t index)
{
    printf("Modbus Alarm! Device=%d,Index=%d, Value= %.2f\n", Modbus_Slave_Device_Get_Address(device), index, Modbus_Slave_Device_Point_Get_Value(device, index).as_float);
    //Modbus_COV_Event();
    Modbus_alarm_flag = true;
    Modbus_cov_flag = true;
    memset(Modbus_alarm_time, 0x00, sizeof(Modbus_alarm_time));
#if ENABLE_RTC
    sprintf(Modbus_alarm_time, "%s", RTC_Get_Date_Time_ISO_Format());

#endif
}
/**
 * @brief indicates if the modbus cov occured
 * 
 * @return true 
 * @return false 
 */
bool Modbus_COV_Event()
{

    return Modbus_cov_flag;
}
/**
 * @brief Clears COV flag
 * 
 */
void Modbus_Clear_COV_event()
{
    Modbus_cov_flag = false;
}

/**
 * @brief Set COV flag
 * 
 */
void Modbus_Set_COV_event()
{
    Modbus_cov_flag = true;
}

#endif
