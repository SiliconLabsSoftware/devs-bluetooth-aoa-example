add_library(drivers OBJECT
  sl_timer.c
  sl_watchdog.c
)
target_link_libraries(drivers PRIVATE slc_locator_host)
target_include_directories(drivers PRIVATE ../.)
target_include_directories(drivers PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
