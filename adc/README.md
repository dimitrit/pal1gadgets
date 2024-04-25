# PAL1-ADC: An Analog to Digital Converter for the PAL-1

The PAL1-ADC is an Analog-to-Digital Converter for the PAL-1 system intended to plug in to the PAL-1 RIOT Expansion Module[^1].

![PAL-1 A/D Converter gadget render](https://github.com/dimitrit/pal1gadgets/blob/main/adc/docs/figures/adc-front.png?raw=true)

The analog-to-digital converter enables high throughput data capture (up to 200 kSPS) via an 8-bit 'bus'. A small on-board prototype area facilitates experimentation. Refer to the AD7819 datasheet[^2] for details.

## Acknowledgement

The `wozfp.a65` and `bcdfp.a65` source files are from Jeff Tranter's github repository and have been modified for `vasm6502_oldstyle` syntax.[^3]

[^1]: Liu Ganning, _‘RIOT EXPANSION’_, 2021 <http://pal.aibs.ws/assets/RIOT_expansion_manual.pdf> [accessed 26 January 2024].
[^2]: Analog Devices, _‘AD7819, 2.7 V to 5.5 V, 200 kSPS
8-Bit Sampling ADC’_, 2000 <https://www.analog.com/media/en/technical-documentation/data-sheets/AD7819.pdf> [accessed 29 February 2024].
[^3]: Jeff Tranter, _‘README’_, N.D., <https://github.com/jefftranter/6502/tree/master/asm/wozfp> [accessed 8 April 2024].
