# Specify the cross-compiling toolchain
SET(CMAKE_SYSTEM_NAME Generic)
SET(CMAKE_SYSTEM_PROCESSOR xtensa)

# Specify the cross compiler
SET(ESP32_TOOLCHAIN_PATH ${CMAKE_CURRENT_LIST_DIR}/bin)
SET(CMAKE_C_COMPILER ${ESP32_TOOLCHAIN_PATH}/xtensa-esp32-elf-gcc)
SET(CMAKE_CXX_COMPILER ${ESP32_TOOLCHAIN_PATH}/xtensa-esp32-elf-g++)

# Compiler flags for the target system
SET(CMAKE_C_FLAGS "-O0 -g")
SET(CMAKE_CXX_FLAGS "-O0 -g")

# Linker settings
SET(CMAKE_EXE_LINKER_FLAGS "-nostdlib")
