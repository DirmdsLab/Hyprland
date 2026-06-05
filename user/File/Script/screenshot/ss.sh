#!/usr/bin/env bash

SCREENSHOT_DIR="$HOME/Pictures/Screenshot"
mkdir -p "$SCREENSHOT_DIR"

FILE="$SCREENSHOT_DIR/Screenshot-$(date +'%Y-%m-%d-%H%M%S').png"

case "$1" in
    fullss)
        if grim "$FILE"; then
            notify-send "Screenshot Saved" "$(basename "$FILE")"
        fi
        ;;

    cropss)
        if grim -g "$(slurp)" "$FILE"; then
            notify-send "Screenshot Saved" "$(basename "$FILE")"
        fi
        ;;

    *)
        echo "Usage: $0 {fullss|cropss}"
        exit 1
        ;;
esac