#include "pico/stdlib.h"
#include "library-template.h"

int example(int a) {
#ifndef PICO_DEFAULT_LED_PIN
#else
	const uint LED_PIN = PICO_DEFAULT_LED_PIN;
	gpio_init(LED_PIN);
	gpio_set_dir(LED_PIN, GPIO_OUT);
	
	gpio_put(LED_PIN, 1);
	sleep_ms(a);
	gpio_put(LED_PIN, 0);
	sleep_ms(a);
#endif
}

