# PAL1-ft: An adapter for the fischertechnik Computing Interface

In the late 1980s and early 1990s fischertechnik released a number of construction sets that could be controlled by a computer. The connection between motors, sensors and the computer was by means of a dedicated Computing Interface.[^1] The fischertechnik Computing Interface supported a range of platforms, including Amstrad, Apple, Atari and Commodore.

![PAL-1 ftPAL gadget render](https://github.com/dimitrit/pal1gadgets/blob/main/ft/docs/figures/ftPAL.png?raw=true)

While some versions of the Computing Interface had dedicated connectors for specific platforms, the company also released 'generic' interfaces. These 'generic' Computing Interfaces required dedicated adapters between the interface and the respective computer systems. PAL1-ft is a simple adapter that allows the fischertechnik Computing Interface to be connected to the PAL-1 RIOT Expansion Module.[^2]

The adapter implements the same logical connections as the original fischertechnik VIC 20/CBM adapter:

| ft Signal    | PAL1 RIOT |
|-------------:| :-------: |
| LOAD_OUT     | PB0       |
| LOAD_IN      | PB1       |
| DATA_OUT     | PB2       |
| CLOCK        | PB3       |
| TRIGGER_X    | PB4       |
| TRIGGER_Y    | PB5       |
| COUNT_IN     | PB6       |
| C64_DATA_IN  | PB7       |

[^1]: fischertechnik, _‘Computing Interface’, _<https://docs.fischertechnikclub.nl/computing/39484.pdf> [accessed 30 August 2025].
[^2]: Liu Ganning, _‘RIOT EXPANSION’_, 2021 <http://pal.aibs.ws/assets/RIOT_expansion_manual.pdf> [accessed 26 January 2024].
