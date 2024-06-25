set(TARGET_NAME hal)

set(SRC
  # soc	
  soc/src/adc_periph.c
  soc/src/dac_periph.c
  soc/src/gpio_periph.c
  soc/src/dport_access.c
  soc/src/i2c_periph.c
  soc/src/i2s_periph.c
  soc/src/interrupts.c
  soc/src/lcd_periph.c
  soc/src/ledc_periph.c
  soc/src/mcpwm_periph.c
  soc/src/mpi_periph.c
  soc/src/pcnt_periph.c
  soc/src/rmt_periph.c
  soc/src/rtc_io_periph.c
  soc/src/sdio_slave_periph.c
  soc/src/sdmmc_periph.c
  soc/src/sdm_periph.c
  soc/src/spi_periph.c
  soc/src/timer_periph.c
  soc/src/touch_sensor_periph.c
  soc/src/twai_periph.c
  soc/src/uart_periph.c

  #hal
  # hal/src/gpio.c
)

set(INCLUDE_DIRS
  ll/include
  soc/include
  hal-util/include
  hal/include
)

add_library(${TARGET_NAME} STATIC ${SRC})
target_include_directories(${TARGET_NAME}
  PUBLIC ${INCLUDE_DIRS})

