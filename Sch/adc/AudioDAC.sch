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
Sheet 4 4
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
L NAU8822LYG U?
U 1 1 58A94092
P 5550 3250
F 0 "U?" H 5550 2400 60  0000 C CNN
F 1 "NAU8822LYG" H 5550 4700 60  0000 C CNN
F 2 "" H 5550 2400 60  0001 C CNN
F 3 "" H 5550 2400 60  0001 C CNN
	1    5550 3250
	1    0    0    -1  
$EndComp
$Comp
L AudioJack CN?
U 1 1 58A945B2
P 8250 3750
F 0 "CN?" H 8200 3450 60  0000 C CNN
F 1 "AudioJack" H 8250 4000 60  0000 C CNN
F 2 "" H 8200 3450 60  0001 C CNN
F 3 "" H 8200 3450 60  0001 C CNN
	1    8250 3750
	1    0    0    -1  
$EndComp
$Comp
L CP1 C?
U 1 1 58A94613
P 6900 3750
F 0 "C?" H 6925 3850 50  0000 L CNN
F 1 "220uF" H 6925 3650 50  0000 L CNN
F 2 "" H 6900 3750 50  0000 C CNN
F 3 "" H 6900 3750 50  0000 C CNN
	1    6900 3750
	0    -1   -1   0   
$EndComp
$Comp
L CP1 C?
U 1 1 58A94914
P 6900 4000
F 0 "C?" H 6925 4100 50  0000 L CNN
F 1 "220uF" H 6925 3900 50  0000 L CNN
F 2 "" H 6900 4000 50  0000 C CNN
F 3 "" H 6900 4000 50  0000 C CNN
	1    6900 4000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6250 3800 6450 3800
Wire Wire Line
	6450 3800 6450 3750
Wire Wire Line
	6450 3750 6750 3750
Wire Wire Line
	6250 3900 6450 3900
Wire Wire Line
	6450 3900 6450 4000
Wire Wire Line
	6450 4000 6750 4000
$Comp
L GND #PWR?
U 1 1 58A94BF7
P 7300 4600
F 0 "#PWR?" H 7300 4350 50  0001 C CNN
F 1 "GND" H 7300 4450 50  0000 C CNN
F 2 "" H 7300 4600 50  0000 C CNN
F 3 "" H 7300 4600 50  0000 C CNN
	1    7300 4600
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 58A94C13
P 7300 4450
F 0 "R?" V 7380 4450 50  0000 C CNN
F 1 "DNL" V 7300 4450 50  0000 C CNN
F 2 "" V 7230 4450 50  0000 C CNN
F 3 "" H 7300 4450 50  0000 C CNN
	1    7300 4450
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 58A94C87
P 7500 4450
F 0 "R?" V 7580 4450 50  0000 C CNN
F 1 "DNL" V 7500 4450 50  0000 C CNN
F 2 "" V 7430 4450 50  0000 C CNN
F 3 "" H 7500 4450 50  0000 C CNN
	1    7500 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	7050 4000 7600 4000
Wire Wire Line
	7600 4000 7600 3750
Wire Wire Line
	7600 3750 7850 3750
Wire Wire Line
	7050 3750 7450 3750
Wire Wire Line
	7450 3750 7450 3900
Wire Wire Line
	7450 3900 7850 3900
Wire Wire Line
	7300 4300 7300 3750
Connection ~ 7300 3750
Wire Wire Line
	7500 4300 7500 3900
Connection ~ 7500 3900
Wire Wire Line
	7300 4600 7950 4600
NoConn ~ 6250 3300
NoConn ~ 6250 3400
NoConn ~ 6250 3000
NoConn ~ 6250 3100
Wire Wire Line
	7850 3650 7700 3650
Wire Wire Line
	7700 3650 7700 4600
Connection ~ 7500 4600
NoConn ~ 4650 2800
NoConn ~ 4650 2900
NoConn ~ 4650 3300
NoConn ~ 4650 3100
NoConn ~ 4650 3200
Wire Wire Line
	6250 3600 6600 3600
Text Label 6350 3600 0    60   ~ 0
VREF
Wire Wire Line
	7950 4300 8300 4300
Text Label 8050 4300 0    60   ~ 0
VREF
$Comp
L C C?
U 1 1 58A95D2B
P 7950 4450
F 0 "C?" H 7975 4550 50  0000 L CNN
F 1 "4.7uF" H 7975 4350 50  0000 L CNN
F 2 "" H 7988 4300 50  0000 C CNN
F 3 "" H 7950 4450 50  0000 C CNN
	1    7950 4450
	1    0    0    -1  
$EndComp
Connection ~ 7700 4600
$Comp
L GND #PWR?
U 1 1 58A96033
P 5650 5100
F 0 "#PWR?" H 5650 4850 50  0001 C CNN
F 1 "GND" H 5650 4950 50  0000 C CNN
F 2 "" H 5650 5100 50  0000 C CNN
F 3 "" H 5650 5100 50  0000 C CNN
	1    5650 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 4950 5650 4950
Connection ~ 5400 4950
Wire Wire Line
	5650 4950 5650 5100
Text GLabel 4650 3400 0    60   Input ~ 0
FS
Text GLabel 4650 3500 0    60   Input ~ 0
BCLK
Text GLabel 4650 3700 0    60   Input ~ 0
DACIN
$Comp
L R R?
U 1 1 58A97C3B
P 3900 4650
F 0 "R?" V 3980 4650 50  0000 C CNN
F 1 "10k" V 3900 4650 50  0000 C CNN
F 2 "" V 3830 4650 50  0000 C CNN
F 3 "" H 3900 4650 50  0000 C CNN
	1    3900 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 4400 3900 4400
Wire Wire Line
	3900 4400 3900 4500
Wire Wire Line
	3900 4800 3900 4950
Connection ~ 5300 4950
$EndSCHEMATC
