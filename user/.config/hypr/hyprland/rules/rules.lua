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
    gaps_in = 0,
    gaps_out = 0,
})

hl.window_rule({
    match = {
        workspace = "11",
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

    opacity = 0.97,
})

-- btop
hl.window_rule({
    match = {
        class = "btop-sysmon",
    },

    opacity = 0.8,
    fullscreen = true,
})

-- thunar
-- Thunar utama
hl.window_rule({
    match = {
        class = "thunar",
    },

    no_blur = true,
    opacity = 0.95,
})

-- Dialog Rename
hl.window_rule({
    match = {
        class = "thunar",
        title = "^Rename.*",
    },

    float = true,
})

-- magic
hl.workspace_rule({
    workspace = "special:magic",
    layout = "master",
})
