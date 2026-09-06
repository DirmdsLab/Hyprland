#!/usr/bin/env bash
set -e

# =========================
# Paths & State
# =========================
ROOT_DIR="$(pwd)"
TEMP_DIR="$ROOT_DIR/temp"
STATE_FILE="$TEMP_DIR/UwU.temp"
LOG_FILE="$TEMP_DIR/setup.log"

mkdir -p "$TEMP_DIR"

# =========================
# Run Metadata
# =========================
RUN_ID="$(date '+%Y-%m-%d %H:%M:%S')"
SEPARATOR="============================================================"

# =========================
# Logging Helpers
# =========================
timestamp() {
    date "+%Y-%m-%d %H:%M:%S"
}

log() {
    echo "[$RUN_ID] $1" | tee -a "$LOG_FILE"
}

run() {
    log "RUN: $*"
    "$@" >>"$LOG_FILE" 2>&1
}

# =========================
# State Helpers
# =========================
is_first_setup() {
    [[ ! -f "$STATE_FILE" ]]
}

mark_setup_done() {
    echo "Delete This ReSetup" > "$STATE_FILE"
    log "State file created: $STATE_FILE"
}

# =========================
# Always Run Tasks
# =========================
always_run() {
    log "=== ALWAYS RUN TASKS START ==="

    # Art-cli
    run rm -rf "$HOME/Documents/art-cli"
    run ln -sf "$ROOT_DIR/external/DirmdsLab/Art" "$HOME/Documents/art-cli"

    # Tmux
    run rm -rf "$HOME/.tmux.conf"
    run ln -sf "$ROOT_DIR/user/.tmux.conf" "$HOME/.tmux.conf"

    # Nano
    run rm -rf "$HOME/.nanorc"
    run ln -sf "$ROOT_DIR/user/.nanorc" "$HOME/.nanorc"

    # btop
    run rm -rf "$HOME/.config/btop"
    run ln -sf "$ROOT_DIR/user/.config/btop" "$HOME/.config/btop"

    # cava
    run rm -rf "$HOME/.config/cava"
    run ln -sf "$ROOT_DIR/user/.config/cava" "$HOME/.config/cava"

    # Fish
    rm -rf "$HOME/.config/fish"
    mkdir -p "$HOME/.config/fish"
    ln -sf "$ROOT_DIR/user/.config/fish/config.fish" "$HOME/.config/fish/config.fish"

    # foot
    run rm -rf "$HOME/.config/foot"
    run ln -sf "$ROOT_DIR/user/.config/foot" "$HOME/.config/foot"

    # hypr
    run rm -rf "$HOME/.config/hypr"
    run ln -sf "$ROOT_DIR/user/.config/hypr" "$HOME/.config/hypr"

    # hyprland app
    run rm -rf "$HOME/File/Software/App/hyprland"
    run ln -sf "$ROOT_DIR/user/File/Software/App/hyprland" "$HOME/File/Software/App/hyprland"

    # Thunar
    run rm -rf "$HOME/.config/Thunar"
    run ln -sf "$ROOT_DIR/user/.config/Thunar" "$HOME/.config/Thunar"

    # Kitty
    run rm -rf "$HOME/.config/kitty"
    run ln -sf "$ROOT_DIR/user/.config/kitty" "$HOME/.config/kitty"

    # kitty app
    run rm -rf "$HOME/File/Software/App/kitty"
    run ln -sf "$ROOT_DIR/user/File/Software/App/kitty" "$HOME/File/Software/App/kitty"

    # kitty-audio
    run rm -rf "$HOME/File/Software/App/cava"
    run ln -sf "$ROOT_DIR/user/File/Software/App/cava" "$HOME/File/Software/App/cava"

    # mako
    run rm -rf "$HOME/.config/mako"
    run ln -sf "$ROOT_DIR/user/.config/mako" "$HOME/.config/mako"

    # mpv
    run chmod +x "$ROOT_DIR/external/DirmdsLab/mpv-setup/linux_setup.sh"
    run bash -c 'cd "$1" && ./linux_setup.sh' _ "$ROOT_DIR/external/DirmdsLab/mpv-setup"
    
    run ln -s "$HOME/Playlists" "$HOME/.config/mpv/playlists"

    # MangoHud
    run rm -rf "$HOME/.config/MangoHud"
    run ln -sf "$ROOT_DIR/user/.config/MangoHud" "$HOME/.config/MangoHud"

    # fastfetch
    run rm -rf "$HOME/.config/fastfetch"
    run ln -sf "$ROOT_DIR/user/.config/fastfetch" "$HOME/.config/fastfetch"

    # quickshell
    run rm -rf "$HOME/.config/quickshell"
    run ln -sf "$ROOT_DIR/user/.config/quickshell" "$HOME/.config/quickshell"

    # wofi
    run rm -rf "$HOME/.config/wofi"
    run ln -sf "$ROOT_DIR/user/.config/wofi" "$HOME/.config/wofi"

    # mimeapps.list
    run rm -rf "$HOME/.config/mimeapps.list"
    run ln -sf "$ROOT_DIR/user/.config/mimeapps.list" "$HOME/.config/mimeapps.list"

    # starship.toml
    run rm -rf "$HOME/.config/starship.toml"
    run ln -sf "$ROOT_DIR/user/.config/starship.toml" "$HOME/.config/starship.toml"

    # Script
    run rm -rf "$HOME/File/Script"
    run ln -sf "$ROOT_DIR/external/DirmdsLab/Script/linux" "$HOME/File/Script"

    log "=== ALWAYS RUN TASKS END ==="
}

# =========================
# First Setup Only Tasks
# =========================
first_setup_only() {

    # clone 
    # external repo
    log "=== FIRST SETUP TASKS START ==="
    log "clone external repo"

    # DirmdsLab Repo
    run mkdir -p "$ROOT_DIR/external/DirmdsLab"

    clone_if_missing() {
        local repo_url="$1"
        local repo_dir="$2"
        shift 2

        if [[ -d "$repo_dir/.git" ]]; then
            log "skip: $repo_dir already exists"
            return 0
        fi

        if [[ -d "$repo_dir" ]]; then
            log "skip: $repo_dir already exists (not a git repo)"
            return 0
        fi

        run git clone "$@" "$repo_url" "$repo_dir"
    }

    # Art
    clone_if_missing \
        "https://github.com/DirmdsLab/Art.git" \
        "$ROOT_DIR/external/DirmdsLab/Art"

    # Script
    clone_if_missing \
        "https://github.com/DirmdsLab/Script.git" \
        "$ROOT_DIR/external/DirmdsLab/Script"

    # mpv-setup
    clone_if_missing \
        "https://github.com/DirmdsLab/mpv-setup.git" \
        "$ROOT_DIR/external/DirmdsLab/mpv-setup"

    # catppuccin
    clone_if_missing \
        "https://github.com/DirmdsLab/catppuccin-tmux.git" \
        "$ROOT_DIR/external/DirmdsLab/catppuccin-tmux" \
        -b v2.3.0

    # Home Folder
    run chmod +x "$ROOT_DIR/external/DirmdsLab/Script/linux/setup/storage-tree.sh"
    run "$ROOT_DIR/external/DirmdsLab/Script/linux/setup/storage-tree.sh" internal "$HOME"

    # .local
    run cp -r "$ROOT_DIR/user/.local" "$HOME/"

    # Tmux
    run rm -rf "$HOME/.config/tmux"
    run mkdir -p "$HOME/.config/tmux/plugins/catppuccin/"
    run cp -r "$ROOT_DIR/external/DirmdsLab/catppuccin-tmux" "$HOME/.config/tmux/plugins/catppuccin/tmux"

    # themes

    run mkdir -p "$HOME/.themes"

    run rm -rf "$ROOT_DIR/external/themes/gtk/Graphite-Dark-nord"
    run mkdir -p "$ROOT_DIR/external/themes/gtk/Graphite-Dark-nord"
    run tar -xf "$ROOT_DIR/external/themes/gtk/Graphite-Dark-nord.tar.xz" -C "$ROOT_DIR/external/themes/gtk/Graphite-Dark-nord"
    run cp -r "$ROOT_DIR/external/themes/gtk/Graphite-Dark-nord/Graphite-Dark-nord" "$HOME/.themes"

    # Cursor
    run mkdir -p "$HOME/.icons"

    run rm -rf "$ROOT_DIR/external/themes/cursor/Bibata-Modern-Ice"
    run mkdir -p "$ROOT_DIR/external/themes/cursor/Bibata-Modern-Ice"
    run tar -xf "$ROOT_DIR/external/themes/cursor/Bibata-Modern-Ice.tar.xz" -C "$ROOT_DIR/external/themes/cursor/Bibata-Modern-Ice"
    run cp -r "$ROOT_DIR/external/themes/cursor/Bibata-Modern-Ice/Bibata-Modern-Ice" "$HOME/.icons"

    # Icon
    run rm -rf "$ROOT_DIR/external/themes/icon/01-Colloid"
    run mkdir -p "$ROOT_DIR/external/themes/icon/01-Colloid"
    run tar -xf "$ROOT_DIR/external/themes/icon/01-Colloid.tar.xz" -C "$ROOT_DIR/external/themes/icon/01-Colloid"
    run cp -r $ROOT_DIR/external/themes/icon/01-Colloid/* "$HOME/.icons"

    # font 
    run fc-cache -fv

    # To apply themes
    run echo "Run 'nwg-look' to apply themes"

    log "=== FIRST SETUP TASKS END ==="
}

# =========================
# Main
# =========================
echo -e "\n$SEPARATOR" >>"$LOG_FILE"
log "Setup script started"

if is_first_setup; then
    log "First setup detected"
    first_setup_only
    mark_setup_done
else
    log "First setup already done, skipping"
fi

always_run

log "Setup script finished"
echo "$SEPARATOR" >>"$LOG_FILE"


# Bruh GPT 
