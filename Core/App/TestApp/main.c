#include <stdlib.h>
#include <string.h>
#include "ll/gpio_ll.h"

int main();

extern int _bss_start;
extern int _bss_end;
extern int _rtc_bss_start;
extern int _rtc_bss_end;
extern int _init_start;

/* CPU0 entry point (PRO CPU) */
void __attribute__((noreturn)) call_start_cpu0(void){
  //cpu_hal_set_vecbase(&_init_start);
  memset(&_bss_start, 0, (&_bss_end - &_bss_start) * sizeof(_bss_start));
 // esp_config_instruction_cache_mode();
  (void) main();
}

/* CPU1 entry point (APP CPU) */
void __attribute__((noreturn)) call_start_cpu1(void){

  while(1) 
  {

  }
}

gpio_dev_t dev;

/* IRAM_ATTR for interrupt functions */

int __attribute__((noreturn)) main() {

  gpio_ll_output_enable(&dev, GPIO_NUM_2);
  gpio_ll_iomux_func_sel(GPIO_NUM_2, FUNC_GPIO2_GPIO2);


  while(1) {
    for (volatile int i = 0; i < 100000; i++);
    gpio_ll_set_level(&dev, GPIO_NUM_2, 1);
    for (volatile int i = 0; i < 100000; i++);
    gpio_ll_set_level(&dev, GPIO_NUM_2, 0);
  }
}