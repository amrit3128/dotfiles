#!/usr/bin/sh

bssid=$(nmcli device wifi list | sed -n '1!p' | cut -b 9- | rofi -dmenu -p "Select wifi" -l 7 | cut -d' ' -f1)
pass=$(echo "" | rofi -dmenu "Enter Password: " -l 0)
nmcli device wifi connect $bssid password $pass

