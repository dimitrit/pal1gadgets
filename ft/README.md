# PAL1-ft: An adapter for the fischertechnik Computing Interface

From the mid 1980s to the early 1990s fischertechnik released a number of construction sets that could be controlled by home computers.[^1] The connection between motors, sensors and the computer was by means of a dedicated Computing Interface.[^2] Different versions of the fischertechnik Computing Interface supported a range of platforms, including Amstrad, Apple, Atari and Commodore. In addition to these dedicated interfaces, fischertechnik also released universal interfaces. The fischertechnik Universal and CVK Computing Interfaces required adapters between the interface connector and target computer systems.

![PAL-1 ftPAL gadget render](https://github.com/dimitrit/pal1gadgets/blob/main/ft/docs/figures/ftPAL.png?raw=true)

 PAL1-ft is a simple adapter that allows the fischertechnik Universal and CVK Computing Interfaces to be connected to the PAL-1 RIOT Expansion Module.[^3]

The PAL1-ft adapter implements mostly the same logical connections as the fischertechnik Commodore 64 adapter, with the exception of the analog data input:[^4]

| PAL1 RIOT | ft Interface | Description |
| :-------: | :----------: | :---------- |
| PB0       | LOAD_OUT     | Signal digital output |
| PB1       | LOAD_IN      | Signal digital input |
| PB2       | DATA_OUT     | Digital data output  stream |
| PB3       | CLOCK        | Data transfer clock |
| PB4       | TRIGGER_X    | Trigger analog input X |
| PB5       | TRIGGER_Y    | Trigger analog input Y |
| PB7       | DATA_IN<sup>*</sup>      | Digital data input stream |
| PA7       | COUNT_IN     | Analog data input pulses |

<sup>*</sup>The source of DATA_IN is determined by the Data Input Select Jumper. See documentation for details. 

Since the 6532 RIOT timer does not support a pulsed count down mode, the adapter instead routes the analog input to PA7, thereby enabling the use of the RIOT's edge sense interrupt feature. Alternatively, it is possible to measure analog inputs by calculating the time DATA_IN remains LOW after triggering an analog input. For this it is necessary to move the Data Input Select jumper to the CENTRONICS position.

[^1]: fischertechnik, _‘Robots, Automats and graphic units to build yourself’_, 1985, <https://docs.fischertechnikclub.nl/info2/1985.pdf> [accessed 1 September 2025]
[^2]: fischertechnik, _‘Computing Interface’_, N.D., <https://docs.fischertechnikclub.nl/computing/39484.pdf> [accessed 30 August 2025].
[^3]: Liu Ganning, _‘RIOT EXPANSION’_, 2021, <http://pal.aibs.ws/assets/RIOT_expansion_manual.pdf> [accessed 26 January 2024].
[^4]: R Trapp, _‘ft66843 Schematic’_, 2017, <https://ftcommunity.de/knowhow/computing/computing_interfaces/ft66843_schematic.pdf> [accessed 30 August 2025].
