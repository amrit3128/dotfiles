#!/bin/bash

while true
do
    battery_level=$(acpi -b | grep -Eo "[0-9]+%" | sed 's/%//')
    if [ $battery_level -lt 30 ]
    then
        dunstify "Battery level is below 30%: $battery_level%"
    fi
    sleep 300
done
