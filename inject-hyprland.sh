#!/usr/bin/env bash

# =========================
# ROOT PROJECT
# =========================
ROOT="$(pwd)"
# =========================
# TARGET FILE 1 (Fish)
# =========================
FISH_FILE="$ROOT/user/.config/fish/config.fish"

MARKER="# Triger-Add"

# =========================
# TARGET FILE 2 (Hyprland)
# =========================
HYPR_FILE="$ROOT/user/.config/hypr/hyprland/monitors/monitors.lua"
MPVPAPER_FILE="$ROOT/user/File/Script/mpvpaper/mpvpaper.sh"
MPVPAPER_LOCK_FILE="$ROOT/user/File/Script/hyprland/hyprlock/hyprlock-script.sh"


# =========================
# COMMANDS YANG MAU DIINJECT
# =========================
COMMANDS=(
"    # command 1"
"    # command 2"
"    # command 3"
)

# =========================
# VALIDASI FILE FISH
# =========================
if [ ! -f "$FISH_FILE" ]; then
  echo "File tidak ditemukan: $FISH_FILE"
  exit 1
fi

# =========================
# VALIDASI FILE HYPRLAND
# =========================
if [ ! -f "$HYPR_FILE" ]; then
  echo "File tidak ditemukan: $HYPR_FILE"
  exit 1
fi

# =========================
# PROSES INJECT FISH
# =========================
awk -v marker="$MARKER" '
{
  print
  if ($0 ~ marker) {
    while ((getline line < "/dev/stdin") > 0) {
      print line
    }
  }
}
' "$FISH_FILE" < <(printf "%s\n" "${COMMANDS[@]}") > "$FISH_FILE.tmp" && mv "$FISH_FILE.tmp" "$FISH_FILE"

echo "Inject config.fish selesai."

# =========================
# PROSES REPLACE HYPRLAND
# =========================

MONITOR=$(hyprctl monitors | awk '/^Monitor / {print $2; exit}')

MODE=$(hyprctl monitors | awk '
/availableModes:/ {
    for (i=2; i<=NF; i++) {
        split($i,a,"@")

        res=a[1]
        hz=a[2]
        gsub(/Hz/,"",hz)

        split(res,r,"x")
        pixels=r[1]*r[2]

        hz += 0

        if (pixels > best_pixels || (pixels == best_pixels && hz > best_hz)) {
            best_pixels = pixels
            best_hz = hz
            best_res = res
        }
    }
}
END {
    printf "%s@%d\n", best_res, best_hz
}')

sed -i "s|output   = \".*\"|output   = \"$MONITOR\"|" "$HYPR_FILE"

sed -i "s|^OUTPUT_NAME=\".*\"|OUTPUT_NAME=\"$MONITOR\"|" "$MPVPAPER_FILE"

sed -i "s|^MONITOR=\"[^\"]*\"|MONITOR=\"$MONITOR\"|" "$MPVPAPER_LOCK_FILE"

sed -i "s|mode     = \".*\"|mode     = \"$MODE\"|" "$HYPR_FILE"