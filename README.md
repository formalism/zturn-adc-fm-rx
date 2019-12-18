# zturn-adc-fm-rx
FM radio reciever by custom ADC/FM BPF board and [Z-turn board](http://www.myirtech.com/list.asp?id=502).

# Directory structure
 * FPGA : FPGA design which should be programmed to Z-turn board.
 * Firmware : programs to be run on Linux on Z-turn board.
      + adc-cap : communicates with adc-capture program.
      + ws-rust : use canvas.html to see FFT result (the functionality is similar to adc-cap and adc-capture program).
 * Sch : Schematics by KiCad
      + adc : ADC(LTC2292 by Linear Technology) board to be used with Z-turn board.
      + fm-bpf : FM bandpass active filter by PSA4-5043+ of Mini-Circuits.
 * PC : software run on Windows
      + adc-capture : communicates with above adc-cap firmware. Written in C#.
      + rf_demod : PC only implementation of FM demodulation. This program convers data captured by ADC to audio data. This program was written to verify algorithm to be implemented in FPGA.

Please see the following pages for more info.

https://www.living-in.tokyo/post/2018/2/new_fm_antenna/

https://www.living-in.tokyo/post/2017/09/new_adc_arrival/

https://www.living-in.tokyo/post/2017/08/adc_rev02/

https://www.living-in.tokyo/post/2017/07/fm_bpf3/

# License
MIT
