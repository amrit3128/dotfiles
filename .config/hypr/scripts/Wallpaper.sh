#!/bin/bash

# DIR="$HOME/Pictures/wallpapers/"
# SCRIPTSDIR="$HOME/.config/hypr/scripts"

# PICS=($(find ${DIR} -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" -o -name "*.gif" \)))
# RANDOMPICS=${PICS[ $RANDOM % ${#PICS[@]} ]}


# # Transition config
# FPS=60
# TYPE="any"
# DURATION=5
# BEZIER=".43,1.19,1,.4"
# SWWW_PARAMS="--transition-fps $FPS --transition-type $TYPE --transition-duration $DURATION "


# swww query || swww init && swww img ${RANDOMPICS} $SWWW_PARAMS


# ${SCRIPTSDIR}/PywalSwww.sh
# sleep 1
# # ${SCRIPTSDIR}/Refresh.sh 

DIR=$HOME/Pictures/wallpapers/
PICS=($(find ${DIR} -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" -o -name "*.gif" \)))
RANDOMPICS=${PICS[ $RANDOM % ${#PICS[@]} ]}

DIR="$HOME/Pictures/wallpapers/"
SCRIPTSDIR="$HOME/.config/hypr/scripts"

change_swaybg(){
  pkill swww
  pkill swaybg
  swaybg -m fill -i ${RANDOMPICS}
}

change_swww(){
  pkill swaybg
  swww query || swww init
  swww img ${RANDOMPICS} --transition-fps 60 --transition-type simple --transition-duration 3
}

change_current(){
  if pidof swaybg >/dev/null; then
    change_swaybg
  else
    change_swww
  fi
}

switch(){
  if pidof swaybg >/dev/null; then
    change_swww
  else
    change_swaybg
  fi
}

case "$1" in
	"swaybg")
		change_swaybg
		;;
	"swww")
		change_swww
		;;
  "s")
		switch
		;;
	*)
		change_current
		;;
esac

sleep 5

${SCRIPTSDIR}/PywalSwww.sh
