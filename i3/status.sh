#!/bin/bash

while true
do
    LOAD=$(uptime | grep -m 1 -oE "[0-9]+,[0-9]+" \
        --color="never" | head -1)
    BAT=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 \
        | grep -E "[0-9]+%" -o -m 1 --color="never")
    DATE=$(date "+%a %Y-%m-%d %H:%M:%S uke %V")

    echo " $LOAD |  $BAT |  $DATE"
    sleep 5
done
