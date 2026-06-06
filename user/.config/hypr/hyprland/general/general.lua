-- General

hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 20,

        border_size = 2,

        col = {
            active_border = {
                colors = { "rgba(aaaaaa99)", "rgba(ffffffff)" },
                angle = 45
            },
            inactive_border = {
                colors = { "rgba(33333355)", "rgba(999999aa)" },
                angle = 45
            },
        },

        resize_on_border = false,

        allow_tearing = false,

        layout = "scrolling",
    },

    decoration = {
        rounding       = 10,
        rounding_power = 2,

        -- Change transparency of focused and unfocused windows
        active_opacity   = 1.0,
        inactive_opacity = 0.8,

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },

        blur = {
            enabled   = true,
            size      = 3,
            passes    = 1,
            vibrancy  = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})

hl.config({
    dwindle = {
        preserve_split = true, 
    },
})

hl.config({
    master = {
        new_status = "master",
    },
})

hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
        column_width = 1.0,
        focus_fit_method = 1,
        follow_focus = true,
        follow_min_visible = 0.0,

        direction = "right",

    },
})

hl.config({
    misc = {
        force_default_wallpaper = -1,    
        disable_hyprland_logo   = false,
        session_lock_xray       = true, 
    },
})

hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,
        

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = false,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})