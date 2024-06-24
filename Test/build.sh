CC="../toolchain/bin/xtensa-esp32-elf-gcc"
SRC=("../main.c"
	"../Cstartup.s"
	"../gpio/*.c") 
CFLAGS="-I ../gpio/include -g -Wall"

mkdir -p bin 
pushd bin 
$CC -o program $SRC $CFLAGS
popd
