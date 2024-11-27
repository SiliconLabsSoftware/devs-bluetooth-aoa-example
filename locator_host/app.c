/***************************************************************************//**
 * @file
 * @brief Core application logic.
 *******************************************************************************
 * # License
 * <b>Copyright 2021 Silicon Laboratories Inc. www.silabs.com</b>
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
#include <string.h>
#include "app.h"
#include "app_log.h"
#include "em_rmu.h"
#include "sl_watchdog.h"
#include "sl_timer.h"
#include "sl_bt_aoa.h"

//macros -----------------------------------------------------------------------
#define SLI_APP_SATURATE(number, min, max) ((number) > (max)) ? (max) : ((number) < (min)) ? (min) : (number)
#define sli_app_mqtt_create_topic(topic_buff, sub_topic, locator_id, tag_id) \
  snprintf((char *)(topic_buff),                                             \
           sizeof(topic_buff),                                               \
           "silabs/aoa/" sub_topic "/%06llX/%06llX",                         \
           locator_id, tag_id)

//private type definitions -----------------------------------------------------
//private function prototypes --------------------------------------------------
//private variables ------------------------------------------------------------
static app_mqtt_data_t sli_app_mqtt_message;

//function definitions----------------------------------------------------------

/**************************************************************************//**
 * Application Init.
 *****************************************************************************/
void app_init(void)
{
  sl_watchdog_init(); //MUST be the first!
  app_log_warning("\r\n\r\nApplication reset! Reason: 0x%lX\r\n", RMU_ResetCauseGet());

  sl_timer_init();
  sl_bt_aoa_init();
}

/**************************************************************************//**
 * Application Process Action.
 *****************************************************************************/
void app_process_action(void)
{
  sl_watchdog_feed();
}

void sl_bt_aoa_on_iq_report(const sl_bt_aoa_locator_id_t *locator_id,
                            const sl_bt_aoa_tag_id_t *tag_id,
                            const aoa_iq_report_t *iq)
{
  int len = sli_app_mqtt_create_topic(sli_app_mqtt_message.topic, "iq", locator_id->system_id, tag_id->system_id);
  sli_app_mqtt_message.topic_length = SLI_APP_SATURATE(len, 0, (int)sizeof(sli_app_mqtt_message.topic));

#if SYSTEM_AOA_IQ_SAMPLE_PROVIDE_METHOD == SYSTEM_AOA_IQ_SAMPLE_PROVIDE_METHOD_RAW_BYTES
  sli_app_mqtt_message.content_length = SLI_APP_SATURATE(iq->length, 0, sizeof(sli_app_mqtt_message.content));
  memcpy(sli_app_mqtt_message.content, iq->samples, sli_app_mqtt_message.content_length);
#elif SYSTEM_AOA_IQ_SAMPLE_PROVIDE_METHOD == SYSTEM_AOA_IQ_SAMPLE_PROVIDE_METHOD_JSON
  #define JSON_END "\"\n}\n"
  const int max_content_size = sizeof(sli_app_mqtt_message.content) - sizeof(JSON_END); //terminating characters shall fit
  const char *hex = "0123456789ABCDEF";

  len = snprintf((char *)sli_app_mqtt_message.content,
                 sizeof(sli_app_mqtt_message.content),
                 "{\n\"channel\": %u,\n"
                 "\"rssi\": %d,\n"
                 "\"sequence\": %u,\n"
                 "\"samples\": \"",//extra spaces, so that ending will surely fit even when sample buffer is small
                 iq->channel, iq->rssi, iq->event_counter);
  sli_app_mqtt_message.content_length = SLI_APP_SATURATE(len, 0, max_content_size);

  for (size_t i = 0; (i < iq->length) && (sli_app_mqtt_message.content_length < max_content_size); i++) {
    sli_app_mqtt_message.content[sli_app_mqtt_message.content_length++] = hex[(iq->samples[i] >> 4) & 0xF];
    sli_app_mqtt_message.content[sli_app_mqtt_message.content_length++] = hex[(iq->samples[i]) & 0xF];
  }
  memcpy(&sli_app_mqtt_message.content[sli_app_mqtt_message.content_length], JSON_END, sizeof(JSON_END));
  sli_app_mqtt_message.content_length += (sizeof(JSON_END) - 1);
#else
  #error Unsupported SYSTEM_AOA_IQ_SAMPLE_PROVIDE_METHOD!
#endif

  app_mqtt_client_publish(&sli_app_mqtt_message);
}

void sl_bt_aoa_on_angle_report(const sl_bt_aoa_locator_id_t *locator_id,
                               const sl_bt_aoa_tag_id_t *tag_id,
                               const aoa_angle_t *angle)
{
  int len = sli_app_mqtt_create_topic(sli_app_mqtt_message.topic, "angle", locator_id->system_id, tag_id->system_id);
  sli_app_mqtt_message.topic_length = SLI_APP_SATURATE(len, 0, (int)sizeof(sli_app_mqtt_message.topic));

  len = snprintf((char *)sli_app_mqtt_message.content,
                 sizeof(sli_app_mqtt_message.content),
                 "{\n\"azimuth\": %.2f,\n\"azimuth_stdev\": %.2f,\n"
                 "\"elevation\": %.2f,\n\"elevation_stdev\": %.2f,\n"
                 "\"distance\": %.2f,\n\"distance_stdev\": %.2f,\n"
                 "\"sequence\": %lu\n}\n",
                 angle->azimuth, angle->azimuth_stdev,
                 angle->elevation, angle->elevation_stdev,
                 angle->distance, angle->distance_stdev,
                 angle->sequence);
  sli_app_mqtt_message.content_length = SLI_APP_SATURATE(len, 0, (int)sizeof(sli_app_mqtt_message.content));

  app_mqtt_client_publish(&sli_app_mqtt_message);
}

int app_mqtt_client_publish(const app_mqtt_data_t *message)
{
  app_log_info("Topic: %s" APP_LOG_NL "%s" APP_LOG_NL, message->topic, message->content);
  return 0;
}
