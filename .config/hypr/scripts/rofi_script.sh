#!/usr/bin/sh
xdg-open "$(locate home media | rofi -threads 0 -width 100 -color-window "#000000, #000000, #000000" -color-normal "#000000, #b3e774, #000000, #b3e774, #000000" -color-active "#000000, #b3e774, #000000, #b3e774, #000000" -color-urgent "#000000, #b3e774, #000000, #b3e774, #000000" -dmenu -i -p "locate:")"
