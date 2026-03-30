#!/bin/bash

set -e

URL="https://api2.cursor.sh/updates/download/golden/linux-x64/cursor/2.6"
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

echo "Creating desktop file..."
cat << 'EOF' > "$DESKTOP_DIR/cursor.desktop"
[Desktop Entry]
Name=Cursor
Exec=/opt/cursor/Cursor.appimage
Icon=/opt/cursor/cursor.png
Type=Application
Categories=Development;
Terminal=false
EOF

echo "Creating icon file..."
base64 -d << 'EOF' > "$INSTALL_DIR/cursor.png"
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
EOF

echo "Cursor installed successfully."