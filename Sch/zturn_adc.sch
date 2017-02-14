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
Sheet 1 5
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 1750 1650 1850 900 
U 589ADF9D
F0 "FX3_clk_reset_cn" 60
F1 "FX3_clk_reset_cn.sch" 60
$EndSheet
$Comp
L CYUSB3014 IC1
U 7 1 58A0A799
P 6100 4750
F 0 "IC1" H 6100 2400 50  0000 C CNN
F 1 "CYUSB3014" H 6100 7300 50  0000 C CNN
F 2 "MODULE" H 6050 7050 50  0001 C CNN
F 3 "DOCUMENTATION" H 6100 7200 50  0001 C CNN
	7    6100 4750
	1    0    0    -1  
$EndComp
$Sheet
S 1800 2850 1700 650 
U 58A06B55
F0 "FX3_power" 60
F1 "FX3_power.sch" 60
$EndSheet
$Sheet
S 7800 1650 2450 1200
U 58A0A991
F0 "FX3_DQ" 60
F1 "FX3_DQ.sch" 60
$EndSheet
$Sheet
S 7800 3350 1900 900 
U 58A1C0F3
F0 "RF_in" 60
F1 "RF_in.sch" 60
$EndSheet
Text Label 4950 4400 0    60   ~ 0
SPI_SCK
Text Label 4950 4300 0    60   ~ 0
SPI_SSN
Text Label 4950 4200 0    60   ~ 0
SPI_MISO
Text Label 4950 4100 0    60   ~ 0
SPI_MOSI
Wire Wire Line
	5350 4400 4900 4400
Wire Wire Line
	5350 4300 4900 4300
Wire Wire Line
	5350 4200 4900 4200
Wire Wire Line
	5350 4100 4900 4100
$Comp
L TEST TP1
U 1 1 58A3C918
P 5350 4000
F 0 "TP1" H 5350 4300 50  0000 C BNN
F 1 "TEST" V 5350 4250 50  0000 C CNN
F 2 "" H 5350 4000 50  0000 C CNN
F 3 "" H 5350 4000 50  0000 C CNN
	1    5350 4000
	0    -1   -1   0   
$EndComp
$Comp
L TEST TP2
U 1 1 58A3CCBA
P 5350 4500
F 0 "TP2" H 5350 4800 50  0000 C BNN
F 1 "TEST" V 5350 4750 50  0000 C CNN
F 2 "" H 5350 4500 50  0000 C CNN
F 3 "" H 5350 4500 50  0000 C CNN
	1    5350 4500
	0    -1   -1   0   
$EndComp
$Comp
L TEST TP3
U 1 1 58A3CCE7
P 5350 4600
F 0 "TP3" H 5350 4900 50  0000 C BNN
F 1 "TEST" V 5350 4850 50  0000 C CNN
F 2 "" H 5350 4600 50  0000 C CNN
F 3 "" H 5350 4600 50  0000 C CNN
	1    5350 4600
	0    -1   -1   0   
$EndComp
$Comp
L TEST TP4
U 1 1 58A3CFDC
P 5350 4700
F 0 "TP4" H 5350 5000 50  0000 C BNN
F 1 "TEST" V 5350 4950 50  0000 C CNN
F 2 "" H 5350 4700 50  0000 C CNN
F 3 "" H 5350 4700 50  0000 C CNN
	1    5350 4700
	0    -1   -1   0   
$EndComp
Text GLabel 5350 4900 0    60   Input ~ 0
FX3_GPIO[45]
$EndSCHEMATC
