/**
* @file
* @author Steve Karg
* @date 2004
*/
#ifndef FIFO_H
#define FIFO_H

#include <stdint.h>
#include <stdbool.h>

/**
* FIFO data structure
*
* @{
*/
typedef struct _fifo_buffer_t {
    /** first byte of data */
    volatile unsigned head;
    /** last byte of data */
    volatile unsigned tail;
    /** block of memory or array of data */
    volatile uint8_t *buffer;
    /** length of the data */
    unsigned buffer_len;
} fifo_buffer_t;

/** @} */

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */

    unsigned FIFO_Count(
        fifo_buffer_t const *b);

    bool FIFO_Full(
        fifo_buffer_t const *b);

    bool FIFO_Available(
        fifo_buffer_t const *b,
        unsigned count);

    bool FIFO_Empty(
        fifo_buffer_t const *b);

    uint8_t FIFO_Peek(
        fifo_buffer_t const *b);

    uint8_t FIFO_Get(
        fifo_buffer_t * b);

    unsigned FIFO_Pull(
        fifo_buffer_t * b,
        uint8_t * data_bytes,
        unsigned length);

    bool FIFO_Put(
        fifo_buffer_t * b,
        uint8_t data_byte);

    bool FIFO_Add(
        fifo_buffer_t * b,
        uint8_t * data_bytes,
        unsigned count);

    void FIFO_Flush(
        fifo_buffer_t * b);

/* note: buffer_len must be a power of two */
    void FIFO_Init(
        fifo_buffer_t * b,
        volatile uint8_t * buffer,
        unsigned buffer_len);

#ifdef TEST
#include "ctest.h"
    void testFIFOBuffer(
        Test * pTest);
#endif

#ifdef __cplusplus
}
#endif /* __cplusplus */
#endif
