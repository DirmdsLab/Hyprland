#!/usr/bin/env bash

LOG="/tmp/lockscreenstyle.log"

echo "[INFO] $(date "+%F %T") Lock Idle..." >> "$LOG"

notify-send -t 1000 "lock idle"

sleep 2

echo "[INFO] $(date "+%F %T") Starting hyprlock..." >> "$LOG"
hyprlock --config ~/File/Script/hyprland/hyprlock/hyprlock-idle.conf >>"$LOG" 2>&1
STATUS=$?
echo "[INFO] $(date "+%F %T") hyprlock exited with status $STATUS" >> "$LOG"

notify-send "unlock"