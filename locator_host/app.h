/***************************************************************************//**
 * @file
 * @brief Application interface provided to main().
 *******************************************************************************
 * # License
 * <b>Copyright 2020 Silicon Laboratories Inc. www.silabs.com</b>
 *******************************************************************************
 *
 * SPDX-License-Identifier: Zlib
 *
 * The licensor of this software is Silicon Laboratories Inc.
 *
 * This software is provided 'as-is', without any express or implied
 * warranty. In no event will the authors be held liable for any damages
 * arising from the use of this software.
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software. If you use this software
 *    in a product, an acknowledgment in the product documentation would be
 *    appreciated but is not required.
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.
 * 3. This notice may not be removed or altered from any source distribution.
 *
 ******************************************************************************/
#ifndef APP_H
#define APP_H
#ifdef __cplusplus
extern "C" {
#endif
#include "sl_system_config.h"

//macros -----------------------------------------------------------------------
#define APP_MQTT_CLIENT_MESSAGE_TOPIC_SIZE       64
#if SL_BT_AOA_CFG_ANGLE_CALCULATION_ENABLED /*Space is needed for the Tags*/
  #define APP_MQTT_CLIENT_MESSAGE_PAYLOAD_SIZE   256
#else
  #define APP_MQTT_CLIENT_MESSAGE_PAYLOAD_SIZE   568
#endif

//type definitions -------------------------------------------------------------
///Message buffer for the AOA data.
//safe to use this even in a multi-threaded environment because sl_bt_aoa_on_*_report() is called from 1 thread.
typedef struct {
  uint8_t topic[APP_MQTT_CLIENT_MESSAGE_TOPIC_SIZE]; ///< Topic buffer.
  uint32_t topic_length; ///< Length of the topic.
  uint8_t content[APP_MQTT_CLIENT_MESSAGE_PAYLOAD_SIZE];///< Content buffer.
  uint32_t content_length; ///< Length of the content.
} app_mqtt_data_t;

//global variables -------------------------------------------------------------
//function prototypes ----------------------------------------------------------
/**************************************************************************//**
 * Application Init.
 *****************************************************************************/
void app_init(void);

/**************************************************************************//**
 * Application Process Action.
 *****************************************************************************/
void app_process_action(void);

/***************************************************************************//**
 * User shall implement this!
 * Publishes the requested message to the MQTT broker.
 * Weak implementation will log the MQTT message
 *
 * @param[in] app_mqtt_data_t MQTT message to send.
 *
 * @return 0 if successful. Error code otherwise.
 ******************************************************************************/
int app_mqtt_client_publish(const app_mqtt_data_t *message);

#ifdef __cplusplus
}
#endif
#endif // APP_H
