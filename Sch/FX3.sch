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
LIBS:zturn_adc-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 2
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
L CYUSB3014-BZ IC?
U 1 1 589AE24E
P 6700 3300
F 0 "IC?" H 6700 6000 60  0000 C CNN
F 1 "CYUSB3014-BZ" H 6750 750 60  0000 C CNN
F 2 "" H 3350 3600 60  0001 C CNN
F 3 "" H 3350 3600 60  0001 C CNN
	1    6700 3300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 589AE255
P 10000 5800
F 0 "#PWR?" H 10000 5550 50  0001 C CNN
F 1 "GND" H 10000 5650 50  0000 C CNN
F 2 "" H 10000 5800 50  0000 C CNN
F 3 "" H 10000 5800 50  0000 C CNN
	1    10000 5800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 589AE25B
P 1200 2050
F 0 "#PWR?" H 1200 1800 50  0001 C CNN
F 1 "GND" H 1200 1900 50  0000 C CNN
F 2 "" H 1200 2050 50  0000 C CNN
F 3 "" H 1200 2050 50  0000 C CNN
	1    1200 2050
	1    0    0    -1  
$EndComp
$Comp
L Crystal_GND24 Y?
U 1 1 589AE261
P 1450 1700
F 0 "Y?" H 1575 1900 50  0000 L CNN
F 1 "Crystal_GND24" H 1575 1825 50  0000 L CNN
F 2 "" H 1450 1700 50  0000 C CNN
F 3 "" H 1450 1700 50  0000 C CNN
	1    1450 1700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 589AE268
P 900 2050
F 0 "#PWR?" H 900 1800 50  0001 C CNN
F 1 "GND" H 900 1900 50  0000 C CNN
F 2 "" H 900 2050 50  0000 C CNN
F 3 "" H 900 2050 50  0000 C CNN
	1    900  2050
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 589AE26E
P 700 1900
F 0 "C?" H 725 2000 50  0000 L CNN
F 1 "10p" H 725 1800 50  0000 L CNN
F 2 "" H 738 1750 50  0000 C CNN
F 3 "" H 700 1900 50  0000 C CNN
	1    700  1900
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 589AE275
P 900 1900
F 0 "C?" H 925 2000 50  0000 L CNN
F 1 "10p" H 925 1800 50  0000 L CNN
F 2 "" H 938 1750 50  0000 C CNN
F 3 "" H 900 1900 50  0000 C CNN
	1    900  1900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 589AE27C
P 2200 2000
F 0 "#PWR?" H 2200 1750 50  0001 C CNN
F 1 "GND" H 2200 1850 50  0000 C CNN
F 2 "" H 2200 2000 50  0000 C CNN
F 3 "" H 2200 2000 50  0000 C CNN
	1    2200 2000
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 589AE282
P 2200 1850
F 0 "R?" V 2280 1850 50  0000 C CNN
F 1 "10k" V 2200 1850 50  0000 C CNN
F 2 "" V 2130 1850 50  0000 C CNN
F 3 "" H 2200 1850 50  0000 C CNN
	1    2200 1850
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 589AE289
P 2350 1850
F 0 "R?" V 2430 1850 50  0000 C CNN
F 1 "10k" V 2350 1850 50  0000 C CNN
F 2 "" V 2280 1850 50  0000 C CNN
F 3 "" H 2350 1850 50  0000 C CNN
	1    2350 1850
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 589AE290
P 2500 1850
F 0 "R?" V 2580 1850 50  0000 C CNN
F 1 "10k" V 2500 1850 50  0000 C CNN
F 2 "" V 2430 1850 50  0000 C CNN
F 3 "" H 2500 1850 50  0000 C CNN
	1    2500 1850
	1    0    0    -1  
$EndComp
NoConn ~ 3350 1900
NoConn ~ 3350 2000
$Comp
L USB3_micro_B CN?
U 1 1 589AE710
P 1000 4350
F 0 "CN?" H 1000 3500 60  0000 C CNN
F 1 "USB3_micro_B" H 1050 5100 60  0000 C CNN
F 2 "" H 1000 3500 60  0001 C CNN
F 3 "" H 1000 3500 60  0001 C CNN
	1    1000 4350
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 589AE887
P 2850 4400
F 0 "C?" H 2875 4500 50  0000 L CNN
F 1 "0.1u" H 2875 4300 50  0000 L CNN
F 2 "" H 2888 4250 50  0000 C CNN
F 3 "" H 2850 4400 50  0000 C CNN
	1    2850 4400
	0    1    1    0   
$EndComp
$Comp
L C C?
U 1 1 589AE915
P 2850 4500
F 0 "C?" H 2875 4600 50  0000 L CNN
F 1 "0.1u" H 2875 4400 50  0000 L CNN
F 2 "" H 2888 4350 50  0000 C CNN
F 3 "" H 2850 4500 50  0000 C CNN
	1    2850 4500
	0    1    1    0   
$EndComp
$Comp
L SP3010-04UTG D?
U 1 1 589AEAF9
P 2300 4300
F 0 "D?" H 2300 3950 60  0000 C CNN
F 1 "SP3010-04UTG" H 2350 4650 60  0000 C CNN
F 2 "" H 2300 3950 60  0001 C CNN
F 3 "" H 2300 3950 60  0001 C CNN
	1    2300 4300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 589AEE63
P 1550 5450
F 0 "#PWR?" H 1550 5200 50  0001 C CNN
F 1 "GND" H 1550 5300 50  0000 C CNN
F 2 "" H 1550 5450 50  0000 C CNN
F 3 "" H 1550 5450 50  0000 C CNN
	1    1550 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	10200 4100 10000 4100
Wire Wire Line
	10000 4100 10000 5800
Wire Wire Line
	10200 4200 10000 4200
Connection ~ 10000 4200
Wire Wire Line
	10200 4300 10000 4300
Connection ~ 10000 4300
Wire Wire Line
	10200 4400 10000 4400
Connection ~ 10000 4400
Wire Wire Line
	10200 4500 10000 4500
Connection ~ 10000 4500
Wire Wire Line
	10200 4600 10000 4600
Connection ~ 10000 4600
Wire Wire Line
	10200 4700 10000 4700
Connection ~ 10000 4700
Wire Wire Line
	10200 4800 10000 4800
Connection ~ 10000 4800
Wire Wire Line
	10200 4900 10000 4900
Connection ~ 10000 4900
Wire Wire Line
	10200 5000 10000 5000
Connection ~ 10000 5000
Wire Wire Line
	10200 5100 10000 5100
Connection ~ 10000 5100
Wire Wire Line
	10200 5200 10000 5200
Connection ~ 10000 5200
Wire Wire Line
	10200 5300 10000 5300
Connection ~ 10000 5300
Wire Wire Line
	10200 5400 10000 5400
Connection ~ 10000 5400
Wire Wire Line
	1450 1500 1200 1500
Wire Wire Line
	1200 1500 1200 2050
Wire Wire Line
	1450 1900 1200 1900
Connection ~ 1200 1900
Wire Wire Line
	1300 1700 700  1700
Wire Wire Line
	700  1200 700  1750
Wire Wire Line
	1600 1700 1600 1400
Wire Wire Line
	1600 1400 900  1400
Wire Wire Line
	900  1300 900  1750
Wire Wire Line
	700  2050 900  2050
Connection ~ 700  1700
Wire Wire Line
	900  1300 3350 1300
Connection ~ 900  1400
Wire Wire Line
	700  1200 3350 1200
Wire Wire Line
	2200 2000 2500 2000
Connection ~ 2350 2000
Wire Wire Line
	2500 1700 3350 1700
Wire Wire Line
	3350 1600 2350 1600
Wire Wire Line
	2350 1600 2350 1700
Wire Wire Line
	3350 1500 2200 1500
Wire Wire Line
	2200 1500 2200 1700
Wire Wire Line
	3350 4400 3000 4400
Wire Wire Line
	3350 4500 3000 4500
Wire Wire Line
	1400 4400 1900 4400
Wire Wire Line
	1400 4500 1900 4500
Wire Wire Line
	1400 4250 1550 4250
Wire Wire Line
	1550 4250 1550 5450
Wire Wire Line
	1400 4600 1550 4600
Connection ~ 1550 4600
Wire Wire Line
	1400 4700 1650 4700
Wire Wire Line
	1650 4700 1650 4100
Wire Wire Line
	1650 4100 1900 4100
Wire Wire Line
	2700 4100 3200 4100
Wire Wire Line
	3200 4100 3200 4200
Wire Wire Line
	3200 4200 3350 4200
Wire Wire Line
	2700 4200 3100 4200
Wire Wire Line
	3100 4200 3100 4300
Wire Wire Line
	3100 4300 3350 4300
Wire Wire Line
	1400 4800 1750 4800
Wire Wire Line
	1750 4800 1750 4200
Wire Wire Line
	1750 4200 1900 4200
Wire Wire Line
	1900 4300 1900 5350
Wire Wire Line
	1550 5350 2700 5350
Connection ~ 1550 5350
Wire Wire Line
	2700 5350 2700 4300
Connection ~ 1900 5350
$EndSCHEMATC
