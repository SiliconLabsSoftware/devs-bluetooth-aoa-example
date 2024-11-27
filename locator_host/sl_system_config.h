/***************************************************************************//**
 * @file
 * @brief
 * @version 1.0.0
 *******************************************************************************
 * # License
 * <b>Copyright 2023 Silicon Laboratories Inc. www.silabs.com</b>
 *******************************************************************************
 *
 * The licensor of this software is Silicon Laboratories Inc. Your use of this
 * software is governed by the terms of Silicon Labs Master Software License
 * Agreement (MSLA) available at
 * www.silabs.com/about-us/legal/master-software-license-agreement. This
 * software is distributed to you in Source Code format and is governed by the
 * sections of the MSLA applicable to Source Code.
 *
 ******************************************************************************/
#ifndef SL_SYSTEM_CONFIG_H
#define SL_SYSTEM_CONFIG_H
#ifdef __cplusplus
extern "C" {
#endif
#include "printf.h"
#include "em_core.h"

//macros -----------------------------------------------------------------------
///Defines whether the angle calculations is enabled or not
#define SYSTEM_BT_AOA_ANGLE_CALCULATION_EN 1

///Maximum allowed tag number. If angle is not calculated then it can be higher only the UART/MQTT processing will limit. If angle calculation is enabled then heap will limit as well.
#if SYSTEM_BT_AOA_ANGLE_CALCULATION_EN
  #define SYSTEM_BT_AOA_MAX_TAG_COUNT      8
#else
  #define SYSTEM_BT_AOA_MAX_TAG_COUNT      10
#endif

//IQ sample providing possibilities, raw bytes is the fastest.
#define SYSTEM_AOA_IQ_SAMPLE_PROVIDE_METHOD_RAW_BYTES          0
#define SYSTEM_AOA_IQ_SAMPLE_PROVIDE_METHOD_JSON               1
///Selected IQ sample providing method
#define SYSTEM_AOA_IQ_SAMPLE_PROVIDE_METHOD                    SYSTEM_AOA_IQ_SAMPLE_PROVIDE_METHOD_JSON

//Utility macros for number to string transformation
#define __SYSTEM_NUM_TO_STR(x)             #x
#define SYSTEM_NUM_TO_STR(x)               __SYSTEM_NUM_TO_STR(x)

///Compile time assert macro
#define SYSTEM_STATIC_ASSERT(condition)    typedef char assert[(condition) ? 1 : -1]

///Assert function which shall be used by the application
#define SYSTEM_ASSERT(condition, ...)                                                         \
  do {                                                                                        \
    if (!(condition)) {                                                                       \
      CORE_EnterAtomic();         /*Disable interrupts*/                                      \
      printf("ASSERT!\r\n  " __FILE__  ":" SYSTEM_NUM_TO_STR(__LINE__) "\r\n  " __VA_ARGS__); \
      while (1) ;                                                                             \
    }                                                                                         \
  } while (0)

//type definitions -------------------------------------------------------------
//global variables -------------------------------------------------------------
//function prototypes ----------------------------------------------------------

#ifdef __cplusplus
}
#endif
#endif /* SL_SYSTEM_CONFIG_H */
