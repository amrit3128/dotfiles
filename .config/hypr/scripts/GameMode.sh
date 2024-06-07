#!/bin/bash

dunst_notif="$HOME/.config/dunst/images/bell.png"
SCRIPTSDIR="$HOME/.config/hypr/scripts"


HYPRGAMEMODE=$(hyprctl getoption animations:enabled | awk 'NR==1{print $2}')
if [ "$HYPRGAMEMODE" = 1 ] ; then
    hyprctl --batch "\
        keyword animations:enabled 0;\
        keyword decoration:drop_shadow 0;\
        keyword decoration:blur:passes 0;\
        keyword general:gaps_in 5;\
        keyword general:gaps_out 10;\
        keyword general:border_size 0;\
        keyword decoration:rounding 0"
    swww kill 
    dunstify -u low -i "$dunst_notif" "gamemode enabled. All animations off"
    exit
else
	swww init && swww img "$HOME/.config/rofi/.current_wallpaper"
	sleep 0.1
	${SCRIPTSDIR}/PywalSwww.sh
	sleep 0.5
    dunstify -u normal -i "$dunst_notif" "Gamemode disabled. All animations normal"
    exit
fi
hyprctl reload
