#!/bin/bash
# Rofi menu for Quick Edit / View of Settings (SUPER E)

# define your preferred text editor and terminal to use
editor=${EDITOR:-nano}
tty=kitty

configs="$HOME/.config/hypr/configs"

menu(){
  printf "1. edit Env-variables\n"
  printf "2. edit Window-Rules\n"
  printf "3. edit Startup_Apps\n"
  printf "4. edit User-Keybinds\n"
  printf "5. edit Monitors\n"
  printf "6. edit Laptop-Keybinds\n"
  printf "7. edit User-Settings\n"
  printf "8. edit Workspace-Rules\n"
  printf "9. edit Default-Settings\n"
  printf "10. edit Default-Keybinds\n"
}

main() {
    choice=$(menu | rofi -i -dmenu -config ~/.config/rofi/config-compact.rasi | cut -d. -f1)
    case $choice in
        1)
            $tty $editor "$configs/ENVariables.conf"
            ;;
        2)
            $tty $editor "$configs/WindowRules.conf"
            ;;
        3)
            $tty $editor "$configs/Startup_Apps.conf"
            ;;
        4)
            $tty $editor "$configs/Keybinds.conf"
            ;;
        5)
            $tty $editor "$configs/Monitors.conf"
            ;;
        6)
            $tty $editor "$configs/Laptops.conf"
            ;;
        7)
            $tty $editor "$configs/Settings.conf"
            ;;
        8)
            $tty $editor "$configs/WorkspaceRules.conf"
            ;;
		9)
            $tty $editor "$configs/Settings.conf"
            ;;
        10)
            $tty $editor "$configs/Keybinds.conf"
            ;;
        *)
            ;;
    esac
}

main
