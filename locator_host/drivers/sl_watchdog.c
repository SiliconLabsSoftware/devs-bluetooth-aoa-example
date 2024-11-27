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
#include "sl_watchdog.h"
#include "sl_system_config.h"
#include "em_cmu.h"
#include "em_wdog.h"

//macros -----------------------------------------------------------------------
//private type definitions -----------------------------------------------------
//private function prototypes --------------------------------------------------
//private variables ------------------------------------------------------------
//function definitions----------------------------------------------------------
void sl_watchdog_init(void)
{
  const WDOG_Init_TypeDef wdog_init = WDOG_INIT_DEFAULT;

  CMU_ClockEnable(cmuClock_WDOG0, true);
  WDOGn_Init(WDOG0, &wdog_init);
}

void sl_watchdog_feed(void)
{
  WDOGn_Feed(WDOG0);
}
