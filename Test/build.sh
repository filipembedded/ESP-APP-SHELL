CC="../toolchain/bin/xtensa-esp32-elf-gcc"

SRC=("../main.c"
	 "../Cstartup.s"
	 "../gpio/*.c"
     "../soc/esp32/*.c"
     "../hal/*.c"
     "../hal/esp32/*.c")

CFLAGS=("-I ../gpio/include"
        "-I ../soc/esp32/include"
        "-I ../soc/include"
        "-I ../soc/linux/include"
        "-I ../hal/include"
        "-I ../hal/esp32/include"
        "-I ../hal/platform_port/include"
        "-g -Wall")

mkdir -p bin 
pushd bin 
$CC -o program $SRC $CFLAGS
popd
