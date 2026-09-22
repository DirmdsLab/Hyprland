-- rules

-- maximize
local suppressMaximizeRule = hl.window_rule({
    
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})

-- drag
hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

-- workspace 10
hl.workspace_rule({
    workspace = "10",
    gaps_in = 0,
    gaps_out = 0,
})

hl.window_rule({
    match = {
        workspace = "10",
    },
    rounding = 0,
    border_size = 0,
})

-- workspace 11
hl.workspace_rule({
    workspace = "11",
    layout = "dwindle",
})

-- workspace 12
hl.workspace_rule({
    workspace = "12",
    layout = "dwindle",
})

-- workspace 13
hl.workspace_rule({
    workspace = "13",
    layout = "dwindle",
})

-- workspace 14
hl.workspace_rule({
    workspace = "14",
    layout = "dwindle",
})

-- workspace 15
hl.workspace_rule({
    workspace = "15",
    layout = "dwindle",
})

-- workspace 16
hl.workspace_rule({
    workspace = "16",
    layout = "master",
})

-- workspace 17
hl.workspace_rule({
    workspace = "17",
    layout = "master",
})

-- workspace 18
hl.workspace_rule({
    workspace = "18",
    layout = "master",
})

-- workspace 19
hl.workspace_rule({
    workspace = "19",
    layout = "master",
})

-- workspace 20
hl.workspace_rule({
    workspace = "20",
    layout = "master",
})

-- workspace 21 hyprlock
hl.workspace_rule({
    workspace = "21",
    gaps_in = 0,
    gaps_out = 0,
})

hl.window_rule({
    match = {
        workspace = "21",
    },
    rounding = 0,
    border_size = 0,
})

-- mpv
hl.window_rule({
    match = {
        class = "^mpv$",
    },

    float = true,
    size = { 854, 480 },
    move = { 100, 100 },
})

-- moonlight
hl.window_rule({
    match = {
        class = "com.moonlight_stream.Moonlight",
    },

    float = true,
    size = { 854, 480 },
    move = { 100, 100 },
})

-- codium
hl.window_rule({
    match = {
        class = "codium",
    },

    no_blur = true,
    opacity = 0.95,
})

-- firefox
hl.window_rule({
    match = {
        class = "firefox",
    },

    opacity = 0.95,
})

-- firefox youtube
hl.window_rule({
    match = {
        class = "firefox",
        title = ".*YouTube.*",
    },

    opacity = 1,
})

-- btop
hl.window_rule({
    match = {
        class = "btop-sysmon",
    },

    opacity = 0.8,
    fullscreen = true,
})

-- magic
hl.workspace_rule({
    workspace = "special:magic",
    layout = "master",
})

hl.window_rule({
    name = "magic-float-all",
    match = {
        workspace = "special:magic",
    },

    float = true,
})

-- terminalX
hl.workspace_rule({
    workspace = "special:terminalX",
    layout = "master",
})

hl.window_rule({
    name = "terminalX-float-all",
    match = {
        workspace = "special:terminalX",
    },

    float = true,
})

hl.window_rule({
    name = "terminalX-tile-exceptions",
    match = {
        workspace = "special:terminalX",
        class = "Term[1-3]", 
    },
    tile = true,
})

-- UwU
hl.window_rule({
    name = "UwU-float-all",
    match = {
        workspace = "special:UwU",
    },

    float = true,
    size = "1280 720",
})

hl.window_rule({
    name = "UwU-tile-exceptions",
    match = {
        workspace = "special:UwU",
        class = "thunar", 
    },
    tile = true,
})

-- thunar
-- Thunar utama
hl.window_rule({
    match = {
        class = "thunar",
    },

    no_blur = true,
    opacity = 0.99,
})

-- Dialog Rename
hl.window_rule({
    match = {
        class = "thunar",
        title = "^Rename.*",
    },

    float = true,
    center = true,
})

hl.window_rule({
    name = "Thunar-create-folder-dialog",
    match = {
        class = "thunar",
        title = "^Create New Folder.*",
    },

    float = true,
    center = true,
})

hl.window_rule({
    name = "Thunar-delete-dialog",
    match = {
        class = "thunar",
        title = "^Attention.*",
    },

    float = true,
    center = true,
})

hl.window_rule({
    name = "Thunar-empty-dialog",
    match = {
        class = "thunar",
        title = "^Empty Trash.*",
    },

    float = true,
    center = true,
})

hl.window_rule({
    name = "Thunar-Operation-dialog",
    match = {
        class = "thunar",
        title = "^File Operation Progress.*",
    },

    float = true,
    center = true,
})

hl.window_rule({
    name = "Thunar-Attention-dialog",
    match = {
        class = "thunar",
        title = "^Attention.*",
    },

    float = true,
    center = true,
})

-- Hmm
hl.workspace_rule({
    workspace = "special:Hmm",
    gaps_in = 0,
    gaps_out = 0,
})

hl.window_rule({
    match = {
        workspace = "special:Hmm",
    },
    rounding = 0,
    border_size = 0,
})

-- Music
hl.window_rule({
    match = {
        class = "music-mpv",
    },

    workspace = "special:Hmm",
    move = { 100, 100 },
    size = { 1280, 720 },

})

hl.window_rule({
    match = {
        class = "foot-music",
    },

    workspace = "special:Hmm",
})

-- kitty-audio
hl.window_rule({
    match = {
        class = "kitty-audio",
    },

    no_blur = true,
    opacity = 0.3,

    workspace = 21,

})

-- kitty-overlay
hl.window_rule({
    match = {
        class = "kitty-overlay",
    },

    float = true,
    no_blur = true,
    opacity = 1,

    size = { "monitor_w*1", "monitor_h*1" },
    move = { 0, 0 },

    workspace = 21,

})

-- scrcpy
hl.window_rule({
    match = {
        class = ".scrcpy-wrapped",
    },

    workspace = 12,
})