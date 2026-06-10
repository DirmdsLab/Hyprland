#!/usr/bin/env bash
echo "[INFO] $(date "+%F %T") Lock Idle..." >> /tmp/lockscreenstyle.log 

notify-send "lock idle"

sleep 0.5x

hyprlock --config ~/File/Script/hyprland/hyprlock/hyprlock-idle.conf

