set(SDK_PATH "C:/Users/tilaczko/SimplicityStudio/SDKs/gecko_sdk_2")
set(COPIED_SDK_PATH "gecko_sdk_4.4.1")

add_library(slc_locator_host OBJECT
    "../${COPIED_SDK_PATH}/app/bluetooth/common/ncp_gatt/sl_ncp_gatt.c"
    "../${COPIED_SDK_PATH}/app/bluetooth/common/ncp_host_com/sl_ncp_host_com.c"
    "../${COPIED_SDK_PATH}/app/bluetooth/common/simple_com/sl_simple_com_robust.c"
    "../${COPIED_SDK_PATH}/app/bluetooth/common/simple_com/sl_simple_com_usart.c"
    "../${COPIED_SDK_PATH}/hardware/board/src/sl_board_control_gpio.c"
    "../${COPIED_SDK_PATH}/hardware/board/src/sl_board_init.c"
    "../${COPIED_SDK_PATH}/hardware/driver/configuration_over_swo/src/sl_cos.c"
    "../${COPIED_SDK_PATH}/hardware/driver/mx25_flash_shutdown/src/sl_mx25_flash_shutdown_usart/sl_mx25_flash_shutdown.c"
    "../${COPIED_SDK_PATH}/platform/common/src/sl_assert.c"
    "../${COPIED_SDK_PATH}/platform/common/src/sl_syscalls.c"
    "../${COPIED_SDK_PATH}/platform/common/toolchain/src/sl_memory.c"
    "../${COPIED_SDK_PATH}/platform/compute/driver/mvp/src/sl_mvp.c"
    "../${COPIED_SDK_PATH}/platform/compute/driver/mvp/src/sl_mvp_hal_efr32.c"
    "../${COPIED_SDK_PATH}/platform/compute/driver/mvp/src/sl_mvp_program_area.c"
    "../${COPIED_SDK_PATH}/platform/compute/driver/mvp/src/sl_mvp_util.c"
    "../${COPIED_SDK_PATH}/platform/compute/math/mvp/src/sl_math_mvp_complex_matrix_mult.c"
    "../${COPIED_SDK_PATH}/platform/compute/math/mvp/src/sl_math_mvp_complex_vector_conjugate.c"
    "../${COPIED_SDK_PATH}/platform/compute/math/mvp/src/sl_math_mvp_complex_vector_dot_product.c"
    "../${COPIED_SDK_PATH}/platform/compute/math/mvp/src/sl_math_mvp_complex_vector_magnitude_squared.c"
    "../${COPIED_SDK_PATH}/platform/compute/math/mvp/src/sl_math_mvp_complex_vector_mult.c"
    "../${COPIED_SDK_PATH}/platform/compute/math/mvp/src/sl_math_mvp_matrix_add.c"
    "../${COPIED_SDK_PATH}/platform/compute/math/mvp/src/sl_math_mvp_matrix_mult.c"
    "../${COPIED_SDK_PATH}/platform/compute/math/mvp/src/sl_math_mvp_matrix_scale.c"
    "../${COPIED_SDK_PATH}/platform/compute/math/mvp/src/sl_math_mvp_matrix_sub.c"
    "../${COPIED_SDK_PATH}/platform/compute/math/mvp/src/sl_math_mvp_matrix_transpose.c"
    "../${COPIED_SDK_PATH}/platform/compute/math/mvp/src/sl_math_mvp_matrix_vector_mult.c"
    "../${COPIED_SDK_PATH}/platform/compute/math/mvp/src/sl_math_mvp_util.c"
    "../${COPIED_SDK_PATH}/platform/compute/math/mvp/src/sl_math_mvp_vector_abs.c"
    "../${COPIED_SDK_PATH}/platform/compute/math/mvp/src/sl_math_mvp_vector_add.c"
    "../${COPIED_SDK_PATH}/platform/compute/math/mvp/src/sl_math_mvp_vector_clamp.c"
    "../${COPIED_SDK_PATH}/platform/compute/math/mvp/src/sl_math_mvp_vector_clip.c"
    "../${COPIED_SDK_PATH}/platform/compute/math/mvp/src/sl_math_mvp_vector_copy.c"
    "../${COPIED_SDK_PATH}/platform/compute/math/mvp/src/sl_math_mvp_vector_dot_product.c"
    "../${COPIED_SDK_PATH}/platform/compute/math/mvp/src/sl_math_mvp_vector_fill.c"
    "../${COPIED_SDK_PATH}/platform/compute/math/mvp/src/sl_math_mvp_vector_mult.c"
    "../${COPIED_SDK_PATH}/platform/compute/math/mvp/src/sl_math_mvp_vector_negate.c"
    "../${COPIED_SDK_PATH}/platform/compute/math/mvp/src/sl_math_mvp_vector_offset.c"
    "../${COPIED_SDK_PATH}/platform/compute/math/mvp/src/sl_math_mvp_vector_scale.c"
    "../${COPIED_SDK_PATH}/platform/compute/math/mvp/src/sl_math_mvp_vector_sub.c"
    "../${COPIED_SDK_PATH}/platform/compute/math/src/sl_math_matrix.c"
    "../${COPIED_SDK_PATH}/platform/Device/SiliconLabs/EFR32MG24/Source/startup_efr32mg24.c"
    "../${COPIED_SDK_PATH}/platform/Device/SiliconLabs/EFR32MG24/Source/system_efr32mg24.c"
    "../${COPIED_SDK_PATH}/platform/driver/debug/src/sl_debug_swo.c"
    "../${COPIED_SDK_PATH}/platform/emdrv/dmadrv/src/dmadrv.c"
    "../${COPIED_SDK_PATH}/platform/emdrv/gpiointerrupt/src/gpiointerrupt.c"
    "../${COPIED_SDK_PATH}/platform/emdrv/uartdrv/src/uartdrv.c"
    "../${COPIED_SDK_PATH}/platform/emlib/src/em_acmp.c"
    "../${COPIED_SDK_PATH}/platform/emlib/src/em_burtc.c"
    "../${COPIED_SDK_PATH}/platform/emlib/src/em_cmu.c"
    "../${COPIED_SDK_PATH}/platform/emlib/src/em_core.c"
    "../${COPIED_SDK_PATH}/platform/emlib/src/em_dbg.c"
    "../${COPIED_SDK_PATH}/platform/emlib/src/em_emu.c"
    "../${COPIED_SDK_PATH}/platform/emlib/src/em_eusart.c"
    "../${COPIED_SDK_PATH}/platform/emlib/src/em_gpcrc.c"
    "../${COPIED_SDK_PATH}/platform/emlib/src/em_gpio.c"
    "../${COPIED_SDK_PATH}/platform/emlib/src/em_i2c.c"
    "../${COPIED_SDK_PATH}/platform/emlib/src/em_iadc.c"
    "../${COPIED_SDK_PATH}/platform/emlib/src/em_ldma.c"
    "../${COPIED_SDK_PATH}/platform/emlib/src/em_letimer.c"
    "../${COPIED_SDK_PATH}/platform/emlib/src/em_msc.c"
    "../${COPIED_SDK_PATH}/platform/emlib/src/em_opamp.c"
    "../${COPIED_SDK_PATH}/platform/emlib/src/em_pcnt.c"
    "../${COPIED_SDK_PATH}/platform/emlib/src/em_prs.c"
    "../${COPIED_SDK_PATH}/platform/emlib/src/em_rmu.c"
    "../${COPIED_SDK_PATH}/platform/emlib/src/em_se.c"
    "../${COPIED_SDK_PATH}/platform/emlib/src/em_system.c"
    "../${COPIED_SDK_PATH}/platform/emlib/src/em_timer.c"
    "../${COPIED_SDK_PATH}/platform/emlib/src/em_usart.c"
    "../${COPIED_SDK_PATH}/platform/emlib/src/em_vdac.c"
    "../${COPIED_SDK_PATH}/platform/emlib/src/em_wdog.c"
    "../${COPIED_SDK_PATH}/platform/peripheral/src/peripheral_sysrtc.c"
    "../${COPIED_SDK_PATH}/platform/service/device_init/src/sl_device_init_dcdc_s2.c"
    "../${COPIED_SDK_PATH}/platform/service/device_init/src/sl_device_init_dpll_s2.c"
    "../${COPIED_SDK_PATH}/platform/service/device_init/src/sl_device_init_emu_s2.c"
    "../${COPIED_SDK_PATH}/platform/service/device_init/src/sl_device_init_hfxo_s2.c"
    "../${COPIED_SDK_PATH}/platform/service/device_init/src/sl_device_init_lfxo_s2.c"
    "../${COPIED_SDK_PATH}/platform/service/device_init/src/sl_device_init_nvic.c"
    "../${COPIED_SDK_PATH}/platform/service/iostream/src/sl_iostream.c"
    "../${COPIED_SDK_PATH}/platform/service/iostream/src/sl_iostream_rtt.c"
    "../${COPIED_SDK_PATH}/platform/service/mpu/src/sl_mpu.c"
    "../${COPIED_SDK_PATH}/platform/service/ram_interrupt_vector_init/src/sl_ram_interrupt_vector_init.c"
    "../${COPIED_SDK_PATH}/platform/service/sleeptimer/src/sl_sleeptimer.c"
    "../${COPIED_SDK_PATH}/platform/service/sleeptimer/src/sl_sleeptimer_hal_burtc.c"
    "../${COPIED_SDK_PATH}/platform/service/sleeptimer/src/sl_sleeptimer_hal_sysrtc.c"
    "../${COPIED_SDK_PATH}/platform/service/sleeptimer/src/sl_sleeptimer_hal_timer.c"
    "../${COPIED_SDK_PATH}/platform/service/system/src/sl_system_init.c"
    "../${COPIED_SDK_PATH}/platform/service/system/src/sl_system_process_action.c"
    "../${COPIED_SDK_PATH}/platform/service/udelay/src/sl_udelay.c"
    "../${COPIED_SDK_PATH}/platform/service/udelay/src/sl_udelay_armv6m_gcc.S"
    "../${COPIED_SDK_PATH}/protocol/bluetooth/src/sl_bt_ncp_host.c"
    "../${COPIED_SDK_PATH}/protocol/bluetooth/src/sl_bt_ncp_host_api.c"
    "../${COPIED_SDK_PATH}/util/third_party/printf/printf.c"
    "../${COPIED_SDK_PATH}/util/third_party/printf/src/iostream_printf.c"
    "../${COPIED_SDK_PATH}/util/third_party/segger/systemview/SEGGER/SEGGER_RTT.c"
    "../autogen/gatt_db.c"
    "../autogen/sl_bluetooth.c"
    "../autogen/sl_board_default_init.c"
    "../autogen/sl_device_init_clocks.c"
    "../autogen/sl_event_handler.c"
    "../autogen/sl_iostream_handles.c"
    "../autogen/sl_simple_com_isr.c"
    "../autogen/sl_uartdrv_init.c"
)

target_include_directories(slc_locator_host PUBLIC
   "../config"
   "../config/btconf"
   "../autogen"
    "../${COPIED_SDK_PATH}/platform/Device/SiliconLabs/EFR32MG24/Include"
    "../${COPIED_SDK_PATH}/app/common/util/app_assert"
    "../${COPIED_SDK_PATH}/platform/common/inc"
    "../${COPIED_SDK_PATH}/protocol/bluetooth/inc"
    "../${COPIED_SDK_PATH}/hardware/board/inc"
    "../${COPIED_SDK_PATH}/platform/CMSIS/Core/Include"
    "../${COPIED_SDK_PATH}/hardware/driver/configuration_over_swo/inc"
    "../${COPIED_SDK_PATH}/platform/driver/debug/inc"
    "../${COPIED_SDK_PATH}/platform/service/device_init/inc"
    "../${COPIED_SDK_PATH}/platform/emdrv/dmadrv/inc"
    "../${COPIED_SDK_PATH}/platform/compute/driver/mvp/inc"
    "../${COPIED_SDK_PATH}/platform/emdrv/common/inc"
    "../${COPIED_SDK_PATH}/platform/emlib/inc"
    "../${COPIED_SDK_PATH}/platform/emdrv/gpiointerrupt/inc"
    "../${COPIED_SDK_PATH}/platform/service/iostream/inc"
    "../${COPIED_SDK_PATH}/platform/compute/math/inc"
    "../${COPIED_SDK_PATH}/platform/compute/math/mvp/inc"
    "../${COPIED_SDK_PATH}/platform/service/mpu/inc"
    "../${COPIED_SDK_PATH}/hardware/driver/mx25_flash_shutdown/inc/sl_mx25_flash_shutdown_usart"
    "../${COPIED_SDK_PATH}/app/bluetooth/common/ncp_gatt"
    "../${COPIED_SDK_PATH}/app/bluetooth/common/ncp_host_com"
    "../${COPIED_SDK_PATH}/platform/peripheral/inc"
    "../${COPIED_SDK_PATH}/util/third_party/printf"
    "../${COPIED_SDK_PATH}/util/third_party/printf/inc"
    "../${COPIED_SDK_PATH}/platform/service/ram_interrupt_vector_init/inc"
    "../${COPIED_SDK_PATH}/util/silicon_labs/aox/inc"
    "../${COPIED_SDK_PATH}/util/third_party/segger/systemview/SEGGER"
    "../${COPIED_SDK_PATH}/app/bluetooth/common/simple_com"
    "../${COPIED_SDK_PATH}/platform/common/toolchain/inc"
    "../${COPIED_SDK_PATH}/platform/service/system/inc"
    "../${COPIED_SDK_PATH}/platform/service/sleeptimer/inc"
    "../${COPIED_SDK_PATH}/platform/emdrv/uartdrv/inc"
    "../${COPIED_SDK_PATH}/platform/service/udelay/inc"
)

target_compile_definitions(slc_locator_host PUBLIC
    "EFR32MG24B220F1536IM48=1"
    "HARDWARE_BOARD_DEFAULT_RF_BAND_2400=1"
    "HARDWARE_BOARD_SUPPORTS_1_RF_BAND=1"
    "HARDWARE_BOARD_SUPPORTS_RF_BAND_2400=1"
    "HFXO_FREQ=39000000"
    "SL_BOARD_NAME=\"BRD4187C\""
    "SL_BOARD_REV=\"A01\""
    "SL_COMPONENT_CATALOG_PRESENT=1"
    "RTT_USE_ASM=0"
    "SEGGER_RTT_SECTION=\"SEGGER_RTT\""
)

target_link_libraries(slc_locator_host PUBLIC
    "-Wl,--start-group"
    "stdc++"
    "gcc"
    "c"
    "m"
    "nosys"
   "${CMAKE_CURRENT_LIST_DIR}/../${COPIED_SDK_PATH}/util/silicon_labs/aox/lib/release/gcc/arm_m33/generic/libaox_static.a"
    "-Wl,--end-group"
)
target_compile_options(slc_locator_host PUBLIC
    $<$<COMPILE_LANGUAGE:C>:-mcpu=cortex-m33>
    $<$<COMPILE_LANGUAGE:C>:-mthumb>
    $<$<COMPILE_LANGUAGE:C>:-mfpu=fpv5-sp-d16>
    $<$<COMPILE_LANGUAGE:C>:-mfloat-abi=hard>
    $<$<COMPILE_LANGUAGE:C>:-Wall>
    $<$<COMPILE_LANGUAGE:C>:-Wextra>
    $<$<COMPILE_LANGUAGE:C>:-Os>
    $<$<COMPILE_LANGUAGE:C>:-fdata-sections>
    $<$<COMPILE_LANGUAGE:C>:-ffunction-sections>
    $<$<COMPILE_LANGUAGE:C>:-fomit-frame-pointer>
    "$<$<COMPILE_LANGUAGE:C>:SHELL:-imacros sl_gcc_preinclude.h>"
    $<$<COMPILE_LANGUAGE:C>:-mcmse>
    $<$<COMPILE_LANGUAGE:C>:-mfp16-format=ieee>
    $<$<COMPILE_LANGUAGE:C>:-fno-builtin-printf>
    $<$<COMPILE_LANGUAGE:C>:-fno-builtin-sprintf>
    $<$<COMPILE_LANGUAGE:C>:--specs=nano.specs>
    $<$<COMPILE_LANGUAGE:C>:-g>
    $<$<COMPILE_LANGUAGE:CXX>:-mcpu=cortex-m33>
    $<$<COMPILE_LANGUAGE:CXX>:-mthumb>
    $<$<COMPILE_LANGUAGE:CXX>:-mfpu=fpv5-sp-d16>
    $<$<COMPILE_LANGUAGE:CXX>:-mfloat-abi=hard>
    $<$<COMPILE_LANGUAGE:CXX>:-fno-rtti>
    $<$<COMPILE_LANGUAGE:CXX>:-fno-exceptions>
    $<$<COMPILE_LANGUAGE:CXX>:-Wall>
    $<$<COMPILE_LANGUAGE:CXX>:-Wextra>
    $<$<COMPILE_LANGUAGE:CXX>:-Os>
    $<$<COMPILE_LANGUAGE:CXX>:-fdata-sections>
    $<$<COMPILE_LANGUAGE:CXX>:-ffunction-sections>
    $<$<COMPILE_LANGUAGE:CXX>:-fomit-frame-pointer>
    "$<$<COMPILE_LANGUAGE:CXX>:SHELL:-imacros sl_gcc_preinclude.h>"
    $<$<COMPILE_LANGUAGE:CXX>:-mcmse>
    $<$<COMPILE_LANGUAGE:CXX>:-mfp16-format=ieee>
    $<$<COMPILE_LANGUAGE:CXX>:-fno-builtin-printf>
    $<$<COMPILE_LANGUAGE:CXX>:-fno-builtin-sprintf>
    $<$<COMPILE_LANGUAGE:CXX>:--specs=nano.specs>
    $<$<COMPILE_LANGUAGE:CXX>:-g>
    $<$<COMPILE_LANGUAGE:ASM>:-mcpu=cortex-m33>
    $<$<COMPILE_LANGUAGE:ASM>:-mthumb>
    $<$<COMPILE_LANGUAGE:ASM>:-mfpu=fpv5-sp-d16>
    $<$<COMPILE_LANGUAGE:ASM>:-mfloat-abi=hard>
    "$<$<COMPILE_LANGUAGE:ASM>:SHELL:-imacros sl_gcc_preinclude.h>"
    "$<$<COMPILE_LANGUAGE:ASM>:SHELL:-x assembler-with-cpp>"
)

set(post_build_command )
set_property(TARGET slc_locator_host PROPERTY C_STANDARD 99)
set_property(TARGET slc_locator_host PROPERTY CXX_STANDARD 11)
set_property(TARGET slc_locator_host PROPERTY CXX_EXTENSIONS OFF)

target_link_options(slc_locator_host INTERFACE
    -mcpu=cortex-m33
    -mthumb
    -mfpu=fpv5-sp-d16
    -mfloat-abi=hard
    -T${CMAKE_CURRENT_LIST_DIR}/../autogen/linkerfile.ld
    --specs=nano.specs
    -Xlinker -Map=$<TARGET_FILE_DIR:locator_host>/locator_host.map
    -Wl,--gc-sections
    -Wl,--no-warn-rwx-segments
)

# BEGIN_SIMPLICITY_STUDIO_METADATA=eJztfQuT3LiR5l+ZUGxc7J6nq/h+6GbsGGt65rQxsnTdPfZurDYYLJJVRYss0ny0WuPwfz+A7wdYBPFgUY71bmiqq8jMLxMJIJEAMv/+6sPD+3+/f/NkPbx///Tq9au/f3z1cP/LD09v/3xvdX/6+Or1x1e73cdX/3j1bfPO4/tfH97cP4LXvvvDSxh88+wlqR9dvv/4StwJH199412cyPUvJ/DFr08/3RkfX/3h9x+Tj5fv4iT6q+dk34D/xl6SfXl0wH/BU9X3H18Vj33zzXfHKHC95JuLHcKf7TyLTt6l+Rk+4Ade/fPJzjLLPewcwDpPfPAN/PX1/s3r/aMf+E50+cU+pPuTn+1d7zm1fvMOiW3ZkW0FkWNnUWLFkbOvP5+jNNtXHPcd0vvrzM/8mJ8nmaeBdQhyL4ui7MxD/CF9HBgcFDGkfwVGZCeu5XpHOw8yy7/4GS+1IBlNAHt4urfeRGEcXbxLlvLQ0JjDtI6c+jkLELKD6MSpyZB8pmEBDr7jFaq0HEDzU8qp6dCMpoF5z1CGs31xAy/hpKsRD1w4fFQ04jENxwevJp4dVk9zse4JNgtA8VETig0GqMLy/Eua2ReHv8LG3KYhpn4YBx7suZaf8jKuMZMJQIF/+eQl8Jtd4LKHMiA/rZXcTjI3eeY5nQxZ4IDhaz9IPhOwdk7igPa8HP0T/Mgez4hBDeS7fekpov3G8o2e29j7/ZDBJzq/o3y7kkie2BlwcXf1K6wkLKnvS7L7Kww7qu/LPDaR8EVSrWNgp2crPeeZG32+WHkK2rNWIUOLqfBjcp2wn8f7n3++f7Aenp6AE3M5csCH4HDFE0l8sKKxwueYq8KQbPD8I9dxHb7YpplNIKzHC26oxgwwdRUHwXq66jObW6iAJ7Mk4gtvitP8FFP2Xu+Fbze4xm0a48WJC0KFG8ET3gSja7Z3yE9W+jnibHRjLhOY7Di27DT1eI7/SB5X/MzA8+LMD8Hwx1NJSDZ4o0ZwfOHdgJPMphGGXhglX/hO40MWE2jc0OY63I/o47WbF+arNVufF9aqiqu1o9jgae28prWfsazdCwP/AB5LvGqs4wbvCie8ZYYf2idvKjgN1uBuCCQPT8IuvpzYoS+47kfkJ9TZPifyhSFiwpD4wpAwYch8Ych9GNft6OQ5nyIrdT9Zyk7ZidPr1jiws2OUhIOVa++ZH4se13ti9ExHysGDo0fvf3qQpXc/S8rowTHVKE9GnBGr6/RLmnmh5R0TWQINprAMrQxUua81ti/V0qPbiLYvke9RwPaz0mTAfc3jLYqDQjaWZxRWmGjetxcnyF2M9m34HSRJOIqqrPmhYrAcwMnUUgmwn8Y329jNq5bthPEGRWpwLRGFbSyRmSTD0OOsIIc8scMtitIAWyZM5mxUmBLYAmGcMN+iKBWsBYLAmNgWJalxLREFcLgco01K00JbIlBogzdTJ/FjgGiTco0QLhEvDoJNClXhWiCKt83hwFs8HHhF8HKTsjTIFohzTBNnkwNCA2yBMKfYSTY5VjfAFgnjb7JhalwLRQGAttlteuAWCHU+brTnNMAWCfOyUVleloriS5scAipYSwSxt+l41riWiOLYztnbpDANsgXifPK+pI592aI8HWgLBAqAm7pFaWpcC0V5OdibXAx0sRGIBM8g+5dthm5QGJeI6BV7t5uUrIW2RKCtegcBgXcQbNQ7CJZ7B6HtB4foZYvSdKAtESi2z4eNBkG72JaIlG7S76lgLRHkeZMbBhWsBYLEzmWTa7ca1xJRkk3OnxWsZYJYqX+62MFWBerCWyBY6iR25pxj292iXH10S8TyNjz39MAtEWqbYd10cVg3BcumI9MjR8xkaZAtE2eje4ktsgXibHZxQLI0yDe7NshJFgeb3Q8h2Q55du1N9poa1wJRPrtsr/uyEqXGNS9KWJ0l3ZAUXUjz58SGh8s2IwcKGfYxMeTXiC9RXw0v7YVhdLl+cNG/OIgDi/3zzUAtob9Ovy0h7wGqfY/xUHujq9yXfJ0leh9gzXYOXnmh4xYabBjPQSzfuwHElvEcxDSzs3yd1VgfYst4P9crRx0sTTA6WNlKaxxzrQQDqPY9xrO6h/seQcD0/j8myC7r5frPoihwzrY/HAexGmrq3tCaWmgEqPXRQhg12sSMMj/kT16QSryTv+6w0Mpb9b4REsRUim6l26PGg3tyHCtOPL90H24KewwFy8iI/JM37x7fPl53T95Eyfh8PPYx+p6enTD10yKVjs84+8ykkgsB91CGxjUco5gxj/KFKi/YbVF3QMyAzn4rrkl7L+v4PAjEfQRYOgamf1v9VgDmwMLrdU4oyzcD2wUwAzaMc8tOwud1LqsgwPYA8BvKygwU18ey4kokGy+kubO+iiNSCrcvmNZOSA8BTz+kZbSGBfVErabEHgJ+JgQ88fl7hp3bv3OWhKveUQq3NfRcCbvvsG/VjUI070R131vtUgmmHNOXSebyrWxKisl7CTN5BLYkxOSVhLlb/VsSYvrc7lwmji1JMX2+6JoUl+eVYpGYUtR4yCZB3Pl+kEQqlVaZ+VEqaBwAJKTlI9zWZGkhLR7nNiZKi2j5aLcxUTqQlo95G5MlIJWlGGk2JEiNh9QnHrusVaZVNoukmtqqKquZ1vrqgphv7SbVbJKtsx0wB7sGwnOF16hozUm9Ebia0bsgFrbTFmDXQJh1xTDOGW2YxPmqlgz4NRslJWuuuyTxuosbKF29wRAjFzLELZ4UGa4zL0nyOLOePQeiwgk04NnBJPlVrWMSRW0zV2HytKRpxmva17R+Kqu7CpOZLZYHaNgYXnUYZ3VTK/l2NrG7KOanmOqFOIkcL00t2ylyWN9cgDEenp2iq7U1u0Elen38o4+CtO1uLsAYD7sO2+SHZdRpG3rrmnzDtjH7HhCMpm8T5Z7toD6OvRUZBpgWi1NmqtqUNA2kxcJsy7z6kGaF8Qevrju6DOVAoeE6L7S98kZy1yNrD8iiVrst8iESZjNB7nqB/YXNLFDSWrWLlizr7tkCmB9dymeLwwZaWJzleLwx7gEWnh2yUtSaJl1JXHXEFgC/HXovdJPnmf35Itc6A+svCa1i+oVYVZb4woBa3txMpmKxhr30xIPW0vJmNughb1qQ6MVzopUOgJZq6Zxzb1gz0wpM/dXEChj0iR69FbtGj2/RQ0ZIuHWUPqf1DKMvM7SPERJ2LkNZt4aBhVSUVrSNimNhFR3u3Oyh5rGeJdQSQhvocOc3zcLD0Xk2dxAOdeByvIvxHM9n2UfbFSLW/xyvde8Dyl+fRQRsmw2NEsH8zcjiURjvOcF4rZ149u2Rj+DgipFnfrAB+DUMXNhwPV/cAN0A9h4W8oIF6PEJ3VNWusQyFLreHMPMwYMyzZsjH8HBFSP7Eq+Uvu46/gbHoi5+e9w1jAVdfAOoJ+Jt004H8ZkAOzszOhQAKMF/Ev9l1dER8m3GxT4GrqcEOqzWtJdC3NpS+hgw7lDCF9YfUUaYJwcTvBZi6wIWSryFT1KopTurD5FgjVn1S5Bq4L1U9mCFebDa7fPr0kwAIxKuOpwABPhrfrIzb1sSotDRiOlGGfQb3NzZWFOi8dGIuj1zHQCjEs4+Xfwsdz0r/RtYbnvuNiVFoVwkdtXDbXcjAvbxkIiS5odNiVLhIRFlOz2MZiKo3t3cqIHGRWRyjh1sZF4bIiIRJ0vsSxpH6bZE6qFaJFbVwgDxNgTq4yESZSvDdR8PiShOYIfrBnTnhGkQkYnjb00an1yYKF4txxKeMBUgEmE255kz8MgrEuDnjSyDB4BIhNmOg0DjGVTvXrztLHlHkEgEio7H1NtW+7SQSATakO82REQkzlZWP308K2x2VYzXj5J29wE6IBa13uo7L1PIl22+XIsXbkKaCWBsApmbkhCFjlUgc4uCDvBRBzK3KCMLcx2HCDcpKQolaSBzEwL28ZAGMrckSoWHOJC5JVmIehYiYLglmWgGjV7YcEtCNYjoAplbEqmHijSQuQmB+nhIA5mbEoVguO6FDbckTIOIOJC5LWl8cmFg3HBTwlSAaAOZW5KJxiPvxg23JFMNiDiQuSVhiDyDftRwS+K0kCgCmVsSqIVEHsjckjxkvlsncLgpYaZWP9zrR3lh4B+uX8OZrW7jhZbtrLTPWuAt4sEdrlcL24Dn1ktp0YM3mbZiiM8J18mf1kNXMZ3FFiXr7GD0wVVc59C5h9P64Cqmc9i8W7Sqh9eqXlnZcX14Dd85hKfYSW7QZxu28/j8dSozDOD56GoMA3S+dAPdVUxnsdnuLcBVXOfQBW64zkXKHrqa6yw6b72MRn2A3mTeoiHGML1B81ZM57BF8VoHwnroGrZz+GLncoNRueY6iy5Z55BjH1yCPMk4xJbcYrZN8GbblQ679qChj7KOkBVZA2+AruE7h/BG4x32aHcjRwrbjyrKXq8Or+Y6h66oZL06uprrfm79jHVgCLkWXid3B5SpyOvTcsVbC68Or2E7u948r7Q10INXc8VZqa8PDl3OCIGtOPlgr5VDqA+xw/sqUpiX8Caa7DOe0+aK5bz7/RivmnfRpdbZqR30Y/Q97VHUaLVK4307xCs0Dl03OzzmlxuMhB3Gs3P3ihVhexivVIFFxgdv0M4JOo8dAp118i5eslJBsRHKLnecaObqICumONHM1bFNFPKbiGauD6/hi4fwZtPziD1e9HV1nA1brOjrDeD56AKxiOjr6uAqpljR1/XB2ejiqMjo6+roaq640df1AXrTSbwR0dfV8VVMMbDdbAjs88aLE68OsmGLFSdeHV7NFSdOvD64BGtlktzCj0nw/JiVzhL3oKFPCo+Q3UJrKabWvqTO8QaOc8sXM8p+C4QVXzyEt1spjfnj7QusDhR7Hr7RkgR7RVJE6NcPLFRcsfYFVkdXc53dF5g/VxcDO47PXmIHlIfrWkJrFppquRZ7JkgQHHZPxnzWsIGOsNAQkCCuGuzojTW93Dn0k14vjl2Pv+i3qB33M2/i1MwYVgbI/GEfQbGpAuNzmVjbJ3kqH3Cpy2pA+PuW674PYD4F680BjzDwy/p/CHIvi6JRhmGiSisXJ7ZOdjZrEUC++lGeQyfUcCNfreua8X4AYt4smqc5GwUeZFyrQDYS5A0HIcyGqh+/SWPVzPcIMHiN1rxxi4abhE/cgKkPr9JjNl/7MP9jMUgdtAD2E3DmG7HzVhId8nRDUrR4loixuiVO4cebEMfybgV/Bw+zOXLOwYqTKIucKLjmZWFOq7NLDSDsIWvHDTv2ua41Ksk6+q/SPCFAzJwo6b5yc8yc1kaQyQmqg+eiYixfdWOtYY3RErcD2fDGQ1ktjfwDQJbxvcM9g3mMBEMC/oUbrqGertkwPO11Q5Pwl9nEGgdurukU99zNYMC5FdwuABwrgGsJ92C53vF2xtDHwD4icrYT97OdeFcn7Ag8xGCyhmQs/+JznfNqgfYFu2a+6/GeNdbiaYAmS6KA+9W5a4iHGDhN1F1ePG19IGrdNYfs8dqnaM0bga15Mwi9I8tGjkJMl6N/yhMw5UYXKwLPW+nniE3hKyfiekuq0WJVKQwtSm31FRiyxT9e5SvIYg2ruS5vZU0VGNL12UgF4YukWsfATs9Wes4zN/o8G5icspL+Q4GFIF3GKfBS0o7fXtPqEOybLL1Tck38uCiFL53h8m+CFTsCqgnq/CJLm2CV5CNzrtNoJ2jwe3b2wUwRAzG+XB/d48S/ZEcGo7kP2iHxbHi4CFLk2cGKbZmOhPuSZdGpEDC4DehDXhwNekpkaMQIGNgid3dmb9ZuV5oKAfAGWp5SLM6smHqn03xl7vJQz7PvfZ4fjB/vf/75/mF+2C2fsx6enlZt1FLgfSvRvgSy7+OZzUVVPr5qc89Ax0qh1ZFyQ9BrPDdIm5WWIlsBkPn6XGRHL3P9BM/NTrIApqk88I6lFa3QlW8PRKgdiyEIsmlonHIM8VDiBZ6dehNDQu/Rk4Mu4zBujCS0QlmeeHhMtzyOOPn4oJGAWEBVVpqBpYmzs9duIniQrVLaHmhkXwm7r6TYj+Chuv2VRpz9cbrqBl9Hcvhnt02AD+GG3i502bVGh2Stwe96i9Ka94/e0c4DsJb4BrSRF/S+KaIeb7pBfxgXTFxFECT7tbCD//eDIH8DvxIN3Wm+EsHLcHQcvhs6+Q60+M47JrK0C0+SUn6Enw6SJBxFVdb8UDHA+1kUBc7Z9i9DInCTFtgVzLmcprtjAuT4HCWfdnES/dWDJaTgtctL9ATefwPfL1EBisA2r9FyP+2A2Tng3zz2kteFFe8sXZYEXVFEodPBvnO91En8GOrx99/tu3/Vjd3TdfHtd/sKYPHXq29fPb599+GXt2/ePv2n9fj0649v31vv3v/46y/3j69ev/qvv0OrCKNnDzTg66MdpN63QPW5H2T+5f7FCXLAFPzyX//dfv0Y5YlTfgsGkTyLQJ/aw0iy5RYVaL4dfwsGR0ggjNw8AIPY64+vvqtAvn73rvjym5cwuKSvq2+///jx46tzlsWv9/vPnz/Xqis2odP9h6oBPNgC8MlvKmTFa1mSl1/6bvF37uxKvrvUy/J4Z8dA99YB2AzU3K5rzTs4dsJXYzfs0fr9R6DLQuFg6A9yuC2RAsPLMi8pme7+N/x3Xz3XNEEt3e8LrVQogfyQ7j++pdV92fad+d+CMkFlf9v82J5ms8pv+j8fMvihbKeeKe3KX7rPuqHtJs9IMsXB4fKGr+sd8hPyoVHYeeKhkkL6OZp+4Nl3vCJKarmO62A9FwdXGLbPeUXuhtnHzscXLHjBteeKyEVVowP5RAisI/ky+etUXGPqhe4hqKlnOgc8pp4IPC8uTv5PPZEDDNBSSjDeC1q++qn2t80MEbnz9Q8O9RD88HRvwdkouniXLK2aoP4x8C+fvAQ6AbvA7f0CO2u9YzgY1Hs/nUc/FV3cLef2Zk+s/4xT47GAeu0gOo3JdDuRA5rhUzom4z1DEmf74gZleqprP484NEGV8gkE/dET0zQKnP4FzOsXB/Vgp1v5KQJr3RnQ+mp/7TDYUG958kJ4At/7mvsL1RHmb2nePy97/9qpXCZ0FuC5driRlkbngCcrUixQNYdnJyhh3YRY9u7oUgLidcy974Vv1hvR869dPVew8PXOIMhk/5OcTn/fGIMO420oQo4Ue48Ijs3lqjfvHt8+7t+AOWL/9lKMqHsnTP20mM/9dpJdTgBMFcTvdo6JLX0frlecUJYJ3g3j3LKT8NkgeDf7regh3stU32pe/rHwgnrBmfufHmTp3c+S0pBrIhtN2kOWJL2pLkRK8QB62dQEQUEzm7WghTSr1HgMKcK1KmuS4PHLMWJNNbStOtgUzfbqpcTjYGoqIiXpMW+qNpkVQ6JHMC6zbqomSRRTmj57mH5kxRFzlZ6P7FUKYzuMSVbpqFhStJmPJb5jO2ePMdFP3pfUsWdn54VU6xxVjEm+HGzWo11NFkZE/AvzybSTC4slVQ69KmDfq0LbDw7RC2uqsX0+sHdRqqxgLCk+s3b26pRWLEkmrE0eUATr8dPFDlhTBg6PnTnn2HZZE/b4mGrK3O9p0zixJcrePecx7uU8Bj4enmSdOYghyTrdDzuSvY12NqTDal+ACbUqzVaDl4poGUvepxlo7DzuEJ2JqWARHQKdoVmFEau409Ww4dQ7WRT6sxbWf6fNNo7/jnfJZ+fZ/hvwwE4+O/DXQdykqwE8rVXvwIHQDoKpuN/wreYQSY3z5DhgpvL80tYw8Y6olBvAdG9biXfCiI+NiNRBxBLCvBqK2p51ULJT3XPeS7n6snW2Z8MF1wnESXQC/pxlJ97souE6peaWLzkJGNsnoFA3xnNM0BLty1CZ5ThCR6anUipKhT4wKRSFY2tdFkVj7SzxZ52qydcXNedU1Vra94vgeeC9VMI0paOZ0GxqoF/+mtclnFkSHhQiZ0k6tE8XPwNjp5X+LQd2NuuTL2bAQtFVo9kuPTyW7V/RaspCMyFWlmVmQSpL7EsaRykzbCybdMkIPVfKGp6xYEWKgYnVw0Fgz+8T4RPz2dGKYhxnB4sWy6GpInn053cucGkxMdWK1sVjMrZX1KLjMfWYYWMzBPUrwy8iVfsa16bbJf7HNZqj6ZYx4a5NMyY9nm5ZM2Ch6M50y4gUS1ilrbMilh9YkWqnW0YEWTbp4gUAikhnumVFioGJ9aZbZsR8drTgdMuIFsuhqTvdMqLFxFT70y0jatV0y4gamyGoM90uIdUjUy7NZ16vYgLFjY960m+uf8xN9b2XK97tyzOcvdBNnruxRc+J5uN05VvlRZjirfLjotcg0uo1LIzw6IR/ybwkyeOsYNr7Bo93nwiE0CeChaQ6hl5gqD7jca9fhHzrF2c5Isr54r+AFfNG1+Rd8Mbs4g5ZVhf/hfntvSt1Z/FfwwrcIytOLnqhW9AE+8WqICP28xhHwSaqFi58hUTTWIe1kEX2sF/AOGmErEWH/QLO0Zupcm3Y72AclrhSzwz7tabCGPYbOCckUIW4sJ/vFMTFf2ehzc/H3VCVp/CfxzpDMFGbaeErRGPKcntcPkjg7NBPVRnGfgdnz36q5Pf8O3C2ridfrNm6eqGcSZe8ASEteh5OP0tegLPIkue9hYC8a7eC0K+Uc8GyNyZv06BfgHPBoufhXLDkhWIuWPRCNRcseQfOBUueLwf1JW8Ug/qiF5LZOEPv+WShOc1HavqPl6PnkleWN8NyCy+GwCUvFMPZzAs45alo3sd0I3BKgl17HyxPinM/nWvO7fp3dPN5BgwmMZzrJ7ikMO5wYJLCcNgxKeGc28ckhXNYGZPU5XneO0GRagIag1wX6ezRDVxqMCMGM2owbwYzYkV2DWbUAqbUivbEJFWnB6jtov4b1x6m3reSyWvj0zQqWRoMS2UYvF9gwKQRxnmzpRdjd3f4Vh1SjGcn0PqtpMjGUMW16khmt3NOPoCLa5pDhXaaA6YMbYqV5thj8w0uyhENn45IfS6ypbFcmBGN4jwa1noBm9qy+XeWHJ2o/oActt4Lj65p/HKpu8RGkQTiJHK8NAUrugxjpTkg1Z6LbbDgagVFYIAFk1TueoH9pRar/AtXjurdCkb17jK+vXeL699aWNxdf0STmS8gtOytpnoLwWvjojpLiXQLnCx99+pRS8wiMEte9QmVhaiKgvc6uvIV6bt1pS/E+4sykmK/vzhd5hRl/AzWCyi06aOXv7SM00SCcRwKGKmFGZCpkyuzIlWi8kP75FW5PC0/PAm7+HJC/iJO/iJN/iI3v3SyhW4mfVWTjOyx+POrTWG1GYW+KfYTKxofgBr/CF52/0ex1IqtkuoBOwVvnNL/0Si1Rv95jLTNF7hzkiYjqgOremxG27lTv387Nf83MiHyhx/fwWzI3/0B6OLjx28qp/P7j69EmNAZfONdnMgFnQ589evTT3fGx1d/AGwhX8C44gseq2u3YOcThbTB67EH5utHB/y3rHJbkHvVcAAPgf+v8rG3bMpGHj038XSd0Bf5dP2OD4ykeeNKVmDwUOEa2pnnfl81GfyySCgKvykMuGwcBLYmRzkSeA/EtTxmndyxlID6PBEZlZnSTyeS/zJnMp0omSmrcSpfrpL0UzmzZjWVo5o1n2tZklnzmsj8zL6Vxpm7mfJAZjNnLQUywTVPgx4kCWfNapRFnCmDUVZ4nprqZ2dn3vCo3Oc8xTlzbPgrKflJ+UxM299VSQ4+2NkZ/FkWFkmz3PWj17VPtq99lRFN/Jf3tfPR0ujUuqi++YafDzed5ZrKi6v89kk3bjQ/ddOyg18aD7xtyHHrYk9+3cTuzIkjU8Mz5TLOds9aCGTuetZM0NnvWXMZJcjny4CDBKgM/dx58JRjXEeANatxJQKmHAYVJVijH9ZJ4EefQRPQzJfNrHCTyW4uJk414RXbA3jT3WhH4uPYS2lUSF3LbGIXBMt2RjskqyIViZBKN0AqESGVb4BURiOd6tRDKx/szuFG6eqjBzNxusFbZRa5q+9MvNnRFsbrE0SajHXYJKbQFAHthVTQYzkiZ94186nHX9Bg7fEP0uR8aOtehh+VSJCPAChOyyS4Gs/FbvwqLyOL1p/OQclWhfM5LxmYwri+A2chGj5swTfOFF/sJRum0JuSFbzBN4xYwy8vRqwAv2TEFH51YY03+IoNU+j1lQve2Gs+bMG3tUW4429ZsRVhVMiEuyQjjmwFqi7ecBej4sMUvLdOR/Y4dOQ2TQB39A0npgI0tWd4428YMYXfZE7gDb9hxBi+v4ryaz7MwTe1e9aQoGHGVIymVBBvERpGjOG/rIT+hT34KisJb+wVG7bQ7XVcuJoPW/BNSSfu8BtOTAXolI/iLUGHFVMR6oQ5vPHXfJiDr6tirSFAzYuLEN0aXGsJ0+XJVqg2rRJ3WVpWbEVYa0YOuMzIwUozcsBjRu4UpOKNv8OKrQidQm3cZejwYitEuop3UbFhC/15lWB0xYYp9DqNG2/sNR+24JNVZrCKDWvo3dp9K4jQZcdUlH6xQN6S9LmxFcRbcS7oMWMrxjrBxZRDcLFNmMgdfcOJtQAr7TC1nJgKsJorzceRzlfzpHM+rvRq0XU+wfU62Sdv9DUfpuDrJKK8wdd8WIDv1gHlhLvLgsV5HkSxUT7IUZy4HufBfhzjQZxHxtdgYb4BksNv/sVZcOhteFa4LZK6uCGnqq3ithPiqH1VSZUSSk2GHEibep9WKw0hcjBtantKMC0hcjBt6VpKMC2heTD4nXPYOdKEqnM0NXdJhR0V76XQfKeYLyWcLime2m/q8JKfyl3SgFOaa6v/kurtSkFh7AZdOB/RDPPXFdGppUyvjzoj5pDywsl6qs3YY2QBblwXmxnIMWnmBsbJg3nz7vHtI4kD8wamYSEeIMgOXA/a1AlTPy1uRfoB4Rq6EH8PZWmc2DFVKsMryXVyCbLD2CFKBTH7rcg54b2Q+U4IfH2KDPQHM10y1V1FkA4avOHuhLLMDFqXIBW0MM6LJKFkFw8Q0HoEv5bBrcx0QzK6FXkLbuv/9OrJLW7C2Qp1X5MH1KvLR6eKJk1+h+LXYs5VSmAye25u9ZNbNZumRJWYWNymi4tY0DqPqGoWvFCTXamYz1zFFTPRqf3ZlDs8IRMd1p/PqsMTMtkJ2fkUUDwxk50huo65rmzCC3NNf61Jko2/MMi4V9YdYaKi6xVhWI9TvJG3LBiPVpyBtxxYj1mcgXdYsB65OCMP+CCvK/nwgl3Tv4VnOzHE1XmGbruo6pYgIlb+tbpGtFYyrHHEHGRN+Gta/3WLV9ErBFERi2mr8QBZE95Qhw7j/MYbRGVlLmJdj4t8fU19oqpmRiV9vzDahmxrsozZbS3uanU14pagK+r2Ndns1fp3HPSHU3ZvQ1ZfHp+6rYkPiqwRN8rV0m200+1kITe2cMf0v6bONijdR6sadEFAPi3JHO6Y/pa6fZP0/cZdv1dfk7wBZgp3UpvMVNFNLogHPBiDb+qP8sPesGAMna+h9FlQQkeVQmWHGkX9q5oneqV5WegFWTiYYRuyxTmkvKGZoaz2ettZoa1WS6zyqfK3tCMSshguU5QD2l9Tt24rFNNqZFTy+Gs5L+GFbvJMdFqiKCxzw35XAiDqdIXQ+5JAYcwtra/GfCvIJLbbEx9abktrQwM79r0hXhr2nIjwCHSp4M6tkIbUhvQLU7k1EZ8b9uMeDoru3KNT9OoR5a+mc/eRk5tgXyfQEkeUN2SRVXWPG9pihYDCCisKhf11qH01lldjJre5WgPQ2jrUvhaHCF5qyDOyA6S4R6kn3g+fY9oKDct7ANIK4IbXc0x6rwzqrz5RDMg0G4glRRa3tQtiMGJ5gvsWduLZ7LGOyLMDnmd+wAFwTZYdUBhhKm6qc0Dbo32LghbLx8prfYXwqtxQQfV2M7OsWihjZo51RJ4d8OxLTJgS8jrihi7jbs0eaU2WabfmgHNhXJeoK69xZgfWfbvtoR2AAP6T+C9U4y6k04y4fZpfjT86gE5jtYU6anvt06S+0w3J0Y9UI4SLByna9tqWC1o0Egt/qVBs1/8YUmY0ttZkId/Ae6kszArzgDjXxnX8E4w4iVMdC3Kiy1/zEyy1zFUmFDe+grlRBj0ZN3c4NxeaH1/h+BvhgBFncezTxQdwPSv9Ww7cTncd2VBcGQta9WXb5SRSnz4f8Gl+4Aq+os8HPL+ewneYrqhz7+9oPpwMybEDTvPMkAMfAbLEvqRxlPIVoseFsSBVO9sH4gRd10Xo0+cEntdg2qfPB7wT2CFdMHYOfsOBlwA+b/w+T/hRTJxjDQ9+xYAPfO5e7SrebMUEPMBpKThgwAc+v0mZ72xcUb94/JZ9IxZ8RIiOx9Tj2wYtCz4icPSJhhw4CcBrddCn/5VvKlVC0UcUu3H6DlHGbUu9+zGFlfUGyLXYGRf8E4zWCtJxlQnFbb0g3RqiDfitEKRbQ6p1jHAcLltFNhRXfkE6LiL16fML0vEEX9HnGKTjiZ5TD0EEz3hKwbe790JoXE2p5sA7SMdTiB4XfkE6LiL06fML0nEFz2Uw7YXQeMJvOHAM0vHF7/OED2NoXOFXDPgH6XhKwdeb7cbQeEpRM+AYpOMJn9Ns3I+g8RSgZcE1SMdThJYFzyAdTwl4+USdIBpX+CSrg6+s9pkXBv6B5CoJRXUnL7Rsh3C/sMBbRFU7VAgLOwEK5Kk7ekAWp+cYI3FCsjx4PRwVEQoUUUIWt+/DqKiQ43APJ3oYFRFyFB6LNvFo28Qra47SA2nokGM5xU7CoL80ZGiQ+GQ1NQZA/GV1NEY4fImBPioiFChslwWMigo5jsANyS669XDUVChweOSZjfpQvMX5i8ZowpRB41REyFFEMekhnR6Ohgw5kti5MBjPaioUOBKyA2N9GMmiU2FjFAmLWSahnWUIj//1QCw73IfAUOT5Y4CjoUOOhdH4wWD0YDT9M5j9i/Lh1EBqKuQ4ikrg1DhqKvM4KPLlLzhsMbFKIstzAOUs8rq0VGhXSdRAGjIU65MzYQi4B6SmQrdao4exrHQREkWxs2yTZmDpg+nQIsQE8/Ax0U6fELmGKIqJ9/sQbS3xwvzJdr4GfWjZbUvECp+4onnfXmgLmkOnxQ6P+YXByNIhRDG7UVR37aEhqOg6EYlh0ErJsqxeSBzWybt4CWGxrhGeLjW6CBE1nIoIXYSIGsXCEnaTESJ6IA0dWizMpqUROdrYFTWihgxl7IoBEH9Z4VNk7IoaRkWEMnZFD8NeVm5zInZFjaOmQh+7oofiLU+HjIxdUSOpiFChYDak9GnRxtOo4TRkKONp1EBqKnTxNHoYCaWHm7CYkxPaOZnwpF4PxLJzeAgMLDSRUmviS+ocGThrLR3qCCMLLBUdWizsfOsxPdroJzUkBvMPI9eWgWdbxC3pF4cVFcroJzWOmgqT6CfJyZMYWGl89hI7WPn4ScuYpuxMS6WIJyOJbjSyPMZKYk0dBUCTQhIlNPIRLRrfbw7nIl+Qti9c/3HYxnZ8PdcZeUb6cWbrzMfph9NAqxApXS69ls6SpgZv1ansoRj7lsq+T5A2iR5zeCOaX0sO6kOQe1kUYeWhZF434eLE1snOKG0N6L4mtGQCgK3ZSF+3a01oPyBKa3ANrYXmhgeQh71dabJzlBaBPCbNVhNj0nQ1sT2COIsmbOixaMZJsCs2Z+rD66xMGrMltfygA1JHLcH9BHnaJu3QTKJDnnLE3NJnB5raCqfQsphix7LzQtuhv7lZd5mbGCdRFjnRdf+N7RROsfwCjXDI2pHLjv1F669K1k47VylWEESJTzF0iTFHt+GVIQR6gspbstAay1zdp2lIUbUDOzgNLVo81ZLRP/iBny270zmDbkyZCuvyhN/X8C3P9T0+HcSwQX1WLUpy8OOanujPfwwGDFbAugTp2hCuH9yD5XpHdk3Zp7m1WMzZTtzPduItnGQj8NoNJljItizvvmD2qkXcF683M1ePFoVBF3Sc6JIlUbD4+s41bEOaG55cu3iX9JyB+HWXHpKjbZ2ilRnBqmndbIMBu9gZIkB1OfqnPAETcXSxIkDFSj9Hty254kSL7qo0LVNVwkGLVPejivha4QMWNVcgZBJLva6PyoIr4rdYF06oLHyRVOsY2OnZSs955kafKQKoJPY4JBFYCEhljIVVeskxfZoegCDXZOeckmTiR+6pO2/RwbbRwBRdGtXAdWaHpQ38T5P2YZmTO7sLOHojO/tgro+BKr+QzLRx4l+y4w1nVh8shxLPhsfOIJIlA0yxmdeRf1+SKAYVBNmvZnIdYl/QJadUArshgiw3lfRPEzBrWYLGREJhoNElSiT3OlLvdKKpF1weSXv2vc+009Hj/c8/3z+wmHhKStbD0xOVSZSq2bcS7kvC+z59BpmPSoJURjMDllGKpo7kHMHW9P855uepjuMHPliiWIF9SEnmVTt6Ie+1LJZnSRbAdIqHpdHewhq60u+BKLUbNyS61pSKlyLrKonECzw7vR49xCZ2cshS+E8ZSxJaoSxTkJzCWR5FpiaMNDLQKMA0rDQDS3hnZ9OaGDwaWzXSHuh3XyllX8mwH7EjGTApjJIpAbJKEhsdQid+nPq6b0XAI3VDbxe61+0HvvR6/+b1/rG0m1+g2Zz8bO96z6n1m3dIbMuObCuIHBumDowjYDHVZ7jjsu/wGRrOd2B0C3LX+2Bn55HBxkn0V8/JgBk6nyILmK+l7JSd2B5v/dF79h2vh+v+pwdZevezpOzflpQZ8Zw+yMhaqIpLMRGxoYzceWJEfBwFZ62PN+8e3z7u30SAB9smxQ+LshapYuh6h/zEgz4wy6JjuEX/KHYjeLDxQjd53ruhDf/DgT66oD0fKdj3utHNEz7A4cYfWA57SZLHXFq5NqY6hsGzpYustLzpc7KjWk+AE4/xlSLQy3AKnDxczZtHe4Cabav1b8gwoj4RuOJLnadNJ3ZoNYNMnSKa8bQyufrlpbapWAtPU+4eHufiNgJugXO2fS5TWW0Opcq4cgg8Ly5u0PKbOXNgBZw8l1oMQCCwv0xwCG0niX70jrAfAY+zXZc1a5g/SpLwk6jK2tt3irGEwv/94eHHv/zwcG/98T34ZP14/9MPv/7yZD38ZP3xhz/9aEmKIFCQe/z1w4f3D0+PllhTZEGMGNxP//He+unh/v8VS9ZnG3Q58K1sCsX/llB6/KXC9Kcf3t33qP2vv+VR9n/++PCjIhr6m/IvIsoP939GEP5BEIlovnn/7sP7P93/6cl688PTD7+8/9n68HD/CP5eQufh6cn69fHe+uHxXQ/aMtU14Wnr8f7N09v3f0KI2T40KS1wlRM7+fJTP6Sauc7vfjf7NKNoBd68RB0yQ4taRDfxHsV+EDXVIB+8RGBgRzwM55T3cdXg8I+3MEzUfrvLnV0z7xTtHhXfX3ts58R5z0ScKMm8l7siFrsOguMAwTF+Vu/SeDX2QWRnln3weyDOxZlZIgRwkQPaM7kOoH5qFyeeX8dT0LFF+OIvfpo1jGuQYLEBDNVqKaA2JL7bt4xJxIHRtfAwK0/z2OYFKgKsM9KUz1T/eXTA2iTrmce/1K6HnWcRGGv25ZNw0NsFKxkOzDZZhMhSr/hv2kOYJTkqQMcBh2tnNnMMCxrpYl8iy7HAUHorDUShn1lHsDjzwDRWrM9uBAQowntxvPiW5gAwJFnm38AQijnfzrx3dlxMqLeR34HOxsUt5o/uvGqaK/F/eZlA8LvfieI6GD7bycW/nNKdHQQ3aoYGgveSJfatQcSea18y3+k7OuUG37oNkniWlyRRkt4KCnwi9H8rdnd6GFL/N3wIof3JK2Zb4PDvgM+wy+zk5GVDDBOPjbzeuxB88z2B70uJIzvn4WGApPpuHQBD5/suBN98X7ngd66orQYE6YYDOPD7O/D994tc8hGbdnycRdQ+OjWY34Gl8PdLRvQrPGB+JWxAcTw9vpegFg3yjGGhpv674yW6K7+9GagJn6iA1v1tXduqx2RrOEne/aX4Zn118UdEpJ/xDH73l+q7G+qIK6olepqcUO/eM7HppRrijWeJbqbXpndH+Ntd+9v6iloV3BKtXY8s3B3r32+qvZuAXNQvr0cF7o7wgbvigbvmgRt019vAXKLJ7UUUGer/KxBuMgQ8/eTXIBY6tDTx2HQsmC4ETImqCH6OQp93YPHmOen38Ndd8XEtPHUMzir/tkI77iP7j4rex2/u3tnx9//yr+9/ffrw65P149uHf9v/y79+eHj/7/dvnuDO77/tipcxcZdnAnY+sJYqNj+EXJ3CjOK+V+IdE1kKT5JykCThCHf5/RC5y79wJBhpzE+nbiFMd4W70AlRgZn5946xqN3BQxB29r3veSQ04PLokPtB5l/upk5OLSKSElPBsOdZGicWgwhMMZj6cPu5MLXUl6Wy1d0MmOvFPnkulNYtNhh3p0u+6wz3B7s60N8xiw7BwdPlQztoN7soO3tJAMT6Hwu6oQVN3qW8hj700hSYxV3gXU7Z+XvUcY41rBBGQ5bYYff5fwJL/Kdqft9Odt7nuJhypqabt/cwFvG+Dm0t1he6rciwQpzwi+rESW1Wzyo82DMEfuWFyg5t1y2OPdnBr6mX3F7ExgUo8tpx8AHWsX9+HjWR1H8Jvr27OzlXlu94JMDsAWN2d8nnF0DrFHqXjI/w06skIvlfwB8NybvPfna+K9aWt/FhKvd+ZuZYSs7xEycP7MT1Yu/iehfnC/lG7XakuoBhwB2tyZZtsZLN8Oj+R0PrK2mi9tl6kgjcY2CfCKYFroMGVVNgum1dLdxIB9/VR/Obb7757g8vYQB5lIlpARdxJxTSAJuKXP9yAl/9+vTTHVh6/6ElVK/l2/RQzi6M3ByMu6mX5fHuTXHf4kP52AfQ8/5Y6K97lHhXnOYFJACx2EuyL48O+O/3RdLyMlAwlCkGbxXt8Jh58e+BNL2/byCl6x3tPMgevSwrjnEsE2/PHyBlA6yAMHcqjJS2McpcUYb/pjpZ/6r/zklgsSd4wRl+LDhXa9tmMAVf1VE0d3qEHWYWWNEY7dh2PlmH7E0pxw3VCW88Wu5hR6HIq3TPDBuo+hrnPlOjg/2V5n317avHt+8+/PL2zdun/7Qen3798e1768PD+w/3D09v7x9fvX7194+vum3z8dXrj+C7j4Cf/eyBoSxyPv3ZTnwbOJgp/Po1/Ac+AP8HZpbYB0+5n36BNIoJovzhdf1hcEOj/vrb+gO83vc+Hr83EXGtfv1H+Q8g8+rHctT7yoD/A7RMiQGeQk1BQ/zX36s8NNBiAL3CFfy26RSFLUAZy4Fhf8jgh31hhL1kCLvyl0I3UeKffLAEbl4uvq26OvhC/Lagl4FZG/4lCbokSIIs/ePbARhovtNY4H1mL4ySL/WodSbgbiqGoCimYBIwn7pMTYPnTpJUw5Q03VgOqJPLwXId16HCYSqSqAAcBIrp4giOLxENDmAXii6Cf5ZaR5lzgkoFoqAbqiAIkryQd3VtlI65KRuyZIricv33075TgdBMTZRUQVuqAYCiVkLZJbyXmAaJLommqIFhYjmObmoAup4p6LKhqKpC0CRFHheYK4YGgSxrmgbGB4GuS3phToNCkRRZExVdXY6iU12KAoCoG4ouq7Ku0enhTDk03ZmyogqGuHSkbvNCUWlBVWTFUMylPaLINQMYJ15llHQYJFOVTUUnsIXm+j7dCKXIpqYqGr73UJ+JgANlnXsBeunLpRdMXRcNU8HuCUjWJGIbiiCopoE9EHQZF5NDtWhv6pYsH4skMDEoprpY9oene+tNFMbRBQZtyCYDoHIwGyjYrklH/M4Q5KcJkejAL5A00O01A3sA6gCop0VizRu6rpumIJIYfMscHtN3PDL9A7dAVQEGTRy3wNT6wQ/tk1el+bP88CTs4suJhLemK6KsgaGXmLVIyBqMtQJYK6hjXwiXs0TKWZTBOCNRyCyTqlvUDFVWJUMZz3JTvMlyMT5GedLkjbGa5SxRF9EERTYMQxz3Tz6YM9Ct8pgS9J2hqcCx0WV8+6LKerlHhwzIRgRDEiVRVhHTAWfslu2EMeHK0jSBXYNV7vqYiQdeQRM1URdk3r1xjPmQJ3ZI5iUqEvAUDFnl3R2RoDOH1KJ14NwbiEUGb9BOmBNCVhUDLFIR60PekGG0idSV0Azd1A3tBqDB45djRGbTpmKKwBngPsUgYIc2gJ4Wh72jhAi9Zqq6oJvi+qO1GwcBYfRFFBUduNzm+qA90g5pAuNWNEVf37a9spo7UXxHNwxTBu796qCPaeKQdcc7xRAV1dCN1X0n6xQ7CenYJ8kmWMtpNxj7ilqgRAOfIciaIIry+uYBMVtxRGjWd7og6Yqg36Azno/Edi1roqCC5fZ4sc8f9AshZlEGqwFdlRGBUd6gfYmsK8qmIYBFLiKmzR2xTeg56ZoEnD1ZHm9GcIfs2M7ZI9OzYpgSWCWu7zV98r6kjn0hdPYMRTHB+LG+QQfA2yPshcBZEoBjra5vIBD0y8Em803vZEWUNLhivBluGB33L4RrdNHUwZBtGDcIKwResZ9C5vUBzKoh3WBaD8hnR0VWFEED5nID0MSzo6LLYEABZrI66ND2g0P0QmbWGjBpWRURO/DcYcf2+UAafALzjaRIwLTXh52STewArQ48PsSuInfEz2SR1DsJLL+Av2eu71rHzoVwOQCmdEMQdXH9FWOcEEZ/TUkzFNFAbPuuANlK/ROASgjdAHOiJMo3CJelDuDknGPbJT31o5omXPOuP4KkHs2ILYMlmKDJ8vrjSEoaLxN1XQcjiYE49MYdM1geHAmPkIqCKIHF2A0M5EtKur8hwt0NVRHM9cc/cif1zlBNWdEEaX3fOqdwU+EpSk1QVWn9gZs8DHwnGoosCyZwV1dH/ezahFYtG9CzvoF9fHYj0jN0hiiBSV1bbcwLq1OQZGEn2VQU2UAcC+eDdnQehHBiEcG8AkYOBrDbMoDwRJWdRaFPGv8HDQ9cfWXBMSpMVN4lJ1su6ZpuCIImMPDTBnoqDrySHoUXASJDZBGe7aMq/yINCoLRRgArNdagYEGYnDD4JMmSJqkii3M4dTmypNt+ZOclNUEUYPSAwbDcRwW9NjsAixISXBJwJMAKEHHThhRVkxekxlfeTyJCpyuSrqq6xgNdXQ2yvD2VeCeftBMoAkDI5HDgdZCE8UEwcGiSbrCzuxG8cTbA5XYo6KBrgCUEg2lgXAl574Spn1pNohqiZoaBElETWSzfJxFWzEmnCE0E05bMwsVGIMx+K65TeS+kM5immjrwpDUG0dNJBcJkDUTrV01VNUlmcbAGhQ3eNHFCWSbUHBgCwRpEMhiEyxHowji37CR8Jjz2KoL1qGroMosdiF7F72r+aK6NkU1wwEERBd00GFjdsB55Hx1RfMrUVUFhcsByopj58MKXE0TOJ9KTt9CJUXSFxX47JlzyQ5WyqBu6ILOI7WBiJT4iB9QqGKapsNg7wMRKfLJF1AVTMUxVWM8GiPcZFd2QVBl1OZEX1Msz8TpYVwRVVRUWbiQKbDOYDq7HpxLZ7RJJN6FuGcyXmGjhjV1CsIamKoams9htxgRbXKslRCsBLxh4w5rJqYch4AYUcMH8qmmGKbDYG8KEW/QystuqoiyrwI1n4AzUWIH31Kx045zsHqmqAf9EZRHa6aKqF48x6bQExqTiqj3DaSmxQ6uoUZDkcQaWOw7MftNt58kHyBoc3pKXFY3FAbB5ESqFT4tA0gyaosiKrrNYNQ3q0rfxIxhdJtbxHTwIreuihEiQwRYioOJ4aWrZRcZRwhFAEDVNFhdcYMXFWkcuO+okCycZoiwCk2U4GiARDrRJ5GAZYGoFwwTD3tWmRGgav/mGqMUV2ZBkXWDa4FcwWmc7qPekyXqTaZqqqYmIi/X8AJd3BIk6lKmA6dREpJ7gh5bcGIB2FUHQ4WVMjnj9AWDSy16yLGqywOIQHAJqPRi0vYvMSZBhGhyVxc7tJEifFqUpwrCjwuIYUA0yd73A/lIbaPkX2fgE1qfQR+ELrQjwaWERH30kWZSYKrzCzDJQVcGs7LDSIJENqoosS6rIYgzyQjd5rvKmFRosP5INNqqga6Yqsbjp0cMFVVbhIuuzhi7pYBnEIjZWAuts3npORLgHBG95KQIMw7OCBW/LNZ540Zy9bwjXu4JuyLrK4hA4CiXUYR8lkS5V2YQ7p6wwVklzCh1WnwkXZMDuYAYZZtqrkUG91ciI5ghdNxRFNxkMxEV6sUJVwM0md63uVHjJVFRZeII9SDC5Apn3JJkwNwvQE2tEUeIRup+GCkxKY3HwtIfII9WRKqiSpukSA1+jD6g8xkg2ZGmmrppL8kXhYSpuUBMhUjTQZKLE4kpKD1FxV5Co3SQwKCm6wF5J8A4MWXY5UwJzDYvNth4eePWCsPfDVEG6yOKoXg9RGZAgC5YLCrwoKWkMYvs9TBRrTOiJylBRjCGRDwBwj14RgJ5YhHJLTIWrF1IkF4KZE0VNUXVm/a2C5Jx9witcoqKohsJkd6CPiDh3iq6p8IglM0tqARWHoWxC51ITDENSTXajd73Op1BWES6B2WBZtx7NqV1dMyRJMZg34IHwbOydDpdYpsziNGDfoigOEavAE5BljcX5oR6mxA5hkXHSw3SGpilw84UxKpojfpJgSIamyixuPw6aLyFbs9+JYMVkiILC4ozuCJJVkCM8UgEvlciCyuSSeQ8Z+TkfXRIFmKCJmQNVI6K54gT8J0OXZIMPKJp55g5mu1c1QzBYj5/EqZ/gGThDAEOowHoEJc5yIuqKDpwplbWZk97dvwMGLqgyk1vlQ0BU1mSYoqCLBvN5hvQuuyjBI39ghGI9dFLc4wUrBVk2NXhnmj0ouMgjdMwlUxNllcVxMwQoqmnmDqz1TKA1gTU2mk05Q9EluN/F2k8gn2dMU5JVYO4MbD0GbRWfwftBsTJu/6TZd4dlHDRZN1gEWzsAod7GAMmGVR0eEWZyfXMOIO0wq8FDAeT9wY7jekcpz/ygUyyk85H4TJsu6aYokXsUV9DBO4K0AAUFLM8EgSL1KATYlNaoocIKQLBiWV0NCH4miyXpArxdSbOmxQdIFjURDdOQNYrJYhJgXUNpWFOJNKBq6CLwAHiochIp0bpTUyVFNyk7zQhnW4dkUJWEJtIJXDwwRlLcI1wGNYkOeUp8J1hTdVGVKC7sLQJLljxMMgXdoDiMTqRPEqTwyLypazTBtiTKIicKOnirUzSHrO1FduyTuRiSJJmyrtLsVeIAJLvQARw0XdNoMjaOsVVnew4nqDKiJZKiqbIGFEexGpmGVTYlkanJmiYAL5vCF5uBVblg/sEP/IzwXJQkiAJwdWSBIjRwDWb2JSZMECqLoqbrAqKKIDUwn6Zd7xRJMRWaHA3X9EV1u7vIc6yCJQDFAuUauGb0INt8ERQV4ENU4mPToNAbdA8wKS1xmFo0VIHi4MrZTtzPduLti+JxzbBbVJIjvzshm7IpyhKieCALXJARLH9KfE7jTpQ1eNSNIgA7wFcbXBcfcfJKXQGzKfkYfA0a8f0NWZVg8QiVAazqvrnTrTFtReAreN+8bmknIj3OIYCJQVIMcm8EE2iTZ4j02jnQpqiZBkWWoSFSRNnq5hLfVEXriR8J+70EM0xReFs4EtUXAJdKRNJKCpg1YSthC1TW5duFLmGAU5BMXRawazLXBSCLqu3ugfDymKRqsqThV4IeciXygQ3TNAQRdeB4vtil9wyIWGf74pLmvVENQ4aZjUnqfPrAnwDtHFYAyPq/JGiiIaKSbhMAIOqsCty1FWRESG4BguLmMl3NUc2UFEExEXdtrlcafrz/+ef7B+vh6cl6A74h3Sc2Td3QNZrFxPAKSK2ceuyt/yac0BTRkBUTVYuYOUIrIQyfwix+qg5TcnEAWQ34jRqJhhtdEVWJaS6SKXyFEokwaqqowoML5CCL0H129oGrF4Op8AsAezrBG3zFjuCz732uuk2n9xCeUAXrDlmhCWEsxUp4XAbO4GB0Ie/fRDolwgrcVlMWFYpI2ghrnPiX7Fj088Y+y+9Ib5qCGVtWaQ77TGGE3WiIkUiNMuhBuqIg5nZaiFSaU4qy6jRhqxlYRG4I3B+GOaUWTr4wd0nhosPSElb5JWleZ80UVJVFXhgYXMyzdvHwHDfLn+eYLFUn8BNVWWJxdvoqOJi24AQzbIC1D9lND7jJr8gKi5Qg15FCIyS8i6JLsLg8Cx/hOkR4m75IK024HpLBsk+VGWXaHeKsl6+kFVnApGsqos4ip+NVdH2TJHOuVUmCFdYYOF3XoZKH7EVN0cGYzCLv23WIRbch1KIsSJquszgmdh0jeVIHQQSDuCmxuHpdQwztNpAPP9M0MnD/RF03WRww78GrxxwID/yT+C+kQUt4DNBUGaUzRuuvAkhmg4ppwHyOFD4VGmB35C5A0swwEtxzUIEdsklafR0lfCDwXiq1WmEeEG6WGPD8mybLrI3zGugqfRdA8df8BLiR3r8DLq0B4+3rQ3ejDM5Qbu6QqR3eWRBFk8nRzaXYyW1FVMC625BZFMNeDNo+Xfwsdz0r/VsOfAKX8LSIqimiqrK42TorQdU1bZcMq6HrogkWSAzn3TmoaU4Ww5dFAZ70ZejFzCGlsGHDkMFKQGdx/QUXLXXHM03oyOqM6pTg2YJjB2QDsw46mCDpLC7z4ILNEvuSxlFKOJMYmmCqCmoLij3iyhbsA+G+iaxKcPOIRRYabKyEI5gI14nAaWORIgwXqxPYIVmwxZAUUxIkliGMebA+GVYYypM0RWZUdgoPbBSTJWMDQ66gG4Yky2s4O4wcNF2FCdBUbcVudvQDsoWHCFwaQTUNfQ0fnnouAwOYIIApYsVB4eIRrzIk6PNKMJf0enCj4zH1CLUrKTKYec1V1kQVXHJP4U4UBJjZSaI5f7kYLqGTC2+aa4phaiwDig3YXqiENDgraoak6wrN8TNshDQhRUk0dFigkMcQMISJCpSQnZgBXpepSauCHgVKyOKPggSztbO4zL4UeXcaJrMVA16cNrjMwzPYyU0FGDhwzjQu8/Ec6FGchEQCU1LAGplJUrJZATphEiLrFuABfkNikWoDFyucQkiw6rohiSaTdJi4UImN+E4FRqxB72c9sPQdT1RhDkQWlaWxbaHwfkjQwko/OkwZvB7YNk5CpF6wgoP3xtaYATthErKNVVWQYQR1RaiEA9gdWGLoYII2WO6pz4EtwyRk460mgHWxwfJQyjxawuyDIty91jWTRX1RbLAwTkICVtNVU9BMeQ03jZl7ZmrAS1BM5lvvV0AXcRLC9ZEmq8AvY1RWGAst+QSsaWC5ISssqmrggq0CJWTrI00zDFHjEpiegFsFSkjgGroC99e4hKYn0JJ7CvBek6YaBstzQrNoCX3cO7Dw0YDXiDgvNHOxI/Avn7wE9G5vF5BdYFLAOlFXRdpT4akf+ICsFQDvY29HL00NsiyAU9GB/Ca0KAq6oqo0dajQCGE6qcQLPDv19ifH2dtJaIWyvK+ScMHfwWNWmtmZ7+xsoiCzLJm6ILEpCNLJwGw7hBs2ogn3x4G7zzorvHs4keYegUeJNSZ7y4Oc8E5CloILXrESdBFxp48OkS8R1l+QwECmSUym4D4g2yVEpIiGopo6uxSGddp8jzzfOTzxBlZbksg6BXsUk+6PqsAXEURG9W26qfOdC3GqH3iACkBi3XIJaZ0KRZQ1xZDZZcetk/kTFvIQTMNQTIVdGsUKz7Nrk1bik2UFjEkGu6T5FaTPbkQ2amsCTAYvMc/eXcxrRHEhQzQE1WA30VaA4LRGFAwWTd2QJJU1nnJSI1zWC7LAPBcunNOI3DpdMkWFfR2IYkojXOgqiiyqksg6x3M9pxHu5YgCQCbprLNil5Ma4V6kaZiSzKQybD+BMZzWyOKBAvCzVV1icSm8n7ufMMe6Kutg6jcpko9OJAomTY+vwOOmhsYiqtcHRKggUVN1HeZSZm3YxTxLqCPFVBWqlDloSMU8S6QkRdZNQ0XEMOYTPsCgRXSBWTccO7MDQgQSGH7AKI2I+cwjcD14675MOOEEkfOJNEGQCTMq6gZiibg08QhZ1TJJFjQwN4znqhn2OzBZ1zdtwUci2YFBqpouIQ7QzF/37ejfjYOA5tKvIsICoiKLw5N1NoYOvDpaNERMev1OMYHZmiyWFCiw1SGpkXpTsturYD5VBEVSVLBw/e9X//j/EgNTzQ===END_SIMPLICITY_STUDIO_METADATA
