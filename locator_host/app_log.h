/***************************************************************************//**
 * @file sl_app_log.h
 * @brief Debug printing with assert functionality
 * @version 1.0.0
 *******************************************************************************
 * # License
 * <b>Copyright 2022 Silicon Laboratories Inc. www.silabs.com</b>
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
#ifndef COMMON_SL_APP_LOG_H_
#define COMMON_SL_APP_LOG_H_
#ifdef __cplusplus
extern "C" {
#endif
#include "printf.h" //SHALL NOT BE USED DIRECTLY!

//macros -----------------------------------------------------------------------
#define APP_LOG_LEVEL_CRITICAL              1
#define APP_LOG_LEVEL_ERROR                 2
#define APP_LOG_LEVEL_WARNING               3
#define APP_LOG_LEVEL_INFO                  4
#define APP_LOG_LEVEL_DEBUG                 5
#if DEBUG
  #define APP_LOG_LEVEL                     APP_LOG_LEVEL_DEBUG
#else //PRODUCTION
  #define APP_LOG_LEVEL                     APP_LOG_LEVEL_INFO
#endif
#define APP_LOG_NL                          "\r\n"

#define APP_LOG_OS_MAX_QUEUE_SIZE           (512)

#define __APP_LOG_NUM_TO_STR(x)             #x
#define APP_LOG_NUM_TO_STR(x)               __APP_LOG_NUM_TO_STR(x)

#define app_log(...)                        printf(__VA_ARGS__)
#define app_log_status(sc, ...)             if (sc) app_log(__VA_ARGS__)

#if APP_LOG_LEVEL >= APP_LOG_LEVEL_CRITICAL
  #define app_log_critical(...)             app_log(__VA_ARGS__)
  #define app_log_status_critical(sc, ...)  app_log_status(sc, __VA_ARGS__)
#else
  #define app_log_critical(...)             app_log_none(__VA_ARGS__)
  #define app_log_status_critical(sc, ...)  (void)(sc); app_log_none(__VA_ARGS__)
#endif

 #if APP_LOG_LEVEL >= APP_LOG_LEVEL_ERROR
  #define app_log_error(...)                app_log(__VA_ARGS__)
  #define app_log_status_error(sc, ...)     app_log_status(sc, __VA_ARGS__)
#else
  #define app_log_error(...)                app_log_none(__VA_ARGS__)
  #define app_log_status_error(sc, ...)     (void)(sc); app_log_none(__VA_ARGS__)
#endif

#if APP_LOG_LEVEL >= APP_LOG_LEVEL_WARNING
  #define app_log_warning(...)              app_log(__VA_ARGS__)
  #define app_log_status_warning(sc, ...)   app_log_status(sc, __VA_ARGS__)
#else
  #define app_log_warning(...)              app_log_none(__VA_ARGS__)
  #define app_log_status_warning(sc, ...)   (void)(sc); app_log_none(__VA_ARGS__)
#endif

#if APP_LOG_LEVEL >= APP_LOG_LEVEL_INFO
  #define app_log_info(...)                 app_log(__VA_ARGS__)
  #define app_log_status_info(sc, ...)      app_log_status(sc, __VA_ARGS__)
#else
  #define app_log_info(...)                 app_log_none(__VA_ARGS__)
  #define app_log_status_info(sc, ...)      (void)(sc); app_log_none(__VA_ARGS__)
#endif

#if APP_LOG_LEVEL >= APP_LOG_LEVEL_DEBUG
    #define app_log_debug(...)              app_log(__VA_ARGS__)
    #define app_log_status_debug(sc, ...)   app_log_status(sc, __VA_ARGS__)
#else
  #define app_log_debug(...)                app_log_none(__VA_ARGS__)
  #define app_log_status_debug(sc, ...)     (void)(sc); app_log_none(__VA_ARGS__)
#endif

//type definitions -------------------------------------------------------------
//global variables -------------------------------------------------------------
//function prototypes ----------------------------------------------------------

/***************************************************************************//**
 * Function to avoid unused variable warnings due to different log levels.
 * @warning This function does nothing and shall not be used directly!
 ******************************************************************************/
static inline void app_log_none(const char* format, ...)
{
  (void)format;
}

#ifdef __cplusplus
}
#endif
#endif /* COMMON_SL_APP_LOG_H_ */
