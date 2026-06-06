#!/usr/bin/env bash
echo "[INFO] $(date "+%F %T") Lock Idle..." >> /tmp/lockscreenstyle.log 

notify-send "lock idle"

hyprlock --config ~/File/Script/hyprland/hyprlock/hyprlock-idle.conf
