#!/usr/bin/env bash

is_floating=$(hyprctl activewindow -j | jq -r '.floating')

if [[ "$is_floating" == "true" ]]; then
    # switch to tiled
    hyprctl dispatch focuswindow prev
    hyprctl dispatch cyclenext tiled
else
    # switch to floating
    hyprctl dispatch focuswindow prev
    hyprctl dispatch cyclenext floating
fi

