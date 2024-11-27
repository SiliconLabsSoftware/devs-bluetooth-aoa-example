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
#ifndef SL_TIMER_H
#define SL_TIMER_H
#ifdef __cplusplus
extern "C" {
#endif
#include <stdint.h>
#include <string.h>

//macros -----------------------------------------------------------------------
#if DEBUG
  #define SL_TIMER_RUNTIME_MEASUREMENT_API_EN 1
#endif

/// Exponential moving average factor (higher value "prefers" fresh data). A commonly used value is factor=2/(N+1), where N is the number of samples for a SMA.
#define SL_TIMER_RUNTIME_MEAS_AVG_EMA_COEFF (0.005F)

#if SL_TIMER_RUNTIME_MEASUREMENT_API_EN
  #define SL_TIMER_RUNTIME_STRUCT_DEFINE(name) static sl_timer_runtime_t name
  #define sl_timer_runtime_meas_start(...)     sli_timer_runtime_meas_start(__VA_ARGS__)
  #define sl_timer_runtime_meas_stop(...)      sli_timer_runtime_meas_stop(__VA_ARGS__)
  #define sl_timer_runtime_meas_reset(...)     sli_timer_runtime_meas_reset(__VA_ARGS__)
#else
  #define SL_TIMER_RUNTIME_STRUCT_DEFINE(name)
  #define sl_timer_runtime_meas_start(...)
  #define sl_timer_runtime_meas_stop(...)
  #define sl_timer_runtime_meas_reset(...)
#endif

//type definitions -------------------------------------------------------------
///Utility structure for runtime measurement
typedef struct {
  uint32_t run_count; ///< flags to indicate how many measurement run was performed
  uint32_t curr; ///< Current runtime in ticks
  uint32_t min;  ///< Minimum runtime in ticks
  uint32_t max;  ///< Maximum runtime in ticks
  float avg; ///< Average runtime in ticks
  float avg_us; ///< Average runtime in us
} sl_timer_runtime_t;

//global variables -------------------------------------------------------------
//function prototypes ----------------------------------------------------------

/***************************************************************************//**
 * Initializes and starts a 32 bit timer.
 * Timer configuration comes from the "config" folder.
 ******************************************************************************/
void sl_timer_init(void);

/***************************************************************************//**
 * Gets the current time in us.
 ******************************************************************************/
uint32_t sl_timer_get(void);

/***************************************************************************//**
 * Gets the timer frequency in Hz.
 ******************************************************************************/
uint32_t sl_timer_get_frequency(void);

/***************************************************************************//**
 * Starts the runtime measurement.
 * @param meas: Structure for the current runtime measurement.
 *              Data will be valid after the @ref sli_timer_runtime_meas_stop call.
 *
 * @warning Internal function DO NOT use directly, use the macro with the "sl" prefix!
 ******************************************************************************/
static inline void sli_timer_runtime_meas_start(sl_timer_runtime_t *meas)
{
  meas->curr = sl_timer_get();
}

/***************************************************************************//**
 * Stops the runtime measurement.
 * @param meas: Structure for the current runtime measurement.
 *              Data is valid after the call!
 *
 * @warning Internal function DO NOT use directly, use the macro with the "sl" prefix!
 ******************************************************************************/
static inline void sli_timer_runtime_meas_stop(sl_timer_runtime_t *meas)
{
  //save the time first statistic overhead comes after
  meas->curr = sl_timer_get() - meas->curr;

  if (0 == meas->run_count) {
    //no valid measurement until now
    meas->min = meas->curr;
    meas->max = meas->curr;
    meas->avg = meas->curr;
  } else {
    //at least 1 measurement before
    meas->min = meas->curr >= meas->min ? meas->min : meas->curr;
    meas->max = meas->curr <= meas->max ? meas->max : meas->curr;
    meas->avg += SL_TIMER_RUNTIME_MEAS_AVG_EMA_COEFF * (meas->curr - meas->avg);
  }
  meas->avg_us = meas->avg / (sl_timer_get_frequency() / 1000000);
  meas->run_count++;
}

/***************************************************************************//**
 * Resets the runtime measurement statistics
 * @param meas: Structure for the current runtime measurement.
 *              Data is valid after the first start and stop call.
 *
 * @warning Internal function DO NOT use directly, use the macro with the "sl" prefix!
 ******************************************************************************/
static inline void sli_timer_runtime_meas_reset(sl_timer_runtime_t *meas)
{
  memset(meas, 0, sizeof(*meas));
}

#ifdef __cplusplus
}
#endif
#endif /* SL_TIMER_H */
