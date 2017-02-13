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
LIBS:zturn_adc
LIBS:CYUSB3014
LIBS:zturn_adc-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 5
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
L BGA2818 U?
U 1 1 58A1C106
P 3450 2250
F 0 "U?" V 3150 2650 60  0000 C CNN
F 1 "BGA2818" H 3450 1550 60  0000 C CNN
F 2 "" H 3450 2300 60  0001 C CNN
F 3 "" H 3450 2300 60  0001 C CNN
	1    3450 2250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 58A1C19C
P 3600 2700
F 0 "#PWR?" H 3600 2450 50  0001 C CNN
F 1 "GND" H 3600 2550 50  0000 C CNN
F 2 "" H 3600 2700 50  0000 C CNN
F 3 "" H 3600 2700 50  0000 C CNN
	1    3600 2700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 58A1C1B6
P 3450 2700
F 0 "#PWR?" H 3450 2450 50  0001 C CNN
F 1 "GND" H 3450 2550 50  0000 C CNN
F 2 "" H 3450 2700 50  0000 C CNN
F 3 "" H 3450 2700 50  0000 C CNN
	1    3450 2700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 58A1C1C7
P 3300 2700
F 0 "#PWR?" H 3300 2450 50  0001 C CNN
F 1 "GND" H 3300 2550 50  0000 C CNN
F 2 "" H 3300 2700 50  0000 C CNN
F 3 "" H 3300 2700 50  0000 C CNN
	1    3300 2700
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 58A1C69B
P 4100 2200
F 0 "C?" H 4125 2300 50  0000 L CNN
F 1 "C" H 4125 2100 50  0000 L CNN
F 2 "" H 4138 2050 50  0000 C CNN
F 3 "" H 4100 2200 50  0000 C CNN
	1    4100 2200
	0    1    1    0   
$EndComp
$Comp
L GND #PWR?
U 1 1 58A1C6CA
P 2950 1650
F 0 "#PWR?" H 2950 1400 50  0001 C CNN
F 1 "GND" H 2950 1500 50  0000 C CNN
F 2 "" H 2950 1650 50  0000 C CNN
F 3 "" H 2950 1650 50  0000 C CNN
	1    2950 1650
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR?
U 1 1 58A1C6DD
P 2650 1350
F 0 "#PWR?" H 2650 1200 50  0001 C CNN
F 1 "+3V3" H 2650 1490 50  0000 C CNN
F 2 "" H 2650 1350 50  0000 C CNN
F 3 "" H 2650 1350 50  0000 C CNN
	1    2650 1350
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 58A1C6F8
P 2950 1500
F 0 "C?" H 2975 1600 50  0000 L CNN
F 1 "22nF" H 2975 1400 50  0000 L CNN
F 2 "" H 2988 1350 50  0000 C CNN
F 3 "" H 2950 1500 50  0000 C CNN
	1    2950 1500
	-1   0    0    1   
$EndComp
Wire Wire Line
	2650 1350 3450 1350
Wire Wire Line
	3450 1350 3450 1750
Connection ~ 2950 1350
$Comp
L L L?
U 1 1 58A1CAF3
P 1650 2200
F 0 "L?" V 1600 2200 50  0000 C CNN
F 1 "220nH" V 1725 2200 50  0000 C CNN
F 2 "" H 1650 2200 50  0000 C CNN
F 3 "" H 1650 2200 50  0000 C CNN
	1    1650 2200
	0    1    1    0   
$EndComp
$Comp
L C C?
U 1 1 58A1CB2F
P 1950 2200
F 0 "C?" H 1975 2300 50  0000 L CNN
F 1 "18p" H 1975 2100 50  0000 L CNN
F 2 "" H 1988 2050 50  0000 C CNN
F 3 "" H 1950 2200 50  0000 C CNN
	1    1950 2200
	0    1    1    0   
$EndComp
$Comp
L L L?
U 1 1 58A1CBF1
P 2500 2200
F 0 "L?" V 2450 2200 50  0000 C CNN
F 1 "220nH" V 2575 2200 50  0000 C CNN
F 2 "" H 2500 2200 50  0000 C CNN
F 3 "" H 2500 2200 50  0000 C CNN
	1    2500 2200
	0    1    1    0   
$EndComp
$Comp
L C C?
U 1 1 58A1CBF7
P 2800 2200
F 0 "C?" H 2825 2300 50  0000 L CNN
F 1 "18p" H 2825 2100 50  0000 L CNN
F 2 "" H 2838 2050 50  0000 C CNN
F 3 "" H 2800 2200 50  0000 C CNN
	1    2800 2200
	0    1    1    0   
$EndComp
Wire Wire Line
	2100 2200 2350 2200
$Comp
L L L?
U 1 1 58A1CC88
P 2100 2750
F 0 "L?" V 2050 2750 50  0000 C CNN
F 1 "27nH" V 2175 2750 50  0000 C CNN
F 2 "" H 2100 2750 50  0000 C CNN
F 3 "" H 2100 2750 50  0000 C CNN
	1    2100 2750
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 58A1CC8E
P 2350 2750
F 0 "C?" H 2375 2850 50  0000 L CNN
F 1 "147p" H 2375 2650 50  0000 L CNN
F 2 "" H 2388 2600 50  0000 C CNN
F 3 "" H 2350 2750 50  0000 C CNN
	1    2350 2750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 58A1CD2C
P 2200 3050
F 0 "#PWR?" H 2200 2800 50  0001 C CNN
F 1 "GND" H 2200 2900 50  0000 C CNN
F 2 "" H 2200 3050 50  0000 C CNN
F 3 "" H 2200 3050 50  0000 C CNN
	1    2200 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 2200 2200 2600
Wire Wire Line
	2100 2600 2350 2600
Connection ~ 2200 2200
Connection ~ 2200 2600
Wire Wire Line
	2350 2900 2100 2900
Wire Wire Line
	2200 3050 2200 2900
Connection ~ 2200 2900
Text Label 3550 1900 0    60   ~ 0
20mA
$Comp
L MABAES0060 RFTransformer?
U 1 1 58A1E2C2
P 5900 2300
F 0 "RFTransformer?" H 5900 1950 60  0000 C CNN
F 1 "MABAES0060" H 5900 2650 60  0000 C CNN
F 2 "" H 5950 2300 60  0001 C CNN
F 3 "" H 5950 2300 60  0001 C CNN
	1    5900 2300
	1    0    0    -1  
$EndComp
$EndSCHEMATC
