#include "sl_event_handler.h"

#include "em_chip.h"
#include "sl_device_init_nvic.h"
#include "sl_board_init.h"
#include "sl_device_init_dcdc.h"
#include "sl_device_init_lfxo.h"
#include "sl_device_init_hfxo.h"
#include "sl_device_init_dpll.h"
#include "sl_device_init_clocks.h"
#include "sl_device_init_emu.h"
#include "sl_board_control.h"
#include "sl_sleeptimer.h"
#include "sl_bluetooth.h"
#include "sl_debug_swo.h"
#include "sl_mvp.h"
#include "gpiointerrupt.h"
#include "sl_iostream_rtt.h"
#include "sl_mpu.h"
#include "sl_ram_interrupt_vector_init.h"
#include "sl_simple_com.h"
#include "sl_uartdrv_instances.h"
#include "sl_ncp_host_com.h"
#include "sl_iostream_init_instances.h"
#include "sl_cos.h"

void sl_platform_init(void)
{
  CHIP_Init();
  sl_device_init_nvic();
  sl_board_preinit();
  sl_device_init_dcdc();
  sl_device_init_lfxo();
  sl_device_init_hfxo();
  sl_device_init_dpll();
  sl_device_init_clocks();
  sl_device_init_emu();
  sl_board_init();
  sl_ram_interrupt_vector_init();
}

void sl_driver_init(void)
{
  sl_debug_swo_init();
  sli_mvp_init();
  GPIOINT_Init();
  sl_uartdrv_init_instances();
  sl_cos_send_config();
}

void sl_service_init(void)
{
  sl_board_configure_vcom();
  sl_sleeptimer_init();
  sl_mpu_disable_execute_from_ram();
  sl_iostream_init_instances();
}

void sl_stack_init(void)
{
  sl_bt_init();
}

void sl_internal_app_init(void)
{
  sl_simple_com_init();
  sl_ncp_host_com_init();
}

void sl_platform_process_action(void)
{
}

void sl_service_process_action(void)
{
  sl_simple_com_step();
}

void sl_stack_process_action(void)
{
  sl_bt_step();
}

void sl_internal_app_process_action(void)
{
}

void sl_iostream_init_instances(void)
{
  sl_iostream_rtt_init();
}

