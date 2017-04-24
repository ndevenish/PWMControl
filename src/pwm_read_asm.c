// This file is not built but is used to generate duty_cycle.S via 
//    avr-gcc -gstabs -Wa,-ahlmsd=output.lst -dp -fverbose-asm -O2 -mmcu=attiny13 -c pwm_read_asm.c

#error "This file should not be compiled directly unless generating assembly (remove this line)"

#include <avr/io.h>
#include "pwm.h"

uint32_t read_cycle_ASM()
{

  // Lowest frequency = 488Hz >> 476Hz (rounded to 2.1 ms)
  // At 476Hz, max clock period is 2.1ms/(1/9.6MHZ) == 20160
  // This corresponds to the longest we would have to wait for a change
  const uint16_t max_period_cycles = 20160;
  const uint16_t  max_loops = max_period_cycles / 13;
  // Restricts the initial waiting period
  uint16_t counter = max_loops;
  // Count the width in terms of number of loops
  uint16_t firstWidth = 0;
  uint16_t fullWidth = 0;

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

  if (startState == 1)
    firstWidth = fullWidth - firstWidth;
  return (((uint32_t)firstWidth) << 16) | ((uint32_t)fullWidth);

   
}
