#!/usr/bin/env bash

set -euo pipefail

# Check argument
if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <path>"
    exit 1
fi

BASE_PATH="$1"

echo "Creating folder structure in: $BASE_PATH"

# Main folders
mkdir -p "$BASE_PATH/Main/Documents"
mkdir -p "$BASE_PATH/Main/Downloads"
mkdir -p "$BASE_PATH/Main/File"
mkdir -p "$BASE_PATH/Main/Pictures"
mkdir -p "$BASE_PATH/Main/Playlists"
mkdir -p "$BASE_PATH/Main/Videos"

# Subfolders inside Main/File
mkdir -p "$BASE_PATH/Main/File/Code"
mkdir -p "$BASE_PATH/Main/File/Software"
mkdir -p "$BASE_PATH/Main/File/Temp"

# Subfolders inside Software
mkdir -p "$BASE_PATH/Main/File/Software/Game"
mkdir -p "$BASE_PATH/Main/File/Software/Podman"
mkdir -p "$BASE_PATH/Main/File/Software/VM"
mkdir -p "$BASE_PATH/Main/File/Software/App"

echo "Folder structure created successfully."