-- Animation
-- Curve
hl.curve("standard", {
    type = "bezier",
    points = {
        {0.2, 0.0},
        {0.0, 1.0},
    }
})

hl.curve("emphasizedAccel", {
    type = "bezier",
    points = {
        {0.3, 0.0},
        {0.8, 0.15},
    }
})

hl.curve("emphasizedDecel", {
    type = "bezier",
    points = {
        {0.05, 0.7},
        {0.1, 1.0},
    }
})

hl.curve("specialWorkSwitch", {
    type = "bezier",
    points = {
        {0.2, 0.8},
        {0.2, 1.0},
    }
})

hl.curve("quick", {
    type = "bezier",
    points = {
        {0.15, 0.0},
        {0.1, 1.0},
    }
})

-- Global
hl.animation({
    leaf = "global",
    enabled = true,
    speed = 10,
    bezier = "default",
})

-- Border
hl.animation({
    leaf = "border",
    enabled = true,
    speed = 6,
    bezier = "standard",
})

-- Window
hl.animation({
    leaf = "windowsIn",
    enabled = true,
    speed = 5,
    bezier = "emphasizedDecel",
})

hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 3,
    bezier = "emphasizedAccel",
})

hl.animation({
    leaf = "windowsMove",
    enabled = true,
    speed = 6,
    bezier = "standard",
})

-- Layer And Fade
hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 3,
    bezier = "standard",
})

hl.animation({
    leaf = "layersIn",
    enabled = true,
    speed = 5,
    bezier = "emphasizedDecel",
    style = "slide",
})

hl.animation({
    leaf = "layersOut",
    enabled = true,
    speed = 4,
    bezier = "emphasizedAccel",
    style = "slide",
})

hl.animation({
    leaf = "fadeLayersIn",
    enabled = true,
    speed = 5,
    bezier = "standard",
})

hl.animation({
    leaf = "fadeLayersOut",
    enabled = true,
    speed = 5,
    bezier = "standard",
})

-- Workspaces 
hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 5,
    bezier = "standard",
})

-- Special
hl.animation({
    leaf = "specialWorkspace",
    enabled = true,
    speed = 6,
    bezier = "specialWorkSwitch",
    style = "slidefadevert 30%",
})

hl.animation({
    leaf = "specialWorkspaceOut",
    enabled = true,
    speed = 6,
    bezier = "specialWorkSwitch",
    style = "slidefadevert -30%",
})

-- Zoom
hl.animation({ 
    leaf = "zoomFactor",    
    enabled = true,  speed = 7,    
    bezier = "quick" 
})
