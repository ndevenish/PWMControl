
TARGET=pwm
MCU=attiny13




CFLAGS += -O3
ALL_CFLAGS=-mmcu=$(MCU) $(CFLAGS)

all: build

build: $(TARGET).o

%.o : %.c
	avr-gcc -c $(ALL_CFLAGS) $< -o $@