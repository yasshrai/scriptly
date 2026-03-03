#!/bin/bash

set -e

URL="https://api2.cursor.sh/updates/download/golden/linux-x64/cursor/2.5"
INSTALL_DIR="/opt/cursor"
INSTALL_FILE="$INSTALL_DIR/Cursor.appimage"
DESKTOP_DIR="/usr/share/applications"

# Absolute path of the script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Starting Cursor installation..."

# Must run as root
if [[ $EUID -ne 0 ]]; then
   echo "Please run with sudo."
   exit 1
fi

# Check required tools
if ! command -v curl &> /dev/null; then
    echo "curl is required but not installed."
    exit 1
fi

echo "Creating install directory..."
mkdir -p "$INSTALL_DIR"

echo "Downloading Cursor AppImage..."
curl -L "$URL" -o "$INSTALL_FILE"

echo "Making AppImage executable..."
chmod +x "$INSTALL_FILE"

echo "Ensuring applications directory exists..."
mkdir -p "$DESKTOP_DIR"

echo "Copying desktop file..."
DESKTOP_SOURCE="$SCRIPT_DIR/../configs/cursor.desktop"
if [[ -f "$DESKTOP_SOURCE" ]]; then
    cp "$DESKTOP_SOURCE" "$DESKTOP_DIR/"
else
    echo "Error: cursor.desktop not found in configs folder."
    exit 1
fi

echo "Copying icon file..."
ICON_SOURCE="$SCRIPT_DIR/../configs/cursor.png"
if [[ -f "$ICON_SOURCE" ]]; then
    cp "$ICON_SOURCE" "$INSTALL_DIR/"
else
    echo "Error: cursor.png not found in configs folder."
    exit 1
fi

echo "Cursor installed successfully."