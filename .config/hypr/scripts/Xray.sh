#!/usr/bin/sh

dunst_notif="$HOME/.config/dunst/images/bell.png"
SCRIPTSDIR="$HOME/.config/hypr/scripts"


Xray=$(hyprctl getoption decoration:blur:xray | awk 'NR==1{print $2}')
if [ "$Xray" = 1 ] ; then
    hyprctl keyword decoration:blur:xray false 
    dunstify -u low -i "$dunst_notif" "Xray mode disabled"
    exit

else
  hyprctl keyword decoration:blur:xray true
	sleep 0.5
  dunstify -u normal -i "$dunst_notif" "Xray mode enabled"
  exit
fi

hyprctl reload

