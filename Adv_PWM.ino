
#define PIN_PWM_IN  1
#define PIN_PWM_OUT 2
#define PIN_ROT_SW  0
#define PIN_ROT_A   4
#define PIN_ROT_B   5
#define PIN_LED     3


void setup() {
  // Set inputs and outputs
  pinMode(PIN_PWM_IN, INPUT);
  pinMode(PIN_PWM_OUT, OUTPUT);
  pinMode(PIN_LED, OUTPUT);
  
  pinMode(PIN_ROT_SW, INPUT_PULLUP);
  pinMode(PIN_ROT_A, INPUT_PULLUP);
  pinMode(PIN_ROT_B, INPUT_PULLUP);
}

void input_rising() {
  attachInterrupt(0, falling, FALLING);
  prev_time = micros();
}
 
void falling() {
  attachInterrupt(0, rising, RISING);
  pwm_value = micros()-prev_time;
  Serial.println(pwm_value);
}
void loop() {
  // put your main code here, to run repeatedly:

}
