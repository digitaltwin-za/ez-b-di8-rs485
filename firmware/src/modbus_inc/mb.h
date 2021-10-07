/*
 * FreeModbus Libary: A portable Modbus implementation for Modbus ASCII/RTU.
 * Copyright (c) 2006 Christian Walter <wolti@sil.at>
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. The name of the author may not be used to endorse or promote products
 *    derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
 * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 * IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
 * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
 * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 * File: $Id: mb.h,v 1.17 2006/12/07 22:10:34 wolti Exp $
 */

#ifndef _MB_H
#define _MB_H
#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>
#include "mbcrc.h"

/** Number of devices that the driver/module/stack supports */
#define MODBUS_DEVICE_COUNT 10
/** Number of Modbus points that each device supports */
#define MODBUS_DEVICE_POINT_COUNT 16
/** Size of the Modbus RTU Message queue for the transport layer */
#define MODBUS_PDU_QUEUE_LENGTH 4

#define DEFAULT_MODBUS_TIMEOUT_MS 100

#define MODBUS_DEFAULT_BAUD 19200
#define MODBUS_DEFAULT_PARITY MODBUS_PARITY_NONE
#define MODBUS_DEFAULT_DATA_BITS MODBUS_DATA_BITS_8
#define MODBUS_DEFAULT_STOP_BITS MODBUS_STOP_BITS_1
#define MODBUS_DEFAULT_POLL_RATE_100MS 10
#define MODBUS_DEFAULT_SWAP_FLAGS 0x2047
#define MODBUS_DEFAULT_NAME ""
#define MODBUS_DEFAULT_POINT_UNITS "none"
#define MODBUS_DEFAULT_POINT_SCALE 1.0f
#define MODBUS_DEFAULT_POINT_SHIFT 0.0f
#define MODBUS_DEFAULT_MODE "m"        // Default Modbus Mode (master)
#define MODBUS_DEFAULT_SLAVE_ADDRESS 1 // Default Slave Address (1)

typedef union _modbus_point_value_t
{
    uint16_t as_uint16;
    uint32_t as_uint32;
    uint64_t as_uint64;
    int16_t as_int16;
    int32_t as_int32;
    int64_t as_int64;
    float as_float;
    long double as_double;
} modbus_point_value_t;

typedef enum MODBUS_FUNCTION_CODES
{
    MODBUS_FUNCTION_NONE = 0,
    MODBUS_FUNCTION_READ_COILS = 1,
    MODBUS_FUNCTION_READ_DISCRETE_INPUTS = 2,
    MODBUS_FUNCTION_WRITE_SINGLE_COIL = 5,
    MODBUS_FUNCTION_WRITE_MULTIPLE_COILS = 15,
    MODBUS_FUNCTION_READ_HOLDING_REGISTER = 3,
    MODBUS_FUNCTION_READ_INPUT_REGISTER = 4,
    MODBUS_FUNCTION_WRITE_REGISTER = 6,
    MODBUS_FUNCTION_WRITE_MULTIPLE_REGISTERS = 16
} modbus_function_codes_t;

typedef enum MODBUS_REGISTER_TYPES
{
    MODBUS_REGISTER_TYPES_NONE = 0,
    MODBUS_REGISTER_TYPES_COIL = 1,
    MODBUS_REGISTER_TYPES_DISCRETE_INPUT = 2,
    MODBUS_REGISTER_TYPES_HOLDING_REGISTER = 3,
    MODBUS_REGISTER_TYPES_INPUT_REGISTER = 4,
} modbus_register_types_t;


typedef enum MODBUS_EXCEPTION
{
    MODBUS_EXCEPTION_NONE = 0x00,
    MODBUS_EXCEPTION_ILLEGAL_FUNCTION = 0x01,
    MODBUS_EXCEPTION_ILLEGAL_DATA_ADDRESS = 0x02,
    MODBUS_EXCEPTION_ILLEGAL_DATA_VALUE = 0x03,
    MODBUS_EXCEPTION_SLAVE_DEVICE_FAILURE = 0x04,
    MODBUS_EXCEPTION_ACKNOWLEDGE = 0x05,
    MODBUS_EXCEPTION_SLAVE_BUSY = 0x06,
    MODBUS_EXCEPTION_MEMORY_PARITY_ERROR = 0x08,
    MODBUS_EXCEPTION_GATEWAY_PATH_FAILED = 0x0A,
    MODBUS_EXCEPTION_GATEWAY_TGT_FAILED = 0x0B
} modbus_exception_t;

typedef enum MODBUS_PARITY
{
    MODBUS_PARITY_NONE = 0, /*!< No parity. */
    MODBUS_PARITY_ODD = 1,  /*!< Odd parity. */
    MODBUS_PARITY_EVEN = 2  /*!< Even parity. */
} modbus_parity_t;

typedef enum MODBUS_STOP_BITS
{
    MODBUS_STOP_BITS_1 = 1,
    MODBUS_STOP_BITS_2 = 2
} modbus_stop_bits_t;

typedef enum MODBUS_DATA_BITS
{
    MODBUS_DATA_BITS_8 = 8,
    MODBUS_DATA_BITS_9 = 9 /*esp does not support 9bits on uart*/
} modbus_data_bits_t;

typedef enum MODBUS_POINT_STATUS
{
    MODBUS_POINT_STATUS_OK = 0,
    MODBUS_POINT_STATUS_STALE = 1,
    MODBUS_POINT_STATUS_ERROR = 2,
    MODBUS_POINT_STATUS_OFFLINE = 4,
    MODBUS_POINT_STATUS_ALARM = 8
} modbus_point_status_t;

typedef enum MODBUS_POINT_TYPES
{
    MODBUS_POINT_TYPES_NONE = 0,
    MODBUS_POINT_TYPES_SIGNED_16 = 1,
    MODBUS_POINT_TYPES_SIGNED_32 = 2,
    MODBUS_POINT_TYPES_SIGNED_64 = 3,
    MODBUS_POINT_TYPES_UNSIGNED_16 = 4,
    MODBUS_POINT_TYPES_UNSIGNED_32 = 5,
    MODBUS_POINT_TYPES_SINGLE_PRECISION_FLOAT = 6,
    MODBUS_POINT_TYPES_DOUBLE_PRECISION_FLOAT = 7
} modbus_point_types_t;

typedef enum MODBUS_SWAP_FLAGS
{
    MODBUS_SWAP_FLAG_INT16_BYTE = 1,
    MODBUS_SWAP_FLAG_INT32_BYTE = 2,
    MODBUS_SWAP_FLAG_INT32_WORD = 4,
    MODBUS_SWAP_FLAG_INT64_BYTE = 8,
    MODBUS_SWAP_FLAG_INT64_WORD = 16,
    MODBUS_SWAP_FLAG_INT64_DOUBLE_WORD = 32,
    MODBUS_SWAP_FLAG_FLOAT_BYTE = 64,
    MODBUS_SWAP_FLAG_FLOAT_WORD = 128,
    MODBUS_SWAP_FLAG_DOUBLE_BYTE = 256,
    MODBUS_SWAP_FLAG_DOUBLE_WORD = 512,
    MODBUS_SWAP_FLAG_DOUBLE_DOUBLE_WORD = 1024
} modbus_swap_flags_t;

typedef enum MODBUS_MODE
{
    MODBUS_MODE_DISABLE = 0,
    MODBUS_MODE_MASTER = 1,
    MODBUS_MODE_SLAVE = 2,
    MODBUS_MODE_LISTENER = 3,
    MODBUS_MODE_FF = 4,
} MODBUS_MODE;

/**
 * Raw Sniffer Struct
 */
typedef struct Sniffer_Raw
{
    uint8_t Slave_Add;
    uint8_t function_code;
    uint8_t Function_code_Slave;
    uint16_t Start_Address;
    uint8_t Data_len;
    uint16_t Single_Data;
    uint8_t Slave_len;
    uint8_t Slave_Data[300];
    uint8_t Byte_Count;
    uint16_t Output_Values;
    uint8_t data[300];
    uint16_t No_Reg;
    uint16_t CRC;
    uint8_t Fulllen;
} Sniffer_Raw;

static volatile Sniffer_Raw Raw_SnifferData;

typedef struct Sniffer_Combined
{
    uint8_t Slave_Add;
    uint8_t function_Code;
    uint16_t Start_Address;
    uint8_t Data_len;
    uint8_t data[300];

    int allocated;
} Sniffer_Combined;

Sniffer_Combined Sniffer_Comb[MODBUS_DEVICE_COUNT];

typedef struct Sniffer_master
{
    uint16_t MStart_address;
    uint8_t MSlave_address;

} Sniffer_master;

Sniffer_master Master_data;

typedef struct Sniffer_slave
{
    uint16_t SStart_address;
    uint8_t SSlave_address;
    uint8_t SSlave_length;
    uint8_t SSlave_data[300];
} Sniffer_slave;

Sniffer_slave Slave_data;

typedef struct Master_Recieved
{
    uint8_t Recieved_Slave_Address;
    uint8_t Recieved_Function_Code;
    uint16_t Recieved_Register_StartAddress;
    uint16_t Recieved_Register_NoRegister;
    uint8_t Recieved_Register_TotalBytes;
    uint16_t recieved_Data[200];
    uint8_t CRC_HI;
    uint8_t CRC_LO;

} Master_Recieved;

Master_Recieved Master_Recieved_Data;

bool Callback_flag;

/**
 * Opaque type definition for a modbus slave point
 */
typedef struct _modbus_point_t modbus_point_t;

/**
 * Opaque type definition for a modbus slave device
 */
typedef struct _modbus_device_t modbus_device_t;

// MODBUS PORT INTERFACE FUNCTIONS
bool Modbus_Set_Baud_Rate(uint32_t baud);
bool Modbus_Set_Parity(modbus_parity_t parity);
bool Modbus_Set_Stop_Bits(modbus_stop_bits_t stop_bits);
bool Modbus_Set_Data_Bits(modbus_data_bits_t data_bits);
bool Modbus_Set_Poll_Rate(uint8_t poll_rate_in_100ms);

uint32_t Modbus_Get_Baud_Rate(void);
modbus_parity_t Modbus_Get_Parity(void);
modbus_stop_bits_t Modbus_Get_Stop_Bits(void);
modbus_data_bits_t Modbus_Get_Data_Bits(void);
uint8_t Modbus_Get_Poll_Rate(void);

/**
 * Gets the string representation of the register type enum
 * @param type The enum index
 * @return The null terminated string for the enum index
 */
const char *Modbus_Get_Register_Type_String(modbus_register_types_t type);

/**
 * Gets the string representation of the point type enum
 * @param type The enum index
 * @return The null terminated string for the enum index
 */
const char *Modbus_Get_Point_Type_String(modbus_point_types_t type);

/**
 * Confirms validity of parameter as a register type
 * @param reg_type a uint8 used to indicate register type
 * @return True if valid. False if not.
 */
bool Modbus_Validate_Register_Type(modbus_register_types_t reg_type);
/**
 * Confirms validity of parameter as a point type
 * @param point_type a uint8 used to indicate point type
 * @return True if valid. False if not.
 */
bool Modbus_Validate_Point_Type(modbus_point_types_t point_type);
/**
 * Gets the number of Modbus devices currently in the driver's database
 * @return The number of enabled devices in the Modbus database
 */
uint8_t Modbus_Get_Device_Count(void);

// MODBUS DEVICE INTERFACE FUNCTIONS
/**
 * Constructor for a new instance of the Modbus Slave device class. Consumes one
 * of the available resources from MODBUS_DEVICE_COUNT on each call.
 * @param   modbus_slave_address    address of the modbus device on the RTU
 *                                  network from 1 to 254
 * @param   swap_flags              configures how endianess/swap is configured
 *                                  to convert from registers to points
 * @param   timeout                 time in seconds that a device will be
 *                                  considered offline if no transactions take
 *                                  place
 * @param   name                    null terminated character string with the 
 *                                  device's friendly name
 * @returns pointer to the newly created instance, or null on error
 */
modbus_device_t *Modbus_Slave_Device_Constructor(uint8_t modbus_slave_address,
                                                 modbus_swap_flags_t swap_flags,
                                                 uint8_t timeout,
                                                 char *name);
/**
 * Destructor for a modbus slave device instance. Free's up the instance to be
 * reallocated later...
 * @param   modbus_slave_device pointer to the instance to be destroyed
 */
void Modbus_Slave_Device_Destructor(modbus_device_t *modbus_slave_device);

/**
 * Is the requested device a valid one?
 * @param modbus_slave_device pointer to the device
 * @return true if the device/index pair is a vaild entry
 */
bool Modbus_Slave_Device_Is_Valid(modbus_device_t *modbus_slave_device);

/**
 * Check if a a modbus slave device instance is reporting the device online
 * @param   modbus_slave_device pointer to the instance
 */
bool Modbus_Slave_Device_Is_Connected(modbus_device_t *modbus_slave_device);
/**
 * Get a modbus slave device instance's allocated point count
 * @param   modbus_slave_device pointer to the instance
 */
uint8_t Modbus_Slave_Device_Get_Point_Count(
    modbus_device_t *modbus_slave_device);

/**
 * Gets a Modbus devices name
 * @param modbus_slave_device pointer to the instance whose name to return
 * @return Returns a string with the name of the modbus device
 */
uint8_t *Modbus_Slave_Device_Get_Name(
    modbus_device_t *modbus_slave_device);

/**
 * Returns the slave address (Modbus RTU MAC address)
 * @param modbus_slave_device pointer to the instance whose address to return
 * @return the address of the slave device
 */
uint8_t Modbus_Slave_Device_Get_Address(
    modbus_device_t *modbus_slave_device);

// MODBUS POINT INTERFACE FUNCTIONS
/**
 * Constructor for a new point instance associated with a Modbus Slave device
 * instance to be polled by this module. Consumes one of the available point
 * resources from MODBUS_DEVICE_POINT_COUNT from each device on each call.
 * @param   slave_device        pointer to the modbus device instance under
 *                              which this point will be associated
 * @param   register_type       modbus register type per the enum for this point
 * @param   point_type          describes how many and in what way the 
 *                              register(s) are interpreted to give the value
 * @param   register_address    modbus register address for this point
 * @param   scale               factor applied (multiplied by) the read point 
 *                              value to give the output value (applied 1st)
 * @param   shift               an offset applied to (added to) the read point
 *                              value to give the output value (applied 2nd)
 * @param   low_threshold       low-limit for the point, which if exceeded, will
 *                              trigger an alarm/callback
 * @param   high_threshold      high-limit for the point, which if exceeded, will
 *                              trigger an alarm/callback
 * @param   delta_threshold     delta-limit for the point, which if exceeded 
 *                              since last read using:
 *                              @function Modbus_Slave_Device_Poit_Get_Value(...)
 *                              will trigger an alarm/callback
 * @param   alarm_time_delay    time delay in seconds that the threshold must
 *                              have been exceeded before the alarm callback
 *                              is actually triggered.
 * @param   name                null terminated character string containing the
 *                              friendly name for the mMdbus point
 * @param   units               null terminated ASCII string containing the 
 *                              engineering units to assigned to this point
 * @returns an index to the point object within the Modbus slave device class
 */
uint8_t Modbus_Slave_Device_Point_Constructor(
    modbus_device_t *slave_device,
    modbus_register_types_t register_type,
    modbus_point_types_t point_type,
    uint16_t register_address,
    float scale,
    float shift,
    float low_threshold,
    float high_threshold,
    float delta_threshold,
    uint16_t alarm_time_delay,
    char *name,
    char *units);
/**
 * Destructor for a modbus slave device point instance. Free's up the instance
 * to be reallocated later...
 * @param   modbus_slave_device     pointer to the instance containing the point
 * to be destroyed
 * @param   index                   index of the point within the slave device
 * @returns true for success, false for failure
 */
bool Modbus_Slave_Device_Point_Destructor(modbus_device_t *modbus_slave_device,
                                          uint8_t index);

/**
 * Enables/Disables a point to be polled by the background polling service
 * @param   modbus_slave_device     pointer to the instance containing the point
 * @param   index                   index of the point within the slave device
 * @param   enabled                 true = enable polling, false = disable
 * polling
 */
void Modbus_Slave_Device_Point_Set_Enabled(modbus_device_t *modbus_slave_device,
                                           uint8_t index,
                                           bool enabled);

/**
 * Is the requested point a valid one?
 * @param modbus_slave_device pointer to the device instance containing the point
 * @param index index of the point within the slave device
 * @return true if the device/index pair is a vaild entry
 */
bool Modbus_Slave_Device_Point_Is_Valid(modbus_device_t *modbus_slave_device,
                                        uint8_t index);
/**
 * Returns the last read value of the point
 * @param   modbus_slave_device     pointer to the instance containing the point
 * @param   index                   index of the point within the slave device
 * @returns the 16-bit register value last read from the device.
 */
modbus_point_value_t Modbus_Slave_Device_Point_Get_Value(
    modbus_device_t *modbus_slave_device,
    uint8_t index);

/**
 * Gets the point's name
 * @param modbus_slave_device Device to which the point belongs
 * @param index Index of the point within said device
 * @return string with the points name
 */
char *Modbus_Slave_Device_Point_Get_Name(
    modbus_device_t *modbus_slave_device,
    uint8_t index);
/**
 * Gets the point's units
 * @param modbus_slave_device pointer to the Device instance to which the point belongs
 * @param index Index of the point within said device
 * @return string with the points units
 */
char *Modbus_Slave_Device_Point_Get_Units(
    modbus_device_t *modbus_slave_device,
    uint8_t index);

/**
 * Retruns the register address for the point
 * @param modbus_slave_device pointer to the Device instance to which the point belongs
 * @param index Index of the point within said device
 * @return 
 */
uint16_t Modbus_Slave_Device_Point_Get_Address(
    modbus_device_t *modbus_slave_device,
    uint8_t index);
/**
 * 
 * @param modbus_slave_device pointer to the Device instance to which the point belongs
 * @param index Index of the point within said device
 * @return The modbus register type
 */

modbus_register_types_t Modbus_Slave_Device_Point_Get_Register_Type(
    modbus_device_t *modbus_slave_device,
    uint8_t index);

/**
 * 
 * @param modbus_slave_device pointer to the Device instance to which the point belongs
 * @param index Index of the point within said device
 * @return The modbus point type
 */
modbus_point_types_t Modbus_Slave_Device_Point_Get_Point_Type(
    modbus_device_t *modbus_slave_device,
    uint8_t index);

/**
 * Gets the required scaling factor from the database.
 * @param modbus_slave_device pointer to the Device instance to which the point belongs
 * @param index Index of the point within said device
 * @return The scaling faactor to be applied to the value
 */
float Modbus_Slave_Device_Point_Get_Scale(
    modbus_device_t *modbus_slave_device,
    uint8_t index);
/**
 * Returns the status of the point
 * @param   modbus_slave_device     pointer to the instance containing the point
 * @param   index                   index of the point within the slave device
 * @returns status code indicating the point's data integrity/status
 */
modbus_point_status_t Modbus_Slave_Device_Point_Get_Status(
    modbus_device_t *modbus_slave_device,
    uint8_t index);
/**
 * Returns a string with the Status flags for the Modbus point
 * @param modbus_slave_device Pointer to the instance
 * @param index index of the point in the database
 * @return a null terminated string
 */
char *Modbus_Slave_Device_Point_Get_Status_String(
    modbus_device_t *modbus_slave_device,
    uint8_t index);

/**
 * Uses the Modbus Point's Address and Register type to lookup it's index in
 * the database
 * @param modbus_slave_device pointer to the instance to check for the point
 * @param point_address Address of the point to search for
 * @param register_type Type of Modbus register associated with the point to find
 * @return the index of the point, or 0xFF for no record found.
 */
uint8_t Modbus_Slave_Device_Point_Get_Index(
    modbus_device_t *modbus_slave_device,
    uint16_t point_address,
    modbus_register_types_t register_type);

// MODBUS MODULE FUNCTIONS
/**
 * Initializes the Modbus Stack 
 * MUST BE CALLED BEFORE ANY OTHER MODBUS FUNCTIONS CAN BE USED!!!!
 * @param baud_rate Comms speed-  Typical values: 4800,9600,19200,38400,57600,115200
 * @param data_bits data bits for UART bytes (8 or 9)
 * @param stop_bits Number of stop bits in UART Module (1 or 2)
 * @param parity Parity configuration (even/odd/none)
 * @param poll_rate time in seconds that a device (and it's points) are polled
 */
void Modbus_Initialize(
    uint32_t baud_rate,
    modbus_data_bits_t data_bits,
    modbus_stop_bits_t stop_bits,
    modbus_parity_t parity,
    uint8_t poll_rate,
    void(alarm_callBack)(
        modbus_device_t *device,
        uint8_t index));

bool Modbus_Write_Register(
    uint8_t slave_address,
    uint16_t register_address,
    modbus_register_types_t register_type,
    float value);

/**
 * @brief Writes to multiple Modbus registers 
 * 
 * @param slave_address Slave address of modbus device
 * @param starting_register Starting modbus register 
 * @param no_registers No of registers required to write
 * @param register_type Type of register to be written 
 * @param value value array of data to be written
 * @return true 
 * @return false 
 */
bool Modbus_Write_Multiple_Sequential(
    uint8_t slave_address,
     uint16_t starting_register,
    uint8_t no_registers,
    modbus_register_types_t register_type,
    float value[50]);

bool Modbus_Evaluate_Thresholds(
    modbus_device_t *device,
    modbus_point_t *point);

bool Modbus_Register_Alarm_Callback(void(Alarm_Callback)(
    modbus_device_t *device,
    uint8_t index));

/**
 * Prints the modbus database to the console
 */
void Modbus_Dump_Database(void);
void Modbus_Reset(void);
void Modbus_Tasks(void);
void Modbus_Millisecond_Timer(void);
void Modbus_100ms_Tick(void);
void Modbus_1s_Tick(void);
/**
 * @brief turns on modbus log for console debuging
 * 
 */
void Modbus_Set_Console_Log(void);
/**
 * @brief turns off modbus log for console debuging
 * 
 */
void Modbus_Clear_Console_Log(void);

/**
 * @brief Obtains and stores data from master modbus message recieved
 * 
 */
bool Modbus_Slave_GetMasterData(void);

/**
 * @brief Differentiates between Modbus Master and slave message for sniffer mode
 * 
 */
void Modbus_Type(void);
/**
 * @brief The function makes use of information recieved from the master message and sends back the correct response.
 * This function handles all read functions recieved from the Modbus master, and and provides the correct response.
 * 
 * @param recieved_slave_address The slave address of the recieved master message
 * @param function_Code The function code of the recieved master message
 * @param register_address The (starting) register address 
 * @param no_registers No of register that need to be read
 * @return true 
 * @return false 
 */
bool Modbus_Slave_ReadData(
    uint8_t recieved_slave_address,
    uint8_t function_Code,
    uint16_t register_address,
    uint16_t no_registers,
    uint16_t recieved_Data[1000]);
/**
     * @brief Enables specific point for specific register type. The function can also be used to disable point or return error message for specific point.
     * 
     * @param function_code Function code to select type of register (read,holding)
     * @param register_address Register address for register
     * @param enable 0 = Disable Point, 1 = enable Point, 2 = Disable Point and return error
     */
void Modbus_Slave_EnablePoint(modbus_function_codes_t function_code, uint16_t register_address, int enable);
/**
 * @brief Stores data from variable to holding register
 * 
 * @param data data to be stored
 * @param register_address Address data must be stored 
 */
void Modbus_Slave_Holding_Register_Store(uint16_t data, uint16_t register_address);

/**
 * @brief Stores data from variable to input register
 * 
 * @param data data to be stored
 * @param register_address Address data must be stored 
 */
void Modbus_Slave_Input_Register_Store(uint16_t data, uint16_t register_address);
/**
 * @brief Handles the write functions recieved from the modbus master. The data recieved to the master will be written to register based on the master message.
 * 
 * @param recieved_slave_address Slave address of modbus slave
 * @param function_Code Function code (Write single or multiple registers)
 * @param register_address Starting register address
 * @param recieved_Data The data that is required to be written to register
 * @param no_registers Number of registers to be written
 * @param no_Bytes No of bytes to be written
 * @return true 
 * @return false 
 */
bool Modbus_Slave_WriteData(
    uint8_t recieved_slave_address,
    uint8_t function_Code,
    uint16_t register_address,
    uint16_t recieved_Data[1000],
    uint16_t no_registers,
    uint8_t no_Bytes);

/**
 * @brief Sets the mode for the Modbus communication (Disabled, Master, Slave, Listener) 
 * 
 * @param mode char indicating mode of operations
 * @return true 
 * @return false 
 */
void Modbus_Set_Mode(char *mode);

/**
 * @brief Sets the value of the Slave address if the Modbus mode is Slave mode
 * 
 * @param slave_addr value of slave address
 */
void Modbus_Set_SlaveAddr(int slave_addr);

/**
 * @brief Returns char of Modbus Mode
 * 
 * @return char* 
 */
char *Modbus_Get_Mode(void);

int slave_address;

/**
 * @brief Return int of Slave Address
 * 
 * @return int 
 */
int Modbus_Get_Slaveaddr(void);
/**
 * @brief Sets Sniffer debug mode 
 * 
 */
void Modbus_Set_Sniffer_Log(void);
/**
 * @brief Clears Sniffer debug mode 
 * 
 */
void Modbus_Clear_Sniffer_Log(void);

/**
 * @brief gets the value from the specified holding register
 * 
 * @param register 
 * @param offset 
 * @return uint16_t 
 */
uint16_t Modbus_Get_Holding_Register_Value(uint16_t register_address);

/**
 * @brief gets the value from the specified input register
 * 
 * @param register 
 * @param offset 
 * @return uint16_t 
 */
uint16_t Modbus_Get_Input_Register_Value(uint16_t register_address);

#endif

