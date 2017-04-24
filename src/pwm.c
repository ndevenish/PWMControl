#ifndef F_CPU
#define F_CPU 1200000UL
#endif

#include <stdbool.h> 
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>                // for _delay_ms()
//#include <math.h>

// Pin assignments
#define PIN_PWM_OUT PB0
#define PIN_PWM_IN  PB1
#define PIN_ROT_B   PB2
#define PIN_LED     PB3
#define PIN_ROT_A   PB4

#define PIN_ROT_SW  PB5
#define ADC_SW      ADC0


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

/// Set the system clock to it's fastest value (9.6MHZ)
/// MUST turns off interrupts
void set_cpu_clock_fast(void)
{
  // Notify that we are about to change the clock
  CLKPR = (1 << CLKPCE);
  CLKPR = 0x00;
}

/// Set the system clock to it's slow setting (1.2MHz)
/// Should turn off interrupts
void set_cpu_clock_slow(void)
{
  // Notify that we are about to change the clock
  CLKPR = (1 << CLKPCE);
  CLKPR |= (1 << CLKPS1) | (1 << CLKPS0);
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
  // Lowest frequency = 488Hz >> 476Hz (round 2.1 ms)
  // At 500Hz, max period is 2.1ms/(1/9.6MHZ) == 20160
  // This corresponds to the longest we would have to wait for a change
  const uint16_t max_period_cycles = 20160;
  const uint16_t  max_loops = max_period_cycles / 12;
  uint16_t counter = max_loops;
  // Count the width in terms of number of loops
  uint16_t firstWidth = 0;
  uint16_t fullWidth = 0;


  // Switch to 8MHZ to capture small steps
  cli();
  set_cpu_clock_fast();

  const uint8_t startState = (PINB & (1 << PIN_PWM_IN));
  
  // Wait for the first change
  while ((PINB & (1 << PIN_PWM_IN)) == startState)
    if (--counter == 0)
      // If this loop failed, then zero or full duty cycle
      return startState == 0 ? 0 : 255;

  // Time while waiting for the second change
  while ((PINB & (1 << PIN_PWM_IN)) != startState)
    if (++firstWidth == max_loops)
      // This loop failed, must have moved to this state on this edge
      return startState == 0 ? 255 : 0;

  // Now back in original state, time this
  fullWidth = firstWidth;
  while ((PINB & (1 << PIN_PWM_IN)) == startState)
    if (++fullWidth == max_loops)
      // This loop failed. Must have just moved to this state!
      return startState == 0 ? 0 : 255;

  // Have all the information we need now.
  // Switch back to 1.2MHZ
  set_cpu_clock_slow();
  sei();

  // The shortest possible pulse to observe
  uint16_t one256 = fullWidth / 256;
  // Divide the first length by this (rounded)
  uint8_t dutyCycle = (firstWidth + one256 - 1) / one256;
  // Now invert if we started with a high signal
  if (startState == 0) {
    return dutyCycle;
  } else {
    return 255-dutyCycle;
  }
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
  uint8_t res = read_duty_cycle();
  
}