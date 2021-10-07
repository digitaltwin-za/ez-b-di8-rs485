
/* The module handles sending data out the RS-485 port */
/* and handles receiving data from the RS-485 port. */
#ifdef __XC32
#include <xc.h> /* Defines special funciton registers, CP0 regs  */
#endif
#include "fifo.h"
#include <math.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include "mb.h"
#include "mb_slaveregister.h"
#include "mbcrc.h"
#include "mb_setup.h"
#include "RS485_HAL.h"
#include <strings.h>
#include "config/development/system/console/sys_console.h"
//#include "ABB_Modbus_TimeTrigger.h"
/* ----------------------- Modbus includes ----------------------------------*/
#define NAN     0.0/0.0
#if ROBIN_BUILD
#include "IOT_F2_defines.h"
#include "crc32.h"
#include "driver/uart.h"
#include "esp_err.h"
#include "esp_log.h"


#endif
SYS_CONSOLE_HANDLE console;
//  <editor-fold defaultstate="collapsed" desc="Definitions">
#define MODBUS_PDU_SIZE_MIN 4
#define MODBUS_PDU_SIZE_MAX 256
#define MODBUS_PDU_SIZE_CRC 2
#define DEBUG_SNIFFER 0
#define DEBUG_SLAVE 0
#define MODBUS_INCREMENT_AND_LIMIT_UINT16(x) \
    {                                        \
        if (x < 0xFFFF)                      \
            x++;                             \
    }
#define MODBUS_INCREMENT_AND_LIMIT_UINT8(x) \
    {                                       \
        if (x < 0xFF)                       \
            x++;                            \
    }

/* FSM states */
typedef enum MODBUS_MASTER_STATE
{
    MODBUS_STATE_INIT = 0,
    MODBUS_STATE_IDLE = 1,
    MODBUS_STATE_TRANSMIT = 2,
    MODBUS_STATE_RECEIVE = 3,
    MODBUS_STATE_PROCESS_RX = 4
} modbus_master_state_t;

typedef struct _modbus_point_t
{
    /** enable/Disable the point */
    bool enable;
    /** Modbus function code for the point */
    modbus_register_types_t register_type;
    /** Modbus register address for the point */
    uint16_t register_address;
    /** Point type (width and how the data is to be interpreted) */
    modbus_point_types_t point_type;
    /** Swap flags for endianess */
    modbus_swap_flags_t swap_flags;
    /** Internal flag used to determine if the instance has been allocated */
    bool used;
    /** Time in seconds since point was last updated */
    uint16_t last_update_time;
    /** Present value of the Modbus point */
    modbus_point_value_t value;

    /** Status of the Modbus Point */
    modbus_point_status_t status;
    /** factor applied (multiplied by) the read point value to give the 
     * output value (applied 1st) */
    float scale;
    /** an offset applied to (added to) the read point value to give the 
     * output value (applied 2nd) */
    float shift;
    /** null terminated character string containing the friendly name for 
     * the Modbus point */
    char *name;
    /** null terminated ASCII string containing the engineering units 
     * to assigned to this point */
    char *units;
    /*Alarm Values*/
    /** A low limit for a register. On crossing a callback will be triggered */
    float low_threshold;
    /** A high limit for a register. On crossing a callback will be triggered */
    float high_threshold;
    /** A delta limit for a register to alarm callback when changing by delta since last read */
    float delta_threshold;
    /** Previous value holding register for the delta threshold check */
    modbus_point_value_t delta_previous_value;
    /** Time that point must be across threshold before alarm is triggered*/
    uint16_t alarm_time_delay;
    uint16_t alarm_time_delay_high_counter;
    uint16_t alarm_time_delay_low_counter;
    uint16_t alarm_time_delay_delta_counter;

} modbus_point_t;

typedef struct _modbus_device_t
{
    /** Modbus address of the device */
    uint8_t address;
    /** Internal state machine for tracking MODbus transactions*/
    uint8_t state;
    /** Timeout in seconds before the device instance it's data stale */
    uint8_t comms_timeout;
    /** Modbus point instance array */
    modbus_point_t points[MODBUS_DEVICE_POINT_COUNT];
    /** Number of points used/instantiated */
    uint8_t point_count;
    /** Internal flag we use to locally track if the device is online */
    bool connected;
    /** Internal counter we use to track the number of message response failures */
    uint8_t missed_messages;
    /** Timeout in hundreds of milliseconds that we wait */
    uint8_t message_timeout;
    /** Internal flag used to determine if the instance has been allocated */
    bool used;
    /** 16 bit flag register used to keep track of each devices endianess and,
     or the byte/word/double word swap config... Because... Modbus... */
    modbus_swap_flags_t swap_flags;
    /** Friendly name for the Modbus device */
    char *name;
} modbus_device_t;

typedef struct _modbus_port_t
{
    /* When a master node is powered up or reset, */
    /* it shall unconditionally enter the INITIALIZE state. */
    modbus_master_state_t master_state;
    /** Callback used registered when a Modbus PDU is sent to link the reply back to the correct caller*/
    void *(*callBack)(uint8_t *data, uint16_t len, modbus_device_t *device, modbus_point_t *point);
    /** Callback for alarm reporting*/
    void *(*alarm_callback)(modbus_device_t *device, uint8_t index);

    modbus_device_t *device;
    modbus_point_t *point;
    /* stores the latest received data */
    uint16_t reply_timeout;
    /* the serial port parameters */
    uint32_t modbus_baud_rate;
    modbus_data_bits_t modbus_data_bits;
    modbus_stop_bits_t modbus_stop_bits;
    modbus_parity_t modbus_parity;
    /** polling interval in 100ms increments from 1 to 100 */
    uint8_t poll_rate;
} modbus_port_t;

typedef struct _modbus_pdu_queue_t
{
    uint8_t pdu[MODBUS_PDU_SIZE_MAX];
    uint8_t lenTx;
    void *(*callBack)(uint8_t *data, uint16_t len, modbus_device_t *device, modbus_point_t *point);
    modbus_device_t *device;
    modbus_point_t *point;
    bool request_send;
} modbus_pdu_queue_t;

const char MODBUS_REGISTER_TYPE_NAMES[][20] = {
    "none",
    "coil",
    "discrete-input",
    "holding-regsiter",
    "input-register"};

const char MODBUS_POINT_TYPE_NAMES[][20] = {
    "none",
    "signed-16",
    "signed-32",
    "signed-64",
    "unsigned-16",
    "unsigned-32",
    "float",
    "double"};

// </editor-fold>
//  <editor-fold defaultstate="collapsed" desc="Global Variables">
/** Memory allocation/reservation of the Modbus objects */
static modbus_device_t modbus_device[MODBUS_DEVICE_COUNT];
static uint8_t modbus_device_count = 0;
static volatile bool modbus_100ms_has_ticked = false;
static volatile bool modbus_1s_has_ticked = false;

static volatile modbus_port_t modbus_port;
/* the FIFO structures for sending and receiving */
static fifo_buffer_t FIFO_MODBUS_Rx;
static fifo_buffer_t FIFO_MODBUS_Tx;
/* the buffer for receiving data (size must be a power of 2) */
static volatile uint8_t Modbus_Rx_Buffer[MODBUS_PDU_SIZE_MAX];
/* the buffer for sending data (size must be a power of 2) */
static volatile uint8_t Modbus_Tx_Buffer[MODBUS_PDU_SIZE_MAX];
static modbus_pdu_queue_t pdu_queue[MODBUS_PDU_QUEUE_LENGTH];
static bool modbus_debug = 0;

/**
 * @brief Updates the status of the current modbus point
 * 
 */
void MB_Point_Status_Update(void);

/**
 * @brief Reads Modbus Point Data
 * 
 * @param mb_mode input modbus mode type
 */
void MB_Read_Point(MODBUS_MODE mb_mode);

/**
 * @brief Stores incoming modbus message
 * 
 * @param mb_mode currnt modbus mode
 */
void MB_Message_Store(MODBUS_MODE mb_mode);

/**
 * @brief Transmits message stored in FIFO
 * 
 */
void MB_Transmit_Message();
// </editor-fold>

// interrupt handler for the rx messages
#if ROBIN_BUILD
intr_handle_t handle_console;
#endif

char *TAG_MODBUS = "Modbus";

bool boot = true;

// Sniffer Variables
uint8_t sniffer_data[259];
uint8_t sniffer_result;

bool sniffer_poll;
bool master_message;
bool message_split;
uint8_t master_len;

// Modbus Slave Variable
int data_length;
uint8_t slavetest_buffer[259];
uint16_t slavetest_registeraddress;
bool recieved_holding = false;
bool recieved_input = false;
bool recieved_write_single = false;
bool recieved_write_multiple = false;
Holding_Register_Read holding_register_readval[Holding_Register_Read_L] = {0};
Input_Register_Read input_register_readval[Input_Register_Read_L] = {0};
int sniffer_print = 0;
int splitcount = 0;
MODBUS_MODE modbus_mode;

/******************************************************************************/
/*                  LOCAL FUNCTIONS                                       */
/******************************************************************************/
//<editor-fold defaultstate="collapsed" desc="Local Functions">
static void Modbus_Send_Frame(
    uint8_t *buffer, /* frame to send (up to 501 bytes of data) */
    uint16_t nbytes);
static bool Modbus_Send_PDU(void(replyCallBack)(uint8_t *dataRx, uint16_t lenRx, modbus_device_t *device, modbus_point_t *point),
                            uint8_t *dataTx,
                            uint16_t lenTx,
                            modbus_device_t *device, modbus_point_t *point);

static void Modbus_Disable_Port(void);
static bool Modbus_Register_Callback(void(replyCallBack)(uint8_t *dataRx,
                                                         uint16_t lenRx, modbus_device_t *device, modbus_point_t *point));
static bool Modbus_Queue_Pdu(void(replyCallBack)(uint8_t *dataRx, uint16_t lenRx, modbus_device_t *device, modbus_point_t *point),
                             uint8_t *dataTx,
                             uint16_t lenTx,
                             modbus_device_t *device, modbus_point_t *point);

void esp_transmit_uart(void);

static bool Modbus_Validate_Function_Code(modbus_function_codes_t function_code)
{
    switch (function_code)
    {

    case MODBUS_FUNCTION_NONE:
    case MODBUS_FUNCTION_READ_COILS:
    case MODBUS_FUNCTION_READ_DISCRETE_INPUTS:
    case MODBUS_FUNCTION_WRITE_SINGLE_COIL:
    case MODBUS_FUNCTION_WRITE_MULTIPLE_COILS:
    case MODBUS_FUNCTION_READ_HOLDING_REGISTER:
    case MODBUS_FUNCTION_READ_INPUT_REGISTER:
    case MODBUS_FUNCTION_WRITE_REGISTER:
    case MODBUS_FUNCTION_WRITE_MULTIPLE_REGISTERS:
        return true;
    default:
        return false;
    }
}

/**
 * Checks the PDU Queue for how many messages are queued
 * @return the amount of PDU messages in the queue
 */
static uint8_t Modbus_Queue_Pdu_Count(void)
{
    uint8_t i, j = 0;
    for (i = 0; i < MODBUS_PDU_QUEUE_LENGTH; i++)
        if (pdu_queue[i].request_send)
            j++;
    return j;
}

static void Modbus_Queue_Pdu_Pop(void)
{
    if (Modbus_Send_PDU((void *)pdu_queue[0].callBack, pdu_queue[0].pdu,
                        pdu_queue[0].lenTx, pdu_queue[0].device, pdu_queue[0].point))
    {
        uint8_t i;
        for (i = 0; i < (MODBUS_PDU_QUEUE_LENGTH - 1); i++)
        {
            memcpy((void *)&pdu_queue[i], &pdu_queue[i + 1],
                   sizeof(modbus_pdu_queue_t));
        }
        memset(&pdu_queue[MODBUS_PDU_QUEUE_LENGTH - 1], 0x00,
               sizeof(modbus_pdu_queue_t));
    }
}

static bool Modbus_Queue_Pdu_Available(void)
{
    return !(Modbus_Queue_Pdu_Count() == MODBUS_PDU_QUEUE_LENGTH);
}

static bool Modbus_Queue_Pdu(void(replyCallBack)(uint8_t *dataRx, uint16_t lenRx, modbus_device_t *device, modbus_point_t *point),
                             uint8_t *dataTx,
                             uint16_t lenTx,
                             modbus_device_t *device, modbus_point_t *point)
{
    bool status = false;
    if (Modbus_Queue_Pdu_Available())
    {
        uint8_t i;
        for (i = 0; i < MODBUS_PDU_QUEUE_LENGTH; i++)
        {
            if (!pdu_queue[i].request_send)
            {
                pdu_queue[i].callBack = (void *)replyCallBack;
                pdu_queue[i].point = point;
                pdu_queue[i].device = device;
                memcpy(&pdu_queue[i].pdu[0], &dataTx[0], lenTx);
                pdu_queue[i].lenTx = lenTx;
                pdu_queue[i].request_send = true;
                status = true;
                break;
            }
        }
    }
    else
        puts("MB:ERR:PDU Queue FULL!!!");
    return status;
}

static bool Modbus_Register_Callback(void(replyCallBack)(uint8_t *dataRx,
                                                                                 uint16_t lenRx,
                                                                                 modbus_device_t *device,
                                                                                 modbus_point_t *point))
{
    modbus_port.callBack = (void *)replyCallBack;
    return true;
}

static bool Modbus_Send_PDU(void(replyCallBack)(uint8_t *dataRx, uint16_t lenRx,
                                                modbus_device_t *device, modbus_point_t *point),
                            uint8_t *dataTx,
                            uint16_t lenTx,
                            modbus_device_t *device, modbus_point_t *point)
{
    if (modbus_port.master_state != MODBUS_STATE_IDLE)
        return false; // If the MODBus port is not Idle, let calling Application
    // know we are busy

    modbus_port.callBack = (void *)replyCallBack;
    modbus_port.point = point;
    modbus_port.device = device;

    Modbus_Send_Frame(dataTx, lenTx);
    //    printf("MB:Tx:");
    //    uint16_t i = 0;
    //    for (i = 0; i < lenTx; i++)
    //        printf(" %02X", dataTx[i]);
    //    puts("");
    return true;
}

/**
 * @brief read incomming data
 * 
 */
void esp_data_read(void);

/**
 * @brief read incomming data for sniffer
 * 
 */
void Sniffer_read(void);

/****************************************************************************
 * DESCRIPTION: Transmits a frame using the UART
 * RETURN:      none
 * ALGORITHM:   none
 * NOTES:       none
 *****************************************************************************/
static void Modbus_Send_Frame(
    uint8_t *buffer, /* frame to send (up to 501 bytes of data) */
    uint16_t nbytes)
{ /* number of bytes of data (up to 501) */
    if (!buffer)
        return;
    if (FIFO_Add(&FIFO_MODBUS_Tx, buffer, nbytes))
    {
        FIFO_Flush(&FIFO_MODBUS_Rx);
        modbus_port.master_state = MODBUS_STATE_TRANSMIT;
        modbus_port.reply_timeout = 0;
        esp_transmit_uart();
        modbus_port.master_state = MODBUS_STATE_RECEIVE;
    }
    return;
}

void esp_transmit_uart(void)
{
    char buffer[2];
    modbus_port.master_state = MODBUS_STATE_TRANSMIT;
    char message_transmit[200];
    int message_tx_count = 0;
    while (!FIFO_Empty(&FIFO_MODBUS_Tx))
    {

       message_transmit[message_tx_count] =FIFO_Get(&FIFO_MODBUS_Tx) ;
        message_tx_count ++;
    }
    if (modbus_mode != MODBUS_MODE_LISTENER)     
     RS485_HAL_Modbus_Write(message_transmit, message_tx_count);

    // if (modbus_debug)
    //     printf("\n");
    if (FIFO_Empty(&FIFO_MODBUS_Tx))
    {
        //   printf("Stuff");
    esp_data_read();
    }
}

void esp_data_read(void)
{
    if (modbus_mode != MODBUS_MODE_LISTENER)
    {
        if (modbus_mode == MODBUS_MODE_MASTER || modbus_mode == MODBUS_MODE_FF)
        {
            uint8_t byte[13];
            memset(byte, 0x00, sizeof(byte));
            int count = 20;
            // while (count != 0)
            // {
                int result = RS485_HAL_Modbus_Read(byte, 13, 20);
               // SYS_CONSOLE_Write(console, &byte, result);
                // for (int i = 0; i < 9; i++){
                //         printf("%02X ", byte[i]);
                //         //FIFO_Put((fifo_buffer_t *)&FIFO_MODBUS_Rx, byte[i]);
                //     }
                if (result >= 5)
                {
                    for (int i = 0; i < result; i++)
                    {
                        if (modbus_debug)
                            printf("%02X ", byte[i]);

                        FIFO_Put((fifo_buffer_t *)&FIFO_MODBUS_Rx, byte[i]);
                    }
                    if (modbus_debug)
                        printf("\n");
        
                }
       
                count--;
            //}
        }

        if (modbus_mode == MODBUS_MODE_SLAVE)
        {
            uint8_t byte[259];
            memset(byte, 0x00, sizeof(byte));
            data_length = RS485_HAL_Modbus_Read(byte, sizeof(byte), 20);

            if (data_length)
            {
//                for (int i = 0; i < data_length; i++)
//                {
//                  if (modbus_debug)
//                    {
//                        //      printf("%02X ", byte[i]);
//                    }
//                    slavetest_buffer[i] = byte[i];
//                }
                
                if (modbus_debug)
                    printf("\n");
                memcpy(slavetest_buffer,byte,data_length);
            }
         
      //    SYS_CONSOLE_Write(console, &byte, data_length);
        }

        RS485_HAL_Flush();
    }
}

void Sniffer_Read(void)
{
    sniffer_result = 0;
    //FIFO_Flush(&FIFO_MODBUS_Rx);
    memset(sniffer_data, 0x00, sizeof(sniffer_data));
    sniffer_result = RS485_HAL_Modbus_Read(sniffer_data, 100, 1);

    // if (sniffer_result)
    // {
    //     if (modbus_debug)
    //     {
    //         for (int i = 0; i < sniffer_result; i++)
    //         {
    //              printf("%02X ", sniffer_data[i]);
    //              FIFO_Put((fifo_buffer_t *)&FIFO_MODBUS_Rx, sniffer_data[i]);
    //         }
    //         // printf("\n");
    //     }
    // }

    RS485_HAL_Flush();
    Modbus_Type();
}

void Modbus_Type(void)
{
    sniffer_poll = false;
    master_message = false;
    message_split = false;
    uint16_t CRC_confirm = 0;
    bool CRC_Result;
    uint16_t CRC_swap = 0;
    uint16_t CRC_Slave = 0;
    int count;
    int State = 0;
    int Slave_State = 0;
    Raw_SnifferData.Fulllen = 0;
    master_len = 0;
    uint16_t CRC_confirm_extended = 0;
    int slave_message_len = 0;
    bool CRC_Split = false;

    if (sniffer_result)
    {

        Raw_SnifferData.Slave_Add = sniffer_data[0];
        Raw_SnifferData.function_code = sniffer_data[1];
        Raw_SnifferData.Start_Address = sniffer_data[2] << 8 | sniffer_data[3];

        // add test for writing code
        if (Raw_SnifferData.function_code == MODBUS_FUNCTION_WRITE_SINGLE_COIL ||
            Raw_SnifferData.function_code == MODBUS_FUNCTION_WRITE_REGISTER)
        {

            Raw_SnifferData.Single_Data = sniffer_data[4] << 8 | sniffer_data[5];
            CRC_swap = sniffer_data[7] << 8 | sniffer_data[6];
            State = 1;
            master_len = 8;
        }

        if (Raw_SnifferData.function_code == MODBUS_FUNCTION_WRITE_MULTIPLE_COILS)
        {
            Raw_SnifferData.No_Reg = sniffer_data[4] << 8 | sniffer_data[5];
            Raw_SnifferData.Byte_Count = sniffer_data[6];
            Raw_SnifferData.Output_Values = sniffer_data[7] << 8 | sniffer_data[8];

            CRC_swap = sniffer_data[10] << 8 | sniffer_data[9];
            State = 2;
            master_len = 11;
        }

        if (Raw_SnifferData.function_code == MODBUS_FUNCTION_WRITE_MULTIPLE_REGISTERS)
        {
            Raw_SnifferData.No_Reg = sniffer_data[4] << 8 | sniffer_data[5];
            Raw_SnifferData.Data_len = sniffer_data[6];
            count = Raw_SnifferData.Data_len;
            for (int i = 0; i < count; i++)
            {
                Raw_SnifferData.data[i] = sniffer_data[7 + i];
            }

            CRC_swap = sniffer_data[8 + count] << 8 | sniffer_data[7 + count];
            State = 3;
            master_len = 9 + count;
        }
        if (Raw_SnifferData.function_code == MODBUS_FUNCTION_READ_COILS ||
            Raw_SnifferData.function_code == MODBUS_FUNCTION_READ_DISCRETE_INPUTS ||
            Raw_SnifferData.function_code == MODBUS_FUNCTION_READ_HOLDING_REGISTER ||
            Raw_SnifferData.function_code == MODBUS_FUNCTION_READ_INPUT_REGISTER)
        {

            Raw_SnifferData.No_Reg = sniffer_data[4] << 8 | sniffer_data[5];
            Raw_SnifferData.CRC = sniffer_data[6] << 8 | sniffer_data[7];
            CRC_swap = sniffer_data[7] << 8 | sniffer_data[6];
            State = 4;
            master_len = 8;
        }
        //printf ("CRC Swapped %04X\n",CRC_swap );
        CRC_confirm = usMBCRC16(sniffer_data, sniffer_result - 2);
        if (CRC_confirm == CRC_swap)
            CRC_Result = true;
        else if (CRC_confirm != CRC_swap)
        {

            CRC_Result = false;
            CRC_confirm_extended = usMBCRC16(sniffer_data, sniffer_result - (sniffer_result - master_len) - 2);
            if ((CRC_confirm_extended == CRC_swap) && State != 0)
            {

                //  master_message = true;
                if (sniffer_result > master_len)
                {
                    Raw_SnifferData.Fulllen = sniffer_result - master_len;
                    sniffer_result = master_len;
                    CRC_Result = true;
                    message_split = true;
                }
                // printf("LEngth a: %02X\n", Raw_SnifferData.Fulllen);

                //  printf("data needs splitting\n");
            }

            // printf ("CRC extended %04X\n",CRC_confirm_extended);
        }
        {
            if (State <= 4 && State != 0 && CRC_Result == 1)
            {
                master_message = true;
                Master_data.MSlave_address = sniffer_data[0];
                Master_data.MStart_address = sniffer_data[2] << 8 | sniffer_data[3];

                if (sniffer_print | DEBUG_SNIFFER)
                    printf("Modbus Master Frame Recieved\n");

                for (int i = 0; i < MODBUS_DEVICE_COUNT; i++)
                {

                    if (Sniffer_Comb[i].Slave_Add == Raw_SnifferData.Slave_Add && Sniffer_Comb[i].allocated)
                        break;

                    if (Sniffer_Comb[i].Slave_Add != Raw_SnifferData.Slave_Add && !Sniffer_Comb[i].allocated)
                    {

                        Sniffer_Comb[i].Slave_Add = Raw_SnifferData.Slave_Add;
                        Sniffer_Comb[i].allocated = 1;
                        if (sniffer_print | DEBUG_SNIFFER)
                            printf("data allocated from slave device %02X and allocated to slot %d\n", Sniffer_Comb[i].Slave_Add, i);
                        if (Sniffer_Comb[i].allocated)
                            break;
                    }
                }

#if (DEBUG_SNIFFER)
                {
                    printf("Slave Address (HEX): %02X\n", Raw_SnifferData.Slave_Add);
                    printf("Function Code (HEX): %02X\n", Raw_SnifferData.function_code);
                    printf("Start Address (HEX): %04X\n", Raw_SnifferData.Start_Address);
                }

                if (State == 1)
                {

                    printf("Single data Register to be written: %04X\n", Raw_SnifferData.Single_Data);
                }

                if (State == 2)
                {

                    printf("Number of Coils to Write (HEX): %04X\n", Raw_SnifferData.No_Reg);
                    printf("Byte Count: %04X\n", Raw_SnifferData.Byte_Count);
                    printf("Output Values: %04X\n", Raw_SnifferData.Output_Values);
                }

                if (State == 3)
                {

                    printf("Number of Register: %04X\n", Raw_SnifferData.No_Reg);
                    printf("data length Byte Count: %04X\n", Raw_SnifferData.Data_len);
                    printf("data Sent: ");
                    count = Raw_SnifferData.Data_len;
                    for (int i = 0; i < count; i++)
                    {
                        printf("%02X ", Raw_SnifferData.data[i]);
                    }
                    printf("\n");
                }

                if (State == 4)

                {

                    printf("Number of Registers to Read (HEX): %04X\n", Raw_SnifferData.No_Reg);
                }

                {
                    printf("Swapped CRC from Device (HEX): %04X\n", CRC_swap);
                    printf("CRC from Calculation (HEX): %04X\n", CRC_confirm);
                    printf("CRC Result: %d\n", CRC_Result);
                    printf("\n");
                }
#endif
            }
        }
        // printf ("State is %d\n",State);
        //printf("Message Split is %d\n",message_split);
        if (message_split)
        {
            if (sniffer_print)
            {
                //printf("Length slave: %02X\n", Raw_SnifferData.Fulllen);
                // printf("Length master: %02X\n", master_len);
                printf("Split message\n");
            }
            CRC_Split = 0;
            splitcount = 0;
            // memset(Slave_data.SSlave_data, 0x00, sizeof(Slave_data.SSlave_data));
            if (CRC_Split == 0)
            {
                Slave_data.SSlave_data[0] = sniffer_data[master_len];
                splitcount++;
                for (int y = 1; y < 20; y++)
                {
                    Slave_data.SSlave_data[y] = sniffer_data[y + master_len];
                    splitcount++;
                    // printf("%02X ",  Slave_data.SSlave_data[y] );

                    if (y > 1)
                    {
                        CRC_Slave = Slave_data.SSlave_data[y] << 8 | Slave_data.SSlave_data[y - 1];
                        //  printf("CRC_SLAVE %04X\n", CRC_Slave);
                        CRC_confirm = usMBCRC16(Slave_data.SSlave_data, y - 1);
                        //    printf("CRC_confirm %04X\n", CRC_confirm);
                    }
                    if (CRC_Slave == CRC_confirm)
                    {
                        CRC_Split = 1;
                        //        printf("CRC Match\n");
                        break;
                    }

                    if (y > 19)
                    {

                        // memset(Slave_data.SSlave_data, 0x00, sizeof(Slave_data.SSlave_data));
                        //     printf("out of bounds\n");
                        break;
                    }
                    //    printf("breakout\n");
                }

                // printf("\n");
                if (CRC_Split == 1)
                {
                    for (int i = 0; i < splitcount; i++)
                    {
                        //  FIFO_Put((fifo_buffer_t *)&FIFO_MODBUS_Rx, Slave_data.SSlave_data[i]);
                        // if  (sniffer_print)
                        //  printf("%02X", Slave_data.SSlave_data[i]);
                        CRC_Result = true;
                        sniffer_poll = true;
                    }
                    //printf("\n");
                }
            }
        }

        // if (Raw_SnifferData.Fulllen > 20)
        // {
        //     Raw_SnifferData.Fulllen = 0;
        //
        //     sniffer_poll = true;
        // }

        if (CRC_Result == 0)
        {
            Raw_SnifferData.Function_code_Slave = sniffer_data[1];
            slave_message_len = 2;

            if (Raw_SnifferData.Function_code_Slave == MODBUS_FUNCTION_WRITE_SINGLE_COIL ||
                Raw_SnifferData.Function_code_Slave == MODBUS_FUNCTION_WRITE_MULTIPLE_COILS ||
                Raw_SnifferData.Function_code_Slave == MODBUS_FUNCTION_WRITE_MULTIPLE_REGISTERS)
            {
                Raw_SnifferData.Start_Address = sniffer_data[2] << 8 | sniffer_data[3];
                Raw_SnifferData.No_Reg = sniffer_data[4] << 8 | sniffer_data[5];
                CRC_Slave = sniffer_data[7] << 8 | sniffer_data[6];
                Slave_State = 2;
                slave_message_len = 8;
            }
            else
            {
                Raw_SnifferData.Slave_len = sniffer_data[2];
                for (int i = 0; i < Raw_SnifferData.Slave_len; i++)
                {
                    Raw_SnifferData.Slave_Data[i] = sniffer_data[3 + i];
                    slave_message_len++;
                }
                CRC_Slave = sniffer_data[4 + Raw_SnifferData.Slave_len] << 8 | sniffer_data[3 + Raw_SnifferData.Slave_len];
                Slave_State = 1;
                slave_message_len += 2;
            }
            if (CRC_confirm == CRC_Slave)

                CRC_Result = true;

            if (CRC_confirm != CRC_Slave)
                CRC_Result = false;

            {
                if (Raw_SnifferData.function_code != Raw_SnifferData.Function_code_Slave)
                {
#if (DEBUG_SNIFFER)
                    printf("Error Between Transmit and Recieve");
#endif
                }
                if (Slave_State == 1 && CRC_Result == 1 && Raw_SnifferData.function_code == Raw_SnifferData.Function_code_Slave)
                {
                    sniffer_poll = true;

                    for (int i = 0; i < slave_message_len; i++)
                    {
                        FIFO_Put((fifo_buffer_t *)&FIFO_MODBUS_Rx, sniffer_data[i]);
                        //printf("%02X",sniffer_data[i]);
                    }
                    if (sniffer_print | DEBUG_SNIFFER)
                        printf("Slave Detected\n");
#if (DEBUG_SNIFFER)

                    printf("Swapped CRC from Device (HEX): %04X\n", CRC_Slave);
                    printf("CRC from Calculation (HEX): %04X\n", CRC_confirm);
                    printf("CRC Result: %d\n", CRC_Result);
                    printf("Slave data:");
                    for (int i = 0; i < Raw_SnifferData.Slave_len; i++)
                    {
                        printf("%02X ", Raw_SnifferData.Slave_Data[i]);
                    }
                    printf("\n");
#endif
                }

                if (Slave_State == 2 && CRC_Result == 1 && Raw_SnifferData.function_code == Raw_SnifferData.Function_code_Slave)
                {

                    sniffer_poll = true;
                    for (int i = 0; i < sniffer_result; i++)
                    {
                        FIFO_Put((fifo_buffer_t *)&FIFO_MODBUS_Rx, sniffer_data[i]);
                        printf("%02X", sniffer_data[i]);
                    }
                    if (sniffer_print | DEBUG_SNIFFER)
                        printf("Slave Detected\n");
#if (DEBUG_SNIFFER)

                    printf("Swapped CRC from Device (HEX): %04X\n", CRC_Slave);
                    printf("CRC from Calculation (HEX): %04X\n", CRC_confirm);
                    printf("CRC Result: %d\n", CRC_Result);
                    printf("Starting Address: %04X\n", Raw_SnifferData.Start_Address);
                    printf("Amount of Registers: %04X\n", Raw_SnifferData.No_Reg);
                    printf("\n");
#endif
                }
                if (CRC_Result == 0)
                {

                    if (sniffer_print | DEBUG_SNIFFER)
                    {
                        printf("Invalid data\n");
                        for (int i = 0; i < sniffer_result; i++)
                        {
                            // FIFO_Put((fifo_buffer_t *)&FIFO_MODBUS_Rx, sniffer_data[i]);
                            //  printf("%02X ", sniffer_data[i + master_len + 1]);
                            sniffer_poll = true;
                        }
                        // printf("\n");
                    }
                }
            }
        }
    }
}
bool Modbus_Validate_Baud_Rate(uint32_t baud)
{
    bool valid = true;

    switch (baud)
    {
    case 4800:
    case 9600:
    case 19200:
    case 38400:
    case 57600:
    case 76800:
    case 115200:
        break;
    default:
        valid = false;
        break;
    }
    return valid;
}

bool Modbus_Validate_Data_Bits(modbus_data_bits_t data_bits)
{
    bool valid = true;

    switch (data_bits)
    {
    case MODBUS_DATA_BITS_8:
    case MODBUS_DATA_BITS_9:
        break;
    default:
        valid = false;
        break;
    }
    return valid;
}

bool Modbus_Validate_Stop_Bits(modbus_stop_bits_t stop_bits)
{
    bool valid = true;

    switch (stop_bits)
    {
    case MODBUS_STOP_BITS_1:
    case MODBUS_STOP_BITS_2:
        break;
    default:
        valid = false;
        break;
    }
    return valid;
}

bool Modbus_Validate_Parity(modbus_parity_t parity)
{
    bool valid = true;

    switch (parity)
    {
    case MODBUS_PARITY_EVEN:
    case MODBUS_PARITY_ODD:
    case MODBUS_PARITY_NONE:
        break;
    default:
        valid = false;
        break;
    }
    return valid;
}

bool Modbus_Validate_Poll_Rate(uint8_t poll_rate)
{
    if ((poll_rate > 0) && (poll_rate < 254))
        return true;
    return false;
}

/**
 * @see mb.h
 */
void Modbus_Initialize_Port(void)
{
   
    RS485_HAL_Port_Configure(CUSTOM, modbus_port.modbus_baud_rate, modbus_port.modbus_data_bits, modbus_port.modbus_stop_bits, modbus_port.modbus_parity);
    memset(Sniffer_Comb, 0x00, sizeof(Sniffer_Comb));
}

/**
 * 
 */
static void Modbus_Disable_Port(void)
{
    #if ROBIN_BUILD
    uart_disable_rx_intr(UART_NUM_1);
    #endif
}

static int16_t Modbus_Slave_Device_Point_To_Index(modbus_device_t *device, modbus_point_t *point)
{
    if ((device != NULL) && (point != NULL))
    {
        uint8_t i;
        for (i = 0; i < MODBUS_DEVICE_POINT_COUNT; i++)
        {
            if (&device->points[i] == point)
                return i;
        }
    }
    return -1;
}

uint16_t Modbus_Get_Register_Count_From_Point_Type(
    modbus_point_types_t point_type)
{
    uint16_t len = 0;
    switch (point_type)
    {

    case MODBUS_POINT_TYPES_SIGNED_16:
    case MODBUS_POINT_TYPES_UNSIGNED_16:
        len = 1;
        break;
    case MODBUS_POINT_TYPES_SIGNED_32:
    case MODBUS_POINT_TYPES_UNSIGNED_32:
    case MODBUS_POINT_TYPES_SINGLE_PRECISION_FLOAT:
        len = 2;
        break;
    case MODBUS_POINT_TYPES_SIGNED_64:
    case MODBUS_POINT_TYPES_DOUBLE_PRECISION_FLOAT:
        len = 4;
        break;
    case MODBUS_POINT_TYPES_NONE:
    default:
        len = 0;
    }
    return len;
}

uint16_t Modbus_Parse_UInt16(modbus_swap_flags_t swap_flag, uint8_t *data)
{

    union
    {
        uint16_t value_16;
        uint8_t value_8[1];
    } combiner;
    if (swap_flag & MODBUS_SWAP_FLAG_INT16_BYTE)
    {
        combiner.value_8[0] = data[1];
        combiner.value_8[1] = data[0];
    }
    else
    {
        combiner.value_8[0] = data[0];
        combiner.value_8[1] = data[1];
    }
    return combiner.value_16;
}

uint32_t Modbus_Parse_UInt32(modbus_swap_flags_t swap_flag, uint8_t *data)
{

    union
    {
        uint32_t value_32;
        uint16_t value_16[2];
        uint8_t value_8[4];
    } combiner;
    if (swap_flag & MODBUS_SWAP_FLAG_INT32_BYTE)
    {
        combiner.value_8[0] = data[1];
        combiner.value_8[1] = data[0];
        combiner.value_8[2] = data[3];
        combiner.value_8[3] = data[2];
    }
    else
    {
        combiner.value_8[0] = data[0];
        combiner.value_8[1] = data[1];
        combiner.value_8[2] = data[2];
        combiner.value_8[3] = data[3];
    }
    if (swap_flag & MODBUS_SWAP_FLAG_INT32_WORD)
    {
        uint16_t temp;
        temp = combiner.value_16[0];
        combiner.value_16[0] = combiner.value_16[1];
        combiner.value_16[1] = temp;
    }
    return combiner.value_32;
}

uint64_t Modbus_Parse_UInt64(modbus_swap_flags_t swap_flag, uint8_t *data)
{

    union
    {
        uint64_t value_64;
        uint32_t value_32[2];
        uint16_t value_16[4];
        uint8_t value_8[8];
    } combiner;
    if (swap_flag & MODBUS_SWAP_FLAG_INT64_BYTE)
    {
        combiner.value_8[0] = data[1];
        combiner.value_8[1] = data[0];
        combiner.value_8[2] = data[3];
        combiner.value_8[3] = data[2];
        combiner.value_8[4] = data[5];
        combiner.value_8[5] = data[4];
        combiner.value_8[6] = data[7];
        combiner.value_8[7] = data[6];
    }
    else
    {
        combiner.value_8[0] = data[0];
        combiner.value_8[1] = data[1];
        combiner.value_8[2] = data[2];
        combiner.value_8[3] = data[3];
        combiner.value_8[4] = data[4];
        combiner.value_8[5] = data[5];
        combiner.value_8[6] = data[6];
        combiner.value_8[7] = data[7];
    }
    if (swap_flag & MODBUS_SWAP_FLAG_INT64_WORD)
    {
        uint16_t temp;
        temp = combiner.value_16[0];
        combiner.value_16[0] = combiner.value_16[1];
        combiner.value_16[1] = temp;
        temp = combiner.value_16[2];
        combiner.value_16[2] = combiner.value_16[3];
        combiner.value_16[3] = temp;
    }
    if (swap_flag & MODBUS_SWAP_FLAG_INT64_DOUBLE_WORD)
    {
        uint32_t temp;
        temp = combiner.value_16[0];
        combiner.value_32[0] = combiner.value_32[1];
        combiner.value_32[1] = temp;
    }
    return combiner.value_64;
}

float Modbus_Parse_Float(modbus_swap_flags_t swap_flag, uint8_t *data)
{

    union
    {
        uint16_t value_16[2];
        uint8_t value_8[4];
        float value_float;
    } combiner;
    combiner.value_8[0] = data[0];
    combiner.value_8[1] = data[1];
    combiner.value_8[2] = data[2];
    combiner.value_8[3] = data[3];
    if (swap_flag & MODBUS_SWAP_FLAG_FLOAT_BYTE)
    {
        combiner.value_8[0] = data[1];
        combiner.value_8[1] = data[0];
        combiner.value_8[2] = data[3];
        combiner.value_8[3] = data[2];
    }
    else
    {
        combiner.value_8[0] = data[0];
        combiner.value_8[1] = data[1];
        combiner.value_8[2] = data[2];
        combiner.value_8[3] = data[3];
    }
    if (swap_flag & MODBUS_SWAP_FLAG_FLOAT_WORD)
    {
        uint16_t temp;
        temp = combiner.value_16[0];
        combiner.value_16[0] = combiner.value_16[1];
        combiner.value_16[1] = temp;
    }
    return combiner.value_float;
}

long double Modbus_Parse_Long_Double(modbus_swap_flags_t swap_flag, uint8_t *data)
{

    union
    {
        long double value_long_double;
        uint32_t value_32[2];
        uint16_t value_16[4];
        uint8_t value_8[8];
    } combiner;
    if (swap_flag & MODBUS_SWAP_FLAG_DOUBLE_BYTE)
    {
        combiner.value_8[0] = data[1];
        combiner.value_8[1] = data[0];
        combiner.value_8[2] = data[3];
        combiner.value_8[3] = data[2];
        combiner.value_8[4] = data[5];
        combiner.value_8[5] = data[4];
        combiner.value_8[6] = data[7];
        combiner.value_8[7] = data[6];
    }
    else
    {
        combiner.value_8[0] = data[0];
        combiner.value_8[1] = data[1];
        combiner.value_8[2] = data[2];
        combiner.value_8[3] = data[3];
        combiner.value_8[4] = data[4];
        combiner.value_8[5] = data[5];
        combiner.value_8[6] = data[6];
        combiner.value_8[7] = data[7];
    }
    if (swap_flag & MODBUS_SWAP_FLAG_DOUBLE_WORD)
    {
        uint16_t temp;
        temp = combiner.value_16[0];
        combiner.value_16[0] = combiner.value_16[1];
        combiner.value_16[1] = temp;
        temp = combiner.value_16[2];
        combiner.value_16[2] = combiner.value_16[3];
        combiner.value_16[3] = temp;
    }
    if (swap_flag & MODBUS_SWAP_FLAG_DOUBLE_DOUBLE_WORD)
    {
        uint32_t temp;
        temp = combiner.value_16[0];
        combiner.value_32[0] = combiner.value_32[1];
        combiner.value_32[1] = temp;
    }
    return combiner.value_long_double;
}

/**
 * Callback to parse a Modbus response called by Modbus stack on reception of 
 * a message.
 * @param data      pointer to the data packet the modbus stack received
 * @param len       length of the array
 * @param device    pointer to the modbus_device_t that sent the request to the 
 *                  modbus stack
 * @param point     pointer to the modbus_point_t that this response should 
 *                  apply to
 */

void Modbus_Reply_Callback(uint8_t *data, uint16_t len, modbus_device_t *device, modbus_point_t *point)
{

    // Confirm that the this response has a registered modbus device and point
    if ((device == NULL) || (point == NULL))
    {
        return;
    }
    //Confirm that the response is a valid PDU
    if ((len < MODBUS_PDU_SIZE_MIN) || (len > MODBUS_PDU_SIZE_MAX))
    {
        puts("MB:PointReadCB:ERR:Invalid PDU size!");
        point->status |= MODBUS_POINT_STATUS_ERROR;
        return;
    }
    // printf("MB:PointReadCB:Rx: ");
    // for (i = 0; i < len; i++)
    //     printf(" %02X", data[i]);
    // puts("");
    //Valid Checksum?
    uint16_t calc_crc = usMBCRC16(data, len - 2);
    uint16_t message_crc = (data[len - 1] << 8) + data[len - 2];
    if (calc_crc != message_crc)
    {
        puts("MB:PointReadCB:ERR:Invalid Checksum!");
        point->status |= MODBUS_POINT_STATUS_ERROR;
        return;
    }
    //Is the reponse from the Slave ID that invoked the Modbus transaction?
    if (data[0] != device->address)
    {
        puts("MB:PointReadCB:ERR:Response from wrong slave!");
        point->status |= MODBUS_POINT_STATUS_ERROR;
        return;
    }
    // Is the response code valid for the point that invoked the Modbus transaction
    if (data[1] != point->register_type)
    {
        point->status |= MODBUS_POINT_STATUS_ERROR;
        puts("MB:PointReadCB:ERR:Invalid Function");
        return;
    }

    //Extract the payload byte count
    uint8_t payload_len = data[2];
    uint8_t calc_payload_len = len - 5; //Modbus response overhead = 5 bytes
    // Confirm that the payload length is valid for the point type requested
    uint8_t expected_payload_len = 0;
    if ((point->register_type == MODBUS_REGISTER_TYPES_COIL) || (point->register_type == MODBUS_REGISTER_TYPES_DISCRETE_INPUT))
        expected_payload_len = Modbus_Get_Register_Count_From_Point_Type(
            point->point_type);
    else
        expected_payload_len = Modbus_Get_Register_Count_From_Point_Type(
                                   point->point_type) *
                               2;
    //Confirm the payload length makes sense!
    if ((payload_len != calc_payload_len) || (expected_payload_len != payload_len))
    {
        point->status |= MODBUS_POINT_STATUS_ERROR;
        printf("MB:PointReadCB:ERR:Invalid Payload Length %d - %d - %d\n",
               payload_len,
               expected_payload_len,
               calc_payload_len);
        Modbus_Queue_Pdu_Pop();
        FIFO_Flush(&FIFO_MODBUS_Rx);
        return;
    }
    //If we get here, it means we've passed all the sanity checks, and we expect
    //that the message we have is valid. Let the parsing begin!
    //Parse response.
    point->value.as_int64 = 0;
    point->status &= MODBUS_POINT_STATUS_OK;
    if (modbus_debug)
        printf("MB:PointReadCB:Dev:%s@%d,Name: %s, Units: %s, Addr:%04X,Func:%d,Val: ",
               device->name,
               device->address,
               point->name,
               point->units,
               point->register_address,
               point->register_type);
    if ((point->register_type != MODBUS_REGISTER_TYPES_COIL) && (point->register_type != MODBUS_REGISTER_TYPES_DISCRETE_INPUT))
    {
        switch (point->point_type)
        {
        case MODBUS_POINT_TYPES_SIGNED_16:
            point->value.as_float += ((int16_t)Modbus_Parse_UInt16(device->swap_flags, &data[3])) * point->scale + point->shift;
            if (modbus_debug)
                printf("%.2f\n", point->value.as_float);
            break;
        case MODBUS_POINT_TYPES_SIGNED_32:
            point->value.as_float += ((int32_t)Modbus_Parse_UInt32(device->swap_flags, &data[3])) * point->scale + point->shift;
            if (modbus_debug)
                printf("%.2f\n", point->value.as_float);
            break;
        case MODBUS_POINT_TYPES_SIGNED_64:
            point->value.as_float += ((int64_t)Modbus_Parse_UInt64(device->swap_flags, &data[3])) * point->scale + point->shift;
            if (modbus_debug)
                printf("%.2f\n", point->value.as_float);

            break;
        case MODBUS_POINT_TYPES_UNSIGNED_16:
            point->value.as_float += (Modbus_Parse_UInt16(device->swap_flags, &data[3]) * point->scale) + point->shift;
            if (modbus_debug)
                printf("%.2f\n", point->value.as_float);
            break;
        case MODBUS_POINT_TYPES_UNSIGNED_32:
            point->value.as_float += (Modbus_Parse_UInt32(device->swap_flags, &data[3]) * point->scale) + point->shift;
            if (modbus_debug)
                printf("%.2f\n", point->value.as_float);

            // The following if statement is
            if (modbus_mode == MODBUS_MODE_FF)
            {
            //    ABB_TimeTrigger(point->register_address, point->value.as_float);
            }
            break;
        case MODBUS_POINT_TYPES_SINGLE_PRECISION_FLOAT:
            point->value.as_float += (Modbus_Parse_Float(device->swap_flags, &data[3]) * point->scale) + point->shift;
            if (modbus_debug)
                printf("%.2f\n", point->value.as_float);
            break;
            //        case MODBUS_POINT_TYPES_DOUBLE_PRECISION_FLOAT:
            //            point->value.as_double += Modbus_Parse_Long_Double(point->swap_flags,&data[3]*point->scale));
            //            break;
        case MODBUS_POINT_TYPES_NONE:
        default:
            point->value.as_int64 = 0;
            if (modbus_debug)
                printf("ERR\n");
            break;
        }
    }
    else if ((point->register_type == MODBUS_REGISTER_TYPES_COIL) || (point->register_type == MODBUS_REGISTER_TYPES_DISCRETE_INPUT))
    {
        point->value.as_uint16 += data[3];
        if (modbus_debug)
            printf("%d\n", point->value.as_uint16);
    }
    else
    {
        if (modbus_debug)
            puts("ERR");
    }
    point->status &= (0xFFFFFFFF ^ MODBUS_POINT_STATUS_OFFLINE); // Clear the Offline flag
    // if (Iot_Get_Client_State() == IOT_CLIENT_STATE_MODEM_ON_AND_CONNECTED)
    // {
    //     LED_POWER_SetHigh();
    //     Platform_Delay_Ms(10);
    //     LED_POWER_SetLow();
    // }
    if (modbus_port.alarm_callback != NULL)
    {
        if (!isnanf(point->delta_threshold))
        {

            if (fabsf(point->value.as_float - point->delta_previous_value.as_float) >= point->delta_threshold)
            {
                if (point->alarm_time_delay_delta_counter == 0)
                    point->alarm_time_delay_delta_counter = point->alarm_time_delay;
            }
            else
            {
                if (point->alarm_time_delay_delta_counter > 0)
                    point->alarm_time_delay_delta_counter = 0;
            }
        }
        if (!isnanf(point->low_threshold))
        {
            if (point->value.as_float < point->low_threshold)
            {
                if (point->alarm_time_delay_low_counter == 0)
                    point->alarm_time_delay_low_counter = point->alarm_time_delay;
            }
            else
            {
                if (point->alarm_time_delay_low_counter > 0)
                    point->alarm_time_delay_low_counter = 0;
            }
        }
        if (!isnanf(point->high_threshold))
        {

            if (point->value.as_float > point->high_threshold)
            {
                if (point->alarm_time_delay_high_counter == 0)
                    point->alarm_time_delay_high_counter = point->alarm_time_delay;
            }
            else
            {
                if (point->alarm_time_delay_high_counter > 0)
                    point->alarm_time_delay_high_counter = 0;
            }
        }
        if ((point->alarm_time_delay_high_counter == 0) &&
            (point->alarm_time_delay_low_counter == 0) &&
            (point->alarm_time_delay_delta_counter == 0))
            point->status &= 0xFFFFFFFF ^ MODBUS_POINT_STATUS_ALARM; // Clear the alarm flag
    }
    point->last_update_time = 0;
    device->connected = true;
    device->message_timeout = 0;

    Callback_flag = false;
}

static bool Modbus_Read_Register(
    uint8_t slave_address,
    modbus_device_t *device, modbus_point_t *point)
{

    bool status = false;
    uint8_t message[8] = {0};
    uint16_t crc = 0;
    modbus_function_codes_t function_code = MODBUS_FUNCTION_NONE;
    uint16_t len = Modbus_Get_Register_Count_From_Point_Type(point->point_type);
    uint16_t register_add;
    if (len == 0)
        return false;
    switch (point->register_type)
    {
    case MODBUS_REGISTER_TYPES_COIL:
        function_code = MODBUS_FUNCTION_READ_COILS;
        break;
    case MODBUS_REGISTER_TYPES_DISCRETE_INPUT:
        function_code = MODBUS_FUNCTION_READ_DISCRETE_INPUTS;
        break;
    case MODBUS_REGISTER_TYPES_HOLDING_REGISTER:
        function_code = MODBUS_FUNCTION_READ_HOLDING_REGISTER;
        break;
    case MODBUS_REGISTER_TYPES_INPUT_REGISTER:
        function_code = MODBUS_FUNCTION_READ_INPUT_REGISTER;
        break;
    default:
        return false;
    }

    message[0] = slave_address;                           /* Slave Address */
    message[1] = function_code;                           /* MODBUS Function Code */
    message[2] = (point->register_address >> 8) & 0x00FF; /* ADDR HI */
    message[3] = point->register_address & 0xFF;          /* ADDR LO */
    message[4] = (len >> 8) & 0xFF;                       /* NUM HI */
    message[5] = len & 0xFF;                              /* NUM LO */
    crc = usMBCRC16(message, 6);
    message[6] = crc & 0x00FF;
    message[7] = (crc >> 8) & 0xFF;

    register_add = message[2] << 8 | message[3];

    // printf("MB:Poll:Addr: %d Func:%d Mem:%04X\nMB:Poll:MSG: ",
    //        slave_address,
    //        function_code,
    //        point->register_address);
    // uint8_t i = 0;
    // for (i = 0; i < 8; i++)
    //     printf(" %02X", message[i]);
    //    puts("");

    if (modbus_mode == MODBUS_MODE_LISTENER)
    {
        if ((Master_data.MSlave_address == slave_address) &&
            (Master_data.MStart_address == register_add))
        {

            //   printf("Entering Callbaclk\n");
            Callback_flag = true;
            Modbus_Queue_Pdu(Modbus_Reply_Callback, &message[0], 8, device, point);
            //    printf("Exited Callbaclk\n");
        }
    }

    if (modbus_mode == MODBUS_MODE_MASTER || modbus_mode == MODBUS_MODE_FF)
    {
        Modbus_Queue_Pdu(Modbus_Reply_Callback, &message[0], 8, device, point);
    }
    status = true;

    return status;
}
// </editor-fold>

bool Modbus_Write_Register(
    uint8_t slave_address,
    uint16_t register_address,
    modbus_register_types_t register_type,
    float value)
{
    bool status = false;
    uint8_t message[8] = {0};
    uint16_t crc = 0;
    uint16_t int_value = (uint16_t)value;
    modbus_function_codes_t function_code = MODBUS_FUNCTION_NONE;
    switch (register_type)
    {
    case MODBUS_REGISTER_TYPES_COIL:
        function_code = MODBUS_FUNCTION_WRITE_SINGLE_COIL;
        break;
    case MODBUS_REGISTER_TYPES_HOLDING_REGISTER:
        function_code = MODBUS_FUNCTION_WRITE_REGISTER;
        break;
    case MODBUS_REGISTER_TYPES_DISCRETE_INPUT:
    case MODBUS_REGISTER_TYPES_INPUT_REGISTER:
    default:
        return false;
    }
    if (function_code == MODBUS_FUNCTION_WRITE_SINGLE_COIL)
    {
        if (value == 0)
        {
            int_value = 0;
        }
        if (value == 1)
        {
            int_value = 0xFF00;
        }
    }
    message[0] = slave_address;                    /* Slave Address */
    message[1] = function_code;                    /* MODBUS Function Code */
    message[2] = (register_address >> 8) & 0x00FF; /* ADDR HI */
    message[3] = register_address & 0xFF;          /* ADDR LO */
    message[4] = (int_value >> 8) & 0xFF;          /* NUM HI */
    message[5] = int_value & 0xFF;                 /* NUM LO */
    crc = usMBCRC16(message, 6);
    message[6] = crc & 0x00FF;
    message[7] = (crc >> 8) & 0xFF;
    printf("MB:Write:Addr: %d Func:%d Mem:%04X\nMB:Poll:MSG: ",
           slave_address,
           function_code,
           register_address);
    Modbus_Send_Frame(&message[0], 8);
    status = true;
    return status;
}

bool Modbus_Write_Multiple_Sequential(
    uint8_t slave_address,
    uint16_t starting_register,
    uint8_t no_registers,
    modbus_register_types_t register_type,
    float value[50])
{

    bool status = false;
    modbus_function_codes_t function_code = MODBUS_FUNCTION_NONE;
    switch (register_type)
    {
    case MODBUS_REGISTER_TYPES_HOLDING_REGISTER:
        function_code = MODBUS_FUNCTION_WRITE_MULTIPLE_REGISTERS;
        (void)function_code;
        break;

    default:
        return false;
    }

    uint8_t message[50] = {0};
    uint16_t crc = 0;
    message[0] = slave_address;                     /* Slave Address */
    message[1] = function_code;                     /* MODBUS Function Code */
    message[2] = (starting_register >> 8) & 0x00FF; /* ADDR HI */
    message[3] = starting_register & 0xFF;          /* ADDR LO */
    message[4] = (no_registers >> 8) & 0x00FF;      /* ADDR HI */
    message[5] = no_registers & 0xFF;               /* ADDR LO */
    message[6] = no_registers*2;                    /* BYTE COUNT */
    int mess_len = 7;
    for (int i = 0; i < no_registers; i++)
    {
       
        message[mess_len] = ((uint16_t)value[i] >> 8) & 0xFF;
        message[mess_len + 1] = (uint16_t)value[i] & 0xFF;
        mess_len += 2;
    }
  
    crc = usMBCRC16(message, mess_len);

    message[mess_len] = crc & 0x00FF;
    message[mess_len + 1] = (crc >> 8) & 0xFF;
    mess_len += 2;

    Modbus_Send_Frame(&message[0], mess_len);

    status = true;
    return status;
}

bool Modbus_Slave_GetMasterData()
{
    bool status = false;
    recieved_holding = false;
    recieved_input = false;
    recieved_write_single = false;
    recieved_write_multiple = false;
    uint16_t Register_Offset = 0;
    Master_Recieved_Data.Recieved_Slave_Address = slavetest_buffer[0];
    Master_Recieved_Data.Recieved_Function_Code = slavetest_buffer[1];
    Master_Recieved_Data.Recieved_Register_StartAddress = (slavetest_buffer[2] << 8) | slavetest_buffer[3];
    int Frame_RecLen = 4;

    if (Master_Recieved_Data.Recieved_Slave_Address == slave_address)
    {
        if (Master_Recieved_Data.Recieved_Function_Code == MODBUS_FUNCTION_READ_HOLDING_REGISTER)
        {
            Register_Offset = Holding_Register_Offset;
            recieved_holding = true;
            Master_Recieved_Data.Recieved_Register_NoRegister = (slavetest_buffer[Frame_RecLen] << 8) | slavetest_buffer[Frame_RecLen + 1];
            Master_Recieved_Data.CRC_HI = slavetest_buffer[Frame_RecLen + 2];
            Master_Recieved_Data.CRC_LO = slavetest_buffer[Frame_RecLen + 3];

            if (modbus_debug)
            {
                printf("MB:Holding Register Read: Slave Address %X, Starting Address %X, No of Registers  %X\n",
                       Master_Recieved_Data.Recieved_Slave_Address,
                       Master_Recieved_Data.Recieved_Register_StartAddress,
                       Master_Recieved_Data.Recieved_Register_NoRegister);
            }
            
      //      SYS_CONSOLE_Write(console,"MB:Holding Register Read\n",sizeof("MB:Holding Register Read\n"));
        }

        if (Master_Recieved_Data.Recieved_Function_Code == MODBUS_FUNCTION_READ_INPUT_REGISTER)
        {
            Register_Offset = Input_Register_Offset;
            recieved_input = true;
            Master_Recieved_Data.Recieved_Register_NoRegister = (slavetest_buffer[Frame_RecLen] << 8) | slavetest_buffer[Frame_RecLen + 1];
            Master_Recieved_Data.CRC_HI = slavetest_buffer[Frame_RecLen + 2];
            Master_Recieved_Data.CRC_LO = slavetest_buffer[Frame_RecLen + 3];

            if (modbus_debug)
            {
                printf("MB:Input Register Read: Slave Address %X, Starting Address %X, No of Registers  %X\n",
                       Master_Recieved_Data.Recieved_Slave_Address,
                       Master_Recieved_Data.Recieved_Register_StartAddress,
                       Master_Recieved_Data.Recieved_Register_NoRegister);
            }
        }

        if (Master_Recieved_Data.Recieved_Function_Code == MODBUS_FUNCTION_WRITE_REGISTER)
        {
            Register_Offset = Holding_Register_Offset;
            recieved_write_single = true;
            Master_Recieved_Data.recieved_Data[0] = (slavetest_buffer[Frame_RecLen] << 8) | slavetest_buffer[Frame_RecLen + 1];
            Master_Recieved_Data.CRC_HI = slavetest_buffer[Frame_RecLen + 2];
            Master_Recieved_Data.CRC_LO = slavetest_buffer[Frame_RecLen + 3];

            if (modbus_debug)
            {
                printf("MB:Single Register write: Slave Address %X, Starting Address %X, Value to be written %X",
                       Master_Recieved_Data.Recieved_Slave_Address,
                       Master_Recieved_Data.Recieved_Register_StartAddress,
                       Master_Recieved_Data.recieved_Data[0]);
            }
        }

        if (Master_Recieved_Data.Recieved_Function_Code == MODBUS_FUNCTION_WRITE_MULTIPLE_REGISTERS)
        {
            Register_Offset = Holding_Register_Offset;
            recieved_write_multiple = true;
            Master_Recieved_Data.Recieved_Register_NoRegister = (slavetest_buffer[Frame_RecLen] << 8) | slavetest_buffer[Frame_RecLen + 1];

            Master_Recieved_Data.Recieved_Register_TotalBytes = slavetest_buffer[Frame_RecLen + 2];

            if (modbus_debug)
            {
                printf("MB:Multiple Register write: Slave Address %X, Starting Address %X, No of Registers %X\n",
                       Master_Recieved_Data.Recieved_Slave_Address,
                       Master_Recieved_Data.Recieved_Register_StartAddress,
                       Master_Recieved_Data.Recieved_Register_NoRegister);
            }

            for (int i = 0; i < (Master_Recieved_Data.Recieved_Register_TotalBytes) / 2; i++)
            {
                Master_Recieved_Data.recieved_Data[i] = (slavetest_buffer[Frame_RecLen + 3 + 2 * i] << 8) | slavetest_buffer[Frame_RecLen + 4 + 2 * i];
                if (modbus_debug)
                {
                    printf("MB:data to be writtent to  Register %d:  %04X\n", (Master_Recieved_Data.Recieved_Register_StartAddress + i), Master_Recieved_Data.recieved_Data[i]);
                }
            }
        }

        if ((recieved_write_single == true) | (recieved_write_multiple == true))
        {
            Modbus_Slave_WriteData(Master_Recieved_Data.Recieved_Slave_Address,
                                   Master_Recieved_Data.Recieved_Function_Code,
                                   (Master_Recieved_Data.Recieved_Register_StartAddress),
                                   Master_Recieved_Data.recieved_Data,
                                   Master_Recieved_Data.Recieved_Register_NoRegister,
                                   Master_Recieved_Data.Recieved_Register_TotalBytes);
        }
        Modbus_Slave_ReadData(
            Master_Recieved_Data.Recieved_Slave_Address,
            Master_Recieved_Data.Recieved_Function_Code,
            (Master_Recieved_Data.Recieved_Register_StartAddress - Register_Offset),
            Master_Recieved_Data.Recieved_Register_NoRegister,
            Master_Recieved_Data.recieved_Data);

        status = true;

        //  printf("MB:Total Frame Length %d\n", data_length);
    }

    if ((Master_Recieved_Data.Recieved_Slave_Address != slave_address))
        if (modbus_debug)
        {
            printf("Request for Different Slave\n");
        }
    return status;
}

bool Modbus_Slave_ReadData(
    uint8_t recieved_slave_address,
    uint8_t function_Code,
    uint16_t register_address,
    uint16_t no_registers,
    uint16_t recieved_Data[1000])

{
    bool send_data = false;
    bool status = false;
    uint8_t message[30] = {0};
    uint16_t crc = 0;
    int Payload_len = 0;
    char buffer[2];
    message[0] = recieved_slave_address;

    if (recieved_slave_address == slave_address)
    {

        message[1] = function_Code;
        message[2] = no_registers * 2;

        Payload_len = 3;
        if ((recieved_holding == true))
        {

            for (int i = 0; i < no_registers; i++)
            {
                if (holding_register_readval[register_address + i].Register_Enable == 2)
                {
                    send_data = true;
                    //   uint8_t bit = 0x80;
                    message[1] = function_Code ^ 0x80;
                    message[2] = 03;
                    printf(" Holding Register %02X Disabled\n", register_address + i);
                    break;
                }
                if (holding_register_readval[register_address + i].Register_Enable == 1)
                {
                    send_data = true;
                    message[3 + 2 * i] = ((holding_register_readval[register_address + i].Register_Data) >> 8) & 0xFF; /* NUM HI */
                    message[4 + 2 * i] = (holding_register_readval[register_address + i].Register_Data) & 0xFF;
                    if (modbus_debug)
                        printf("data Read for  Holding Register %X : %02X%02X\n", (register_address + i), message[3 + 2 * i], message[4 + 2 * i]);
                    Payload_len += 2;
                }
            }
        }

        if ((recieved_input == true))
        {

            for (int i = 0; i < no_registers; i++)
            {
                if (input_register_readval[register_address + i].Register_Enable == 2)
                {
                    send_data = true;
                    //   uint8_t bit = 0x80;
                    message[1] = function_Code ^ 0x80;
                    message[2] = 03;
                    if (modbus_debug)
                        printf("Input Register %02X Disabled\n", register_address + i);
                    break;
                }
                if (input_register_readval[register_address + i].Register_Enable == 1)
                {
                    send_data = true;
                    message[3 + 2 * i] = ((input_register_readval[register_address + i].Register_Data) >> 8) & 0xFF; /* NUM HI */
                    message[4 + 2 * i] = (input_register_readval[register_address + i].Register_Data) & 0xFF;
                    if (modbus_debug)
                        printf("data Read for Input Register %X : %02X%02X\n", (register_address + i), message[3 + 2 * i], message[4 + 2 * i]);
                    Payload_len += 2;
                }
            }
        }

        if ((recieved_write_single == true))

        {
            send_data = true;
            message[2] = (register_address >> 8) & 0xFF;
            message[3] = register_address & 0xFF;
            message[4] = (recieved_Data[0] >> 8) & 0xFF;
            message[5] = recieved_Data[0] & 0xFF;
            Payload_len = 6;
            printf(" Write data\n");
        }

        if ((recieved_write_single == true))

        {
            send_data = true;
            message[2] = (register_address >> 8) & 0xFF;
            message[3] = register_address & 0xFF;
            message[4] = (no_registers >> 8) & 0xFF;
            message[5] = no_registers & 0xFF;
            Payload_len = 6;
        }

        crc = usMBCRC16(message, Payload_len);
        message[Payload_len] = crc & 0xFF;
        message[Payload_len + 1] = (crc >> 8) & 0xFF;

        Payload_len += 2;
        // printf("Size of message %d\n", Payload_len);
    }
    uint8_t tx_buffer[100];
    int tx_count;
    if (send_data == true)
    {
        for (int i = 0; i < Payload_len; i++)
        {

            sprintf(buffer, "%1c", message[i]);
            tx_buffer[i]= message[i];
            //     printf("%02X ", buffer[0]);
     
        }
          
             RS485_HAL_Modbus_Write(tx_buffer, Payload_len);
          //   SYS_CONSOLE_Write(console,&tx_buffer,Payload_len);
        // printf(" \n");
    }
    //  Modbus_Send_Frame(message, Payload_len);
    //Modbus_Send_Frame(&message[0], 8);

    status = true;
    return status;
}

bool Modbus_Slave_WriteData(
    uint8_t recieved_slave_address,
    uint8_t function_Code,
    uint16_t register_address,
    uint16_t recieved_Data[1000],
    uint16_t no_registers,
    uint8_t no_Bytes)

{

    bool status = false;
    if (recieved_slave_address == slave_address)
    {
        if (recieved_write_single == true)
        {
            Modbus_Slave_Holding_Register_Store(recieved_Data[0], register_address);
            printf("Single data Written \n");
        }

        if (recieved_write_multiple == true)
        {
            for (int i = 0; i < no_Bytes / 2; i++)
            {
                Modbus_Slave_Holding_Register_Store(recieved_Data[i], register_address + i);
                printf("Multiple data Values Written \n"); /* code */
            }
        }
    }

    return status;
}

bool Modbus_Evaluate_Flags(modbus_device_t *device, modbus_point_t *point)
{
    return true;
}

bool Modbus_Register_Alarm_Callback(void(Alarm_Callback)(
    modbus_device_t *device,
    uint8_t index))
{
    modbus_port.alarm_callback = (void *)Alarm_Callback;
    return true;
}
// </editor-fold>

/******************************************************************************/
/*                  INTERFACE FUNCTIONS                                       */
/******************************************************************************/
//  <editor-fold defaultstate="collapsed" desc="Interface Functions">

/**
 * @see mb.h
 */
uint32_t Modbus_Get_Baud_Rate(void)
{
    return modbus_port.modbus_baud_rate;
}

/**
 * @see mb.h
 */
modbus_parity_t Modbus_Get_Parity(void)
{
    return modbus_port.modbus_parity;
}

/**
 * @see mb.h
 */
modbus_stop_bits_t Modbus_Get_Stop_Bits(void)
{
    return modbus_port.modbus_stop_bits;
}

/**
 * @see mb.h
 */
modbus_data_bits_t Modbus_Get_Data_Bits(void)
{
    return modbus_port.modbus_data_bits;
}

/**
 * @see mb.h
 */
uint8_t Modbus_Get_Poll_Rate(void)
{
    return modbus_port.poll_rate;
}
/**
 * @see mb.h
 */
char *Modbus_Get_Mode(void)
{
    char *mode;
    if (modbus_mode == MODBUS_MODE_DISABLE)
        mode = "d";
    if (modbus_mode == MODBUS_MODE_MASTER)
        mode = "m";
    if (modbus_mode == MODBUS_MODE_SLAVE)
        mode = "s";
    if (modbus_mode == MODBUS_MODE_LISTENER)
        mode = "l";
    if (modbus_mode == MODBUS_MODE_FF)
        mode = "abb";
    return mode;
}
/**
 * @see mb.h
 */
int Modbus_Get_Slaveaddr(void)
{
    return slave_address;
}

const char *Modbus_Get_Register_Type_String(modbus_register_types_t type)
{
    if (Modbus_Validate_Register_Type(type))
    {
        return MODBUS_REGISTER_TYPE_NAMES[type];
    }
    return NULL;
}

const char *Modbus_Get_Point_Type_String(modbus_point_types_t type)
{
    if (Modbus_Validate_Point_Type(type))
    {
        return MODBUS_POINT_TYPE_NAMES[type];
    }
    return NULL;
}

/**
 * @see mb.h
 */
bool Modbus_Set_Baud_Rate(uint32_t baud)
{
    bool valid = Modbus_Validate_Baud_Rate(baud);
    if (valid)
    {
        modbus_port.modbus_baud_rate = baud;
   //   Modbus_Initialize_Port();
    }
    return valid;
}

/**
 * @see mb.h
 */
bool Modbus_Set_Data_Bits(modbus_data_bits_t data_bits)
{
    bool valid = Modbus_Validate_Data_Bits(data_bits);
    if (valid)
    {
        modbus_port.modbus_data_bits = data_bits;
  //    Modbus_Initialize_Port();
    }
    return valid;
}

/**
 * @see mb.h
 */
bool Modbus_Set_Stop_Bits(modbus_stop_bits_t stop_bits)
{
    bool valid = Modbus_Validate_Stop_Bits(stop_bits);
    if (valid)
    {
        modbus_port.modbus_stop_bits = stop_bits;
     // Modbus_Initialize_Port();
    }
    return valid;
}

/**
 * @see mb.h
 */
bool Modbus_Set_Parity(modbus_parity_t parity)
{
    bool valid = Modbus_Validate_Parity(parity);
    if (valid)
    {
        modbus_port.modbus_parity = parity;
        //  Modbus_Initialize_Port();
    }
    return valid;
}

/**
 * @see mb.h
 */
void Modbus_Set_Mode(char mode[4])
{

    if (strcasecmp(mode, "m") == 0)
    {
        modbus_mode = MODBUS_MODE_MASTER;
        //ESP_LOGI(TAG_MODBUS, "Mode: Master");
    }
    else if (strcasecmp(mode, "s") == 0)
    {
        modbus_mode = MODBUS_MODE_SLAVE;
        //ESP_LOGI(TAG_MODBUS, "Mode: Slave");
    }
    else if (strcasecmp(mode, "l") == 0)
    {
        modbus_mode = MODBUS_MODE_LISTENER;
        //ESP_LOGI(TAG_MODBUS, "Mode: Listener");
    }
    else if (strcasecmp(mode, "abb") == 0)
    {
        modbus_mode = MODBUS_MODE_FF;
        //ESP_LOGI(TAG_MODBUS, "Mode: ABB Time Trigger");
    }
    else if (strcasecmp(mode, "d") == 0)
    {
        modbus_mode = MODBUS_MODE_DISABLE;
        //ESP_LOGI(TAG_MODBUS, "Mode: Disabled");
    }
    else
    {
        modbus_mode = MODBUS_MODE_DISABLE;
        //ESP_LOGW(TAG_MODBUS, "Modbus Mode Not Configured! Disabled");
    }
}

void Modbus_Set_SlaveAddr(int slave_addr)
{

    if ((slave_addr > 0) && (slave_addr < 256))
    {
        slave_address = slave_addr;
        //ESP_LOGI(TAG_MODBUS, "Slave Address set to %d", slave_address);
    }
    else
    {
        slave_address = 1;
        //ESP_LOGW(TAG_MODBUS, "Slave Address out of bounds. Default set to %d", slave_address);
    }
}

/**
 * @see mb.h
 */
bool Modbus_Set_Poll_Rate(uint8_t poll_rate_in_100ms)
{
    if ((poll_rate_in_100ms > 0) && (poll_rate_in_100ms < 100))
    {
        modbus_port.poll_rate = poll_rate_in_100ms;
        // Modbus_Initialize_Port();
        return true;
    }
    return false;
}

/**
 * @see mb.h
 */
bool Modbus_Validate_Register_Type(modbus_register_types_t reg_type)
{
    bool result = false;
    switch (reg_type)
    {
    case MODBUS_REGISTER_TYPES_NONE:
    case MODBUS_REGISTER_TYPES_COIL:
    case MODBUS_REGISTER_TYPES_DISCRETE_INPUT:
    case MODBUS_REGISTER_TYPES_HOLDING_REGISTER:
    case MODBUS_REGISTER_TYPES_INPUT_REGISTER:
        result = true;
        break;
    default:
        result = false;
    }
    return result;
}

/**
 * @see mb.h
 */
bool Modbus_Validate_Point_Type(modbus_point_types_t point_type)
{
    bool result = false;
    switch (point_type)
    {
    case MODBUS_POINT_TYPES_NONE:
    case MODBUS_POINT_TYPES_SIGNED_16:
    case MODBUS_POINT_TYPES_SIGNED_32:
    case MODBUS_POINT_TYPES_SIGNED_64:
    case MODBUS_POINT_TYPES_UNSIGNED_16:
    case MODBUS_POINT_TYPES_UNSIGNED_32:
    case MODBUS_POINT_TYPES_SINGLE_PRECISION_FLOAT:
    case MODBUS_POINT_TYPES_DOUBLE_PRECISION_FLOAT:
        result = true;
        break;
    default:
        result = false;
    }
    return result;
}

/**
 * @see mb.h
 */
uint8_t Modbus_Get_Device_Count(void)
{
    return modbus_device_count;
}

/**
 * @see mb.h
 */
modbus_device_t *Modbus_Slave_Device_Constructor(uint8_t modbus_slave_address,
                                                 modbus_swap_flags_t swap_flags,
                                                 uint8_t timeout,
                                                 char *name)
{
    //   //  printf("MB->Modbus_Slave_Device_Constructor:%d,%04X,%d,%s\n",
    //            modbus_slave_address,
    //            swap_flags,
    //            timeout,
    //            name);
    if ((modbus_slave_address == 0) || (modbus_slave_address > 253))
    {
        puts("MB->Invalid Slave Address");
        return NULL;
    }
    if (modbus_device_count < MODBUS_DEVICE_COUNT)
    {
        uint8_t index = 0;
        while (modbus_device[index].used)
            index++;
        modbus_device_count++;
        modbus_device[index].used = true;
        modbus_device[index].address = modbus_slave_address;
        modbus_device[index].comms_timeout = timeout;
        modbus_device[index].point_count = 0;
        modbus_device[index].swap_flags = swap_flags;
        if (name != NULL)
            modbus_device[index].name = name;
        else
            modbus_device[index].name = MODBUS_DEFAULT_NAME;
        uint8_t i = 0;
        for (i = 0; i < MODBUS_DEVICE_POINT_COUNT; i++)
            modbus_device[index].points[i].used = false;
        if (modbus_debug)
            printf("MB:New Device Instance @ %d Addr: %02X\n", index, modbus_device[index].address);
        return &modbus_device[index];
    }
    return NULL;
}

/**
 * @see mb.h
 */
void Modbus_Slave_Device_Destructor(modbus_device_t *modbus_slave_device)
{
    if (modbus_slave_device != NULL)
    {
        if (modbus_slave_device->used)
        {
            modbus_slave_device->used = false;
            modbus_device_count--;
        }
    }
}

/**
 * @see mb.h
 */
bool Modbus_Slave_Device_Is_Valid(modbus_device_t *modbus_slave_device)
{
    if (modbus_slave_device != NULL)
    {
        if (modbus_slave_device->used)
            return true;
    }
    return false;
}

/**
 * @see mb.h
 */
bool Modbus_Slave_Device_Is_Connected(modbus_device_t *modbus_slave_device)
{
    if (modbus_slave_device != NULL)
    {
        if (modbus_slave_device->used)
            return modbus_slave_device->used;
    }
    return false;
}

/**
 * @see mb.h
 */
uint8_t Modbus_Slave_Device_Get_Point_Count(
    modbus_device_t *modbus_slave_device)
{
    if (modbus_slave_device != NULL)
        if (modbus_slave_device->used)
        {
            return modbus_slave_device->point_count;
        }
    return 0;
}

/**
 * @see mb.h
 */
uint8_t *Modbus_Slave_Device_Get_Name(
    modbus_device_t *modbus_slave_device)
{
    if (modbus_slave_device != NULL)
        if (modbus_slave_device->used)
            return (uint8_t *)modbus_slave_device->name;
    return (uint8_t *)"";
}

/**
 * @see mb.h
 */
uint8_t Modbus_Slave_Device_Get_Address(
    modbus_device_t *modbus_slave_device)
{
    if (modbus_slave_device != NULL)
        if (modbus_slave_device->used)
            return modbus_slave_device->address;
    return 0;
}

/**
 * @see mb.h
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
    char *units)
{
    if ((register_type == MODBUS_REGISTER_TYPES_NONE) || (register_type > MODBUS_REGISTER_TYPES_INPUT_REGISTER))
        return 0xFF;
    if (slave_device != NULL)
        if (slave_device->used)
        {
            if (slave_device->point_count < MODBUS_DEVICE_POINT_COUNT)
            {
                uint8_t index = 0;
                while (slave_device->points[index].used)
                    index++;
                slave_device->points[index].used = true;
                slave_device->point_count++;
                slave_device->points[index].register_type = register_type;
                slave_device->points[index].register_address = register_address;
                slave_device->points[index].point_type = point_type;
                slave_device->points[index].scale = scale;
                slave_device->points[index].shift = shift;
                slave_device->points[index].low_threshold = low_threshold;
                slave_device->points[index].high_threshold = high_threshold;
                slave_device->points[index].delta_threshold = delta_threshold;
                slave_device->points[index].alarm_time_delay = alarm_time_delay;
                slave_device->points[index].alarm_time_delay_high_counter = 0;
                slave_device->points[index].alarm_time_delay_low_counter = 0;
                slave_device->points[index].delta_previous_value.as_float = 0.0f;
                slave_device->points[index].value.as_float = 0.0f;
                if (name != NULL)
                    slave_device->points[index].name = name;
                else
                    slave_device->points[index].name = MODBUS_DEFAULT_NAME;
                if (units != NULL)
                    slave_device->points[index].units = units;
                else
                    slave_device->points[index].units = MODBUS_DEFAULT_POINT_UNITS;
                if (modbus_debug)
                    printf("MB->Point Created @ %d: \n\tDev:%d \n\tRegType: %d\n\tPointType: %d\n\tAddr: %04X\n",
                           index,
                           slave_device->address,
                           register_type,
                           point_type,
                           register_address);
                return index;
            }
        }
    return 0xFF; //Error Index
}

/**
 * @see mb.h
 */
bool Modbus_Slave_Device_Point_Destructor(modbus_device_t *modbus_slave_device,
                                          uint8_t index)
{
    if (modbus_slave_device != NULL)
        if (modbus_slave_device->used)
            if (index < MODBUS_DEVICE_POINT_COUNT)
            {
                modbus_slave_device->points[index].used = false;
                modbus_slave_device->point_count--;
                return true;
            }
    return false;
}

/**
 * @see mb.h
 */
void Modbus_Slave_Device_Point_Set_Enabled(modbus_device_t *modbus_slave_device,
                                           uint8_t index,
                                           bool enabled)
{
    if (modbus_slave_device != NULL)
        if (modbus_slave_device->used)
            if (index < MODBUS_DEVICE_POINT_COUNT)
                modbus_slave_device->points[index].enable = enabled;
}

/**
 * @see mb.h
 */
bool Modbus_Slave_Device_Point_Is_Valid(modbus_device_t *modbus_slave_device,
                                        uint8_t index)
{
    if (modbus_slave_device != NULL)
        if (modbus_slave_device->used)
            if (index < MODBUS_DEVICE_POINT_COUNT)
                return modbus_slave_device->points[index].used;
    return false;
}

/**
 * @see mb.h
 */
modbus_point_value_t Modbus_Slave_Device_Point_Get_Value(
    modbus_device_t *modbus_slave_device,
    uint8_t index)
{
    modbus_point_value_t value;
    value.as_int64 = 0;
    if (Modbus_Slave_Device_Is_Valid(modbus_slave_device))
        if (modbus_slave_device->used)
            if (index < MODBUS_DEVICE_POINT_COUNT)
            {
                modbus_slave_device->points[index].delta_previous_value =
                    modbus_slave_device->points[index].value;
                return modbus_slave_device->points[index].value;
            }
    return value;
}

/**
 * @see mb.h
 */
char *Modbus_Slave_Device_Point_Get_Name(
    modbus_device_t *modbus_slave_device,
    uint8_t index)
{
    if (modbus_slave_device != NULL)
        if (modbus_slave_device->used)
            if (modbus_slave_device->points[index].used)
                return modbus_slave_device->points[index].name;
    return "";
}

/**
 * @see mb.h
 */
char *Modbus_Slave_Device_Point_Get_Units(
    modbus_device_t *modbus_slave_device,
    uint8_t index)
{
    if (modbus_slave_device != NULL)
        if (modbus_slave_device->used)
            if (modbus_slave_device->points[index].used)
                return modbus_slave_device->points[index].units;
    return "";
}

/**
 * @see mb.h
 */
uint16_t Modbus_Slave_Device_Point_Get_Address(
    modbus_device_t *modbus_slave_device,
    uint8_t index)
{
    if (modbus_slave_device != NULL)
        if (modbus_slave_device->used)
            if (modbus_slave_device->points[index].used)
                return modbus_slave_device->points[index].register_address;
    return 0xFFFF;
}

/**
 * @see mb.h
 */
modbus_register_types_t Modbus_Slave_Device_Point_Get_Register_Type(
    modbus_device_t *modbus_slave_device,
    uint8_t index)
{
    if (modbus_slave_device != NULL)
        if (modbus_slave_device->used)
            if (modbus_slave_device->points[index].used)
                return modbus_slave_device->points[index].register_type;
    return MODBUS_REGISTER_TYPES_NONE;
}

/**
 * @see mb.h
 */
modbus_point_types_t Modbus_Slave_Device_Point_Get_Point_Type(
    modbus_device_t *modbus_slave_device,
    uint8_t index)
{
    if (modbus_slave_device != NULL)
        if (modbus_slave_device->used)
            if (modbus_slave_device->points[index].used)
                return modbus_slave_device->points[index].point_type;
    return MODBUS_POINT_TYPES_NONE;
}

/**
 * @see mb.h
 */
float Modbus_Slave_Device_Point_Get_Scale(
    modbus_device_t *modbus_slave_device,
    uint8_t index)
{
    if (modbus_slave_device != NULL)
        if (modbus_slave_device->used)
        {
            return modbus_slave_device->points[index].scale;
        }
    return 1.0f;
}

/**
 * @see mb.hmodbus_point_status_t
 */
modbus_point_status_t Modbus_Slave_Device_Point_Get_Status(
    modbus_device_t *modbus_slave_device,
    uint8_t index)
{
    if (modbus_slave_device != NULL)
        if (modbus_slave_device->used)
        {
            if (!modbus_slave_device->connected)
                return MODBUS_POINT_STATUS_OFFLINE;
            if (index < MODBUS_DEVICE_POINT_COUNT)
            {
                return modbus_slave_device->points[index].status;
            }
        }
    return MODBUS_POINT_STATUS_ERROR;
}

/**
 * @see mb.h
 */
char *Modbus_Slave_Device_Point_Get_Status_String(
    modbus_device_t *modbus_slave_device,
    uint8_t index)
{
    if (modbus_slave_device != NULL)
        if (modbus_slave_device->used)
            if (modbus_slave_device->points[index].used)
            {
                if (modbus_slave_device->connected)
                    switch (modbus_slave_device->points[index].status)
                    {
                    case MODBUS_POINT_STATUS_OK:
                        return "ok";
                    case MODBUS_POINT_STATUS_STALE:
                        return "stale";
                    case MODBUS_POINT_STATUS_OFFLINE:
                        return "offline";
                    case MODBUS_POINT_STATUS_ERROR:
                    default:
                        return "error";
                    }
            }
    return "offline";
}

/**
 * @see mb.h
 */
uint8_t Modbus_Slave_Device_Point_Get_Index(
    modbus_device_t *modbus_slave_device,
    uint16_t point_address,
    modbus_register_types_t register_type)
{
    uint8_t i;
    if (modbus_slave_device == NULL)
        return 0xFF;
    if (!Modbus_Validate_Register_Type(register_type))
        return 0xFF;
    for (i = 0; i < MODBUS_DEVICE_POINT_COUNT; i++)
    {
        if (modbus_slave_device->points[i].used)
        {
            if (modbus_slave_device->points[i].register_address == point_address)
                if (modbus_slave_device->points[i].register_type == register_type)
                    return i;
        }
    }
    return 0xFF;
}

/**
 * @see mb.h
 */
void Modbus_Initialize(uint32_t baud_rate,
                       modbus_data_bits_t data_bits,
                       modbus_stop_bits_t stop_bits,
                       modbus_parity_t parity,
                       uint8_t poll_rate,
                       void(alarm_callBack)(
                           modbus_device_t *device,
                           uint8_t index))
{
    uint8_t i, j;
    //ESP_LOGI(TAG_MODBUS, "Initializing Modbus Stack:");
  RS485_HAL_Port_Init();
    // Initialize the Modbus port structs
    modbus_port.master_state = MODBUS_STATE_INIT;
    modbus_port.callBack = NULL;
    modbus_port.alarm_callback = NULL;
    modbus_port.reply_timeout = 0;
    modbus_port.poll_rate = MODBUS_DEFAULT_POLL_RATE_100MS;
    /* Initialize the Rs485 buffers */
    FIFO_Init((fifo_buffer_t *)&FIFO_MODBUS_Rx, Modbus_Rx_Buffer, sizeof(Modbus_Rx_Buffer));
    FIFO_Init((fifo_buffer_t *)&FIFO_MODBUS_Tx, Modbus_Tx_Buffer, sizeof(Modbus_Tx_Buffer));
    memset(&pdu_queue[0], 0x00,
           MODBUS_PDU_QUEUE_LENGTH * sizeof(modbus_pdu_queue_t));
    // Initialize the Modbus slave device objects
    for (i = 0; i < MODBUS_DEVICE_COUNT; i++)
    {
        modbus_device[i].address = 0;
        modbus_device[i].state = MODBUS_STATE_INIT;
        modbus_device[i].comms_timeout = 0;
        modbus_device[i].connected = false;
        modbus_device[i].missed_messages = 0;
        modbus_device[i].message_timeout = 0;
        modbus_device[i].used = false;
        // Initialize the points table for each device
        for (j = 0; j < MODBUS_DEVICE_POINT_COUNT; j++)
        {
            modbus_device[i].points[j].enable = false;
            modbus_device[i].points[j].register_type = MODBUS_REGISTER_TYPES_NONE;
            modbus_device[i].points[j].register_address = 0;
            modbus_device[i].points[j].used = false;
            modbus_device[i].points[j].last_update_time = 0;
            modbus_device[i].points[j].value.as_uint64 = 0;
            modbus_device[i].points[j].status = MODBUS_POINT_STATUS_OFFLINE;
            modbus_device[i].points[j].low_threshold = NAN;
            modbus_device[i].points[j].high_threshold = NAN;
            modbus_device[i].points[j].delta_threshold = NAN;
            modbus_device[i].points[j].alarm_time_delay = 0;
            modbus_device[i].points[j].alarm_time_delay_high_counter = 0;
            modbus_device[i].points[j].alarm_time_delay_low_counter = 0;
        }
    }
    modbus_port.poll_rate = MODBUS_DEFAULT_POLL_RATE_100MS;
    //ESP_LOGI(TAG_MODBUS, "Initializing Modbus RTU Port...");
    //MB_Setup_init();
    //  Modbus_Initialize_Port();
    //ESP_LOGI(TAG_MODBUS, "Baud: %d \t Parity: %d \t Data: %d \t Stop: %d",
            // modbus_port.modbus_baud_rate, modbus_port.modbus_parity, modbus_port.modbus_data_bits, modbus_port.modbus_stop_bits);
    modbus_port.master_state = MODBUS_STATE_IDLE;

    /*
    Add custom modbus functions initialisation below
    */
   // ABB_TimeTrigger_Init();
}

/**
 * @see mb.h
 */
void Modbus_Reset(void)
{
    uint8_t i, j;
    puts("MB:Resetting Modbus Stack:");
    Modbus_Disable_Port();
    // Initialize the Modbus port structs
    modbus_port.master_state = MODBUS_STATE_INIT;
    modbus_port.callBack = NULL;
    modbus_port.reply_timeout = 0;
    modbus_port.poll_rate = MODBUS_DEFAULT_POLL_RATE_100MS;
    /* Init the Rs485 buffers */
    FIFO_Init((fifo_buffer_t *)&FIFO_MODBUS_Rx, Modbus_Rx_Buffer, sizeof(Modbus_Rx_Buffer));
    FIFO_Init((fifo_buffer_t *)&FIFO_MODBUS_Tx, Modbus_Tx_Buffer, sizeof(Modbus_Tx_Buffer));
    memset(&pdu_queue[0], 0x00,
           MODBUS_PDU_QUEUE_LENGTH * sizeof(modbus_pdu_queue_t));
    // Initialize the Modbus slave device objects
    for (i = 0; i < MODBUS_DEVICE_COUNT; i++)
    {
        modbus_device[i].address = 0;
        modbus_device[i].state = MODBUS_STATE_INIT;
        modbus_device[i].comms_timeout = 0;
        modbus_device[i].connected = false;
        modbus_device[i].missed_messages = 0;
        modbus_device[i].message_timeout = 0;
        modbus_device[i].used = false;
        // Initialize the points table for each device
        for (j = 0; j < MODBUS_DEVICE_POINT_COUNT; j++)
        {
            modbus_device[i].points[j].enable = false;
            modbus_device[i].points[j].register_type = MODBUS_REGISTER_TYPES_NONE;
            modbus_device[i].points[j].register_address = 0;
            modbus_device[i].points[j].used = false;
            modbus_device[i].points[j].last_update_time = 0;
            modbus_device[i].points[j].value.as_uint64 = 0;
            modbus_device[i].points[j].status = MODBUS_POINT_STATUS_OFFLINE;
        }
    }
    if (!Modbus_Validate_Baud_Rate(modbus_port.modbus_baud_rate))
        modbus_port.modbus_baud_rate = MODBUS_DEFAULT_BAUD;
    if (!Modbus_Validate_Data_Bits(modbus_port.modbus_data_bits))
        modbus_port.modbus_data_bits = MODBUS_DEFAULT_DATA_BITS;
    if (!Modbus_Validate_Stop_Bits(modbus_port.modbus_stop_bits))
        modbus_port.modbus_stop_bits = MODBUS_DEFAULT_STOP_BITS;
    if (!Modbus_Validate_Parity(modbus_port.modbus_parity))
        modbus_port.modbus_parity = MODBUS_DEFAULT_PARITY;
    printf("MB:Baud:%d \t Parity: %d \t data: %d \t Stop: %d\n",
           modbus_port.modbus_baud_rate, modbus_port.modbus_parity,
           modbus_port.modbus_data_bits, modbus_port.modbus_stop_bits);
    if (modbus_port.poll_rate > 100)
        modbus_port.poll_rate = MODBUS_DEFAULT_POLL_RATE_100MS;
    printf("MB:Starting Poll Service @ %dms\n", modbus_port.poll_rate * 100);
    puts("MB:Initializing Modbus RTU Port...");
    Modbus_Initialize_Port();
    modbus_port.master_state = MODBUS_STATE_IDLE;
    puts("MB: Reset Complete!");
}

/**
 * @see mb.h
 */
void Modbus_Tasks(void)
{
    slave_address =1;
    modbus_mode = MODBUS_MODE_SLAVE;
    if (modbus_mode != MODBUS_MODE_DISABLE)
    {
        if (modbus_mode == MODBUS_MODE_SLAVE)
        {
           // SYS_CONSOLE_Write(console,"here to read modbus\n",sizeof("here to read modbus\n"));
 
            esp_data_read();
            if (data_length)
            {
                Modbus_Slave_GetMasterData();
            }
        }
        static uint8_t modbus_poll_service_counter = 0;
        if (modbus_mode != MODBUS_MODE_SLAVE)
        {
            if (modbus_100ms_has_ticked)
            {
                modbus_100ms_has_ticked = false;
                modbus_poll_service_counter++;
            }
            MB_Point_Status_Update();
            if ((modbus_poll_service_counter >= modbus_port.poll_rate) && (modbus_port.master_state = MODBUS_STATE_IDLE))
            {

                modbus_poll_service_counter = 0;
                MB_Read_Point(modbus_mode);
            }

            MB_Message_Store(modbus_mode);
            MB_Transmit_Message();
        }
    }
}

/**
 * @see mb.h
 */
void Modbus_Millisecond_Timer(void)
{
    MODBUS_INCREMENT_AND_LIMIT_UINT16(modbus_port.reply_timeout);
}

/**
 * @see mb.h
 */
void Modbus_100ms_Tick(void)
{
    modbus_100ms_has_ticked = true;
}

/**
 * @see mb.h
 */
void Modbus_1s_Tick(void)
{
    modbus_1s_has_ticked = true;
}

/**
 * @brief Set the Flow Control Pin High 
 * 
 */

/**
 * @brief turns on modbus log for console debuging
 * 
 */
void Modbus_Set_Console_Log(void)
{
    modbus_debug = 1;
}
/**
 * @brief turns off modbus log for console debuging
 * 
 */
void Modbus_Clear_Console_Log(void)
{
    modbus_debug = 0;
}

void Modbus_Set_Sniffer_Log(void)
{
    sniffer_print = 1;
}

void Modbus_Clear_Sniffer_Log(void)
{
    sniffer_print = 0;
}

void Modbus_Slave_EnablePoint(modbus_function_codes_t function_code, uint16_t register_address, int enable)
{

    if (function_code == MODBUS_FUNCTION_READ_HOLDING_REGISTER)
    {
        if (register_address >= Holding_Register_Offset)
        {
            holding_register_readval[register_address - Holding_Register_Offset].Register_Enable = enable;
            // printf("Point enable for register %X: %d\n", register_address, holding_register_readval[register_address].Register_Enable);
        }
        else
        {
            //ESP_LOGW(TAG_MODBUS, "Register address needs to be greater that %d", Holding_Register_Offset);
        }
    }
    if (function_code == MODBUS_FUNCTION_READ_INPUT_REGISTER)
    {
        //Input_Register_Offset is a hash define = 0 usually.
        //Because register address is unsigned the comparison is useless and we get a warning.
        //Creating an int first and making the comparison fixes this and accomdates for the potential that the offet changes.
        int RegisterOffsetCheck = Input_Register_Offset;
        if (register_address >= RegisterOffsetCheck)
        {
            input_register_readval[register_address - Input_Register_Offset].Register_Enable = enable;
            // printf("Point enable for register %X: %d\n", register_address, holding_register_readval[register_address].Register_Enable);
        }
        else
        {
            //ESP_LOGW(TAG_MODBUS, "Register address needs to be greater that %d", Input_Register_Offset);
        }
    }
}

void Modbus_Slave_Holding_Register_Store(uint16_t data, uint16_t register_address)
{
    //Input_Register_Offset is a hash define = 0 usually.
    //Because register address is unsigned the comparison is useless and we get a warning.
    //Creating an int first and making the comparison fixes this and accomdates for the potential that the offet changes.
    int RegisterOffsetCheck = Holding_Register_Offset;
    if (register_address >= RegisterOffsetCheck)
    {
        holding_register_readval[register_address - Holding_Register_Offset].Register_Data = data;
    }
    else
    {
        //ESP_LOGW(TAG_MODBUS, "Register address needs to be greater that %d", Holding_Register_Offset);
    }
}

void Modbus_Slave_Input_Register_Store(uint16_t data, uint16_t register_address)
{
    //Input_Register_Offset is a hash define = 0 usually.
    //Because register address is unsigned the comparison is useless and we get a warning.
    //Creating an int first and making the comparison fixes this and accomdates for the potential that the offet changes.
    int RegisterOffsetCheck = Input_Register_Offset;
    if (register_address >= RegisterOffsetCheck)
    {
        input_register_readval[register_address - Input_Register_Offset].Register_Data = data;
    }
    else
    {
        //ESP_LOGW(TAG_MODBUS, "Register address needs to be greater that %d", Input_Register_Offset);
    }
}

uint16_t Modbus_Get_Holding_Register_Value(uint16_t register_address)
{
    //Input_Register_Offset is a hash define = 0 usually.
    //Because register address is unsigned the comparison is useless and we get a warning.
    //Creating an int first and making the comparison fixes this and accomdates for the potential that the offet changes.
    int RegisterOffsetCheck = Holding_Register_Offset;
    if (register_address >= RegisterOffsetCheck)
    {
        return holding_register_readval[register_address - Holding_Register_Offset].Register_Data;
    }
    else
    {
        //ESP_LOGW(TAG_MODBUS, "Register address needs to be greater that %d. Returning 0", Holding_Register_Offset);
        return 0;
    }
}

uint16_t Modbus_Get_Input_Register_Value(uint16_t register_address)
{
    //Input_Register_Offset is a hash define = 0 usually.
    //Because register address is unsigned the comparison is useless and we get a warning.
    //Creating an int first and making the comparison fixes this and accomdates for the potential that the offet changes.
    int RegisterOffsetCheck = Input_Register_Offset;
    if (register_address >= RegisterOffsetCheck)
    {
        return input_register_readval[register_address - Holding_Register_Offset].Register_Data;
    }
    else
    {
        //ESP_LOGW(TAG_MODBUS, "Register address needs to be greater that %d. Returning 0", Input_Register_Offset);
        return 0;
    }
}

/**
 * @brief Updates the status of the current modbus point
 * 
 */
void MB_Point_Status_Update(void)
{
    if (modbus_1s_has_ticked)
    {

        modbus_1s_has_ticked = false;

        uint8_t i, j;
        for (i = 0; i < MODBUS_DEVICE_COUNT; i++)
        {

            if (!modbus_device[i].used)

                continue;
            for (j = 0; j < MODBUS_DEVICE_POINT_COUNT; j++)
            {

                if (modbus_device[i].points[j].used)
                {
                    MODBUS_INCREMENT_AND_LIMIT_UINT16(modbus_device[i].points[j].last_update_time);
                    if (modbus_port.alarm_callback != NULL)
                    {
                        if (modbus_device[i].points[j].alarm_time_delay_high_counter > 0)
                        {
                            if (--modbus_device[i].points[j].alarm_time_delay_high_counter == 0)
                                if ((modbus_device[i].points[j].status & MODBUS_POINT_STATUS_ALARM) == 0)
                                {
                                    modbus_port.alarm_callback(&modbus_device[i], j);
                                    modbus_device[i].points[j].status += MODBUS_POINT_STATUS_ALARM;
                                }
                        }
                        else if (modbus_device[i].points[j].alarm_time_delay_low_counter > 0)
                        {
                            if (--modbus_device[i].points[j].alarm_time_delay_low_counter == 0)
                                if ((modbus_device[i].points[j].status & MODBUS_POINT_STATUS_ALARM) == 0)
                                {
                                    modbus_port.alarm_callback(&modbus_device[i], j);
                                    modbus_device[i].points[j].status += MODBUS_POINT_STATUS_ALARM;
                                }
                        }
                        if (modbus_device[i].points[j].alarm_time_delay_delta_counter > 0)
                        {
                            if (--modbus_device[i].points[j].alarm_time_delay_delta_counter == 0)
                                if ((modbus_device[i].points[j].status & MODBUS_POINT_STATUS_ALARM) == 0)
                                {
                                    modbus_port.alarm_callback(&modbus_device[i], j);
                                    modbus_device[i].points[j].status += MODBUS_POINT_STATUS_ALARM;
                                }
                        }
                    }
                    if (modbus_device[i].points[j].last_update_time > modbus_device[i].comms_timeout)
                        modbus_device[i].points[j].status |= MODBUS_POINT_STATUS_STALE;
                    else
                        modbus_device[i].points[j].status &= (0xFFFFFFFF ^ MODBUS_POINT_STATUS_STALE);
                }
            }
            MODBUS_INCREMENT_AND_LIMIT_UINT8(modbus_device[i].message_timeout);
            if ((modbus_device[i].message_timeout > modbus_device[i].comms_timeout) && (modbus_device[i].connected))
            {
                modbus_device[i].connected = false;
                printf("MB:Controller %d Offline!\n", modbus_device[i].address);
            }
        }
    }
}

/**
 * @brief Reads Modbus Point Data
 * 
 * @param mb_mode input modbus mode type
 */
void MB_Read_Point(MODBUS_MODE mb_mode)
{
    static uint8_t controller_index = 0;
    static uint8_t point_index = 0;

    //Poll the currently selected point/controller
    if (modbus_device[controller_index].used)
    {
        if (mb_mode == MODBUS_MODE_LISTENER)
        {
            Sniffer_Read();
        }

        if (modbus_device[controller_index].points[point_index].used)
        {

            if (mb_mode == MODBUS_MODE_LISTENER)
            {
                if (sniffer_poll)
                {
                    point_index = 0;

                    for (int i = 0; i <= MODBUS_DEVICE_COUNT; i++)
                    {

                        if ((modbus_device[controller_index].used))
                        {
                            if (Master_data.MSlave_address != modbus_device[controller_index].address)
                            {
                                controller_index = i;
                            }
                        }

                        if ((modbus_device[controller_index].points[point_index].used))
                        {
                            while (Master_data.MStart_address != modbus_device[controller_index].points[point_index].register_address)
                            {
                                point_index++;
                                if (point_index >= MODBUS_DEVICE_POINT_COUNT)
                                {
                                    point_index = 0;
                                    controller_index++;
                                    break;
                                }
                            }
                        }
                    }

                    if ((Master_data.MSlave_address == modbus_device[controller_index].address))
                    {
                        Modbus_Read_Register(modbus_device[controller_index].address, &modbus_device[controller_index], &modbus_device[controller_index].points[point_index]);
                        Master_data.MSlave_address = 0;
                    }

                    if (modbus_debug)
                        printf("MB->Polling Device %d Point: %04d Type:%d\n",
                               modbus_device[controller_index].address,
                               modbus_device[controller_index].points[point_index].register_address,
                               modbus_device[controller_index].points[point_index].register_type);
                }
            }

            if (mb_mode == MODBUS_MODE_LISTENER)
            {
                point_index++;
                while ((point_index < MODBUS_DEVICE_POINT_COUNT) && (!modbus_device[controller_index].points[point_index].used))
                {
                    point_index++;
                }

                if (point_index >= MODBUS_DEVICE_POINT_COUNT)
                {
                    point_index = 0;
                    controller_index++;
                    while ((controller_index < MODBUS_DEVICE_COUNT) && (!modbus_device[controller_index].used))
                        controller_index++;
                    if (controller_index >= MODBUS_DEVICE_COUNT)
                    {
                        controller_index = 0;
                        point_index = 0;
                    }
                }
            }
            if (mb_mode != MODBUS_MODE_LISTENER)
            {

                Modbus_Read_Register(modbus_device[controller_index].address, &modbus_device[controller_index], &modbus_device[controller_index].points[point_index]);
                if (modbus_debug)
                    printf("MB->Polling Device %d Point: %04d Type:%d\n",
                           modbus_device[controller_index].address,
                           modbus_device[controller_index].points[point_index].register_address,
                           modbus_device[controller_index].points[point_index].register_type);
            }

            if (mb_mode != MODBUS_MODE_LISTENER)
            {
                point_index++;

                while ((point_index < MODBUS_DEVICE_POINT_COUNT) && (!modbus_device[controller_index].points[point_index].used))
                    point_index++;
                if (point_index >= MODBUS_DEVICE_POINT_COUNT)
                {
                    point_index = 0;
                    controller_index++;
                    while ((controller_index < MODBUS_DEVICE_COUNT) && (!modbus_device[controller_index].used))
                        controller_index++;
                    if (controller_index >= MODBUS_DEVICE_COUNT)
                    {
                        controller_index = 0;
                        point_index = 0;
                    }
                }
            }
        }

        //Polling service done for this tick...
    }
}

/**
 * @brief Stores incoming modbus message
 * 
 * @param mb_mode currnt modbus mode
 */
void MB_Message_Store(MODBUS_MODE mb_mode)

{
    //Transport check for reply after silence timeout
    if (modbus_port.reply_timeout >
        DEFAULT_MODBUS_TIMEOUT_MS)
    { // If we are in Wait for reply State, and we have
        // waited longer than the specified time
        // process Modbus message
        uint8_t message[32] = {0};
        uint8_t count = 0;
        if (modbus_mode != MODBUS_MODE_LISTENER)
            count = FIFO_Count((fifo_buffer_t *)&FIFO_MODBUS_Rx);
        if (modbus_mode == MODBUS_MODE_LISTENER)
        {

            if (!message_split)
            {
                count = sniffer_result;
                //           printf("Count  %X\n",count );
            }
            else if (message_split)
            {

                count = splitcount;
                //          printf("Count Split %X\n",count );
            }
            else
            {
                //          printf("Count 0\n");
                count = 0;
            }
        }

        uint8_t i = 0;
        uint16_t crc1 = 0;
        uint16_t crc2 = 0;
        modbus_port.reply_timeout = 0;
        if (count < 4)
        {
            /** If we have any callbacks waiting for a reply, let them know there was
             * a timeout*/

            if (modbus_port.callBack != NULL)
            {

                modbus_port.callBack(NULL, 0, NULL, NULL);
            }
            modbus_port.master_state = MODBUS_STATE_IDLE;

            return;
        }
        if (count >= 4)
        {
            for (i = 0; i < count; i++)
            {
                if (modbus_mode != MODBUS_MODE_LISTENER)
                    message[i] = FIFO_Get((fifo_buffer_t *)&FIFO_MODBUS_Rx);

                if (modbus_mode == MODBUS_MODE_LISTENER)
                {
                    if (!message_split && sniffer_poll)
                    {
                        message[i] = sniffer_data[i];
                    }
                    else if (message_split && sniffer_poll)
                    {

                        message[i] = Slave_data.SSlave_data[i];
                    }

                    else
                    {
                        message[i] = 0;
                    }
                }
            }
            crc1 = (uint16_t)((message[count - 1] << 8) | message[count - 2]);
            crc2 = usMBCRC16(&message[0], count - 2);
            if (crc1 == crc2)
            { // Do Error Checks!
                // We have received a valid Modbus Reply. Send it to the registered
                // callBack for processing!

                if (modbus_port.callBack != NULL)
                {
                    modbus_port.callBack(&message[0], count, modbus_port.device, modbus_port.point);
                }
            }
            else
            {
                /* Flag an Error! */
                /** If we have any callbacks waiting for a reply, let them know there
                 * was a timeout*/
                if (modbus_debug)
                    if (modbus_mode != MODBUS_MODE_LISTENER)
                        puts("MB-> Invalid CRC");

                if (modbus_port.callBack != NULL)
                {
                    modbus_port.callBack(NULL, 0, NULL, NULL);
                }
            }
            modbus_port.callBack = NULL;
            modbus_port.master_state = MODBUS_STATE_IDLE;
        }
    }
}

/**
 * @brief Transmits message stored in FIFO
 * 
 */
void MB_Transmit_Message()
{
    //Transport Transmit message if in FIFO
    if ((modbus_port.master_state == MODBUS_STATE_IDLE) &&
        (!FIFO_Empty((fifo_buffer_t *)&FIFO_MODBUS_Tx)))
    {
        modbus_port.master_state = MODBUS_STATE_TRANSMIT;

        esp_transmit_uart();
        memset(sniffer_data, 0x00, sizeof(sniffer_data));
    }
    else if ((modbus_port.master_state == MODBUS_STATE_IDLE) &&
             (Modbus_Queue_Pdu_Count() > 0))
    {
        Modbus_Queue_Pdu_Pop();
    }
}