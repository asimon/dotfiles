#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/Pictures/wallpapers/"
WALLPAPER_LINK="$HOME/.config/niri/wallpaper.png"
CURRENT_WALLPAPER=$(readlink -f "$WALLPAPER_LINK")

# Get a random wallpaper that is not the current one
NEW_WALLPAPER=$(find "$WALLPAPER_DIR" -type f ! -name "$(basename "$CURRENT_WALLPAPER")" | shuf -n 1)

PID=$(pidof swaybg)

# Apply the selected wallpaper
swaybg --image "$NEW_WALLPAPER" &

# Kill old swaybg instance
sleep 1
[[ ${PID} != "" ]] && kill $PID

# Update the link for the next start of Niri
ln -sf "$NEW_WALLPAPER" "$WALLPAPER_LINK"
