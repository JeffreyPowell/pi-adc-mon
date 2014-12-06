#!/bin/bash

/usr/bin/rrdtool graph /usr/local/scripts/git/pi-adc-mon/www/adc-volts-hour.png \
--start -1h \
--upper-limit 14 \
--lower-limit 11 \
--width 600 \
--height 400 \
DEF:chartdata=/usr/local/scripts/git/pi-adc-mon/data/adc-volts.rrd:data:AVERAGE \
LINE4:chartdata#AAFF00:"channel 1 (v)"

/usr/bin/rrdtool graph /usr/local/scripts/git/pi-adc-mon/www/adc-volts-dayonday.png \
--slope-mode \
--start midnight \
--end midnight+1d \
--upper-limit 14.5 \
--lower-limit 10.5 \
--rigid \
--alt-y-grid \
--width 500 \
--height 600 \
DEF:day1=/usr/local/scripts/git/pi-adc-mon/data/adc-volts.rrd:data:AVERAGE:start=midnight-0d:end=midnight+2d \
SHIFT:day1:0 \
DEF:day2=/usr/local/scripts/git/pi-adc-mon/data/adc-volts.rrd:data:AVERAGE:start=midnight-1d:end=midnight+1d \
SHIFT:day2:86400 \
DEF:day3=/usr/local/scripts/git/pi-adc-mon/data/adc-volts.rrd:data:AVERAGE:start=midnight-2d:end=midnight-1d \
SHIFT:day3:172800 \
DEF:day4=/usr/local/scripts/git/pi-adc-mon/data/adc-volts.rrd:data:AVERAGE:start=midnight-3d:end=midnight-2d \
SHIFT:day4:259200 \
DEF:day5=/usr/local/scripts/git/pi-adc-mon/data/adc-volts.rrd:data:AVERAGE:start=midnight-4d:end=midnight-3d \
SHIFT:day5:345600 \
DEF:day6=/usr/local/scripts/git/pi-adc-mon/data/adc-volts.rrd:data:AVERAGE:start=midnight-5d:end=midnight-3d \
SHIFT:day6:432000 \
DEF:day7=/usr/local/scripts/git/pi-adc-mon/data/adc-volts.rrd:data:AVERAGE:start=midnight-6d:end=midnight-4d \
SHIFT:day7:518400 \
AREA:day7#8B00FF20 \
AREA:day6#0000FF20 \
AREA:day5#00FFFF20 \
AREA:day4#00FF0020 \
AREA:day3#FFFF0020 \
AREA:day2#FF7F0020 \
AREA:day1#FF000020 \
LINE2:day5#8B00FF:"channel 1 (v) day-6" \
LINE2:day4#0000FF:"channel 1 (v) day-5" \
LINE2:day5#FFFF00:"channel 1 (v) day-4" \
LINE2:day4#FF7F00:"channel 1 (v) day-3" \
LINE2:day3#FFFF00:"channel 1 (v) day-2" \
LINE2:day2#FF7F00:"channel 1 (v) day-1" \
LINE2:day1#FF0000:"channel 1 (v) today"

/usr/bin/rrdtool graph /usr/local/scripts/git/pi-adc-mon/www/adc-volts-day.png \
--start -1d \
--width 600 \
--height 400 \
--upper-limit 13 \
--lower-limit 11 \
DEF:chartdata=/usr/local/scripts/git/pi-adc-mon/data/adc-volts.rrd:data:AVERAGE \
AREA:chartdata#CCFFCC \
LINE2:chartdata#00FF00:"channel 1 (v)"

/usr/bin/rrdtool graph /usr/local/scripts/git/pi-adc-mon/www/adc-volts-week.png \
--start -1w \
--width 600 \
--height 400 \
--upper-limit 13 \
--lower-limit 11 \
DEF:chartdata=/usr/local/scripts/git/pi-adc-mon/data/adc-volts.rrd:data:AVERAGE \
AREA:chartdata#CCFFCC \
LINE2:chartdata#00FF00:"channel 1 (v)"

/usr/bin/rrdtool graph /usr/local/scripts/git/pi-adc-mon/www/adc-volts-month.png \
--start -1m \
--width 600 \
--height 400 \
--upper-limit 13 \
--lower-limit 11 \
DEF:chartdata=/usr/local/scripts/git/pi-adc-mon/data/adc-volts.rrd:data:AVERAGE \
AREA:chartdata#CCFFCC \
LINE2:chartdata#00FF00:"channel 1 (v)"



