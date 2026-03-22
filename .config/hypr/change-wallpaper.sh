#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/Pictures/wallpapers/"
# The link is used in Hyprpaper's config
LINK="$HOME/.config/hypr/wallpaper.png"
CURRENT_WALL=$(readlink "$LINK")
# Get the name of the focused monitor with hyprctl
FOCUSED_MONITOR=$(hyprctl monitors -j | jq -r '.[] | select(.focused) | .name')
# Get a random wallpaper that is not the current one
WALLPAPER=$(find "$WALLPAPER_DIR" -type f ! -name "$(basename "$CURRENT_WALL")" | shuf -n 1)

# Apply the selected wallpaper
hyprctl hyprpaper wallpaper "$FOCUSED_MONITOR","$WALLPAPER",cover

# Set it as default for the next hyprpaper start
ln -sf "$WALLPAPER" "$LINK"
