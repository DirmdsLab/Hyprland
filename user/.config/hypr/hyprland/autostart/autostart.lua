-- Auto Start
hl.on("hyprland.start", function ()

  -- Hyprpolkit
  hl.exec_cmd("systemctl --user start hyprpolkitagent")

  -- hypridle
  hl.exec_cmd("hypridle")

  -- Mako
  hl.exec_cmd("mako")

  -- Clipboard
  hl.exec_cmd("wl-paste --type text --watch cliphist store")
  hl.exec_cmd("wl-paste --type image --watch cliphist store")

  -- Mpvpaper
  hl.exec_cmd("~/File/Script/mpvpaper/mpvpaper.sh playlistplay ~/Playlists/wallpaper.m3u")
  hl.exec_cmd('tmux new-session -d -s paper-pause-session "bash $HOME/File/Script/mpvpaper/auto-pause.sh"')

  -- Ydotool
  hl.exec_cmd("ydotoold")
end)