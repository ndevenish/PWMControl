#ifndef F_CPU
#define F_CPU 1200000UL
#endif

#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>                // for _delay_ms()

// Pin assignments

#define PWMIN_DDR   
#define PWMIN_PB    

#define PIN_PWM_OUT PB0
#define PIN_PWM_IN  PB1
#define PIN_ROT_B   PB2
#define PIN_LED     PB3
#define PIN_ROT_A   PB4
#define PIN_ROT_SW  PB5


// Check that the PORTB/DDRB/PINB constants are all identical
#if PB0 != DDB0 || PB0 != PINB0
#error "IO bits mismatch"
#endif

// Map the pin number to the port bit

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

/// ADC-read the reset pin to check if we have the button pressed.
/// Voltage on pin will drop from 5v to 3v when the button is pressed.
bool read_reset_pin() {

}

int main(void)
{
  // Configure all the pins
  setup_pins();

  // Read the PWM input pin to determine the current PWM before startup

}