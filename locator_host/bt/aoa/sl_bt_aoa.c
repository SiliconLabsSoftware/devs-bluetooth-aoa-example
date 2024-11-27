/***************************************************************************//**
 * @file
 * @brief BT AOA application
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
#include <stdlib.h>
#include "sl_common.h"
#include "sl_bt_api.h"
#include "sl_bt_ncp_host.h"
#include "sl_bt_aoa.h"
#include "aoa_cte.h"
#include "aoa_angle.h"
#include "aoa_angle_config.h"
#include "app_log.h"
#include "sl_system_config.h"
#include "sl_timer.h"

//macros -----------------------------------------------------------------------
///Set to 1 if you wish to report angles instead of the raw IQ data.
#define SL_BT_AOA_CFG_ANGLE_CALCULATION_ENABLED SYSTEM_BT_AOA_ANGLE_CALCULATION_EN

//private type definitions -----------------------------------------------------
//private function prototypes --------------------------------------------------
#if SL_BT_AOA_CFG_ANGLE_CALCULATION_ENABLED
static inline sl_status_t sli_bt_aoa_calculate_angle(aoa_state_t *state, aoa_iq_report_t *iq, aoa_angle_t *angle);
#endif

//private variables ------------------------------------------------------------
static antenna_array_t sli_bt_aoa_antenna_array;
static sl_bt_aoa_locator_id_t sli_bt_aoa_locator_id;
#if SL_BT_AOA_CFG_ANGLE_CALCULATION_ENABLED
static aoa_angle_config_t *sli_bt_aoa_angle_configuration;
static aoa_id_t sli_bt_aoa_angle_id = "0";
SL_TIMER_RUNTIME_STRUCT_DEFINE(sli_bt_aoa_angle_calc_meas);
#endif
SL_TIMER_RUNTIME_STRUCT_DEFINE(sli_bt_aoa_cycle_meas);

//function definitions----------------------------------------------------------
void sl_bt_aoa_init(void)
{
  antenna_array_init(&sli_bt_aoa_antenna_array, AOA_ANGLE_ANTENNA_ARRAY_TYPE);
  aoa_cte_config.antenna_array = &sli_bt_aoa_antenna_array;

#if SL_BT_AOA_CFG_ANGLE_CALCULATION_ENABLED
  sl_status_t status = aoa_angle_add_config(sli_bt_aoa_angle_id, &sli_bt_aoa_angle_configuration);
  SYSTEM_ASSERT(SL_STATUS_OK == status);
  status = aoa_angle_finalize_config(sli_bt_aoa_angle_id);
  SYSTEM_ASSERT(SL_STATUS_OK == status);
#endif

  sl_bt_system_reset(sl_bt_system_boot_mode_normal);
}

void sl_bt_on_event(sl_bt_msg_t *evt)
{
  sl_timer_runtime_meas_start(&sli_bt_aoa_cycle_meas);

  switch (SL_BT_MSG_ID(evt->header)) {
    case sl_bt_evt_system_boot_id:
      // This event indicates the device has started and the radio is ready.
      // Do not call any stack command before receiving this boot event!
      app_log_info("BT NCP boot! Stack version: %d.%d.%d (build %d)" APP_LOG_NL,
                   evt->data.evt_system_boot.major,
                   evt->data.evt_system_boot.minor,
                   evt->data.evt_system_boot.patch,
                   evt->data.evt_system_boot.build);
      sl_bt_system_get_identity_address((void *)&sli_bt_aoa_locator_id.system_id, NULL);
      app_log_info("MAC address (reversed endianness): %06llX\r\n", sli_bt_aoa_locator_id.system_id);
      break;

    case sl_bt_evt_system_error_id:
      SYSTEM_ASSERT(0);
      break;
    case sl_bt_evt_system_hardware_error_id:
      SYSTEM_ASSERT(0);
      break;
    case sl_bt_evt_system_resource_exhausted_id:
      SYSTEM_ASSERT(0, "Sys. exhausted, discarded: %u, buff alloc: %u, heap alloc: %u\r\n",
                    evt->data.evt_system_resource_exhausted.num_buffers_discarded,
                    evt->data.evt_system_resource_exhausted.num_buffer_allocation_failures,
                    evt->data.evt_system_resource_exhausted.num_heap_allocation_failures);
      break;

    default:
      break;
  }

  aoa_cte_bt_on_event(evt);
  sl_timer_runtime_meas_stop(&sli_bt_aoa_cycle_meas);
}

/**************************************************************************//**
 * Tag added callback (will be called before IQ report)
 *
 * @param[in] tag Pointer to tag.
 *****************************************************************************/
void aoa_db_on_tag_added(aoa_db_entry_t *tag)
{
#if SL_BT_AOA_CFG_ANGLE_CALCULATION_ENABLED
  tag->user_data = malloc(sizeof(aoa_state_t));
  SYSTEM_ASSERT(NULL != tag->user_data, "Failed to allocate memory for aoa state.");

  enum sl_rtl_error_code ec = aoa_init_rtl(tag->user_data, sli_bt_aoa_angle_id, false);
  SYSTEM_ASSERT(ec == SL_RTL_ERROR_SUCCESS, "aoa_init_rtl failed (%d)", ec);
#else
  (void)tag;
#endif
}

/**************************************************************************//**
 * Callback to notify the application on new iq report.
 *
 * @param[in] tag Pointer to the tag.
 * @param[in] iq_report IQ report from the tag.
 *****************************************************************************/
void aoa_cte_on_iq_report(aoa_db_entry_t *tag,
                          aoa_iq_report_t *iq_report)
{
  const sl_bt_aoa_tag_id_t tag_id = {
    .mac_addr = {
      tag->address.addr[0], tag->address.addr[1], tag->address.addr[2],
      tag->address.addr[3], tag->address.addr[4], tag->address.addr[5]
    }
  };

#if SL_BT_AOA_CFG_ANGLE_CALCULATION_ENABLED
  aoa_angle_t angle = { 0 };
  sl_status_t sc = sli_bt_aoa_calculate_angle(tag->user_data, iq_report, &angle);
  if (SL_STATUS_OK == sc) {
    sl_bt_aoa_on_angle_report(&sli_bt_aoa_locator_id, &tag_id, &angle);
  }
#else
  sl_bt_aoa_on_iq_report(&sli_bt_aoa_locator_id, &tag_id, iq_report);
#endif
}

#if SL_BT_AOA_CFG_ANGLE_CALCULATION_ENABLED
static inline sl_status_t sli_bt_aoa_calculate_angle(aoa_state_t *state, aoa_iq_report_t *iq, aoa_angle_t *angle)
{
  sl_timer_runtime_meas_start(&sli_bt_aoa_angle_calc_meas);
  enum sl_rtl_error_code sc = aoa_calculate(state, iq, angle, sli_bt_aoa_angle_id);
  sl_timer_runtime_meas_stop(&sli_bt_aoa_angle_calc_meas);
  return sc; //TODO convert to sl_status_t (indifferent at the moment because we only check success/0)
}
#endif

SL_WEAK void sl_bt_aoa_on_iq_report(const sl_bt_aoa_locator_id_t *locator_id,
                                    const sl_bt_aoa_tag_id_t *tag_id,
                                    const aoa_iq_report_t *iq)
{
  (void)locator_id;
  (void)tag_id;
  (void)iq;
}

SL_WEAK void sl_bt_aoa_on_angle_report(const sl_bt_aoa_locator_id_t *locator_id,
                                       const sl_bt_aoa_tag_id_t *tag_id,
                                       const aoa_angle_t *angle)
{
  (void)locator_id;
  (void)tag_id;
  (void)angle;
}
