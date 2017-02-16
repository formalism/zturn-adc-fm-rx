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
Sheet 2 3
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
L LTC2292 U1
U 3 1 58A30D40
P 2750 3200
F 0 "U1" H 2450 4850 60  0000 C CNN
F 1 "LTC2292" H 2450 4750 60  0000 C CNN
F 2 "" H 2750 3200 60  0001 C CNN
F 3 "" H 2750 3200 60  0001 C CNN
	3    2750 3200
	1    0    0    -1  
$EndComp
NoConn ~ 3300 3350
NoConn ~ 3300 3450
NoConn ~ 3300 3550
NoConn ~ 3300 3650
NoConn ~ 3300 3750
NoConn ~ 3300 3850
NoConn ~ 3300 3950
NoConn ~ 3300 4050
NoConn ~ 3300 4150
NoConn ~ 3300 4250
NoConn ~ 3300 4350
NoConn ~ 3300 4450
NoConn ~ 3300 4550
Text Notes 1800 1450 0    60   ~ 0
Clock to the ADC should be fed to FPGA!
Text Notes 2450 4850 0    60   ~ 0
Digital 19pin
$Comp
L CONN_02X40 P1
U 1 1 58A39D55
P 6900 3700
F 0 "P1" H 6900 5750 50  0000 C CNN
F 1 "CONN_02X40" V 6900 3700 50  0000 C CNN
F 2 "" H 6900 3700 50  0000 C CNN
F 3 "" H 6900 3700 50  0000 C CNN
	1    6900 3700
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR01
U 1 1 58A39D5B
P 6300 1500
F 0 "#PWR01" H 6300 1350 50  0001 C CNN
F 1 "+3V3" H 6300 1640 50  0000 C CNN
F 2 "" H 6300 1500 50  0000 C CNN
F 3 "" H 6300 1500 50  0000 C CNN
	1    6300 1500
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR02
U 1 1 58A39D61
P 6550 1500
F 0 "#PWR02" H 6550 1350 50  0001 C CNN
F 1 "+5V" H 6550 1640 50  0000 C CNN
F 2 "" H 6550 1500 50  0000 C CNN
F 3 "" H 6550 1500 50  0000 C CNN
	1    6550 1500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR03
U 1 1 58A39D67
P 7600 5950
F 0 "#PWR03" H 7600 5700 50  0001 C CNN
F 1 "GND" H 7600 5800 50  0000 C CNN
F 2 "" H 7600 5950 50  0000 C CNN
F 3 "" H 7600 5950 50  0000 C CNN
	1    7600 5950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR04
U 1 1 58A39D6D
P 6150 5950
F 0 "#PWR04" H 6150 5700 50  0001 C CNN
F 1 "GND" H 6150 5800 50  0000 C CNN
F 2 "" H 6150 5950 50  0000 C CNN
F 3 "" H 6150 5950 50  0000 C CNN
	1    6150 5950
	1    0    0    -1  
$EndComp
Text Label 7200 2450 0    60   ~ 0
IO_B13_LP14(SRCC)
Text Label 7200 2550 0    60   ~ 0
IO_B13_LN14
Text Label 7200 2650 0    60   ~ 0
IO_B13_LP21
Text Label 7200 2750 0    60   ~ 0
IO_B13_LN21
Text Label 7200 2950 0    60   ~ 0
IO_B34_LP1
Text Label 7200 3050 0    60   ~ 0
IO_B34_LN1
Text Label 7200 3150 0    60   ~ 0
IO_B34_LP3
Text Label 7200 3250 0    60   ~ 0
IO_B34_LN3
Text Label 7200 3450 0    60   ~ 0
IO_B34_LP5
Text Label 7200 3550 0    60   ~ 0
IO_B34_LN5
Text Label 7200 3650 0    60   ~ 0
IO_B34_LP7
Text Label 7200 3750 0    60   ~ 0
IO_B34_LN7
Text Label 6000 4050 0    60   ~ 0
IO_B34_LN11
Text Label 6000 3950 0    60   ~ 0
IO_B34_LP11(CLK?)
Text Label 6000 3850 0    60   ~ 0
IO_B34_LN8
Text Label 6000 3750 0    60   ~ 0
IO_B34_LP8
Text Label 6000 3650 0    60   ~ 0
IO_B34_LN6
Text Label 6000 3550 0    60   ~ 0
IO_B34_LP6
Text Label 6000 3350 0    60   ~ 0
IO_B34_LN4
Text Label 6000 3250 0    60   ~ 0
IO_B34_LP4
Text Label 6000 3150 0    60   ~ 0
IO_B34_LN2
Text Label 6000 3050 0    60   ~ 0
IO_B34_LP2
Text Label 6000 2850 0    60   ~ 0
IO_B13_LN15
Text Label 6000 2750 0    60   ~ 0
IO_B13_LP15
Text Label 6000 2650 0    60   ~ 0
IO_B13_LN13
Text Label 6000 2550 0    60   ~ 0
IO_B13_LP13(MRCC)
Text Label 6000 2350 0    60   ~ 0
IO_B13_LN12
Text Label 6000 2250 0    60   ~ 0
IO_B13_LP12(MRCC)
Text Label 6000 2150 0    60   ~ 0
IO_B13_LN11
Text Label 6000 2050 0    60   ~ 0
IO_B13_LP11(SRCC)
Text Label 3950 2750 0    60   ~ 0
IO_B34_LP5
Text Label 3950 2850 0    60   ~ 0
IO_B34_LN5
Text Label 3950 2950 0    60   ~ 0
IO_B34_LP7
Text Label 3950 3050 0    60   ~ 0
IO_B34_LN7
Text Label 3950 2650 0    60   ~ 0
IO_B34_LN4
Text Label 3950 2550 0    60   ~ 0
IO_B34_LP4
Text Label 3950 2450 0    60   ~ 0
IO_B34_LN2
Text Label 3950 2350 0    60   ~ 0
IO_B34_LP2
Text Label 3950 1950 0    60   ~ 0
IO_B34_LP1
Text Label 3950 2050 0    60   ~ 0
IO_B34_LN1
Text Label 3950 2150 0    60   ~ 0
IO_B34_LP3
Text Label 3950 2250 0    60   ~ 0
IO_B34_LN3
Text Label 3950 1850 0    60   ~ 0
IO_B13_LN15
Text Label 1550 2900 0    60   ~ 0
IO_B34_LN8
Text Label 1550 2800 0    60   ~ 0
IO_B34_LP8
Text Label 1550 2700 0    60   ~ 0
IO_B34_LN6
Text Label 1550 2600 0    60   ~ 0
IO_B34_LP6
NoConn ~ 5950 3950
NoConn ~ 5950 4050
Text Notes 5100 800  0    60   ~ 0
Bank13,34,35=3.3V
$Comp
L +3V3 #PWR05
U 1 1 58A4E210
P 7900 850
F 0 "#PWR05" H 7900 700 50  0001 C CNN
F 1 "+3V3" H 7900 990 50  0000 C CNN
F 2 "" H 7900 850 50  0000 C CNN
F 3 "" H 7900 850 50  0000 C CNN
	1    7900 850 
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR06
U 1 1 58A4E244
P 8300 850
F 0 "#PWR06" H 8300 700 50  0001 C CNN
F 1 "+5V" H 8300 990 50  0000 C CNN
F 2 "" H 8300 850 50  0000 C CNN
F 3 "" H 8300 850 50  0000 C CNN
	1    8300 850 
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR07
U 1 1 58A4E278
P 8650 900
F 0 "#PWR07" H 8650 650 50  0001 C CNN
F 1 "GND" H 8650 750 50  0000 C CNN
F 2 "" H 8650 900 50  0000 C CNN
F 3 "" H 8650 900 50  0000 C CNN
	1    8650 900 
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG08
U 1 1 58A4E2AC
P 8650 900
F 0 "#FLG08" H 8650 995 50  0001 C CNN
F 1 "PWR_FLAG" H 8650 1080 50  0000 C CNN
F 2 "" H 8650 900 50  0000 C CNN
F 3 "" H 8650 900 50  0000 C CNN
	1    8650 900 
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG09
U 1 1 58A4E2FE
P 8300 850
F 0 "#FLG09" H 8300 945 50  0001 C CNN
F 1 "PWR_FLAG" H 8300 1030 50  0000 C CNN
F 2 "" H 8300 850 50  0000 C CNN
F 3 "" H 8300 850 50  0000 C CNN
	1    8300 850 
	-1   0    0    1   
$EndComp
$Comp
L PWR_FLAG #FLG010
U 1 1 58A4E385
P 7900 850
F 0 "#FLG010" H 7900 945 50  0001 C CNN
F 1 "PWR_FLAG" H 7900 1030 50  0000 C CNN
F 2 "" H 7900 850 50  0000 C CNN
F 3 "" H 7900 850 50  0000 C CNN
	1    7900 850 
	-1   0    0    1   
$EndComp
NoConn ~ 7150 3950
NoConn ~ 7150 4050
NoConn ~ 7150 4150
NoConn ~ 7150 4250
NoConn ~ 7150 4450
NoConn ~ 7150 4550
NoConn ~ 7150 4650
NoConn ~ 7150 4750
NoConn ~ 7150 4850
NoConn ~ 7150 4950
NoConn ~ 7150 5150
NoConn ~ 7150 5250
NoConn ~ 7150 5350
NoConn ~ 7150 5450
NoConn ~ 6650 4150
NoConn ~ 6650 4250
NoConn ~ 6650 4350
NoConn ~ 6650 4450
NoConn ~ 6650 4550
NoConn ~ 6650 4650
NoConn ~ 6650 4750
NoConn ~ 6650 4850
NoConn ~ 6650 4950
NoConn ~ 6650 5150
NoConn ~ 6650 5250
NoConn ~ 6650 5350
NoConn ~ 6650 5450
NoConn ~ 6650 5550
NoConn ~ 7150 5550
NoConn ~ 6650 5650
Text Label 1550 2450 0    60   ~ 0
IO_B13_LP11(SRCC)
$Comp
L +3V3 #PWR011
U 1 1 58A5E943
P 1800 5900
F 0 "#PWR011" H 1800 5750 50  0001 C CNN
F 1 "+3V3" H 1800 6040 50  0000 C CNN
F 2 "" H 1800 5900 50  0000 C CNN
F 3 "" H 1800 5900 50  0000 C CNN
	1    1800 5900
	1    0    0    -1  
$EndComp
$Comp
L R R24
U 1 1 58A5E977
P 1800 6150
F 0 "R24" V 1880 6150 50  0000 C CNN
F 1 "1k" V 1800 6150 50  0000 C CNN
F 2 "" V 1730 6150 50  0000 C CNN
F 3 "" H 1800 6150 50  0000 C CNN
	1    1800 6150
	1    0    0    -1  
$EndComp
$Comp
L R R25
U 1 1 58A5EA97
P 1800 6550
F 0 "R25" V 1880 6550 50  0000 C CNN
F 1 "1k" V 1800 6550 50  0000 C CNN
F 2 "" V 1730 6550 50  0000 C CNN
F 3 "" H 1800 6550 50  0000 C CNN
	1    1800 6550
	1    0    0    -1  
$EndComp
$Comp
L R R26
U 1 1 58A5EADA
P 1800 6950
F 0 "R26" V 1880 6950 50  0000 C CNN
F 1 "1k" V 1800 6950 50  0000 C CNN
F 2 "" V 1730 6950 50  0000 C CNN
F 3 "" H 1800 6950 50  0000 C CNN
	1    1800 6950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR012
U 1 1 58A5EE0A
P 3150 7100
F 0 "#PWR012" H 3150 6850 50  0001 C CNN
F 1 "GND" H 3150 6950 50  0000 C CNN
F 2 "" H 3150 7100 50  0000 C CNN
F 3 "" H 3150 7100 50  0000 C CNN
	1    3150 7100
	1    0    0    -1  
$EndComp
$Comp
L C C53
U 1 1 58A5EE44
P 3150 6950
F 0 "C53" H 3175 7050 50  0000 L CNN
F 1 "0.1u" H 3175 6850 50  0000 L CNN
F 2 "" H 3188 6800 50  0000 C CNN
F 3 "" H 3150 6950 50  0000 C CNN
	1    3150 6950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 1500 6550 1750
Wire Wire Line
	6550 1750 6650 1750
Wire Wire Line
	7150 1750 7600 1750
Wire Wire Line
	7600 1750 7600 5950
Wire Wire Line
	7150 1850 7600 1850
Connection ~ 7600 1850
Wire Wire Line
	7150 5650 7600 5650
Connection ~ 7600 5650
Wire Wire Line
	7150 2850 7600 2850
Connection ~ 7600 2850
Wire Wire Line
	7150 3350 7600 3350
Connection ~ 7600 3350
Wire Wire Line
	7150 3850 7600 3850
Connection ~ 7600 3850
Wire Wire Line
	7150 4350 7600 4350
Connection ~ 7600 4350
Wire Wire Line
	7150 5050 7600 5050
Connection ~ 7600 5050
Wire Wire Line
	6150 5050 6650 5050
Wire Wire Line
	6150 2950 6150 5950
Wire Wire Line
	6650 3450 6150 3450
Connection ~ 6150 5050
Wire Wire Line
	6650 2950 6150 2950
Connection ~ 6150 3450
Wire Wire Line
	6300 1500 6300 1850
Wire Wire Line
	6300 1850 6650 1850
Wire Wire Line
	6650 2050 5950 2050
Wire Wire Line
	6650 2150 5950 2150
Wire Wire Line
	6650 2250 5950 2250
Wire Wire Line
	6650 2350 5950 2350
Wire Wire Line
	6650 2550 5950 2550
Wire Wire Line
	6650 2650 5950 2650
Wire Wire Line
	6650 2750 5950 2750
Wire Wire Line
	6650 2850 5950 2850
Wire Wire Line
	6650 3050 5950 3050
Wire Wire Line
	6650 3150 5950 3150
Wire Wire Line
	6650 3250 5950 3250
Wire Wire Line
	6650 3350 5950 3350
Wire Wire Line
	6650 3550 5950 3550
Wire Wire Line
	6650 3650 5950 3650
Wire Wire Line
	6650 3750 5950 3750
Wire Wire Line
	6650 3850 5950 3850
Wire Wire Line
	6650 3950 5950 3950
Wire Wire Line
	6650 4050 5950 4050
Wire Wire Line
	7150 2450 7850 2450
Wire Wire Line
	7150 2550 7850 2550
Wire Wire Line
	7150 2650 7850 2650
Wire Wire Line
	7150 2750 7850 2750
Wire Wire Line
	7150 2950 7850 2950
Wire Wire Line
	7150 3050 7850 3050
Wire Wire Line
	7150 3150 7850 3150
Wire Wire Line
	7150 3250 7850 3250
Wire Wire Line
	7150 3450 7850 3450
Wire Wire Line
	7150 3550 7850 3550
Wire Wire Line
	7150 3650 7850 3650
Wire Wire Line
	7150 3750 7850 3750
Wire Wire Line
	3900 2750 4600 2750
Wire Wire Line
	3900 2850 4600 2850
Wire Wire Line
	3900 2950 4600 2950
Wire Wire Line
	3900 3050 4600 3050
Wire Wire Line
	4600 2350 3900 2350
Wire Wire Line
	4600 2450 3900 2450
Wire Wire Line
	4600 2550 3900 2550
Wire Wire Line
	4600 2650 3900 2650
Wire Wire Line
	3900 1950 4600 1950
Wire Wire Line
	3900 2050 4600 2050
Wire Wire Line
	3900 2150 4600 2150
Wire Wire Line
	3900 2250 4600 2250
Wire Wire Line
	4600 1850 3900 1850
Wire Wire Line
	2200 2600 1500 2600
Wire Wire Line
	2200 2700 1500 2700
Wire Wire Line
	2200 2800 1500 2800
Wire Wire Line
	2200 2900 1500 2900
Wire Wire Line
	2200 2450 1500 2450
Wire Wire Line
	1800 5900 1800 6000
Wire Wire Line
	1800 6300 1800 6400
Wire Wire Line
	1800 6700 1800 6800
Wire Wire Line
	1800 7100 3150 7100
$Comp
L JP4 J1
U 1 1 58A5FE9F
P 2550 6650
F 0 "J1" H 2600 6350 60  0000 C CNN
F 1 "JP4" H 2600 7000 60  0000 C CNN
F 2 "" H 2550 6900 60  0001 C CNN
F 3 "" H 2550 6900 60  0001 C CNN
	1    2550 6650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 6800 2950 6800
Wire Wire Line
	3150 6700 2950 6700
Wire Wire Line
	3150 5450 3150 6800
Wire Wire Line
	2950 6600 3150 6600
Connection ~ 3150 6700
Wire Wire Line
	2950 6500 3150 6500
Connection ~ 3150 6600
Wire Wire Line
	1800 5950 2250 5950
Wire Wire Line
	2250 5950 2250 6500
Connection ~ 1800 5950
Wire Wire Line
	1800 6350 2150 6350
Wire Wire Line
	2150 6350 2150 6600
Wire Wire Line
	2150 6600 2250 6600
Connection ~ 1800 6350
Wire Wire Line
	1800 6750 2000 6750
Wire Wire Line
	2000 6750 2000 6700
Wire Wire Line
	2000 6700 2250 6700
Connection ~ 1800 6750
Wire Wire Line
	2000 7100 2000 6950
Wire Wire Line
	2000 6950 2150 6950
Wire Wire Line
	2150 6950 2150 6800
Wire Wire Line
	2150 6800 2250 6800
Connection ~ 2000 7100
Wire Wire Line
	2200 3500 1900 3500
Wire Wire Line
	1900 3500 1900 5450
Wire Wire Line
	1900 5450 3150 5450
Connection ~ 3150 6500
Wire Wire Line
	6650 2450 5700 2450
Text Label 5800 2450 0    60   ~ 0
VDDIO_13_PL
Wire Wire Line
	6650 1950 5950 1950
Text Label 6000 1950 0    60   ~ 0
VDD18_KEY_BACKUP
Wire Wire Line
	7150 1950 8150 1950
Wire Wire Line
	7150 2050 8150 2050
Wire Wire Line
	7150 2150 8150 2150
Wire Wire Line
	7150 2350 8150 2350
Text Label 7200 1950 0    60   ~ 0
JTAG_TCK
Text Label 7200 2050 0    60   ~ 0
JTAG_TMS
Text Label 7200 2150 0    60   ~ 0
JTAG_TDI
Text Label 7200 2250 0    60   ~ 0
JTAG_TDO
Text Label 7200 2350 0    60   ~ 0
JTAG_NRST
Wire Wire Line
	7150 2250 8150 2250
$Comp
L Header5 J2
U 1 1 58A52616
P 8350 2150
F 0 "J2" H 8350 1850 60  0000 C CNN
F 1 "Header5" H 8400 2500 60  0000 C CNN
F 2 "" H 8350 2250 60  0001 C CNN
F 3 "" H 8350 2250 60  0001 C CNN
	1    8350 2150
	1    0    0    -1  
$EndComp
NoConn ~ 7850 2450
NoConn ~ 7850 2550
NoConn ~ 7850 2650
NoConn ~ 7850 2750
NoConn ~ 5950 1950
NoConn ~ 5950 2150
NoConn ~ 5950 2350
NoConn ~ 5950 2650
NoConn ~ 5950 2750
Text GLabel 5950 2550 0    60   Input ~ 0
ADC_CLK
NoConn ~ 5950 2250
$Comp
L R_Pack04 RN?
U 1 1 58A5BF52
P 3700 2050
F 0 "RN?" V 3400 2050 50  0000 C CNN
F 1 "22" V 3900 2050 50  0000 C CNN
F 2 "" V 3975 2050 50  0001 C CNN
F 3 "" H 3700 2050 50  0000 C CNN
	1    3700 2050
	0    1    1    0   
$EndComp
$Comp
L R_Pack04 RN?
U 1 1 58A5BFD7
P 3700 2450
F 0 "RN?" V 3400 2450 50  0000 C CNN
F 1 "22" V 3900 2450 50  0000 C CNN
F 2 "" V 3975 2450 50  0001 C CNN
F 3 "" H 3700 2450 50  0000 C CNN
	1    3700 2450
	0    1    1    0   
$EndComp
$Comp
L R_Pack04 RN?
U 1 1 58A5C027
P 3700 2850
F 0 "RN?" V 3400 2850 50  0000 C CNN
F 1 "22" V 3900 2850 50  0000 C CNN
F 2 "" V 3975 2850 50  0001 C CNN
F 3 "" H 3700 2850 50  0000 C CNN
	1    3700 2850
	0    1    1    0   
$EndComp
$Comp
L R_Pack04 RN?
U 1 1 58A5C02D
P 3700 3250
F 0 "RN?" V 3400 3250 50  0000 C CNN
F 1 "22" V 3900 3250 50  0000 C CNN
F 2 "" V 3975 3250 50  0001 C CNN
F 3 "" H 3700 3250 50  0000 C CNN
	1    3700 3250
	0    1    1    0   
$EndComp
Wire Wire Line
	3300 1850 3500 1850
Wire Wire Line
	3300 1950 3500 1950
Wire Wire Line
	3300 2050 3500 2050
Wire Wire Line
	3300 2150 3500 2150
Wire Wire Line
	3300 2250 3500 2250
Wire Wire Line
	3300 2350 3500 2350
Wire Wire Line
	3300 2450 3500 2450
Wire Wire Line
	3300 2550 3500 2550
Wire Wire Line
	3300 2650 3500 2650
Wire Wire Line
	3300 2750 3500 2750
Wire Wire Line
	3300 2850 3500 2850
Wire Wire Line
	3300 2950 3500 2950
Wire Wire Line
	3300 3050 3500 3050
NoConn ~ 3500 3150
NoConn ~ 3500 3250
NoConn ~ 3500 3350
NoConn ~ 3900 3350
NoConn ~ 3900 3250
NoConn ~ 3900 3150
$EndSCHEMATC
