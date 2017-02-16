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
Sheet 4 6
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
P 8300 4150
F 0 "IC1" H 8300 1800 50  0000 C CNN
F 1 "CYUSB3014" H 8300 6700 50  0000 C CNN
F 2 "MODULE" H 8250 6450 50  0001 C CNN
F 3 "DOCUMENTATION" H 8300 6600 50  0001 C CNN
	1    8300 4150
	1    0    0    -1  
$EndComp
$Comp
L CONN_02X40 P2
U 1 1 58A0AB50
P 3400 3900
F 0 "P2" H 3400 5950 50  0000 C CNN
F 1 "CONN_02X40" V 3400 3900 50  0000 C CNN
F 2 "" H 3400 3900 50  0000 C CNN
F 3 "" H 3400 3900 50  0000 C CNN
	1    3400 3900
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR034
U 1 1 58A0AB93
P 2800 1700
F 0 "#PWR034" H 2800 1550 50  0001 C CNN
F 1 "+3V3" H 2800 1840 50  0000 C CNN
F 2 "" H 2800 1700 50  0000 C CNN
F 3 "" H 2800 1700 50  0000 C CNN
	1    2800 1700
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR035
U 1 1 58A0ABAF
P 3050 1700
F 0 "#PWR035" H 3050 1550 50  0001 C CNN
F 1 "+5V" H 3050 1840 50  0000 C CNN
F 2 "" H 3050 1700 50  0000 C CNN
F 3 "" H 3050 1700 50  0000 C CNN
	1    3050 1700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR036
U 1 1 58A0ADDE
P 4100 6150
F 0 "#PWR036" H 4100 5900 50  0001 C CNN
F 1 "GND" H 4100 6000 50  0000 C CNN
F 2 "" H 4100 6150 50  0000 C CNN
F 3 "" H 4100 6150 50  0000 C CNN
	1    4100 6150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR037
U 1 1 58A0B6AA
P 2650 6150
F 0 "#PWR037" H 2650 5900 50  0001 C CNN
F 1 "GND" H 2650 6000 50  0000 C CNN
F 2 "" H 2650 6150 50  0000 C CNN
F 3 "" H 2650 6150 50  0000 C CNN
	1    2650 6150
	1    0    0    -1  
$EndComp
$Comp
L R_Pack04 RN2
U 1 1 58A0D159
P 7350 2350
F 0 "RN2" V 7050 2350 50  0000 C CNN
F 1 "22" V 7550 2350 50  0000 C CNN
F 2 "" V 7625 2350 50  0001 C CNN
F 3 "" H 7350 2350 50  0000 C CNN
	1    7350 2350
	0    1    1    0   
$EndComp
$Comp
L R_Pack04 RN3
U 1 1 58A0D195
P 7350 2750
F 0 "RN3" V 7050 3050 50  0000 C CNN
F 1 "22" V 7550 2750 50  0000 C CNN
F 2 "" V 7625 2750 50  0001 C CNN
F 3 "" H 7350 2750 50  0000 C CNN
	1    7350 2750
	0    1    1    0   
$EndComp
$Comp
L R_Pack04 RN4
U 1 1 58A0D1BF
P 7350 3150
F 0 "RN4" V 7050 3450 50  0000 C CNN
F 1 "22" V 7550 3150 50  0000 C CNN
F 2 "" V 7625 3150 50  0001 C CNN
F 3 "" H 7350 3150 50  0000 C CNN
	1    7350 3150
	0    1    1    0   
$EndComp
$Comp
L R_Pack04 RN5
U 1 1 58A0D1E6
P 7350 3550
F 0 "RN5" V 7050 3850 50  0000 C CNN
F 1 "22" V 7550 3550 50  0000 C CNN
F 2 "" V 7625 3550 50  0001 C CNN
F 3 "" H 7350 3550 50  0000 C CNN
	1    7350 3550
	0    1    1    0   
$EndComp
$Comp
L R_Pack04 RN6
U 1 1 58A0D22C
P 7350 3950
F 0 "RN6" V 7050 4250 50  0000 C CNN
F 1 "22" V 7550 3950 50  0000 C CNN
F 2 "" V 7625 3950 50  0001 C CNN
F 3 "" H 7350 3950 50  0000 C CNN
	1    7350 3950
	0    1    1    0   
$EndComp
$Comp
L R_Pack04 RN7
U 1 1 58A0D53D
P 7350 4350
F 0 "RN7" V 7100 4650 50  0000 C CNN
F 1 "22" V 7550 4350 50  0000 C CNN
F 2 "" V 7625 4350 50  0001 C CNN
F 3 "" H 7350 4350 50  0000 C CNN
	1    7350 4350
	0    1    1    0   
$EndComp
$Comp
L R_Pack04 RN8
U 1 1 58A0D578
P 7350 4750
F 0 "RN8" V 7100 5050 50  0000 C CNN
F 1 "22" V 7550 4750 50  0000 C CNN
F 2 "" V 7625 4750 50  0001 C CNN
F 3 "" H 7350 4750 50  0000 C CNN
	1    7350 4750
	0    1    1    0   
$EndComp
$Comp
L R_Pack04 RN9
U 1 1 58A0D5B9
P 7350 5150
F 0 "RN9" V 7650 5150 50  0000 C CNN
F 1 "22" V 7550 5150 50  0000 C CNN
F 2 "" V 7625 5150 50  0001 C CNN
F 3 "" H 7350 5150 50  0000 C CNN
	1    7350 5150
	0    1    1    0   
$EndComp
$Comp
L R_Pack04 RN10
U 1 1 58A0DCF4
P 7350 5550
F 0 "RN10" V 7150 5800 50  0000 C CNN
F 1 "22" V 7550 5550 50  0000 C CNN
F 2 "" V 7625 5550 50  0001 C CNN
F 3 "" H 7350 5550 50  0000 C CNN
	1    7350 5550
	0    1    1    0   
$EndComp
$Comp
L R_Pack04 RN11
U 1 1 58A0DD72
P 7350 5950
F 0 "RN11" V 7150 6200 50  0000 C CNN
F 1 "22" V 7200 5700 50  0000 C CNN
F 2 "" V 7625 5950 50  0001 C CNN
F 3 "" H 7350 5950 50  0000 C CNN
	1    7350 5950
	0    1    1    0   
$EndComp
$Comp
L R R12
U 1 1 58A0DDA4
P 7400 6250
F 0 "R12" V 7480 6250 50  0000 C CNN
F 1 "22" V 7350 6450 50  0000 C CNN
F 2 "" V 7330 6250 50  0000 C CNN
F 3 "" H 7400 6250 50  0000 C CNN
	1    7400 6250
	0    1    1    0   
$EndComp
$Comp
L R R11
U 1 1 58A0DEA2
P 7400 6150
F 0 "R11" V 7480 6150 50  0000 C CNN
F 1 "22" V 7350 6350 50  0000 C CNN
F 2 "" V 7330 6150 50  0000 C CNN
F 3 "" H 7400 6150 50  0000 C CNN
	1    7400 6150
	0    1    1    0   
$EndComp
Text Label 3700 2950 0    60   ~ 0
IO_B35_LP2
Text Label 3700 3050 0    60   ~ 0
IO_B35_LN2
Text Label 3700 3150 0    60   ~ 0
IO_B35_LP4
Text Label 3700 3250 0    60   ~ 0
IO_B35_LN4
Text Label 3700 3450 0    60   ~ 0
IO_B35_LP6
Text Label 3700 3550 0    60   ~ 0
IO_B35_LN6
Text Label 3700 3650 0    60   ~ 0
IO_B35_LP8
Text Label 3700 3750 0    60   ~ 0
IO_B35_LN8
Text Label 3700 3950 0    60   ~ 0
IO_B35_LP10
Text Label 3700 4050 0    60   ~ 0
IO_B35_LN10
Text Label 3700 4150 0    60   ~ 0
IO_B35_LP12(MRCC)
Text Label 3700 4250 0    60   ~ 0
IO_B35_LN12
Text Label 3700 4550 0    60   ~ 0
IO_B35_LN14
Text Label 3700 4650 0    60   ~ 0
IO_B35_LP16
Text Label 3700 4750 0    60   ~ 0
IO_B35_LN16
Text Label 3700 4950 0    60   ~ 0
IO_B35_LP18
Text Label 3700 5050 0    60   ~ 0
IO_B35_LN18
Text Label 3700 5150 0    60   ~ 0
IO_B35_LP20
Text Label 3700 5250 0    60   ~ 0
IO_B35_LN20
Text Label 3700 5450 0    60   ~ 0
IO_B35_LP22
Text Label 3700 5550 0    60   ~ 0
IO_B35_LN22
Text Label 3700 5650 0    60   ~ 0
IO_B35_LP24
Text Label 3700 5750 0    60   ~ 0
IO_B35_LN24
Text Label 2550 5250 0    60   ~ 0
IO_B35_LP19
Text Label 2550 5350 0    60   ~ 0
IO_B35_LN19
Text Label 2550 5550 0    60   ~ 0
IO_B35_LP21
Text Label 2550 5650 0    60   ~ 0
IO_B35_LN21
Text Label 2550 5750 0    60   ~ 0
IO_B35_LP23
Text Label 2550 5850 0    60   ~ 0
IO_B35_LN23
Text Label 3700 4450 0    60   ~ 0
IO_B35_LP14(SRCC)
Text Label 2550 5150 0    60   ~ 0
IO_B35_LN17
Text Label 2550 5050 0    60   ~ 0
IO_B35_LP17
Text Label 2550 4850 0    60   ~ 0
IO_B35_LN15
Text Label 2550 4750 0    60   ~ 0
IO_B35_LP15
Text Label 2550 4650 0    60   ~ 0
IO_B35_LN13
Text Label 2550 4550 0    60   ~ 0
IO_B35_LP13(MRCC)
Text Label 2550 4350 0    60   ~ 0
IO_B35_LN11
Text Label 2550 4250 0    60   ~ 0
IO_B35_LP11(SRCC)
Text Label 2550 4150 0    60   ~ 0
IO_B35_LN9
Text Label 2550 4050 0    60   ~ 0
IO_B35_LP9
Text Label 2550 3850 0    60   ~ 0
IO_B35_LN7
Text Label 2550 3750 0    60   ~ 0
IO_B35_LP7
Text Label 2550 3650 0    60   ~ 0
IO_B35_LN5
Text Label 2550 3550 0    60   ~ 0
IO_B35_LP5
Text Label 2550 3350 0    60   ~ 0
IO_B35_LN3
Text Label 2550 3250 0    60   ~ 0
IO_B35_LP3
Text Label 2550 3150 0    60   ~ 0
IO_B35_LN1
Text Label 2550 3050 0    60   ~ 0
IO_B35_LP1
Text Label 2550 2850 0    60   ~ 0
PS_MIO13
Text Label 2550 2750 0    60   ~ 0
PS_MIO12
Text Label 2550 2650 0    60   ~ 0
PS_MIO9
Text Label 2550 2550 0    60   ~ 0
PS_MIO8
Text Label 2550 2450 0    60   ~ 0
PS_MIO0
Text Label 3700 2750 0    60   ~ 0
PS_MIO15
Text Label 3700 2650 0    60   ~ 0
PS_MIO14
Text Label 3700 2550 0    60   ~ 0
PS_MIO11
Text Label 3700 2450 0    60   ~ 0
PS_MIO10
Text Notes 7800 6700 0    60   ~ 0
digital 42pin
Text Notes 3250 6150 0    60   ~ 0
PL-48pin\nPS-9pin
Text GLabel 4400 2950 2    60   Input ~ 0
FX3_RESET#
Text GLabel 2500 3050 0    60   Input ~ 0
FX3_CTL[15]
Text Label 6450 2150 0    60   ~ 0
IO_B35_LP4
Text Label 6450 2250 0    60   ~ 0
IO_B35_LN4
Text Label 6450 2350 0    60   ~ 0
IO_B35_LP6
Text Label 6450 2450 0    60   ~ 0
IO_B35_LN6
Text Label 6450 2550 0    60   ~ 0
IO_B35_LP8
Text Label 6450 2650 0    60   ~ 0
IO_B35_LN8
Text Label 6450 2750 0    60   ~ 0
IO_B35_LP10
Text Label 6450 2850 0    60   ~ 0
IO_B35_LN10
Text Label 6450 2950 0    60   ~ 0
IO_B35_LP12(MRCC)
Text Label 6450 3050 0    60   ~ 0
IO_B35_LN12
Text Label 6450 3250 0    60   ~ 0
IO_B35_LN14
Text Label 6450 3350 0    60   ~ 0
IO_B35_LP16
Text Label 6450 3450 0    60   ~ 0
IO_B35_LN16
Text Label 6450 3150 0    60   ~ 0
IO_B35_LP14(SRCC)
Text Label 6450 5950 0    60   ~ 0
IO_B35_LP22
Text Label 6450 6050 0    60   ~ 0
IO_B35_LN22
Text Label 6450 6150 0    60   ~ 0
IO_B35_LP24
Text Label 6450 6250 0    60   ~ 0
IO_B35_LN24
Text Label 6550 5550 0    60   ~ 0
IO_B35_LP21
Text Label 6550 5650 0    60   ~ 0
IO_B35_LN21
Text Label 6550 5750 0    60   ~ 0
IO_B35_LP23
Text Label 6550 5850 0    60   ~ 0
IO_B35_LN23
Text Label 6450 5150 0    60   ~ 0
IO_B35_LP18
Text Label 6450 5250 0    60   ~ 0
IO_B35_LN18
Text Label 6450 5350 0    60   ~ 0
IO_B35_LP20
Text Label 6450 5450 0    60   ~ 0
IO_B35_LN20
Text Label 6550 4950 0    60   ~ 0
IO_B35_LP19
Text Label 6550 5050 0    60   ~ 0
IO_B35_LN19
Text Label 6550 4850 0    60   ~ 0
IO_B35_LN17
Text Label 6550 4750 0    60   ~ 0
IO_B35_LP17
Text Label 6550 4650 0    60   ~ 0
IO_B35_LN15
Text Label 6550 4550 0    60   ~ 0
IO_B35_LP15
Text Label 6550 4450 0    60   ~ 0
IO_B35_LN13
Text Label 6550 4350 0    60   ~ 0
IO_B35_LP13(MRCC)
Text Label 6550 4250 0    60   ~ 0
IO_B35_LN11
Text Label 6550 4150 0    60   ~ 0
IO_B35_LP11(SRCC)
Text Label 6550 4050 0    60   ~ 0
IO_B35_LN9
Text Label 6550 3950 0    60   ~ 0
IO_B35_LP9
Text Label 6550 3850 0    60   ~ 0
IO_B35_LN7
Text Label 6550 3750 0    60   ~ 0
IO_B35_LP7
Text Label 6550 3650 0    60   ~ 0
IO_B35_LN5
Text Label 6550 3550 0    60   ~ 0
IO_B35_LP5
Text GLabel 2500 3250 0    60   Input ~ 0
FX3_GPIO[45]
Text Notes 5100 800  0    60   ~ 0
Bank13,34,35=3.3V
$Comp
L +3V3 #PWR038
U 1 1 58A4E210
P 7900 850
F 0 "#PWR038" H 7900 700 50  0001 C CNN
F 1 "+3V3" H 7900 990 50  0000 C CNN
F 2 "" H 7900 850 50  0000 C CNN
F 3 "" H 7900 850 50  0000 C CNN
	1    7900 850 
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR039
U 1 1 58A4E244
P 8300 850
F 0 "#PWR039" H 8300 700 50  0001 C CNN
F 1 "+5V" H 8300 990 50  0000 C CNN
F 2 "" H 8300 850 50  0000 C CNN
F 3 "" H 8300 850 50  0000 C CNN
	1    8300 850 
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR040
U 1 1 58A4E278
P 8650 900
F 0 "#PWR040" H 8650 650 50  0001 C CNN
F 1 "GND" H 8650 750 50  0000 C CNN
F 2 "" H 8650 900 50  0000 C CNN
F 3 "" H 8650 900 50  0000 C CNN
	1    8650 900 
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG041
U 1 1 58A4E2AC
P 8650 900
F 0 "#FLG041" H 8650 995 50  0001 C CNN
F 1 "PWR_FLAG" H 8650 1080 50  0000 C CNN
F 2 "" H 8650 900 50  0000 C CNN
F 3 "" H 8650 900 50  0000 C CNN
	1    8650 900 
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG042
U 1 1 58A4E2FE
P 8300 850
F 0 "#FLG042" H 8300 945 50  0001 C CNN
F 1 "PWR_FLAG" H 8300 1030 50  0000 C CNN
F 2 "" H 8300 850 50  0000 C CNN
F 3 "" H 8300 850 50  0000 C CNN
	1    8300 850 
	-1   0    0    1   
$EndComp
$Comp
L PWR_FLAG #FLG043
U 1 1 58A4E385
P 7900 850
F 0 "#FLG043" H 7900 945 50  0001 C CNN
F 1 "PWR_FLAG" H 7900 1030 50  0000 C CNN
F 2 "" H 7900 850 50  0000 C CNN
F 3 "" H 7900 850 50  0000 C CNN
	1    7900 850 
	-1   0    0    1   
$EndComp
NoConn ~ 2500 2750
NoConn ~ 2500 2850
NoConn ~ 4400 2450
NoConn ~ 4400 2550
NoConn ~ 4400 2650
NoConn ~ 4400 2750
Text GLabel 4400 3050 2    60   Input ~ 0
FX3_GPIO[27]
Text GLabel 2500 3350 0    60   Input ~ 0
FX3_GPIO[26]
Wire Wire Line
	2800 1700 2800 2050
Wire Wire Line
	2800 2050 3150 2050
Wire Wire Line
	3050 1700 3050 1950
Wire Wire Line
	3050 1950 3150 1950
Wire Wire Line
	3650 1950 4100 1950
Wire Wire Line
	4100 1950 4100 6150
Wire Wire Line
	3650 2050 4100 2050
Connection ~ 4100 2050
Wire Wire Line
	2650 2950 2650 6150
Wire Wire Line
	4100 2850 3650 2850
Wire Wire Line
	3650 3350 4100 3350
Wire Wire Line
	3650 3850 4100 3850
Connection ~ 4100 3850
Wire Wire Line
	3650 4350 4100 4350
Connection ~ 4100 4350
Wire Wire Line
	3650 4850 4100 4850
Connection ~ 4100 4850
Wire Wire Line
	3650 5350 4100 5350
Connection ~ 4100 5350
Wire Wire Line
	3650 5850 4100 5850
Connection ~ 4100 5850
Wire Wire Line
	3150 2950 2650 2950
Wire Wire Line
	3150 3450 2650 3450
Connection ~ 2650 3450
Wire Wire Line
	3150 3950 2650 3950
Connection ~ 2650 3950
Wire Wire Line
	3150 4950 2650 4950
Connection ~ 2650 4950
Wire Wire Line
	3150 5450 2650 5450
Connection ~ 2650 5450
Wire Wire Line
	3650 2950 4400 2950
Connection ~ 4100 3350
Connection ~ 4100 2850
Wire Wire Line
	3650 3050 4400 3050
Wire Wire Line
	3650 3150 4400 3150
Wire Wire Line
	3650 3250 4400 3250
Wire Wire Line
	3650 3450 4400 3450
Wire Wire Line
	3650 3550 4400 3550
Wire Wire Line
	3650 3650 4400 3650
Wire Wire Line
	3650 3750 4400 3750
Wire Wire Line
	3650 3950 4400 3950
Wire Wire Line
	3650 4050 4400 4050
Wire Wire Line
	3650 4150 4400 4150
Wire Wire Line
	3650 4250 4400 4250
Wire Wire Line
	3650 4450 4400 4450
Wire Wire Line
	3650 4550 4400 4550
Wire Wire Line
	3650 4650 4400 4650
Wire Wire Line
	3650 4750 4400 4750
Wire Wire Line
	3650 4950 4400 4950
Wire Wire Line
	3650 5050 4400 5050
Wire Wire Line
	3650 5150 4400 5150
Wire Wire Line
	3650 5250 4400 5250
Wire Wire Line
	3650 5450 4400 5450
Wire Wire Line
	3650 5550 4400 5550
Wire Wire Line
	3650 5650 4400 5650
Wire Wire Line
	3650 5750 4400 5750
Wire Wire Line
	3150 5550 2500 5550
Wire Wire Line
	3150 5650 2500 5650
Wire Wire Line
	3150 5750 2500 5750
Wire Wire Line
	3150 5850 2500 5850
Wire Wire Line
	3150 5350 2500 5350
Wire Wire Line
	3150 5250 2500 5250
Wire Wire Line
	3150 5050 2500 5050
Wire Wire Line
	3150 5150 2500 5150
Wire Wire Line
	3150 4850 2500 4850
Wire Wire Line
	3150 4750 2500 4750
Wire Wire Line
	3150 4650 2500 4650
Wire Wire Line
	3150 4550 2500 4550
Wire Wire Line
	3150 4450 2200 4450
Wire Wire Line
	2200 4450 2200 4200
Wire Wire Line
	3150 4350 2500 4350
Wire Wire Line
	3150 4250 2500 4250
Wire Wire Line
	3150 4150 2500 4150
Wire Wire Line
	3150 4050 2500 4050
Wire Wire Line
	3150 3850 2500 3850
Wire Wire Line
	3150 3750 2500 3750
Wire Wire Line
	3150 3650 2500 3650
Wire Wire Line
	3150 3550 2500 3550
Wire Wire Line
	3150 3350 2500 3350
Wire Wire Line
	3150 3250 2500 3250
Wire Wire Line
	3150 3150 2500 3150
Wire Wire Line
	3150 3050 2500 3050
Wire Wire Line
	3150 2850 2500 2850
Wire Wire Line
	3150 2750 2500 2750
Wire Wire Line
	3150 2650 2500 2650
Wire Wire Line
	3150 2550 2500 2550
Wire Wire Line
	3150 2450 2500 2450
Wire Wire Line
	3150 2350 2500 2350
Wire Wire Line
	3150 2250 2500 2250
Wire Wire Line
	3150 2150 2500 2150
Wire Wire Line
	3650 2750 4400 2750
Wire Wire Line
	3650 2650 4400 2650
Wire Wire Line
	3650 2550 4400 2550
Wire Wire Line
	3650 2450 4400 2450
Wire Wire Line
	6400 2150 7150 2150
Wire Wire Line
	6400 2250 7150 2250
Wire Wire Line
	6400 2350 7150 2350
Wire Wire Line
	6400 2450 7150 2450
Wire Wire Line
	6400 2550 7150 2550
Wire Wire Line
	6400 2650 7150 2650
Wire Wire Line
	6400 2750 7150 2750
Wire Wire Line
	6400 2850 7150 2850
Wire Wire Line
	6400 2950 7150 2950
Wire Wire Line
	6400 3050 7150 3050
Wire Wire Line
	6400 3150 7150 3150
Wire Wire Line
	6400 3250 7150 3250
Wire Wire Line
	6400 3350 7150 3350
Wire Wire Line
	6400 3450 7150 3450
Wire Wire Line
	6400 5950 7150 5950
Wire Wire Line
	6400 6050 7150 6050
Wire Wire Line
	6400 6150 7250 6150
Wire Wire Line
	6400 6250 7250 6250
Wire Wire Line
	7150 5550 6500 5550
Wire Wire Line
	7150 5650 6500 5650
Wire Wire Line
	7150 5750 6500 5750
Wire Wire Line
	7150 5850 6500 5850
Wire Wire Line
	6400 5150 7150 5150
Wire Wire Line
	6400 5250 7150 5250
Wire Wire Line
	6400 5350 7150 5350
Wire Wire Line
	6400 5450 7150 5450
Wire Wire Line
	7150 5050 6500 5050
Wire Wire Line
	7150 4950 6500 4950
Wire Wire Line
	7150 4750 6500 4750
Wire Wire Line
	7150 4850 6500 4850
Wire Wire Line
	7150 4650 6500 4650
Wire Wire Line
	7150 4550 6500 4550
Wire Wire Line
	7150 4450 6500 4450
Wire Wire Line
	7150 4350 6500 4350
Wire Wire Line
	7150 4250 6500 4250
Wire Wire Line
	7150 4150 6500 4150
Wire Wire Line
	7150 4050 6500 4050
Wire Wire Line
	7150 3950 6500 3950
Wire Wire Line
	7150 3850 6500 3850
Wire Wire Line
	7150 3750 6500 3750
Wire Wire Line
	7150 3650 6500 3650
Wire Wire Line
	7150 3550 6500 3550
Text GLabel 2250 1050 0    60   Input ~ 0
PG_FX3VDD
Wire Wire Line
	2250 1050 2800 1050
Text Label 2350 1050 0    60   ~ 0
IO_B13_LP15
NoConn ~ 2500 2650
NoConn ~ 2500 2550
NoConn ~ 2500 2450
Text Label 2550 2150 0    60   ~ 0
XADC_INP0
Text Label 2550 2250 0    60   ~ 0
XADC_INN0
NoConn ~ 2500 2150
NoConn ~ 2500 2250
Text Label 2550 2350 0    60   ~ 0
XADC_VCC
NoConn ~ 2500 2350
Wire Wire Line
	3650 2150 4400 2150
Wire Wire Line
	3650 2250 4400 2250
Wire Wire Line
	3650 2350 4400 2350
NoConn ~ 4400 2150
NoConn ~ 4400 2250
NoConn ~ 4400 2350
Text Label 3700 2150 0    60   ~ 0
XADC_TEMP_P
Text Label 3700 2250 0    60   ~ 0
XADC_TEMP_N
Text Label 3700 2350 0    60   ~ 0
XADC_GND
Text Label 2250 4450 0    60   ~ 0
VDDIO_35_PL
NoConn ~ 2500 3150
$EndSCHEMATC
