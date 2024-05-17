#!/bin/bash
IMAGE=$(zenity --file-selection --title="Chose a background")
if [ -n "$IMAGE" ]; then
    feh --bg-scale "$IMAGE"
    echo "$IMAGE" > ~/.last_wallpaper
fi
