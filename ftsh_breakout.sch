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
LIBS:special
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
LIBS:ftsh
LIBS:ftsh_breakout-cache
EELAYER 25 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 1 1
Title "FTSH JTAG Breakout"
Date ""
Rev ""
Comp "MIT Media Lab - Responsive Environments"
Comment1 "Designed by Spencer Russell in Cambridge"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L FTSH-JTAG J1
U 1 1 54A6FF95
P 5100 3500
F 0 "J1" H 5100 3100 60  0000 C CNN
F 1 "FTSH-JTAG" H 5100 3900 60  0000 C CNN
F 2 "FTSH:FTSH-JTAG" H 5100 3900 60  0001 C CNN
F 3 "" H 5100 3900 60  0000 C CNN
	1    5100 3500
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X05 P1
U 1 1 54A7008D
P 6750 3450
F 0 "P1" H 6750 3750 50  0000 C CNN
F 1 "CONN_01X05" V 6850 3450 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x05" H 6750 3450 60  0001 C CNN
F 3 "" H 6750 3450 60  0000 C CNN
	1    6750 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 3500 4500 3500
Wire Wire Line
	4350 2900 4350 3500
Wire Wire Line
	4350 2900 6200 2900
Wire Wire Line
	6200 2900 6200 3250
Wire Wire Line
	6200 3250 6550 3250
Wire Wire Line
	4500 3400 4350 3400
Connection ~ 4350 3400
Wire Wire Line
	4500 3300 4400 3300
Wire Wire Line
	4400 3300 4400 2950
Wire Wire Line
	4400 2950 6150 2950
Wire Wire Line
	6150 2950 6150 3450
Wire Wire Line
	6150 3450 6550 3450
Wire Wire Line
	5700 3300 6100 3300
Wire Wire Line
	6100 3300 6100 3550
Wire Wire Line
	6100 3550 6550 3550
Wire Wire Line
	5700 3400 6000 3400
Wire Wire Line
	6000 3400 6000 3650
Wire Wire Line
	6000 3650 6550 3650
NoConn ~ 5700 3500
NoConn ~ 5700 3600
NoConn ~ 5700 3700
NoConn ~ 6550 3350
$Comp
L PWR_FLAG #FLG01
U 1 1 54A70611
P 6400 3100
F 0 "#FLG01" H 6400 3195 30  0001 C CNN
F 1 "PWR_FLAG" H 6400 3280 30  0000 C CNN
F 2 "" H 6400 3100 60  0000 C CNN
F 3 "" H 6400 3100 60  0000 C CNN
	1    6400 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 3100 6400 3450
Connection ~ 6400 3450
$EndSCHEMATC
