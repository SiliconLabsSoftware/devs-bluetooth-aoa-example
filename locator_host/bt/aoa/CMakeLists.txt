add_library(bt_aoa OBJECT
  sl_bt_aoa.c
  #Add the GSDK sources here directly because directories copied from GSDK directly (no place for the CMakeLists.txt file there might be overwritten)
  antenna_array/antenna_array.c
  aoa_angle/aoa_angle.c
  aoa_cte/aoa_cte.c
  aoa_cte/cte_conn_less.c
  aoa_cte/cte_conn.c
  aoa_cte/cte_silabs.c
  aoa_db/aoa_db.c
  aoa_util/aoa_util.c
  ncp_evt_filter/sl_ncp_evt_filter.c
)
target_link_libraries(bt_aoa PRIVATE drivers slc_locator_host)
target_compile_definitions(bt_aoa PRIVATE
  _POSIX_C_SOURCE=200809 #needed to avoid warning for strtok_r usage
)
target_include_directories(bt_aoa PRIVATE
  ../../. #System configuration
  antenna_array
  aoa_angle
  aoa_angle/config
  aoa_cte
  aoa_cte/config
  aoa_db
  aoa_util
  config
  ncp_evt_filter
  ncp_evt_filter/config
)
target_include_directories(bt_aoa PUBLIC
  ${CMAKE_CURRENT_SOURCE_DIR}
)
