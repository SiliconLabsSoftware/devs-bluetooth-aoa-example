# Define minimal required version of CMake.
cmake_minimum_required(VERSION "3.25")

# Project definition
project(
	locator_ncp
	VERSION 1.0
	LANGUAGES C CXX ASM
)

# Include the definition of the slc_locator_ncp target,
# which contains the content of the SLC project
include(locator_ncp.cmake)

add_executable(locator_ncp
    # Add additional sources here
)

target_include_directories(locator_ncp PUBLIC
    # Add additional include paths here
)

target_compile_definitions(locator_ncp PUBLIC
    # Add additional macros here
)

target_compile_options(locator_ncp PUBLIC
    # Set additional compiler flags here
)

target_link_options(locator_ncp PUBLIC
    # Set additional linker flags here
)

# Link with the content defined in the SLC project
target_link_libraries(locator_ncp PRIVATE
    slc_locator_ncp
)

# Create .bin, .hex and .s37 artifacts after building the project
add_custom_command(TARGET locator_ncp
    POST_BUILD
    COMMAND ${CMAKE_OBJCOPY} -O srec "$<TARGET_FILE:locator_ncp>" "$<TARGET_FILE_DIR:locator_ncp>/$<TARGET_FILE_BASE_NAME:locator_ncp>.s37"
    COMMAND ${CMAKE_OBJCOPY} -O ihex "$<TARGET_FILE:locator_ncp>" "$<TARGET_FILE_DIR:locator_ncp>/$<TARGET_FILE_BASE_NAME:locator_ncp>.hex"
    COMMAND ${CMAKE_OBJCOPY} -O binary "$<TARGET_FILE:locator_ncp>" "$<TARGET_FILE_DIR:locator_ncp>/$<TARGET_FILE_BASE_NAME:locator_ncp>.bin"
	COMMAND ${CMAKE_SIZE_UTIL} "$<TARGET_FILE:locator_ncp>" -A
)
