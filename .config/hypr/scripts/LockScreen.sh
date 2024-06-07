#!/bin/bash

CONFIG="$HOME/.config/swaylock/config"

#hyprlock
sleep 0.5s; swaylock --config ${CONFIG} & disown
