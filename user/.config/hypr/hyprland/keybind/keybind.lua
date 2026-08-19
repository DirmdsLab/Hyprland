-- ╭─────────────────────────────╮
-- │          Keybind            │
-- ╰─────────────────────────────╯

-- Super Key
local mainMod                       = "SUPER"

-- Terminal 
local terminal                      = "kitty"

-- File
local fileManager                   = "thunar"

-- Browser
local browser                       = "firefox"
local browser_shortcut              = "~/File/Script/shortcut/firefox-search.sh"

-- Lock
local lockscreen                    = "~/File/Script/hyprland/hyprlock/hyprlock-script.sh"
local lockidle                      = "~/File/Script/hyprland/hyprlock/hyprlock-idle.sh"

-- Menu
local menu                          = "wofi --show drun --insensitive"

-- Code
local code                          = "codium"

-- Vol
local volup                         = "~/File/Script/audio/vol.sh up"
local voldown                       = "~/File/Script/audio/vol.sh down"
local volmute                       = "~/File/Script/audio/vol.sh mute"

-- Mpvpaper
local mpvpaper                      = "~/File/Script/mpvpaper/mpvpaper.sh"

local mpvpaper_next                 = [[sh -c 'echo "{ \"command\": [\"playlist-next\"] }" | socat - /tmp/mpv-socket']]
local mpvpaper_prev                 = [[sh -c 'echo "{ \"command\": [\"playlist-prev\"] }" | socat - /tmp/mpv-socket']]
local mpvpaper_color                = [[sh -c 'echo "{ \"command\": [\"set_property\", \"saturation\", 70] }" | socat - /tmp/mpv-socket']]
local mpvpaper_reset                = [[sh -c 'echo "{ \"command\": [\"set_property\", \"saturation\", 0] }" | socat - /tmp/mpv-socket']]

local mpvpaper_menu                 = "~/File/Script/mpvpaper/mpvpaper-menu.sh"

-- Screenshot
local screenshot                    = "~/File/Script/screenshot/ss.sh fullss"
local screenshot_area               = "~/File/Script/screenshot/ss.sh cropss"

-- Workspace
local workspace_tran                = "~/File/Script/hyprland/workspace/workspacetransparant.sh"
local workspace_list                = "~/File/Script/hyprland/workspace/listworkspace.sh"

local workspace_zoom_reset          = "~/File/Script/hyprland/zoom/zoom-workspace.sh zoomreset"
local workspace_zoom_in             = "~/File/Script/hyprland/zoom/zoom-workspace.sh zoomin"
local workspace_zoom_out            = "~/File/Script/hyprland/zoom/zoom-workspace.sh zoomout"

-- Clipboard
local clipboard                     = "~/File/Script/clipboard/clip.sh"

-- Task Manager
local taskmanager                   = "~/File/Script/hyprland/taskmanager/taskmanager.sh"





-- | A keybind |
-- Vol
hl.bind(mainMod .. " + A",        hl.dsp.exec_cmd(volup))
hl.bind(mainMod .. " + CTRL + A", hl.dsp.exec_cmd(voldown))
hl.bind(mainMod .. " + SHIFT + A",hl.dsp.exec_cmd(volmute))





-- | B keybind |





-- | C keybind |
-- codium
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(code))





-- | D keybind |
-- Special workspace
hl.bind(mainMod .. " + D", hl.dsp.workspace.toggle_special("Hmph"))
hl.bind(mainMod .. " + SHIFT + D", hl.dsp.window.move({ workspace = "special:Hmph" }))

-- MPVPaper (Wallpaper)
hl.bind(mainMod .. " + CTRL + SHIFT + D",
    hl.dsp.exec_cmd(mpvpaper))

hl.bind("CTRL + ALT + D",
    hl.dsp.exec_cmd(mpvpaper_next))

hl.bind("CTRL + ALT + A",
    hl.dsp.exec_cmd(mpvpaper_prev))

hl.bind("CTRL + ALT + S",
    hl.dsp.exec_cmd(mpvpaper_color))

hl.bind("CTRL + ALT + W",
    hl.dsp.exec_cmd(mpvpaper_reset))

hl.bind(mainMod .. " + CTRL + D",
    hl.dsp.exec_cmd(mpvpaper_menu))





-- | E keybind |

-- File Manager
hl.bind(mainMod .. " + CTRL + E", hl.dsp.exec_cmd(fileManager))

-- Special workspace
hl.bind(mainMod .. " + E", hl.dsp.workspace.toggle_special("UwU"))
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.window.move({ workspace = "special:UwU" }))





-- | F keybind |
-- Fullscreen
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())

-- Firefox
hl.bind(mainMod .. " + CTRL + F",
    hl.dsp.exec_cmd(browser))

hl.bind(mainMod .. " + CTRL + SHIFT + F",
    hl.dsp.exec_cmd(browser_shortcut))





-- | G keybind |






-- | H keybind |





-- | I keybind |





-- | J keybind |






-- | K keybind |
-- TEMP Tablet
hl.bind(mainMod .. " + K", hl.dsp.exec_cmd("~/File/Temp/tablet/lock.sh normal"))
hl.bind(mainMod .. " + CTRL + K", hl.dsp.exec_cmd("~/File/Temp/tablet/lock.sh idle"))





-- | L keybind |
-- Lockscreen
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd(lockscreen))
hl.bind(mainMod .. " + CTRL + L", hl.dsp.exec_cmd(lockidle))






-- | M keybind |





-- | N keybind |





-- | O keybind |





-- | P keybind |





-- | Q keybind |
-- Close Window
hl.bind(mainMod .. " + CTRL + Q", hl.dsp.window.close())





-- | R keybind |
-- Menu
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))

hl.bind(mainMod .. " + CTRL + R", function()
    hl.dispatch(hl.dsp.focus({ workspace = "empty" }))
    hl.dispatch(hl.dsp.exec_cmd(menu))
end)






-- | S keybind |
-- Special workspace (magic)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Screenshot
hl.bind(mainMod .. " + CTRL + SHIFT + S",
    hl.dsp.exec_cmd(screenshot))

hl.bind(mainMod .. " + CTRL + S",
    hl.dsp.exec_cmd(screenshot_area))





-- | T keybind |
-- Terminal
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))

-- Transparant
hl.bind(mainMod .. " + SHIFT + T",
    hl.dsp.exec_cmd(workspace_tran))





-- | U keybind |





-- | V keybind |
-- Clipboard
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(clipboard))





-- | W keybind |
-- Empty workspace
hl.bind(mainMod .. " + W", hl.dsp.focus({ workspace = "empty" }))
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.window.move({ workspace = "empty" }))

-- list workspace
hl.bind(mainMod .. " + CTRL + W",
    hl.dsp.exec_cmd(workspace_list))





-- | X keybind |
-- Float
hl.bind(mainMod .. " + CTRL + X", hl.dsp.window.float({ action = "toggle" }))

-- Special temp
hl.bind(mainMod .. " + X", hl.dsp.workspace.toggle_special("temp"))
hl.bind(mainMod .. " + SHIFT + X", hl.dsp.window.move({ workspace = "special:temp" }))





-- | Y keybind |





-- | Z keybind |
-- Zoom
hl.bind(mainMod .. " + CTRL + Z",
    hl.dsp.exec_cmd(workspace_zoom_in))

hl.bind(mainMod .. " + CTRL + SHIFT + Z",
    hl.dsp.exec_cmd(workspace_zoom_out ))

hl.bind(mainMod .. " + Z",
    hl.dsp.exec_cmd(workspace_zoom_reset ))





-- | Special keybind |
-- Task Manager
hl.bind("CTRL + SHIFT + Escape", hl.dsp.exec_cmd(taskmanager))

-- Arrow
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- workspace switch 1-20
for i = 1, 10 do
    local key = i % 10

    hl.bind(mainMod .. " + " .. key,
        hl.dsp.focus({ workspace = i }))

    hl.bind(mainMod .. " + CTRL + " .. key,
        hl.dsp.focus({ workspace = i + 10 }))

    hl.bind(mainMod .. " + SHIFT + " .. key,
        hl.dsp.window.move({ workspace = i }))

    hl.bind(mainMod .. " + CTRL + SHIFT + " .. key,
        hl.dsp.window.move({ workspace = i + 10 }))
end

-- workspace scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e+1" }))

-- workspace key
hl.bind("ALT + CTRL + Tab", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("ALT + CTRL + SHIFT + Tab", hl.dsp.focus({ workspace = "e-1" }))

-- alt + tab
hl.bind("ALT + Tab", hl.dsp.window.cycle_next({ next = true }))
hl.bind("ALT + SHIFT + Tab", hl.dsp.window.cycle_next({ next = false }))

-- WINDOW DRAG / RESIZE
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })