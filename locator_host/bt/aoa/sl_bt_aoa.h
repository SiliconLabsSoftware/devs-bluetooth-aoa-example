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
#ifndef SL_BT_AOA_H
#define SL_BT_AOA_H
#ifdef __cplusplus
extern "C" {
#endif
#include "aoa_util/aoa_types.h"

//macros -----------------------------------------------------------------------
//type definitions -------------------------------------------------------------
typedef struct {
  union {
    uint8_t mac_addr[6]; //< MAC address of the bluetooth tag.
    uint64_t system_id;  //< Same as MAC address but in reversed byte order and the last 2 byte will be always 0.
  };
} sl_bt_aoa_tag_id_t;

//< MAC address of the locator board. (The last 2 byte will be always 0.)
typedef sl_bt_aoa_tag_id_t sl_bt_aoa_locator_id_t;

//global variables -------------------------------------------------------------
//function prototypes ----------------------------------------------------------

/***************************************************************************//**
 * Initializes the BT AOA component.
 ******************************************************************************/
void sl_bt_aoa_init(void);

/***************************************************************************//**
 * Weekly defined function which will be called when an IQ report is received
 * from an AOA tag.
 *
 * @param[out] tag_id Identification of the tag with the AOA data.
 * @param[out] iq Raw IQ samples with some additional info.
 *
 * @note Won't be called if @ref SL_BT_AOA_CFG_ANGLE_CALCULATION_ENABLED is 1
 ******************************************************************************/
void sl_bt_aoa_on_iq_report(const sl_bt_aoa_locator_id_t *locator_id,
                            const sl_bt_aoa_tag_id_t *tag_id,
                            const aoa_iq_report_t *iq);

/***************************************************************************//**
 * Weekly defined function which will be called when an angle report is calculated
 * from an AOA tag.
 *
 * @param[out] tag_id Identification of the tag with the AOA data.
 * @param[out] angle Calculated angle
 *
 * @note Won't be called if @ref SL_BT_AOA_CFG_ANGLE_CALCULATION_ENABLED is 0
 ******************************************************************************/
void sl_bt_aoa_on_angle_report(const sl_bt_aoa_locator_id_t *locator_id,
                               const sl_bt_aoa_tag_id_t *tag_id,
                               const aoa_angle_t *angle);

#ifdef __cplusplus
}
#endif
#endif /* SL_BT_AOA_H */
