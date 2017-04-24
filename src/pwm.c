#ifndef F_CPU
#define F_CPU 1200000UL
#endif

#include <stdbool.h> 
#include <avr/io.h>
#include <avr/power.h>
#include <avr/interrupt.h>
#include <util/delay.h>                // for _delay_ms()
//#include <math.h>
#include <stdint.h>

#include "pwm.h"
//#include <math.h>



// Check that the PORTB/DDRB/PINB constants are all identical
#if PB0 != DDB0 || PB0 != PINB0
#error "IO bits mismatch"
#endif

inline void set_led_on(void)
{
  PORTB |= (1 << PIN_LED);
}

inline void set_led_off(void)
{
  PORTB &= ~(1 << PIN_LED);
}

void setup_pins() {
  // Initialize all pins as input
  DDRB  = 0x00;
  PORTB = 0x00;

  // Set the output pins, off
  DDRB |= (1 << PIN_PWM_OUT) | (1 << PIN_LED);
  //PORTB &= ~(1 << PB(PIN_PWM_OUT)) | (1 << PB(PIN_LED));

  // Set the input PWM pin  
  // (Automatic after above initialization)
  //DDRB &= ~(1 << DDB(PIN_PWM_IN));
  //PORTB &= ~(1 << PB(PIN_PWM_IN));

  // Set the pullup input pins
  //DDRB  &= ~((1 << PB(PIN_ROT_SW)) | (1 << PB(PIN_ROT_A)) | (1 << PB(PIN_ROT_B)));
  PORTB |= (1 << PIN_ROT_SW) | (1 << PIN_ROT_A) | (1 << PIN_ROT_B);

}

void adc_setup(void)
{
#if ADC_SW != ADC0
#warning "Setting up for ADC0"
#endif
  // ADC0, Vcc reference, and Left-aligned
  ADMUX =  (1 << ADLAR);
  // Set the ADC prescalers
#if F_CPU != 1200000UL
  #warning "CPU Scale changes require adjustment to ADC rate"
#endif
  // Clock div/2 |= 500khz. Above recommended for 10-bit, but we only care about 8
  ADCSRA &= ~((1 << ADPS1) | (1 << ADPS0) | (1 << ADPS2));
  // Read time approx. 50 uS
}


// Read the duty cycle of a PWM signal
uint8_t read_duty_cycle()
{
  // Switch to 8MHZ to capture small steps
  cli();
  // Set the timer prescaler to /8 to keep any same PWM
  TCCR0B = (TCCR0B & (1<< WGM02)) | (1<<CS01);
  clock_prescale_set(clock_div_1);

  uint32_t result = read_cycle_ASM();
  
  // Have all the information we need now.
  // Switch back to 1.2MHZ
  clock_prescale_set(clock_div_8);
  // Switch the timer prescaler back to /1
  TCCR0B = (TCCR0B & (1<< WGM02)) | (1<<CS00);

  sei();

  uint32_t fullWidth = (result & 0xFFFF);
  uint32_t firstWidth = ((result >> 16) & 0xFFFF);

  
  // Ratio x 10k. Possible optimization by making this some power of two.
  uint32_t ratio = (firstWidth*10000 + fullWidth/2) / fullWidth;
  // Calculate the duty cycle by multiplying then dividing this back into range
  uint8_t dutyCycle = (ratio * 255 + 5000) / 10000;
  
  // Now invert if we started with a high signal
  return dutyCycle;
}

/// ADC-read the reset pin to check if we have the button pressed.
/// Voltage on pin will drop from 5v to 3v when the button is pressed.
bool read_reset_pin() {
  // Enable the ADC and 
  ADCSRA |= (1 << ADEN) | (1 << ADSC);
  // Wait until the read is complete
  while(ADCSRA & (1 << ADSC))
    ;
  uint8_t result = ADCH;
  // disable the ADC
  ADCSRA &= ~(1 << ADEN);

  // Read ADCH and compare to reference split value of 4v (204)
  if (result < 204) {
    return true;
  }
  return false;
}

void set_pwm_output(uint8_t value)
{

}

int main(void)
{
  // Configure all the pins
  setup_pins();
  // Configure the ADC unit
  adc_setup();

  // Read the PWM input pin to determine the current PWM before startup

  read_reset_pin();

  while(1) {
   volatile uint8_t res = read_duty_cycle();
   _delay_ms(5);
  }
}