/*******************************************************************************
  GPIO PLIB

  Company:
    Microchip Technology Inc.

  File Name:
    plib_gpio.h

  Summary:
    GPIO PLIB Header File

  Description:
    This library provides an interface to control and interact with Parallel
    Input/Output controller (GPIO) module.

*******************************************************************************/

/*******************************************************************************
* Copyright (C) 2019 Microchip Technology Inc. and its subsidiaries.
*
* Subject to your compliance with these terms, you may use Microchip software
* and any derivatives exclusively with Microchip products. It is your
* responsibility to comply with third party license terms applicable to your
* use of third party software (including open source software) that may
* accompany Microchip software.
*
* THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS". NO WARRANTIES, WHETHER
* EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY IMPLIED
* WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS FOR A
* PARTICULAR PURPOSE.
*
* IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE,
* INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND
* WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP HAS
* BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE. TO THE
* FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL CLAIMS IN
* ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT OF FEES, IF ANY,
* THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE.
*******************************************************************************/

#ifndef PLIB_GPIO_H
#define PLIB_GPIO_H

#include <device.h>
#include <stdint.h>
#include <stdbool.h>
#include <stddef.h>

// DOM-IGNORE-BEGIN
#ifdef __cplusplus  // Provide C++ Compatibility

    extern "C" {

#endif
// DOM-IGNORE-END

// *****************************************************************************
// *****************************************************************************
// Section: Data types and constants
// *****************************************************************************
// *****************************************************************************
        
#define DIO6_Set()               (LATESET = (1<<5))
#define DIO6_Clear()             (LATECLR = (1<<5))
#define DIO6_Toggle()            (LATEINV= (1<<5))
#define DIO6_OutputEnable()      (TRISECLR = (1<<5))
#define DIO6_InputEnable()       (TRISESET = (1<<5))
#define DIO6_Get()               ((PORTE >> 5) & 0x1)
#define DIO6_PIN                  GPIO_PIN_RE5

/*** Macros for DIO7 pin ***/
#define DIO7_Set()               (LATESET = (1<<6))
#define DIO7_Clear()             (LATECLR = (1<<6))
#define DIO7_Toggle()            (LATEINV= (1<<6))
#define DIO7_OutputEnable()      (TRISECLR = (1<<6))
#define DIO7_InputEnable()       (TRISESET = (1<<6))
#define DIO7_Get()               ((PORTE >> 6) & 0x1)
#define DIO7_PIN                  GPIO_PIN_RE6

/*** Macros for DIO8 pin ***/
#define DIO8_Set()               (LATESET = (1<<7))
#define DIO8_Clear()             (LATECLR = (1<<7))
#define DIO8_Toggle()            (LATEINV= (1<<7))
#define DIO8_OutputEnable()      (TRISECLR = (1<<7))
#define DIO8_InputEnable()       (TRISESET = (1<<7))
#define DIO8_Get()               ((PORTE >> 7) & 0x1)
#define DIO8_PIN                  GPIO_PIN_RE7

/*** Macros for DIO9 pin ***/
#define DIO9_Set()               (LATBSET = (1<<8))
#define DIO9_Clear()             (LATBCLR = (1<<8))
#define DIO9_Toggle()            (LATBINV= (1<<8))
#define DIO9_OutputEnable()      (TRISBCLR = (1<<8))
#define DIO9_InputEnable()       (TRISBSET = (1<<8))
#define DIO9_Get()               ((PORTB >> 8) & 0x1)
#define DIO9_PIN                  GPIO_PIN_RB8

/*** Macros for DIO10 pin ***/
#define DIO10_Set()               (LATBSET = (1<<9))
#define DIO10_Clear()             (LATBCLR = (1<<9))
#define DIO10_Toggle()            (LATBINV= (1<<9))
#define DIO10_OutputEnable()      (TRISBCLR = (1<<9))
#define DIO10_InputEnable()       (TRISBSET = (1<<9))
#define DIO10_Get()               ((PORTB >> 9) & 0x1)
#define DIO10_PIN                  GPIO_PIN_RB9

/*** Macros for DIO11 pin ***/
#define DIO11_Set()               (LATBSET = (1<<10))
#define DIO11_Clear()             (LATBCLR = (1<<10))
#define DIO11_Toggle()            (LATBINV= (1<<10))
#define DIO11_OutputEnable()      (TRISBCLR = (1<<10))
#define DIO11_InputEnable()       (TRISBSET = (1<<10))
#define DIO11_Get()               ((PORTB >> 10) & 0x1)
#define DIO11_PIN                  GPIO_PIN_RB10

/*** Macros for DIO12 pin ***/
#define DIO12_Set()               (LATBSET = (1<<11))
#define DIO12_Clear()             (LATBCLR = (1<<11))
#define DIO12_Toggle()            (LATBINV= (1<<11))
#define DIO12_OutputEnable()      (TRISBCLR = (1<<11))
#define DIO12_InputEnable()       (TRISBSET = (1<<11))
#define DIO12_Get()               ((PORTB >> 11) & 0x1)
#define DIO12_PIN                  GPIO_PIN_RB11

/*** Macros for DIO13 pin ***/
#define DIO13_Set()               (LATBSET = (1<<12))
#define DIO13_Clear()             (LATBCLR = (1<<12))
#define DIO13_Toggle()            (LATBINV= (1<<12))
#define DIO13_OutputEnable()      (TRISBCLR = (1<<12))
#define DIO13_InputEnable()       (TRISBSET = (1<<12))
#define DIO13_Get()               ((PORTB >> 12) & 0x1)
#define DIO13_PIN                  GPIO_PIN_RB12

/*** Macros for DIO14 pin ***/
#define DIO14_Set()               (LATBSET = (1<<13))
#define DIO14_Clear()             (LATBCLR = (1<<13))
#define DIO14_Toggle()            (LATBINV= (1<<13))
#define DIO14_OutputEnable()      (TRISBCLR = (1<<13))
#define DIO14_InputEnable()       (TRISBSET = (1<<13))
#define DIO14_Get()               ((PORTB >> 13) & 0x1)
#define DIO14_PIN                  GPIO_PIN_RB13

/*** Macros for DIO15 pin ***/
#define DIO15_Set()               (LATBSET = (1<<14))
#define DIO15_Clear()             (LATBCLR = (1<<14))
#define DIO15_Toggle()            (LATBINV= (1<<14))
#define DIO15_OutputEnable()      (TRISBCLR = (1<<14))
#define DIO15_InputEnable()       (TRISBSET = (1<<14))
#define DIO15_Get()               ((PORTB >> 14) & 0x1)
#define DIO15_PIN                  GPIO_PIN_RB14

/*** Macros for DIO16 pin ***/
#define DIO16_Set()               (LATBSET = (1<<15))
#define DIO16_Clear()             (LATBCLR = (1<<15))
#define DIO16_Toggle()            (LATBINV= (1<<15))
#define DIO16_OutputEnable()      (TRISBCLR = (1<<15))
#define DIO16_InputEnable()       (TRISBSET = (1<<15))
#define DIO16_Get()               ((PORTB >> 15) & 0x1)
#define DIO16_PIN                  GPIO_PIN_RB15
        
/*** Macros for AIO6 pin ***/
#define AIO6_Set()               (LATBSET = (1<<5))
#define AIO6_Clear()             (LATBCLR = (1<<5))
#define AIO6_Toggle()            (LATBINV= (1<<5))
#define AIO6_OutputEnable()      (TRISBCLR = (1<<5))
#define AIO6_InputEnable()       (TRISBSET = (1<<5))
#define AIO6_Get()               ((PORTB >> 5) & 0x1)
#define AIO6_PIN                  GPIO_PIN_RB5

/*** Macros for AIO5 pin ***/
#define AIO5_Set()               (LATBSET = (1<<4))
#define AIO5_Clear()             (LATBCLR = (1<<4))
#define AIO5_Toggle()            (LATBINV= (1<<4))
#define AIO5_OutputEnable()      (TRISBCLR = (1<<4))
#define AIO5_InputEnable()       (TRISBSET = (1<<4))
#define AIO5_Get()               ((PORTB >> 4) & 0x1)
#define AIO5_PIN                  GPIO_PIN_RB4

/*** Macros for AIO4 pin ***/
#define AIO4_Set()               (LATBSET = (1<<3))
#define AIO4_Clear()             (LATBCLR = (1<<3))
#define AIO4_Toggle()            (LATBINV= (1<<3))
#define AIO4_OutputEnable()      (TRISBCLR = (1<<3))
#define AIO4_InputEnable()       (TRISBSET = (1<<3))
#define AIO4_Get()               ((PORTB >> 3) & 0x1)
#define AIO4_PIN                  GPIO_PIN_RB3

/*** Macros for AIO3 pin ***/
#define AIO3_Set()               (LATBSET = (1<<2))
#define AIO3_Clear()             (LATBCLR = (1<<2))
#define AIO3_Toggle()            (LATBINV= (1<<2))
#define AIO3_OutputEnable()      (TRISBCLR = (1<<2))
#define AIO3_InputEnable()       (TRISBSET = (1<<2))
#define AIO3_Get()               ((PORTB >> 2) & 0x1)
#define AIO3_PIN                  GPIO_PIN_RB2

/*** Macros for AIO2 pin ***/
#define AIO2_Set()               (LATBSET = (1<<1))
#define AIO2_Clear()             (LATBCLR = (1<<1))
#define AIO2_Toggle()            (LATBINV= (1<<1))
#define AIO2_OutputEnable()      (TRISBCLR = (1<<1))
#define AIO2_InputEnable()       (TRISBSET = (1<<1))
#define AIO2_Get()               ((PORTB >> 1) & 0x1)
#define AIO2_PIN                  GPIO_PIN_RB1

/*** Macros for AIO1 pin ***/
#define AIO1_Set()               (LATBSET = (1<<0))
#define AIO1_Clear()             (LATBCLR = (1<<0))
#define AIO1_Toggle()            (LATBINV= (1<<0))
#define AIO1_OutputEnable()      (TRISBCLR = (1<<0))
#define AIO1_InputEnable()       (TRISBSET = (1<<0))
#define AIO1_Get()               ((PORTB >> 0) & 0x1)
#define AIO1_PIN                  GPIO_PIN_RB0

/*** Macros for AIO7 pin ***/
#define AIO7_Set()               (LATBSET = (1<<6))
#define AIO7_Clear()             (LATBCLR = (1<<6))
#define AIO7_Toggle()            (LATBINV= (1<<6))
#define AIO7_OutputEnable()      (TRISBCLR = (1<<6))
#define AIO7_InputEnable()       (TRISBSET = (1<<6))
#define AIO7_Get()               ((PORTB >> 6) & 0x1)
#define AIO7_PIN                  GPIO_PIN_RB6

/*** Macros for AIO8 pin ***/
#define AIO8_Set()               (LATBSET = (1<<7))
#define AIO8_Clear()             (LATBCLR = (1<<7))
#define AIO8_Toggle()            (LATBINV= (1<<7))
#define AIO8_OutputEnable()      (TRISBCLR = (1<<7))
#define AIO8_InputEnable()       (TRISBSET = (1<<7))
#define AIO8_Get()               ((PORTB >> 7) & 0x1)
#define AIO8_PIN                  GPIO_PIN_RB7

/*** Macros for DIO1 pin ***/
#define DIO1_Set()               (LATESET = (1<<0))
#define DIO1_Clear()             (LATECLR = (1<<0))
#define DIO1_Toggle()            (LATEINV= (1<<0))
#define DIO1_OutputEnable()      (TRISECLR = (1<<0))
#define DIO1_InputEnable()       (TRISESET = (1<<0))
#define DIO1_Get()               ((PORTE >> 0) & 0x1)
#define DIO1_PIN                  GPIO_PIN_RE0

/*** Macros for DIO2 pin ***/
#define DIO2_Set()               (LATESET = (1<<1))
#define DIO2_Clear()             (LATECLR = (1<<1))
#define DIO2_Toggle()            (LATEINV= (1<<1))
#define DIO2_OutputEnable()      (TRISECLR = (1<<1))
#define DIO2_InputEnable()       (TRISESET = (1<<1))
#define DIO2_Get()               ((PORTE >> 1) & 0x1)
#define DIO2_PIN                  GPIO_PIN_RE1

/*** Macros for DIO3 pin ***/
#define DIO3_Set()               (LATESET = (1<<2))
#define DIO3_Clear()             (LATECLR = (1<<2))
#define DIO3_Toggle()            (LATEINV= (1<<2))
#define DIO3_OutputEnable()      (TRISECLR = (1<<2))
#define DIO3_InputEnable()       (TRISESET = (1<<2))
#define DIO3_Get()               ((PORTE >> 2) & 0x1)
#define DIO3_PIN                  GPIO_PIN_RE2

/*** Macros for DIO4 pin ***/
#define DIO4_Set()               (LATESET = (1<<3))
#define DIO4_Clear()             (LATECLR = (1<<3))
#define DIO4_Toggle()            (LATEINV= (1<<3))
#define DIO4_OutputEnable()      (TRISECLR = (1<<3))
#define DIO4_InputEnable()       (TRISESET = (1<<3))
#define DIO4_Get()               ((PORTE >> 3) & 0x1)
#define DIO4_PIN                  GPIO_PIN_RE3

/*** Macros for DIO5 pin ***/
#define DIO5_Set()               (LATESET = (1<<4))
#define DIO5_Clear()             (LATECLR = (1<<4))
#define DIO5_Toggle()            (LATEINV= (1<<4))
#define DIO5_OutputEnable()      (TRISECLR = (1<<4))
#define DIO5_InputEnable()       (TRISESET = (1<<4))
#define DIO5_Get()               ((PORTE >> 4) & 0x1)
#define DIO5_PIN                  GPIO_PIN_RE4        
        
#define DO_U1FC_Set()               (LATFSET = (1<<3))
#define DO_U1FC_Clear()             (LATFCLR = (1<<3))
#define DO_U1FC_Toggle()            (LATFINV= (1<<3))
#define DO_U1FC_OutputEnable()      (TRISFCLR = (1<<3))
#define DO_U1FC_InputEnable()       (TRISFSET = (1<<3))
#define DO_U1FC_Get()               ((PORTF >> 3) & 0x1)
#define DO_U1FC_PIN                  GPIO_PIN_RF3
/*** Macros for DO_U4FC pin ***/
#define DO_U4FC_Set()               (LATBSET = (1<<13))
#define DO_U4FC_Clear()             (LATBCLR = (1<<13))
#define DO_U4FC_Toggle()            (LATBINV= (1<<13))
#define DO_U4FC_Get()               ((PORTB >> 13) & 0x1)
#define DO_U4FC_OutputEnable()      (TRISBCLR = (1<<13))
#define DO_U4FC_InputEnable()       (TRISBSET = (1<<13))
#define DO_U4FC_PIN                  GPIO_PIN_RB13
/*** Macros for DO_U2FC pin ***/
#define DO_U2FC_Set()               (LATFSET = (1<<5))
#define DO_U2FC_Clear()             (LATFCLR = (1<<5))
#define DO_U2FC_Toggle()            (LATFINV= (1<<5))
#define DO_U2FC_Get()               ((PORTF >> 5) & 0x1)
#define DO_U2FC_OutputEnable()      (TRISFCLR = (1<<5))
#define DO_U2FC_InputEnable()       (TRISFSET = (1<<5))
#define DO_U2FC_PIN                  GPIO_PIN_RF5
/*** Macros for LED_3 pin ***/
#define LED_3_Set()               (LATDSET = (1<<0))
#define LED_3_Clear()             (LATDCLR = (1<<0))
#define LED_3_Toggle()            (LATDINV= (1<<0))
#define LED_3_Get()               ((PORTD >> 0) & 0x1)
#define LED_3_OutputEnable()      (TRISDCLR = (1<<0))
#define LED_3_InputEnable()       (TRISDSET = (1<<0))
#define LED_3_PIN                  GPIO_PIN_RD0
/*** Macros for LED_1 pin ***/
#define LED_1_Set()               (LATCSET = (1<<13))
#define LED_1_Clear()             (LATCCLR = (1<<13))
#define LED_1_Toggle()            (LATCINV= (1<<13))
#define LED_1_Get()               ((PORTC >> 13) & 0x1)
#define LED_1_OutputEnable()      (TRISCCLR = (1<<13))
#define LED_1_InputEnable()       (TRISCSET = (1<<13))
#define LED_1_PIN                  GPIO_PIN_RC13
/*** Macros for LED_2 pin ***/
#define LED_2_Set()               (LATCSET = (1<<14))
#define LED_2_Clear()             (LATCCLR = (1<<14))
#define LED_2_Toggle()            (LATCINV= (1<<14))
#define LED_2_Get()               ((PORTC >> 14) & 0x1)
#define LED_2_OutputEnable()      (TRISCCLR = (1<<14))
#define LED_2_InputEnable()       (TRISCSET = (1<<14))
#define LED_2_PIN                  GPIO_PIN_RC14
/*** Macros for LED_4 pin ***/
#define LED_4_Set()               (LATDSET = (1<<1))
#define LED_4_Clear()             (LATDCLR = (1<<1))
#define LED_4_Toggle()            (LATDINV= (1<<1))
#define LED_4_Get()               ((PORTD >> 1) & 0x1)
#define LED_4_OutputEnable()      (TRISDCLR = (1<<1))
#define LED_4_InputEnable()       (TRISDSET = (1<<1))
#define LED_4_PIN                  GPIO_PIN_RD1


// *****************************************************************************
/* GPIO Port

  Summary:
    Identifies the available GPIO Ports.

  Description:
    This enumeration identifies the available GPIO Ports.

  Remarks:
    The caller should not rely on the specific numbers assigned to any of
    these values as they may change from one processor to the next.

    Not all ports are available on all devices.  Refer to the specific
    device data sheet to determine which ports are supported.
*/

typedef enum
{
    GPIO_PORT_B = 0,
    GPIO_PORT_C = 1,
    GPIO_PORT_D = 2,
    GPIO_PORT_E = 3,
    GPIO_PORT_F = 4,
    GPIO_PORT_G = 5,
} GPIO_PORT;

// *****************************************************************************
/* GPIO Port Pins

  Summary:
    Identifies the available GPIO port pins.

  Description:
    This enumeration identifies the available GPIO port pins.

  Remarks:
    The caller should not rely on the specific numbers assigned to any of
    these values as they may change from one processor to the next.

    Not all pins are available on all devices.  Refer to the specific
    device data sheet to determine which pins are supported.
*/

typedef enum
{
    GPIO_PIN_RB0 = 0,
    GPIO_PIN_RB1 = 1,
    GPIO_PIN_RB2 = 2,
    GPIO_PIN_RB3 = 3,
    GPIO_PIN_RB4 = 4,
    GPIO_PIN_RB5 = 5,
    GPIO_PIN_RB6 = 6,
    GPIO_PIN_RB7 = 7,
    GPIO_PIN_RB8 = 8,
    GPIO_PIN_RB9 = 9,
    GPIO_PIN_RB10 = 10,
    GPIO_PIN_RB11 = 11,
    GPIO_PIN_RB12 = 12,
    GPIO_PIN_RB13 = 13,
    GPIO_PIN_RB14 = 14,
    GPIO_PIN_RB15 = 15,
    GPIO_PIN_RC12 = 28,
    GPIO_PIN_RC13 = 29,
    GPIO_PIN_RC14 = 30,
    GPIO_PIN_RC15 = 31,
    GPIO_PIN_RD0 = 32,
    GPIO_PIN_RD1 = 33,
    GPIO_PIN_RD2 = 34,
    GPIO_PIN_RD3 = 35,
    GPIO_PIN_RD4 = 36,
    GPIO_PIN_RD5 = 37,
    GPIO_PIN_RD6 = 38,
    GPIO_PIN_RD7 = 39,
    GPIO_PIN_RD8 = 40,
    GPIO_PIN_RD9 = 41,
    GPIO_PIN_RD10 = 42,
    GPIO_PIN_RD11 = 43,
    GPIO_PIN_RE0 = 48,
    GPIO_PIN_RE1 = 49,
    GPIO_PIN_RE2 = 50,
    GPIO_PIN_RE3 = 51,
    GPIO_PIN_RE4 = 52,
    GPIO_PIN_RE5 = 53,
    GPIO_PIN_RE6 = 54,
    GPIO_PIN_RE7 = 55,
    GPIO_PIN_RF0 = 64,
    GPIO_PIN_RF1 = 65,
    GPIO_PIN_RF3 = 67,
    GPIO_PIN_RF4 = 68,
    GPIO_PIN_RF5 = 69,
    GPIO_PIN_RG6 = 86,
    GPIO_PIN_RG7 = 87,
    GPIO_PIN_RG8 = 88,
    GPIO_PIN_RG9 = 89,

    /* This element should not be used in any of the GPIO APIs.
       It will be used by other modules or application to denote that none of the GPIO Pin is used */
    GPIO_PIN_NONE = -1

} GPIO_PIN;


void GPIO_Initialize(void);

// *****************************************************************************
// *****************************************************************************
// Section: GPIO Functions which operates on multiple pins of a port
// *****************************************************************************
// *****************************************************************************

uint32_t GPIO_PortRead(GPIO_PORT port);

void GPIO_PortWrite(GPIO_PORT port, uint32_t mask, uint32_t value);

uint32_t GPIO_PortLatchRead ( GPIO_PORT port );

void GPIO_PortSet(GPIO_PORT port, uint32_t mask);

void GPIO_PortClear(GPIO_PORT port, uint32_t mask);

void GPIO_PortToggle(GPIO_PORT port, uint32_t mask);

void GPIO_PortInputEnable(GPIO_PORT port, uint32_t mask);

void GPIO_PortOutputEnable(GPIO_PORT port, uint32_t mask);

// *****************************************************************************
// *****************************************************************************
// Section: GPIO Functions which operates on one pin at a time
// *****************************************************************************
// *****************************************************************************

static inline void GPIO_PinWrite(GPIO_PIN pin, bool value)
{
    GPIO_PortWrite(pin>>4, (uint32_t)(0x1) << (pin & 0xF), (uint32_t)(value) << (pin & 0xF));
}

static inline bool GPIO_PinRead(GPIO_PIN pin)
{
    return (bool)(((GPIO_PortRead(pin>>4)) >> (pin & 0xF)) & 0x1);
}

static inline bool GPIO_PinLatchRead(GPIO_PIN pin)
{
    return (bool)((GPIO_PortLatchRead(pin>>4) >> (pin & 0xF)) & 0x1);
}

static inline void GPIO_PinToggle(GPIO_PIN pin)
{
    GPIO_PortToggle(pin>>4, 0x1 << (pin & 0xF));
}

static inline void GPIO_PinSet(GPIO_PIN pin)
{
    GPIO_PortSet(pin>>4, 0x1 << (pin & 0xF));
}

static inline void GPIO_PinClear(GPIO_PIN pin)
{
    GPIO_PortClear(pin>>4, 0x1 << (pin & 0xF));
}

static inline void GPIO_PinInputEnable(GPIO_PIN pin)
{
    GPIO_PortInputEnable(pin>>4, 0x1 << (pin & 0xF));
}

static inline void GPIO_PinOutputEnable(GPIO_PIN pin)
{
    GPIO_PortOutputEnable(pin>>4, 0x1 << (pin & 0xF));
}


// DOM-IGNORE-BEGIN
#ifdef __cplusplus  // Provide C++ Compatibility

    }

#endif
// DOM-IGNORE-END
#endif // PLIB_GPIO_H
