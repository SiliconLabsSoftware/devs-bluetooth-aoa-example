/***************************************************************************//**
 * @file
 * @brief General timer driver code for SI917
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
#include "sl_timer.h"
#include "sl_system_config.h"
#include "em_cmu.h"

//macros -----------------------------------------------------------------------
//private type definitions -----------------------------------------------------
//private function prototypes --------------------------------------------------
//private variables ------------------------------------------------------------
//function definitions----------------------------------------------------------
void sl_timer_init(void)
{
  ITM->LAR = 0xC5ACCE55;
  CoreDebug->DEMCR |= CoreDebug_DEMCR_TRCENA_Msk;
  DWT->CTRL |= DWT_CTRL_CYCCNTENA_Msk;
}

uint32_t sl_timer_get(void)
{
  return DWT->CYCCNT;
}

uint32_t sl_timer_get_frequency(void)
{
  return CMU_ClockFreqGet(cmuClock_CORE);
}
