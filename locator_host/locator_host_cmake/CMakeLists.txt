# Define minimal required version of CMake.
cmake_minimum_required(VERSION "3.25")

# Project definition
project(
	locator_host
	VERSION 1.0
	LANGUAGES C CXX ASM
)

# Include the definition of the slc_locator_host target,
# which contains the content of the SLC project
include(locator_host.cmake)

add_executable(locator_host
   ../app.c
   ../main.c
)

add_subdirectory(../bt ${CMAKE_CURRENT_BINARY_DIR}/bt)
add_subdirectory(../drivers ${CMAKE_CURRENT_BINARY_DIR}/drivers)

# Link with the content defined in the SLC project
target_link_libraries(locator_host PRIVATE
    bt
    drivers
    slc_locator_host
)

# Include managed project content if available
include(locator_host_project.cmake OPTIONAL RESULT_VARIABLE managed_project)
if(managed_project)
    message(STATUS "Using managed project content from ${managed_project}")
endif()

# Force the gcc linker command
set_target_properties(locator_host PROPERTIES LINKER_LANGUAGE C)

# Create .bin, .hex and .s37 artifacts after building the project
add_custom_command(TARGET locator_host
    POST_BUILD
    COMMAND ${CMAKE_OBJCOPY} -O srec "$<TARGET_FILE:locator_host>" "$<TARGET_FILE_DIR:locator_host>/$<TARGET_FILE_BASE_NAME:locator_host>.s37"
    COMMAND ${CMAKE_OBJCOPY} -O ihex "$<TARGET_FILE:locator_host>" "$<TARGET_FILE_DIR:locator_host>/$<TARGET_FILE_BASE_NAME:locator_host>.hex"
    COMMAND ${CMAKE_OBJCOPY} -O binary "$<TARGET_FILE:locator_host>" "$<TARGET_FILE_DIR:locator_host>/$<TARGET_FILE_BASE_NAME:locator_host>.bin"
    COMMAND ${CMAKE_SIZE_UTIL} "$<TARGET_FILE:locator_host>" -A
)

# Run post-build pipeline to perform additional post-processing
if(post_build_command)
add_custom_command(TARGET locator_host
    POST_BUILD
    WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/..
    COMMAND ${post_build_command}
)
endif()
