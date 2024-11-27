add_subdirectory(aoa)

add_library(bt)
target_link_libraries(bt PRIVATE bt_aoa)
target_include_directories(bt PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/aoa)
