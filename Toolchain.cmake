# setup toolchains

if (BUILD_PSP2)
    set(CMAKE_SYSTEM_NAME "Generic")
    if (NOT DEFINED CMAKE_TOOLCHAIN_FILE)
        if (DEFINED ENV{VITASDK})
            set(CMAKE_TOOLCHAIN_FILE "$ENV{VITASDK}/share/vita.toolchain.cmake" CACHE PATH "toolchain file")
        else ()
            message(FATAL_ERROR "Please define VITASDK to point to your SDK path!")
        endif ()
    endif ()
    include("$ENV{VITASDK}/share/vita.cmake" REQUIRED)
endif (BUILD_PSP2)

if (BUILD_PS3)
    set(CMAKE_SYSTEM_NAME "Generic")
    set(PSL1GHT $ENV{PSL1GHT})
    set(CMAKE_SYSTEM_PROCESSOR "powerpc64")
    set(CMAKE_C_COMPILER "${PSL1GHT}/ppu/bin/powerpc64-ps3-elf-gcc")
    set(CMAKE_CXX_COMPILER "${PSL1GHT}/ppu/bin/powerpc64-ps3-elf-g++")
    set(CMAKE_ASM_COMPILER "${PSL1GHT}/ppu/bin/powerpc64-ps3-elf-gcc")
    set(CMAKE_C_FLAGS "-mcpu=cell -I${PSL1GHT}/ppu/include -I${PSL1GHT}/portlibs/ppu/include" CACHE STRING "C flags")
    set(CMAKE_CXX_FLAGS "${CMAKE_C_FLAGS} -std=gnu++11 -fpermissive" CACHE STRING "C++ flags")
endif (BUILD_PS3)

if (BUILD_3DS)
    set(CMAKE_SYSTEM_NAME "Generic")
    set(DEVKITPRO $ENV{DEVKITPRO})
    set(CMAKE_SYSTEM_PROCESSOR "armv6k")
    set(CMAKE_C_COMPILER "${DEVKITPRO}/devkitARM/bin/arm-none-eabi-gcc")
    set(CMAKE_CXX_COMPILER "${DEVKITPRO}/devkitARM/bin/arm-none-eabi-g++")
    set(CMAKE_ASM_COMPILER "${DEVKITPRO}/devkitARM/bin/arm-none-eabi-as")
    set(CMAKE_AR "${DEVKITPRO}/devkitARM/bin/arm-none-eabi-gcc-ar" CACHE STRING "")
    set(CMAKE_RANLIB "${DEVKITPRO}/devkitARM/bin/arm-none-eabi-gcc-ranlib" CACHE STRING "")
    set(CMAKE_C_FLAGS "-march=armv6k -mtune=mpcore -mfloat-abi=hard -mtp=soft -mword-relocations" CACHE STRING "C flags")
    set(CMAKE_CXX_FLAGS "${CMAKE_C_FLAGS} -fpermissive -std=gnu++11 -fno-rtti -fno-exceptions" CACHE STRING "C++ flags")
    set(CMAKE_FIND_ROOT_PATH ${DEVKITPRO} ${DEVKITPRO}/devkitARM ${DEVKITPRO}/libctru ${DEVKITPRO}/portlibs/3ds ${DEVKITPRO}/portlibs/armv6k)
    set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
    set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
    set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
    set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
    set(BUILD_SHARED_LIBS OFF CACHE INTERNAL "Shared libs not available")
    include(source/3ds/cmake/Tools3DS.cmake)
endif (BUILD_3DS)

if (BUILD_NX)
    set(CMAKE_SYSTEM_NAME "Generic")
    set(DEVKITPRO $ENV{DEVKITPRO})
    set(CMAKE_SYSTEM_PROCESSOR "armv8-a")
    set(CMAKE_C_COMPILER "${DEVKITPRO}/devkitA64/bin/aarch64-none-elf-gcc")
    set(CMAKE_CXX_COMPILER "${DEVKITPRO}/devkitA64/bin/aarch64-none-elf-g++")
    set(CMAKE_ASM_COMPILER "${DEVKITPRO}/devkitA64/bin/aarch64-none-elf-as")
    set(CMAKE_AR "${DEVKITPRO}/devkitA64/bin/aarch64-none-elf-gcc-ar" CACHE STRING "")
    set(CMAKE_RANLIB "${DEVKITPRO}/devkitA64/bin/aarch64-none-elf-gcc-ranlib" CACHE STRING "")
    set(CMAKE_C_FLAGS "-march=armv8-a -mtune=cortex-a57 -mtp=soft -fPIE -ffast-math -ffunction-sections -fdata-sections -I${DEVKITPRO}/libnx/include -I${DEVKITPRO}/portlibs/switch/include" CACHE STRING "C flags")
    set(CMAKE_CXX_FLAGS "${CMAKE_C_FLAGS} -fpermissive -fno-rtti -fno-exceptions -std=gnu++11" CACHE STRING "C++ flags")
    set(CMAKE_FIND_ROOT_PATH ${DEVKITPRO} ${DEVKITPRO}/devkitA64 ${DEVKITPRO}/libnx ${DEVKITPRO}/portlibs/switch)
    set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
    set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
    set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
    set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
    set(BUILD_SHARED_LIBS OFF CACHE INTERNAL "Shared libs not available")
    link_directories(${DEVKITPRO}/libnx/lib ${DEVKITPRO}/portlibs/switch/lib)
endif (BUILD_NX)

if (BUILD_RPI)
    set(CMAKE_SYSTEM_NAME "Generic")
    set(RPISDK "/usr/local/rpi-tools")
    set(CMAKE_SYSTEM_PROCESSOR "armv7-a")
    set(CMAKE_C_COMPILER "${RPISDK}/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian/bin/arm-linux-gnueabihf-gcc")
    set(CMAKE_CXX_COMPILER "${RPISDK}/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian/bin/arm-linux-gnueabihf-g++")
    set(CMAKE_ASM_COMPILER "${RPISDK}/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian/bin/arm-linux-gnueabihf-g++")
    set(CMAKE_C_FLAGS "-I${RPISDK}/sysroot/include" CACHE STRING "C flags")
endif (BUILD_RPI)
