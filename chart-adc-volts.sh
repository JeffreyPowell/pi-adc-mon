#!/bin/bash

/usr/bin/rrdtool graph /usr/local/scripts/git/pi-adc-mon/www/adc-volts-hour.png \
--start -1h \
--upper-limit 14 \
--lower-limit 9 \
--width 800 \
--height 400 \
DEF:chartdata=/usr/local/scripts/git/pi-adc-mon/data/adc-volts.rrd:data:AVERAGE \
LINE4:chartdata#AAFF00:"channel 1 (v)"

/usr/bin/rrdtool graph /usr/local/scripts/git/pi-adc-mon/www/adc-volts-dayonday.png \
--start midnight \
--end midnight+1d \
--upper-limit 14.5 \
--lower-limit 10.5 \
--rigid \
--alt-y-grid \
--width 800 \
--height 400 \
DEF:day1=/usr/local/scripts/git/pi-adc-mon/data/adc-volts.rrd:data:AVERAGE \
LINE8:day1#FFFF00:"channel 1 (v) today" \
DEF:day2=/usr/local/scripts/git/pi-adc-mon/data/adc-volts.rrd:data:AVERAGE:start=midnight-1d:end=midnight+1d \
SHIFT:day2:86400 \
LINE4:day2#00FFFF:"channel 1 (v) day-1" \
DEF:day3=/usr/local/scripts/git/pi-adc-mon/data/adc-volts.rrd:data:AVERAGE:start=midnight-2d:end=midnight+0d \
SHIFT:day3:172800 \
LINE2:day3#FF00FF:"channel 1 (v) day-2"


/usr/bin/rrdtool graph /usr/local/scripts/git/pi-adc-mon/www/adc-volts-day.png \
--start -1d \
--width 800 \
--height 400 \
--upper-limit 13 \
--lower-limit 11 \
DEF:chartdata=/usr/local/scripts/git/pi-adc-mon/data/adc-volts.rrd:data:AVERAGE \
AREA:chartdata#CCFFCC \
LINE2:chartdata#00FF00:"channel 1 (v)"

/usr/bin/rrdtool graph /usr/local/scripts/git/pi-adc-mon/www/adc-volts-week.png \
--start -1w \
--width 800 \
--height 400 \
--upper-limit 13 \
--lower-limit 9 \
DEF:chartdata=/usr/local/scripts/git/pi-adc-mon/data/adc-volts.rrd:data:AVERAGE \
AREA:chartdata#CCFFCC \
LINE2:chartdata#00FF00:"channel 1 (v)"


