/*
 * pwm.h
 *
 * Created: 24/04/2017 15:27:54
 *  Author: misno
 */ 


#ifndef PWM_H_
#define PWM_H_

// Pin assignments
#define PIN_PWM_OUT PB0
#define PIN_PWM_IN  PB1
#define PIN_ROT_B   PB2
#define PIN_LED     PB3
#define PIN_ROT_A   PB4

#define PIN_ROT_SW  PB5
#define ADC_SW      ADC0


uint32_t read_cycle_ASM();





#endif /* PWM_H_ */