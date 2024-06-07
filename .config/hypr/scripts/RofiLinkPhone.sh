#!/bin/bash

# # Define menu options as an associative array
declare -A menu_options=(
  # ["Devops"]="/home/amrit/Documents/Learning/Devops/"
  # ["Latin"]="/home/amrit/Documents/Learning/Latin/"
  # ["Github"]="https://github.com/"
  ["Connect Phone(Wireless)"]="/home/amrit/.local/bin/phone_connect.sh"
  ["Disconnect Phone"]="/home/amrit/.local/bin/phone_disconnect.sh"
  ["Connect Phone(USB-Mirroring)"]="/home/amrit/.local/bin/phone_connect_usb.sh"
)
# Function for displaying notifications
notification() {
  dunstify -u normal -i "" "Opening Bookmark: $@"
}

# Main function
main() {
  choice=$(printf "%s\n" "${!menu_options[@]}" | rofi -dmenu -config ~/.config/rofi/config-rofi-Beats.rasi -i -p "")

  # if [ -z "$choice" ]; then
  #   exit 1
  # fi

  link="${menu_options[$choice]}"

  # notification "$choice"
  
  # Check if the link is a playlist
  # if [[ $link == *playlist* ]]; then
  #   xdg-open "$link"
  # else
  #   xdg-open "$link"
  # fi

#     for i in $link
#     do
#       xdg-open "$i"
#     done
# }
  if [[ "$link" == *.sh ]]; then
    "$link"
  else
    xdg-open "$link"
  fi

}

# Check if an online music process is running and send a notification, otherwise run the main function
# pkill -f http && dunstify -u low -i "$iDIR/music.png" "Bookmark Closed" || 
main
