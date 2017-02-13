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
Sheet 3 5
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
L CYUSB3014 IC1
U 2 1 58A06BB8
P 4750 3750
F 0 "IC1" H 4750 1400 50  0000 C CNN
F 1 "CYUSB3014" H 4750 6300 50  0000 C CNN
F 2 "MODULE" H 4700 6050 50  0001 C CNN
F 3 "DOCUMENTATION" H 4750 6200 50  0001 C CNN
	2    4750 3750
	1    0    0    -1  
$EndComp
$Comp
L +2V5 #PWR?
U 1 1 58A06DA4
P 6200 2100
F 0 "#PWR?" H 6200 1950 50  0001 C CNN
F 1 "+2V5" H 6200 2240 50  0000 C CNN
F 2 "" H 6200 2100 50  0000 C CNN
F 3 "" H 6200 2100 50  0000 C CNN
	1    6200 2100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 58A06DBA
P 5800 4600
F 0 "#PWR?" H 5800 4350 50  0001 C CNN
F 1 "GND" H 5800 4450 50  0000 C CNN
F 2 "" H 5800 4600 50  0000 C CNN
F 3 "" H 5800 4600 50  0000 C CNN
	1    5800 4600
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 58A06DD0
P 5800 4450
F 0 "C?" H 5825 4550 50  0000 L CNN
F 1 "0.01u" H 5825 4350 50  0000 L CNN
F 2 "" H 5838 4300 50  0000 C CNN
F 3 "" H 5800 4450 50  0000 C CNN
	1    5800 4450
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 58A06E37
P 6000 4450
F 0 "C?" H 6025 4550 50  0000 L CNN
F 1 "0.1u" H 6025 4350 50  0000 L CNN
F 2 "" H 6038 4300 50  0000 C CNN
F 3 "" H 6000 4450 50  0000 C CNN
	1    6000 4450
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 58A06E54
P 6200 4450
F 0 "C?" H 6225 4550 50  0000 L CNN
F 1 "0.1u" H 6225 4350 50  0000 L CNN
F 2 "" H 6238 4300 50  0000 C CNN
F 3 "" H 6200 4450 50  0000 C CNN
	1    6200 4450
	1    0    0    -1  
$EndComp
Text Label 5500 3400 0    60   ~ 0
VIO1
$Comp
L C C?
U 1 1 58A07346
P 6700 4450
F 0 "C?" H 6725 4550 50  0000 L CNN
F 1 "0.01u" H 6725 4350 50  0000 L CNN
F 2 "" H 6738 4300 50  0000 C CNN
F 3 "" H 6700 4450 50  0000 C CNN
	1    6700 4450
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 58A0734C
P 6900 4450
F 0 "C?" H 6925 4550 50  0000 L CNN
F 1 "0.1u" H 6925 4350 50  0000 L CNN
F 2 "" H 6938 4300 50  0000 C CNN
F 3 "" H 6900 4450 50  0000 C CNN
	1    6900 4450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 58A0736C
P 6700 4600
F 0 "#PWR?" H 6700 4350 50  0001 C CNN
F 1 "GND" H 6700 4450 50  0000 C CNN
F 2 "" H 6700 4600 50  0000 C CNN
F 3 "" H 6700 4600 50  0000 C CNN
	1    6700 4600
	1    0    0    -1  
$EndComp
Text Label 5550 3150 0    60   ~ 0
VIO2
$Comp
L C C?
U 1 1 58A07649
P 7350 4450
F 0 "C?" H 7375 4550 50  0000 L CNN
F 1 "0.01u" H 7375 4350 50  0000 L CNN
F 2 "" H 7388 4300 50  0000 C CNN
F 3 "" H 7350 4450 50  0000 C CNN
	1    7350 4450
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 58A0764F
P 7550 4450
F 0 "C?" H 7575 4550 50  0000 L CNN
F 1 "0.1u" H 7575 4350 50  0000 L CNN
F 2 "" H 7588 4300 50  0000 C CNN
F 3 "" H 7550 4450 50  0000 C CNN
	1    7550 4450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 58A07669
P 7350 4600
F 0 "#PWR?" H 7350 4350 50  0001 C CNN
F 1 "GND" H 7350 4450 50  0000 C CNN
F 2 "" H 7350 4600 50  0000 C CNN
F 3 "" H 7350 4600 50  0000 C CNN
	1    7350 4600
	1    0    0    -1  
$EndComp
Text Label 5650 2900 0    60   ~ 0
VIO3
$Comp
L GND #PWR?
U 1 1 58A07B36
P 3700 5900
F 0 "#PWR?" H 3700 5650 50  0001 C CNN
F 1 "GND" H 3700 5750 50  0000 C CNN
F 2 "" H 3700 5900 50  0000 C CNN
F 3 "" H 3700 5900 50  0000 C CNN
	1    3700 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 4600 6200 4600
Connection ~ 6000 4600
Wire Wire Line
	5800 4300 6200 4300
Connection ~ 6000 4300
Wire Wire Line
	5500 3400 6200 3400
Wire Wire Line
	5800 3400 5800 4300
Wire Wire Line
	5500 3700 5800 3700
Connection ~ 5800 3700
Wire Wire Line
	6200 3400 6200 2100
Connection ~ 5800 3400
Wire Wire Line
	5500 3150 6700 3150
Connection ~ 6200 3150
Wire Wire Line
	6700 3150 6700 4300
Wire Wire Line
	6700 4300 6900 4300
Wire Wire Line
	6900 4600 6700 4600
Wire Wire Line
	5500 2900 7350 2900
Wire Wire Line
	7350 2900 7350 4300
Wire Wire Line
	7350 4300 7550 4300
Wire Wire Line
	7550 4600 7350 4600
Connection ~ 6200 2900
Wire Wire Line
	4000 4750 3700 4750
Wire Wire Line
	3700 2000 3700 5900
Wire Wire Line
	4000 5150 3700 5150
Connection ~ 3700 5150
Wire Wire Line
	4000 4650 3700 4650
Connection ~ 3700 4750
Wire Wire Line
	4000 5450 3700 5450
Connection ~ 3700 5450
Wire Wire Line
	4000 4550 3700 4550
Connection ~ 3700 4650
Wire Wire Line
	4000 4850 3700 4850
Connection ~ 3700 4850
Wire Wire Line
	4000 5550 3700 5550
Connection ~ 3700 5550
Wire Wire Line
	4000 5050 3700 5050
Connection ~ 3700 5050
Wire Wire Line
	4000 5350 3700 5350
Connection ~ 3700 5350
Wire Wire Line
	4000 4950 3700 4950
Connection ~ 3700 4950
Wire Wire Line
	4000 5250 3700 5250
Connection ~ 3700 5250
Wire Wire Line
	4000 4250 3700 4250
Connection ~ 3700 4550
Wire Wire Line
	4000 4350 3700 4350
Connection ~ 3700 4350
Wire Wire Line
	4000 4450 3700 4450
Connection ~ 3700 4450
Wire Wire Line
	4000 2950 3700 2950
Connection ~ 3700 4250
Wire Wire Line
	4000 2000 3700 2000
Connection ~ 3700 2950
Wire Wire Line
	4000 4000 3150 4000
Wire Wire Line
	3150 1650 3150 4100
Wire Wire Line
	4000 3500 3150 3500
Connection ~ 3150 3500
Wire Wire Line
	4000 3900 3150 3900
Connection ~ 3150 3900
Wire Wire Line
	4000 3600 3150 3600
Connection ~ 3150 3600
Wire Wire Line
	2000 4100 4000 4100
Connection ~ 3150 4000
Wire Wire Line
	4000 3800 3150 3800
Connection ~ 3150 3800
Wire Wire Line
	4000 3700 3150 3700
Connection ~ 3150 3700
Wire Wire Line
	4000 3400 3150 3400
Connection ~ 3150 3400
$Comp
L +1V2 #PWR?
U 1 1 58A09064
P 3150 1650
F 0 "#PWR?" H 3150 1500 50  0001 C CNN
F 1 "+1V2" H 3150 1790 50  0000 C CNN
F 2 "" H 3150 1650 50  0000 C CNN
F 3 "" H 3150 1650 50  0000 C CNN
	1    3150 1650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 58A09342
P 1900 4550
F 0 "#PWR?" H 1900 4300 50  0001 C CNN
F 1 "GND" H 1900 4400 50  0000 C CNN
F 2 "" H 1900 4550 50  0000 C CNN
F 3 "" H 1900 4550 50  0000 C CNN
	1    1900 4550
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 58A09348
P 1900 4400
F 0 "C?" H 1925 4500 50  0000 L CNN
F 1 "0.01u" H 1925 4300 50  0000 L CNN
F 2 "" H 1938 4250 50  0000 C CNN
F 3 "" H 1900 4400 50  0000 C CNN
	1    1900 4400
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 58A0934E
P 2100 4400
F 0 "C?" H 2125 4500 50  0000 L CNN
F 1 "0.1u" H 2125 4300 50  0000 L CNN
F 2 "" H 2138 4250 50  0000 C CNN
F 3 "" H 2100 4400 50  0000 C CNN
	1    2100 4400
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 58A09354
P 2300 4400
F 0 "C?" H 2325 4500 50  0000 L CNN
F 1 "0.1u" H 2325 4300 50  0000 L CNN
F 2 "" H 2338 4250 50  0000 C CNN
F 3 "" H 2300 4400 50  0000 C CNN
	1    2300 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 4550 2700 4550
Connection ~ 2100 4550
$Comp
L C C?
U 1 1 58A093D1
P 1700 4400
F 0 "C?" H 1725 4500 50  0000 L CNN
F 1 "0.01u" H 1725 4300 50  0000 L CNN
F 2 "" H 1738 4250 50  0000 C CNN
F 3 "" H 1700 4400 50  0000 C CNN
	1    1700 4400
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 58A09416
P 1500 4400
F 0 "C?" H 1525 4500 50  0000 L CNN
F 1 "0.01u" H 1525 4300 50  0000 L CNN
F 2 "" H 1538 4250 50  0000 C CNN
F 3 "" H 1500 4400 50  0000 C CNN
	1    1500 4400
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 58A0947D
P 1300 4400
F 0 "C?" H 1325 4500 50  0000 L CNN
F 1 "0.01u" H 1325 4300 50  0000 L CNN
F 2 "" H 1338 4250 50  0000 C CNN
F 3 "" H 1300 4400 50  0000 C CNN
	1    1300 4400
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 58A094C9
P 2500 4400
F 0 "C?" H 2525 4500 50  0000 L CNN
F 1 "0.1u" H 2525 4300 50  0000 L CNN
F 2 "" H 2538 4250 50  0000 C CNN
F 3 "" H 2500 4400 50  0000 C CNN
	1    2500 4400
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 58A094CF
P 2700 4400
F 0 "C?" H 2725 4500 50  0000 L CNN
F 1 "0.1u" H 2725 4300 50  0000 L CNN
F 2 "" H 2738 4250 50  0000 C CNN
F 3 "" H 2700 4400 50  0000 C CNN
	1    2700 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 4250 1300 4250
Connection ~ 1900 4550
Connection ~ 2300 4550
Connection ~ 2100 4250
Connection ~ 2300 4250
Connection ~ 2500 4250
Connection ~ 2700 4550
Connection ~ 2500 4550
Connection ~ 2700 4250
Connection ~ 1900 4250
Connection ~ 1700 4250
Connection ~ 1500 4250
Connection ~ 1500 4550
Connection ~ 1700 4550
Connection ~ 1300 4250
Connection ~ 1300 4550
Connection ~ 6200 4300
Connection ~ 5800 4300
Connection ~ 6250 4600
Connection ~ 5800 4600
Connection ~ 6900 4300
Connection ~ 6700 4300
Connection ~ 6700 4600
Connection ~ 6900 4600
Connection ~ 7350 4300
Connection ~ 7550 4300
Connection ~ 7550 4600
Connection ~ 7350 4600
Wire Wire Line
	2000 4100 2000 4250
Connection ~ 2000 4250
Connection ~ 3150 4100
$Comp
L L L?
U 1 1 58A09C34
P 2800 1900
F 0 "L?" V 2750 1900 50  0000 C CNN
F 1 "MPZ2012S601A" V 2875 1900 50  0000 C CNN
F 2 "" H 2800 1900 50  0000 C CNN
F 3 "" H 2800 1900 50  0000 C CNN
	1    2800 1900
	0    1    1    0   
$EndComp
$Comp
L VDDA #PWR?
U 1 1 58A09D73
P 2500 1650
F 0 "#PWR?" H 2500 1500 50  0001 C CNN
F 1 "VDDA" H 2500 1800 50  0000 C CNN
F 2 "" H 2500 1650 50  0000 C CNN
F 3 "" H 2500 1650 50  0000 C CNN
	1    2500 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 1900 3150 1900
Connection ~ 3150 1900
Wire Wire Line
	2500 1650 2500 2850
Wire Wire Line
	2500 1900 2650 1900
Wire Wire Line
	1950 2850 4000 2850
Connection ~ 2500 1900
$Comp
L GND #PWR?
U 1 1 58A09FF0
P 1950 3150
F 0 "#PWR?" H 1950 2900 50  0001 C CNN
F 1 "GND" H 1950 3000 50  0000 C CNN
F 2 "" H 1950 3150 50  0000 C CNN
F 3 "" H 1950 3150 50  0000 C CNN
	1    1950 3150
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 58A0A037
P 1950 3000
F 0 "C?" H 1975 3100 50  0000 L CNN
F 1 "2.2u" H 1975 2900 50  0000 L CNN
F 2 "" H 1988 2850 50  0000 C CNN
F 3 "" H 1950 3000 50  0000 C CNN
	1    1950 3000
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 58A0A08C
P 2150 3000
F 0 "C?" H 2175 3100 50  0000 L CNN
F 1 "0.1u" H 2175 2900 50  0000 L CNN
F 2 "" H 2188 2850 50  0000 C CNN
F 3 "" H 2150 3000 50  0000 C CNN
	1    2150 3000
	1    0    0    -1  
$EndComp
Connection ~ 2500 2850
Connection ~ 2150 2850
Wire Wire Line
	1950 3150 2150 3150
Connection ~ 2150 3150
Connection ~ 1950 2850
Connection ~ 1950 3150
$EndSCHEMATC
