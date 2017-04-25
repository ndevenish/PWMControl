#include "pwm.h"
#include <avr/interrupt.h>



#ifdef PWM_INTERRUPT


volatile uint16_t PWM_end_fall   = 0;
volatile uint16_t PWM_start_fall = 0;
volatile uint16_t PWM_start_rise = 0;
volatile uint8_t  timer_overflow = 0;

ISR(INT0_vect)
{
  // Grab the timer value as fast as possible
  
}

// Fake a 16-bit counter
ISR(TIM0_OVF_vect)
{
  timer_overflow += 1;
  
  // Timer value: TCNT0
  
}

inline void end_pwm_measure(void)
{
  // Disable INT0 for now
  GIMSK &= ~(1<<INT0);
  // Remove timer overflow interrupts
  TIMSK0 &= ~(1<<TOIE0);
}

inline void start_pwm_measure(void)
{
  // Reset the measurement variables
  PWM_end_fall = 0;
  PWM_start_fall = 0;
  PWM_start_rise = 0;
  timer_overflow = 0;

  // Enable INT0 interrupts
  GIMSK |= (1<<INT0);
  // Enable interrupts for overflow
  TIMSK0 |= (1<<TOIE0);

}

void setup_pwm_measure(void)
{
  // Start with Rising-edge triggered INT0
  MCUCR |= (1<<ISC01) | (1<<ISC00);

  // Falling-edge triggered INT0
  // MCUCR = (MCUCR | (1<<ISC01)) & ~(1<<ISC00);

}

#endif