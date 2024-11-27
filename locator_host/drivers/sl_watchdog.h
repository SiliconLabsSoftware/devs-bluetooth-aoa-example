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
#ifndef SL_WATCHDOG_H
#define SL_WATCHDOG_H
#ifdef __cplusplus
extern "C" {
#endif

//macros -----------------------------------------------------------------------
//type definitions -------------------------------------------------------------
//global variables -------------------------------------------------------------
//function prototypes ----------------------------------------------------------

/***************************************************************************//**
 * Initializes and starts the Wathchdog timer of the MCU.
 * Configuration comes from the "config" folder.
 ******************************************************************************/
void sl_watchdog_init(void);

/***************************************************************************//**
 * Restarts/feeds/kicks the watchdog timer
 ******************************************************************************/
void sl_watchdog_feed(void);

#ifdef __cplusplus
}
#endif
#endif /* SL_WATCHDOG_H */
