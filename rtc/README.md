# PAL1-RTC: A Real Time Clock/Calendar for the PAL-1

PAL1-RTC is a real time clock/calendar for the PAL-1 system intended to plug in to the PAL-1 RIOT Expansion Module.[^1]

![PAL-1 RTC gadget render](https://raw.githubusercontent.com/dimitrit/pal1gadgets/main/rtc/docs/images/rtc-front.png)

The clock/calendar provides seconds, minutes, hours, day, date, month, and year information. The end of the month date is automatically adjusted for months with fewer than 31 days, including corrections for leap year. The clock operates in either the 24-hour or 12-hour format with AM/PM indicator. In addition, 96 bytes of NV RAM are provided for data storage. Refer to the DS1305 datasheet for details.[^2]

[^1]: Liu Ganning, _‘RIOT EXPANSION’_, 2021 <http://pal.aibs.ws/assets/RIOT_expansion_manual.pdf> [accessed 26 January 2024].
[^2]: Maxim Integrated Products, _‘DS1305
Serial Alarm Real-Time Clock’_, 2015 <https://www.analog.com/media/en/technical-documentation/data-sheets/DS1305.pdf> [accessed 26 January 2024].
