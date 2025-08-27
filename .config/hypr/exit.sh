#!/usr/bin/env bash
# Close all windows and exit hyprland
HYPRCMDS=$(hyprctl -j clients | jq -j '.[] | "dispatch closewindow address:\(.address); "')
hyprctl --batch "$HYPRCMDS" >>/tmp/exit-hyprland.log 2>&1
hyprctl dispatch exit >>/tmp/exit-hyprland.log 2>&1
