#!/bin/bash

device=$(adb devices | awk 'NR==2{print $1}')

# Play and Pause
media_play_pause() {
    adb -s $device shell input keyevent 85
}

# Next Song
media_next() {
    adb -s $device shell input keyevent 87
}

# Previous Song
media_previous() {
    adb -s $device shell input keyevent 88
}

# Execute accordingly
  if [[ "$1" == "--inc" ]]; then
	  inc_volume
  elif [[ "$1" == "--dec" ]]; then
	  dec_volume
  elif [[ "$1" == "--media" ]]; then
	  media_play_pause
  elif [[ "$1" == "--next" ]]; then
	  media_next
  elif [[ "$1" == "--prev" ]]; then
	  media_previous
  fi
