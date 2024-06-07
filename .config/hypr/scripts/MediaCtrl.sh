#!/bin/bash

music_icon="$HOME/.config/dunst/icons/music.png"

# Play the next track
play_next() {
    playerctl next
    show_music_notification_next
}

# Play the previous track
play_previous() {
    playerctl previous
    show_music_notification_previous
}

# Toggle play/pause
toggle_play_pause() {
    playerctl play-pause
    show_music_notification
}

# Stop playback
stop_playback() {
    playerctl stop
    dunstify -r 123 -i "$music_icon" "Playback Stopped"
}

show_music_notification_next() {
    status=$(playerctl status)
    if [[ "$status" == "Playing" ]]; then
        song_title=$(playerctl metadata title)
        song_artist=$(playerctl metadata artist)
        dunstify -r 123 -i "$music_icon" "Next Song"
    elif [[ "$status" == "Paused" ]]; then
        dunstify -r 123 -i "$music_icon" "Playback Paused"
    fi
}
show_music_notification_previous() {
    status=$(playerctl status)
    if [[ "$status" == "Playing" ]]; then
        song_title=$(playerctl metadata title)
        song_artist=$(playerctl metadata artist)
        dunstify -r 123 -i "$music_icon" "Previous Song"
    elif [[ "$status" == "Paused" ]]; then
        dunstify -r 123 -i "$music_icon" "Playback Paused"
    fi
}
# # Display Dunst notification with song information
# show_music_notification() {
#     status=$(playerctl status)
#     if [[ "$status" == "Playing" ]]; then
#         song_title=$(playerctl metadata title)
#         song_artist=$(playerctl metadata artist)
#         dunstify -r 123 -i "$music_icon" "Now Playing:" "$song_title\nby $song_artist"
#     elif [[ "$status" == "Paused" ]]; then
#         dunstify -r 123 -i "$music_icon" "Playback Paused"
#     fi
# }

show_music_notification() {
    status=$(playerctl status)
    if [[ "$status" == "Playing" ]]; then
        song_title=$(playerctl metadata title)
        dunstify -r 123 -i "$music_icon" "Now Playing:" "$song_title"
    elif [[ "$status" == "Paused" ]]; then
        dunstify -r 123 -i "$music_icon" "Playback Paused"
    fi
}
# Get media control action from command line argument
case "$1" in
    "--nxt")
        play_next
        ;;
    "--prv")
        play_previous
        ;;
    "--pause")
        toggle_play_pause
        ;;
    "--stop")
        stop_playback
        ;;
    *)
        echo "Usage: $0 [--nxt|--prv|--pause|--stop]"
        exit 1
        ;;
esac
