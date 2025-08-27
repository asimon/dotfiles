#!/usr/bin/env bash

move-focus-or-workspace() {
  direction=$1

  # 1. find monitor's width in px

  # account for possible gaps by giving it a bit more room
  monEdgeLeft=30
  mon=$(hyprctl -j monitors)
  monWidth=$(printf '%s' "$mon" | jq '.[0] | .width')
  scale=$(printf '%s' "$mon" | jq '.[0] | .scale')
  monEdgeRight=$(echo "$monWidth / $scale - 30" | bc)

  # 2. find where active window is on the x-axis
  active=$(hyprctl -j activewindow)
  activeAtLeft=$(printf '%s' "$active" | jq '.at | .[0]')
  activeAtRight=$(printf '%s' "$active" | jq '(.at | .[0]) + (.size | .[0])')

  # 3. dispatch accordingly
  if [[ $activeAtLeft -le $monEdgeLeft ]]; then
    if [ "$direction" = "l" ]; then
      hyprctl dispatch workspace -1
    else
      hyprctl dispatch movefocus r
    fi
  elif [[ $activeAtRight -ge $monEdgeRight ]]; then
    if [ "$direction" = "r" ]; then
      hyprctl dispatch workspace +1
    else
      hyprctl dispatch movefocus l
    fi
  else
    hyprctl dispatch movefocus $direction
  fi
}

handle() {
  case "$1" in
  'custom>>move-focus-or-workspace-'*)
    direction="${1#custom>>move-focus-or-workspace-}"
    move-focus-or-workspace "$direction"
    ;;
  esac
}

socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done
