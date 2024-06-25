#include <stdlib.h>
#include <string.h>

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

/* IRAM_ATTR for interrupt functions */

int __attribute__((noreturn)) main() {

  while(1) {


  }
}