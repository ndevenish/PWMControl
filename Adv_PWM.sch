EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:Adv_PWM-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Rotary_Encoder_Switch SW1
U 1 1 58E231E9
P 4150 3500
F 0 "SW1" H 4150 3760 50  0000 C CNN
F 1 "Rotary_Encoder_Switch" H 4150 3240 50  0000 C CNN
F 2 "PWM_2:Rotary" H 4050 3660 50  0001 C CNN
F 3 "" H 4150 3760 50  0001 C CNN
	1    4150 3500
	0    1    1    0   
$EndComp
Text Label 3850 2600 0    60   ~ 0
IN
$Comp
L GND #PWR01
U 1 1 58E2337C
P 3850 2700
F 0 "#PWR01" H 3850 2450 50  0001 C CNN
F 1 "GND" H 3850 2550 50  0000 C CNN
F 2 "" H 3850 2700 50  0000 C CNN
F 3 "" H 3850 2700 50  0000 C CNN
	1    3850 2700
	1    0    0    -1  
$EndComp
$Comp
L ATTINY13-P IC1
U 1 1 58E23514
P 6000 2850
F 0 "IC1" H 5200 3250 50  0000 C CNN
F 1 "ATTINY13-P" H 6650 2450 50  0000 C CNN
F 2 "Housings_DIP:DIP-8_W7.62mm" H 6650 2850 50  0001 C CIN
F 3 "" H 5200 3200 50  0000 C CNN
	1    6000 2850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 58E2387A
P 4050 3800
F 0 "#PWR02" H 4050 3550 50  0001 C CNN
F 1 "GND" H 4050 3650 50  0000 C CNN
F 2 "" H 4050 3800 50  0000 C CNN
F 3 "" H 4050 3800 50  0000 C CNN
	1    4050 3800
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X03 P1
U 1 1 58E23B2F
P 3550 2600
F 0 "P1" H 3550 2800 50  0000 C CNN
F 1 "CONN_01X03" V 3650 2600 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 3550 2600 50  0001 C CNN
F 3 "" H 3550 2600 50  0000 C CNN
	1    3550 2600
	-1   0    0    -1  
$EndComp
$Comp
L +5V #PWR03
U 1 1 58E23C1A
P 3750 2500
F 0 "#PWR03" H 3750 2350 50  0001 C CNN
F 1 "+5V" H 3750 2640 50  0000 C CNN
F 2 "" H 3750 2500 50  0000 C CNN
F 3 "" H 3750 2500 50  0000 C CNN
	1    3750 2500
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR04
U 1 1 58E23C5F
P 7000 2600
F 0 "#PWR04" H 7000 2450 50  0001 C CNN
F 1 "+5V" H 7000 2740 50  0000 C CNN
F 2 "" H 7000 2600 50  0000 C CNN
F 3 "" H 7000 2600 50  0000 C CNN
	1    7000 2600
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR05
U 1 1 58E23C73
P 7000 3100
F 0 "#PWR05" H 7000 2850 50  0001 C CNN
F 1 "GND" H 7000 2950 50  0000 C CNN
F 2 "" H 7000 3100 50  0000 C CNN
F 3 "" H 7000 3100 50  0000 C CNN
	1    7000 3100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR06
U 1 1 58E23F17
P 6350 4650
F 0 "#PWR06" H 6350 4400 50  0001 C CNN
F 1 "GND" H 6350 4500 50  0000 C CNN
F 2 "" H 6350 4650 50  0000 C CNN
F 3 "" H 6350 4650 50  0000 C CNN
	1    6350 4650
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X03 P2
U 1 1 58E242DC
P 7800 4750
F 0 "P2" H 7800 4950 50  0000 C CNN
F 1 "CONN_01X03" V 7900 4750 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 7800 4750 50  0001 C CNN
F 3 "" H 7800 4750 50  0000 C CNN
	1    7800 4750
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 58E244D2
P 7150 5100
F 0 "R2" V 7230 5100 50  0000 C CNN
F 1 "4.7k" V 7150 5100 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 7080 5100 50  0001 C CNN
F 3 "" H 7150 5100 50  0000 C CNN
	1    7150 5100
	0    1    1    0   
$EndComp
$Comp
L R R1
U 1 1 58E2451B
P 6950 5300
F 0 "R1" V 7030 5300 50  0000 C CNN
F 1 "470R" V 6950 5300 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 6880 5300 50  0001 C CNN
F 3 "" H 6950 5300 50  0000 C CNN
	1    6950 5300
	-1   0    0    1   
$EndComp
$Comp
L GNDA #PWR07
U 1 1 58E245CE
P 7450 4750
F 0 "#PWR07" H 7450 4500 50  0001 C CNN
F 1 "GNDA" H 7450 4600 50  0000 C CNN
F 2 "" H 7450 4750 50  0000 C CNN
F 3 "" H 7450 4750 50  0000 C CNN
	1    7450 4750
	1    0    0    -1  
$EndComp
$Comp
L GNDA #PWR08
U 1 1 58E245F8
P 7350 5450
F 0 "#PWR08" H 7350 5200 50  0001 C CNN
F 1 "GNDA" H 7350 5300 50  0000 C CNN
F 2 "" H 7350 5450 50  0000 C CNN
F 3 "" H 7350 5450 50  0000 C CNN
	1    7350 5450
	1    0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 58E253DF
P 6100 4450
F 0 "R3" V 6180 4450 50  0000 C CNN
F 1 "330R" V 6100 4450 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 6030 4450 50  0001 C CNN
F 3 "" H 6100 4450 50  0000 C CNN
	1    6100 4450
	0    -1   -1   0   
$EndComp
$Comp
L CP C1
U 1 1 58E25B1D
P 7350 5300
F 0 "C1" H 7375 5400 50  0000 L CNN
F 1 "4.7u" H 7375 5200 50  0000 L CNN
F 2 "Capacitors_THT:CP_Radial_D5.0mm_P2.50mm" H 7388 5150 50  0001 C CNN
F 3 "" H 7350 5300 50  0000 C CNN
	1    7350 5300
	1    0    0    -1  
$EndComp
$Comp
L LTV-817 U1
U 1 1 58E25D44
P 6650 4550
F 0 "U1" H 6450 4750 50  0000 L CNN
F 1 "LTV-817" H 6650 4750 50  0000 L CNN
F 2 "Housings_DIP:DIP-4_W7.62mm" H 6450 4350 50  0001 L CIN
F 3 "" H 6650 4450 50  0000 L CNN
	1    6650 4550
	1    0    0    -1  
$EndComp
Text Label 4800 2800 0    60   ~ 0
PWM
Text Label 4800 2700 0    60   ~ 0
IN
Text Label 4250 2950 0    60   ~ 0
A
Text Label 4050 2950 0    60   ~ 0
B
Text Label 4900 3000 0    60   ~ 0
A
Text Label 4900 3100 0    60   ~ 0
B
Text Label 4900 2600 0    60   ~ 0
SW
Text Label 5850 4200 0    60   ~ 0
PWM
Wire Wire Line
	3750 2700 4150 2700
Wire Wire Line
	4150 2700 4150 3200
Connection ~ 3850 2700
Wire Wire Line
	7300 5100 7350 5100
Wire Wire Line
	7350 4650 7350 5150
Wire Wire Line
	7350 4650 7600 4650
Connection ~ 7350 5100
Wire Wire Line
	7350 5450 6950 5450
Wire Wire Line
	6950 4650 6950 5150
Wire Wire Line
	6950 5100 7000 5100
Connection ~ 6950 5100
Wire Wire Line
	6950 4450 6950 4550
Wire Wire Line
	6950 4550 7550 4550
Wire Wire Line
	5000 2600 4900 2600
Wire Wire Line
	3850 2600 3750 2600
Wire Wire Line
	4800 2700 5000 2700
Wire Wire Line
	4800 2800 5000 2800
Wire Wire Line
	4800 2900 5000 2900
Wire Wire Line
	5000 3000 4900 3000
Wire Wire Line
	6250 4450 6350 4450
Wire Wire Line
	5950 4450 5850 4450
Wire Wire Line
	5850 4450 5850 4200
Wire Wire Line
	4250 3200 4250 2950
Wire Wire Line
	4050 2950 4050 3200
Wire Wire Line
	4250 3800 4250 4200
Text Label 4250 4200 0    60   ~ 0
SW
$Comp
L VCC #PWR09
U 1 1 58E2840A
P 7400 4500
F 0 "#PWR09" H 7400 4350 50  0001 C CNN
F 1 "VCC" H 7400 4650 50  0000 C CNN
F 2 "" H 7400 4500 50  0000 C CNN
F 3 "" H 7400 4500 50  0000 C CNN
	1    7400 4500
	1    0    0    -1  
$EndComp
Text Label 7450 4650 2    60   ~ 0
Vref
Wire Wire Line
	7400 4500 7400 4550
Connection ~ 7400 4550
$Comp
L LED D1
U 1 1 58E29931
P 4900 3850
F 0 "D1" H 4900 3950 50  0000 C CNN
F 1 "LED" H 4900 3750 50  0000 C CNN
F 2 "LEDs:LED_D3.0mm" H 4900 3850 50  0001 C CNN
F 3 "" H 4900 3850 50  0000 C CNN
	1    4900 3850
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR010
U 1 1 58E29A0A
P 4900 4000
F 0 "#PWR010" H 4900 3750 50  0001 C CNN
F 1 "GND" H 4900 3850 50  0000 C CNN
F 2 "" H 4900 4000 50  0000 C CNN
F 3 "" H 4900 4000 50  0000 C CNN
	1    4900 4000
	1    0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 58E29B6D
P 4900 3400
F 0 "R4" V 4800 3400 50  0000 C CNN
F 1 "330R" V 4900 3400 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 4830 3400 50  0001 C CNN
F 3 "" H 4900 3400 50  0000 C CNN
	1    4900 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 3550 4900 3700
Wire Wire Line
	4900 3100 5000 3100
Wire Wire Line
	4800 2900 4800 3250
Wire Wire Line
	4800 3250 4900 3250
Wire Wire Line
	7450 4750 7600 4750
Wire Wire Line
	7600 4850 7550 4850
Wire Wire Line
	7550 4850 7550 4550
$EndSCHEMATC
