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
Sheet 4 5
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
U 1 1 58A0A9A0
P 10400 3500
F 0 "IC1" H 10400 1150 50  0000 C CNN
F 1 "CYUSB3014" H 10400 6050 50  0000 C CNN
F 2 "MODULE" H 10350 5800 50  0001 C CNN
F 3 "DOCUMENTATION" H 10400 5950 50  0001 C CNN
	1    10400 3500
	1    0    0    -1  
$EndComp
$Comp
L CONN_02X40 P?
U 1 1 58A0AB50
P 7100 3300
F 0 "P?" H 7100 5350 50  0000 C CNN
F 1 "CONN_02X40" V 7100 3300 50  0000 C CNN
F 2 "" H 7100 3300 50  0000 C CNN
F 3 "" H 7100 3300 50  0000 C CNN
	1    7100 3300
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR?
U 1 1 58A0AB93
P 6500 1100
F 0 "#PWR?" H 6500 950 50  0001 C CNN
F 1 "+3V3" H 6500 1240 50  0000 C CNN
F 2 "" H 6500 1100 50  0000 C CNN
F 3 "" H 6500 1100 50  0000 C CNN
	1    6500 1100
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR?
U 1 1 58A0ABAF
P 6750 1100
F 0 "#PWR?" H 6750 950 50  0001 C CNN
F 1 "+5V" H 6750 1240 50  0000 C CNN
F 2 "" H 6750 1100 50  0000 C CNN
F 3 "" H 6750 1100 50  0000 C CNN
	1    6750 1100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 58A0ADDE
P 7800 5550
F 0 "#PWR?" H 7800 5300 50  0001 C CNN
F 1 "GND" H 7800 5400 50  0000 C CNN
F 2 "" H 7800 5550 50  0000 C CNN
F 3 "" H 7800 5550 50  0000 C CNN
	1    7800 5550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 58A0B6AA
P 6350 5550
F 0 "#PWR?" H 6350 5300 50  0001 C CNN
F 1 "GND" H 6350 5400 50  0000 C CNN
F 2 "" H 6350 5550 50  0000 C CNN
F 3 "" H 6350 5550 50  0000 C CNN
	1    6350 5550
	1    0    0    -1  
$EndComp
$Comp
L R_Pack04 RN?
U 1 1 58A0D159
P 9450 1700
F 0 "RN?" V 9150 1700 50  0000 C CNN
F 1 "22" V 9650 1700 50  0000 C CNN
F 2 "" V 9725 1700 50  0001 C CNN
F 3 "" H 9450 1700 50  0000 C CNN
	1    9450 1700
	0    1    1    0   
$EndComp
$Comp
L R_Pack04 RN?
U 1 1 58A0D195
P 9450 2100
F 0 "RN?" V 9150 2400 50  0000 C CNN
F 1 "22" V 9650 2100 50  0000 C CNN
F 2 "" V 9725 2100 50  0001 C CNN
F 3 "" H 9450 2100 50  0000 C CNN
	1    9450 2100
	0    1    1    0   
$EndComp
$Comp
L R_Pack04 RN?
U 1 1 58A0D1BF
P 9450 2500
F 0 "RN?" V 9150 2800 50  0000 C CNN
F 1 "22" V 9650 2500 50  0000 C CNN
F 2 "" V 9725 2500 50  0001 C CNN
F 3 "" H 9450 2500 50  0000 C CNN
	1    9450 2500
	0    1    1    0   
$EndComp
$Comp
L R_Pack04 RN?
U 1 1 58A0D1E6
P 9450 2900
F 0 "RN?" V 9150 3200 50  0000 C CNN
F 1 "22" V 9650 2900 50  0000 C CNN
F 2 "" V 9725 2900 50  0001 C CNN
F 3 "" H 9450 2900 50  0000 C CNN
	1    9450 2900
	0    1    1    0   
$EndComp
$Comp
L R_Pack04 RN?
U 1 1 58A0D22C
P 9450 3300
F 0 "RN?" V 9150 3600 50  0000 C CNN
F 1 "22" V 9650 3300 50  0000 C CNN
F 2 "" V 9725 3300 50  0001 C CNN
F 3 "" H 9450 3300 50  0000 C CNN
	1    9450 3300
	0    1    1    0   
$EndComp
$Comp
L R_Pack04 RN?
U 1 1 58A0D53D
P 9450 3700
F 0 "RN?" V 9200 4000 50  0000 C CNN
F 1 "22" V 9650 3700 50  0000 C CNN
F 2 "" V 9725 3700 50  0001 C CNN
F 3 "" H 9450 3700 50  0000 C CNN
	1    9450 3700
	0    1    1    0   
$EndComp
$Comp
L R_Pack04 RN?
U 1 1 58A0D578
P 9450 4100
F 0 "RN?" V 9200 4400 50  0000 C CNN
F 1 "22" V 9650 4100 50  0000 C CNN
F 2 "" V 9725 4100 50  0001 C CNN
F 3 "" H 9450 4100 50  0000 C CNN
	1    9450 4100
	0    1    1    0   
$EndComp
$Comp
L R_Pack04 RN?
U 1 1 58A0D5B9
P 9450 4500
F 0 "RN?" V 9750 4500 50  0000 C CNN
F 1 "22" V 9650 4500 50  0000 C CNN
F 2 "" V 9725 4500 50  0001 C CNN
F 3 "" H 9450 4500 50  0000 C CNN
	1    9450 4500
	0    1    1    0   
$EndComp
$Comp
L R_Pack04 RN?
U 1 1 58A0DCF4
P 9450 4900
F 0 "RN?" V 9250 5150 50  0000 C CNN
F 1 "22" V 9650 4900 50  0000 C CNN
F 2 "" V 9725 4900 50  0001 C CNN
F 3 "" H 9450 4900 50  0000 C CNN
	1    9450 4900
	0    1    1    0   
$EndComp
$Comp
L R_Pack04 RN?
U 1 1 58A0DD72
P 9450 5300
F 0 "RN?" V 9250 5550 50  0000 C CNN
F 1 "22" V 9300 5050 50  0000 C CNN
F 2 "" V 9725 5300 50  0001 C CNN
F 3 "" H 9450 5300 50  0000 C CNN
	1    9450 5300
	0    1    1    0   
$EndComp
$Comp
L R R?
U 1 1 58A0DDA4
P 9500 5600
F 0 "R?" V 9580 5600 50  0000 C CNN
F 1 "22" V 9450 5800 50  0000 C CNN
F 2 "" V 9430 5600 50  0000 C CNN
F 3 "" H 9500 5600 50  0000 C CNN
	1    9500 5600
	0    1    1    0   
$EndComp
$Comp
L R R?
U 1 1 58A0DEA2
P 9500 5500
F 0 "R?" V 9580 5500 50  0000 C CNN
F 1 "22" V 9450 5700 50  0000 C CNN
F 2 "" V 9430 5500 50  0000 C CNN
F 3 "" H 9500 5500 50  0000 C CNN
	1    9500 5500
	0    1    1    0   
$EndComp
$Comp
L LTC2292 U?
U 3 1 58A30D40
P 1650 3600
F 0 "U?" H 1350 5250 60  0000 C CNN
F 1 "LTC2292" H 1350 5150 60  0000 C CNN
F 2 "" H 1650 3600 60  0001 C CNN
F 3 "" H 1650 3600 60  0001 C CNN
	3    1650 3600
	1    0    0    -1  
$EndComp
Text Label 7400 2350 0    60   ~ 0
IO_B35_LP2
Text Label 7400 2450 0    60   ~ 0
IO_B35_LN2
Text Label 7400 2550 0    60   ~ 0
IO_B35_LP4
Text Label 7400 2650 0    60   ~ 0
IO_B35_LN4
Text Label 7400 2850 0    60   ~ 0
IO_B35_LP6
Text Label 7400 2950 0    60   ~ 0
IO_B35_LN6
Text Label 7400 3050 0    60   ~ 0
IO_B35_LP8
Text Label 7400 3150 0    60   ~ 0
IO_B35_LN8
Text Label 7400 3350 0    60   ~ 0
IO_B35_LP10
Text Label 7400 3450 0    60   ~ 0
IO_B35_LN10
Text Label 7400 3550 0    60   ~ 0
IO_B35_LP12(MRCC)
Text Label 7400 3650 0    60   ~ 0
IO_B35_LN12
Text Label 7400 3950 0    60   ~ 0
IO_B35_LN14
Text Label 7400 4050 0    60   ~ 0
IO_B35_LP16
Text Label 7400 4150 0    60   ~ 0
IO_B35_LN16
Text Label 7400 4350 0    60   ~ 0
IO_B35_LP18
Text Label 7400 4450 0    60   ~ 0
IO_B35_LN18
Text Label 7400 4550 0    60   ~ 0
IO_B35_LP20
Text Label 7400 4650 0    60   ~ 0
IO_B35_LN20
Text Label 7400 4850 0    60   ~ 0
IO_B35_LP22
Text Label 7400 4950 0    60   ~ 0
IO_B35_LN22
Text Label 7400 5050 0    60   ~ 0
IO_B35_LP24
Text Label 7400 5150 0    60   ~ 0
IO_B35_LN24
Text Label 6250 4650 0    60   ~ 0
IO_B35_LP19
Text Label 6250 4750 0    60   ~ 0
IO_B35_LN19
Text Label 6250 4950 0    60   ~ 0
IO_B35_LP21
Text Label 6250 5050 0    60   ~ 0
IO_B35_LN21
Text Label 6250 5150 0    60   ~ 0
IO_B35_LP23
Text Label 6250 5250 0    60   ~ 0
IO_B35_LN23
Text Label 7400 3850 0    60   ~ 0
IO_B35_LP14(SRCC)
Text Label 6250 4550 0    60   ~ 0
IO_B35_LN17
Text Label 6250 4450 0    60   ~ 0
IO_B35_LP17
Text Label 6250 4250 0    60   ~ 0
IO_B35_LN15
Text Label 6250 4150 0    60   ~ 0
IO_B35_LP15
Text Label 6250 4050 0    60   ~ 0
IO_B35_LN13
Text Label 6250 3950 0    60   ~ 0
IO_B35_LP13(MRCC)
Text Label 6250 3750 0    60   ~ 0
IO_B35_LN11
Text Label 6250 3650 0    60   ~ 0
IO_B35_LP11(SRCC)
Text Label 6250 3550 0    60   ~ 0
IO_B35_LN9
Text Label 6250 3450 0    60   ~ 0
IO_B35_LP9
Text Label 6250 3250 0    60   ~ 0
IO_B35_LN7
Text Label 6250 3150 0    60   ~ 0
IO_B35_LP7
Text Label 6250 3050 0    60   ~ 0
IO_B35_LN5
Text Label 6250 2950 0    60   ~ 0
IO_B35_LP5
Text Label 6250 2750 0    60   ~ 0
IO_B35_LN3
Text Label 6250 2650 0    60   ~ 0
IO_B35_LP3
Text Label 6250 2550 0    60   ~ 0
IO_B35_LN1
Text Label 6250 2450 0    60   ~ 0
IO_B35_LP1
Text Label 6250 2250 0    60   ~ 0
PS_MIO13
Text Label 6250 2150 0    60   ~ 0
PS_MIO12
Text Label 6250 2050 0    60   ~ 0
PS_MIO9
Text Label 6250 1950 0    60   ~ 0
PS_MIO8
Text Label 6250 1850 0    60   ~ 0
PS_MIO0
Text Label 7400 2150 0    60   ~ 0
PS_MIO15
Text Label 7400 2050 0    60   ~ 0
PS_MIO14
Text Label 7400 1950 0    60   ~ 0
PS_MIO11
Text Label 7400 1850 0    60   ~ 0
PS_MIO10
NoConn ~ 2200 3750
NoConn ~ 2200 3850
NoConn ~ 2200 3950
NoConn ~ 2200 4050
NoConn ~ 2200 4150
NoConn ~ 2200 4250
NoConn ~ 2200 4350
NoConn ~ 2200 4450
NoConn ~ 2200 4550
NoConn ~ 2200 4650
NoConn ~ 2200 4750
NoConn ~ 2200 4850
NoConn ~ 2200 4950
Text Notes 700  1850 0    60   ~ 0
Clock to the ADC should be fed to FPGA!
Text Notes 1350 5250 0    60   ~ 0
Digital 19pin
Text Notes 9900 6050 0    60   ~ 0
digital 42pin
Text Notes 6950 5550 0    60   ~ 0
PL-48pin\nPS-9pin
$Comp
L CONN_02X40 P?
U 1 1 58A39D55
P 4250 3300
F 0 "P?" H 4250 5350 50  0000 C CNN
F 1 "CONN_02X40" V 4250 3300 50  0000 C CNN
F 2 "" H 4250 3300 50  0000 C CNN
F 3 "" H 4250 3300 50  0000 C CNN
	1    4250 3300
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR?
U 1 1 58A39D5B
P 3650 1100
F 0 "#PWR?" H 3650 950 50  0001 C CNN
F 1 "+3V3" H 3650 1240 50  0000 C CNN
F 2 "" H 3650 1100 50  0000 C CNN
F 3 "" H 3650 1100 50  0000 C CNN
	1    3650 1100
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR?
U 1 1 58A39D61
P 3900 1100
F 0 "#PWR?" H 3900 950 50  0001 C CNN
F 1 "+5V" H 3900 1240 50  0000 C CNN
F 2 "" H 3900 1100 50  0000 C CNN
F 3 "" H 3900 1100 50  0000 C CNN
	1    3900 1100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 58A39D67
P 4950 5550
F 0 "#PWR?" H 4950 5300 50  0001 C CNN
F 1 "GND" H 4950 5400 50  0000 C CNN
F 2 "" H 4950 5550 50  0000 C CNN
F 3 "" H 4950 5550 50  0000 C CNN
	1    4950 5550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 58A39D6D
P 3500 5550
F 0 "#PWR?" H 3500 5300 50  0001 C CNN
F 1 "GND" H 3500 5400 50  0000 C CNN
F 2 "" H 3500 5550 50  0000 C CNN
F 3 "" H 3500 5550 50  0000 C CNN
	1    3500 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 1100 6500 1450
Wire Wire Line
	6500 1450 6850 1450
Wire Wire Line
	6750 1100 6750 1350
Wire Wire Line
	6750 1350 6850 1350
Wire Wire Line
	7350 1350 7800 1350
Wire Wire Line
	7800 1350 7800 5550
Wire Wire Line
	7350 1450 7800 1450
Connection ~ 7800 1450
Wire Wire Line
	6350 2350 6350 5550
Wire Wire Line
	7800 2250 7350 2250
Wire Wire Line
	7350 2750 7800 2750
Wire Wire Line
	7350 3250 7800 3250
Connection ~ 7800 3250
Wire Wire Line
	7350 3750 7800 3750
Connection ~ 7800 3750
Wire Wire Line
	7350 4250 7800 4250
Connection ~ 7800 4250
Wire Wire Line
	7350 4750 7800 4750
Connection ~ 7800 4750
Wire Wire Line
	7350 5250 7800 5250
Connection ~ 7800 5250
Wire Wire Line
	6850 2350 6350 2350
Wire Wire Line
	6850 2850 6350 2850
Connection ~ 6350 2850
Wire Wire Line
	6850 3350 6350 3350
Connection ~ 6350 3350
Wire Wire Line
	6850 4350 6350 4350
Connection ~ 6350 4350
Wire Wire Line
	6850 4850 6350 4850
Connection ~ 6350 4850
Wire Wire Line
	7350 2350 8100 2350
Connection ~ 7800 2750
Connection ~ 7800 2250
Wire Wire Line
	7350 2450 8100 2450
Wire Wire Line
	7350 2550 8100 2550
Wire Wire Line
	7350 2650 8100 2650
Wire Wire Line
	7350 2850 8100 2850
Wire Wire Line
	7350 2950 8100 2950
Wire Wire Line
	7350 3050 8100 3050
Wire Wire Line
	7350 3150 8100 3150
Wire Wire Line
	7350 3350 8100 3350
Wire Wire Line
	7350 3450 8100 3450
Wire Wire Line
	7350 3550 8100 3550
Wire Wire Line
	7350 3650 8100 3650
Wire Wire Line
	7350 3850 8100 3850
Wire Wire Line
	7350 3950 8100 3950
Wire Wire Line
	7350 4050 8100 4050
Wire Wire Line
	7350 4150 8100 4150
Wire Wire Line
	7350 4350 8100 4350
Wire Wire Line
	7350 4450 8100 4450
Wire Wire Line
	7350 4550 8100 4550
Wire Wire Line
	7350 4650 8100 4650
Wire Wire Line
	7350 4850 8100 4850
Wire Wire Line
	7350 4950 8100 4950
Wire Wire Line
	7350 5050 8100 5050
Wire Wire Line
	7350 5150 8100 5150
Wire Wire Line
	6850 4950 6200 4950
Wire Wire Line
	6850 5050 6200 5050
Wire Wire Line
	6850 5150 6200 5150
Wire Wire Line
	6850 5250 6200 5250
Wire Wire Line
	6850 4750 6200 4750
Wire Wire Line
	6850 4650 6200 4650
Wire Wire Line
	6850 4450 6200 4450
Wire Wire Line
	6850 4550 6200 4550
Wire Wire Line
	6850 4250 6200 4250
Wire Wire Line
	6850 4150 6200 4150
Wire Wire Line
	6850 4050 6200 4050
Wire Wire Line
	6850 3950 6200 3950
Wire Wire Line
	6850 3850 5900 3850
Wire Wire Line
	5900 3850 5900 3600
Wire Wire Line
	6850 3750 6200 3750
Wire Wire Line
	6850 3650 6200 3650
Wire Wire Line
	6850 3550 6200 3550
Wire Wire Line
	6850 3450 6200 3450
Wire Wire Line
	6850 3250 6200 3250
Wire Wire Line
	6850 3150 6200 3150
Wire Wire Line
	6850 3050 6200 3050
Wire Wire Line
	6850 2950 6200 2950
Wire Wire Line
	6850 2750 6200 2750
Wire Wire Line
	6850 2650 6200 2650
Wire Wire Line
	6850 2550 6200 2550
Wire Wire Line
	6850 2450 6200 2450
Wire Wire Line
	6850 2250 6200 2250
Wire Wire Line
	6850 2150 6200 2150
Wire Wire Line
	6850 2050 6200 2050
Wire Wire Line
	6850 1950 6200 1950
Wire Wire Line
	6850 1850 6200 1850
Wire Wire Line
	6850 1750 6200 1750
Wire Wire Line
	6850 1650 6200 1650
Wire Wire Line
	6850 1550 6200 1550
Wire Wire Line
	7350 2150 8100 2150
Wire Wire Line
	7350 2050 8100 2050
Wire Wire Line
	7350 1950 8100 1950
Wire Wire Line
	7350 1850 8100 1850
Wire Wire Line
	3900 1100 3900 1350
Wire Wire Line
	3900 1350 4000 1350
Wire Wire Line
	4500 1350 4950 1350
Wire Wire Line
	4950 1350 4950 5550
Wire Wire Line
	4500 1450 4950 1450
Connection ~ 4950 1450
Wire Wire Line
	4500 5250 4950 5250
Connection ~ 4950 5250
Wire Wire Line
	4500 2450 4950 2450
Connection ~ 4950 2450
Wire Wire Line
	4500 2950 4950 2950
Connection ~ 4950 2950
Wire Wire Line
	4500 3450 4950 3450
Connection ~ 4950 3450
Wire Wire Line
	4500 3950 4950 3950
Connection ~ 4950 3950
Wire Wire Line
	4500 4650 4950 4650
Connection ~ 4950 4650
Wire Wire Line
	4000 4650 3500 4650
Wire Wire Line
	3500 2550 3500 5550
Wire Wire Line
	4000 3050 3500 3050
Connection ~ 3500 4650
Wire Wire Line
	4000 2550 3500 2550
Connection ~ 3500 3050
Wire Wire Line
	3650 1100 3650 1450
Wire Wire Line
	3650 1450 4000 1450
Wire Wire Line
	4000 1650 3300 1650
Wire Wire Line
	4000 1750 3300 1750
Wire Wire Line
	4000 1850 3300 1850
Wire Wire Line
	4000 1950 3300 1950
Wire Wire Line
	4000 2150 3300 2150
Wire Wire Line
	4000 2250 3300 2250
Wire Wire Line
	4000 2350 3300 2350
Wire Wire Line
	4000 2450 3300 2450
Wire Wire Line
	4000 2650 3300 2650
Wire Wire Line
	4000 2750 3300 2750
Wire Wire Line
	4000 2850 3300 2850
Wire Wire Line
	4000 2950 3300 2950
Wire Wire Line
	4000 3150 3300 3150
Wire Wire Line
	4000 3250 3300 3250
Wire Wire Line
	4000 3350 3300 3350
Wire Wire Line
	4000 3450 3300 3450
Wire Wire Line
	4000 3550 3300 3550
Wire Wire Line
	4000 3650 3300 3650
Wire Wire Line
	4500 2050 5200 2050
Wire Wire Line
	4500 2150 5200 2150
Wire Wire Line
	4500 2250 5200 2250
Wire Wire Line
	4500 2350 5200 2350
Wire Wire Line
	4500 2550 5200 2550
Wire Wire Line
	4500 2650 5200 2650
Wire Wire Line
	4500 2750 5200 2750
Wire Wire Line
	4500 2850 5200 2850
Wire Wire Line
	4500 3050 5200 3050
Wire Wire Line
	4500 3150 5200 3150
Wire Wire Line
	4500 3250 5200 3250
Wire Wire Line
	4500 3350 5200 3350
Text Label 4550 2050 0    60   ~ 0
IO_B13_LP14(SRCC)
Text Label 4550 2150 0    60   ~ 0
IO_B13_LN14
Text Label 4550 2250 0    60   ~ 0
IO_B13_LP21
Text Label 4550 2350 0    60   ~ 0
IO_B13_LN21
Text Label 4550 2550 0    60   ~ 0
IO_B34_LP1
Text Label 4550 2650 0    60   ~ 0
IO_B34_LN1
Text Label 4550 2750 0    60   ~ 0
IO_B34_LP3
Text Label 4550 2850 0    60   ~ 0
IO_B34_LN3
Text Label 4550 3050 0    60   ~ 0
IO_B34_LP5
Text Label 4550 3150 0    60   ~ 0
IO_B34_LN5
Text Label 4550 3250 0    60   ~ 0
IO_B34_LP7
Text Label 4550 3350 0    60   ~ 0
IO_B34_LN7
Text Label 3350 3650 0    60   ~ 0
IO_B34_LN11
Text Label 3350 3550 0    60   ~ 0
IO_B34_LP11(CLK?)
Text Label 3350 3450 0    60   ~ 0
IO_B34_LN8
Text Label 3350 3350 0    60   ~ 0
IO_B34_LP8
Text Label 3350 3250 0    60   ~ 0
IO_B34_LN6
Text Label 3350 3150 0    60   ~ 0
IO_B34_LP6
Text Label 3350 2950 0    60   ~ 0
IO_B34_LN4
Text Label 3350 2850 0    60   ~ 0
IO_B34_LP4
Text Label 3350 2750 0    60   ~ 0
IO_B34_LN2
Text Label 3350 2650 0    60   ~ 0
IO_B34_LP2
Text Label 3350 2450 0    60   ~ 0
IO_B13_LN15
Text Label 3350 2350 0    60   ~ 0
IO_B13_LP15
Text Label 3350 2250 0    60   ~ 0
IO_B13_LN13
Text Label 3350 2150 0    60   ~ 0
IO_B13_LP13(MRCC)
Text Label 3350 1950 0    60   ~ 0
IO_B13_LN12
Text Label 3350 1850 0    60   ~ 0
IO_B13_LP12(MRCC)
Text Label 3350 1750 0    60   ~ 0
IO_B13_LN11
Text Label 3350 1650 0    60   ~ 0
IO_B13_LP11(SRCC)
$EndSCHEMATC
