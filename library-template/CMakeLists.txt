cmake_minimum_required(VERSION 3.13)

# Pull in SDK (must be before project)
include($ENV{PICO_SDK_PATH}/pico_sdk_init.cmake)

if (PICO_SDK_VERSION_STRING VERSION_LESS "1.3.0")
    message(FATAL_ERROR "Raspberry Pi Pico SDK version 1.3.0 (or later) required. Your version is ${PICO_SDK_VERSION_STRING}")
endif()

project($ENV{PROJECT_NAME} C CXX ASM)

# Initialize the SDK
pico_sdk_init()

set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)

add_compile_options(
    -Wall
    -Wno-format          # int != int32_t as far as the compiler is concerned because gcc has int32_t as long int
    -Wno-unused-function # we have some for the docs that aren't called
    -Wno-maybe-uninitialized
)

###############################################################################


add_executable($ENV{PROJECT_NAME}
    demo.c
)

add_subdirectory($ENV{LIBRARY_NAME})
include_directories($ENV{LIBRARY_NAME})

target_link_libraries($ENV{PROJECT_NAME}
    $ENV{LIBRARY_NAME}
	pico_stdlib
)

