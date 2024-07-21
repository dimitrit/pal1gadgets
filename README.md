# PAL1-GADGETS: A range of Gadgets for the PAL-1

The PAL-1 RIOT Expansion Module adds two bidirectional 8-bit digital input/output ports and a programmable interval timer to the PAL-1 system by means of a MOS6532 RAM-I/O-Timer (RIOT) IC.[^1]

This repository includes a number of `gadgets' that can be plugged in to the RIOT Expansion Module to provide specific functionality, including:

  * a [Real-Time Clock](../../tree/master/rtc)
  * a [Speech Processor](../../tree/master/speech)
  * an [Analog-to-Digital Converter](../../tree/master/adc)
  * an [IEC interface](../../tree/master/iec)

Refer to the relevant directories for details on each gadget.

Gadgets are plugged in to the PAL-1 RIOT Expansion Module using a [RIOT adapter](../../tree/master/adapter).

## Example code
Code examples are provided for most gadgets. These code examples use  `vasm6502_oldstyle` syntax[^2] and can be built using `make`.[^3]

## Acknowledgements
PAL-1 and the PAL-1 logo used with kind permission by Liu Ganning.

[^1]: Ganning, Liu, _‘RIOT EXPANSION’_, 2021 <http://pal.aibs.ws/assets/RIOT_expansion_manual.pdf> [accessed 26 January 2024].
[^2]: Barthelmann, Volker and Wille, Frank, `vasm assembler system' (2024), <http://sun.hasenbraten.de/vasm/daily/vasm.tar.gz> [accessed 27 March 2024].
[^3]: Free Software Foundation, `Make - GNU Project', <https://www.gnu.org/
software/make/> [accessed 27 March 2024].
