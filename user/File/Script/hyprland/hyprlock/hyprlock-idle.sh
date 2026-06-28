#!/usr/bin/env bash
echo "[INFO] $(date "+%F %T") Lock Idle..." >> /tmp/lockscreenstyle.log 

notify-send -t 1000 "lock idle"

sleep 2

hyprlock --config ~/File/Script/hyprland/hyprlock/hyprlock-idle.conf

notify-send "unlock"