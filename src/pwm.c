#ifndef F_CPU
#define F_CPU 1200000UL
#endif

#include <stdbool.h> 
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>                // for _delay_ms()

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

void setup_pins() {
  // Initialise all pins as input
  DDRB  = 0x00;
  PORTB = 0x00;

  // Set the output pins, off
  DDRB |= (1 << PIN_PWM_OUT) | (1 << PIN_LED);
  //PORTB &= ~(1 << PB(PIN_PWM_OUT)) | (1 << PB(PIN_LED));

  // Set the input PWM pin  
  // (Automatic after above initialisation)
  //DDRB &= ~(1 << DDB(PIN_PWM_IN));
  //PORTB &= ~(1 << PB(PIN_PWM_IN));

  // Set the pullup input pins
  //DDRB  &= ~((1 << PB(PIN_ROT_SW)) | (1 << PB(PIN_ROT_A)) | (1 << PB(PIN_ROT_B)));
  PORTB |= (1 << PIN_ROT_SW) | (1 << PIN_ROT_A) | (1 << PIN_ROT_B);

}

/// Read the PWM signal upon startup
void read_initial_pwm() {
  bool state = (PINB & (1 << PIN_PWM_IN));

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
  if (ADCH < 204) {
    return true;
  }
  return false;
}

int main(void)
{
  // Configure all the pins
  setup_pins();
  // Configure the ADC unit
  adc_setup();

  // Read the PWM input pin to determine the current PWM before startup

}