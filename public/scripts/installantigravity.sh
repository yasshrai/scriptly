#!/bin/bash

set -e

URL="https://edgedl.me.gvt1.com/edgedl/release2/j0qc3/antigravity/stable/1.21.6-5723021441368064/linux-x64/Antigravity.tar.gz"
TMP_FILE="/tmp/Antigravity.tar.gz"
INSTALL_DIR="/opt/Antigravity"
DESKTOP_DIR="/usr/share/applications"

# Absolute path of the script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Starting Antigravity installation..."

# Must run as root
if [[ $EUID -ne 0 ]]; then
   echo "Please run with sudo."
   exit 1
fi

# Check required tools
for cmd in curl tar; do
    if ! command -v $cmd &> /dev/null; then
        echo "$cmd is required but not installed."
        exit 1
    fi
done

echo "Downloading Antigravity..."
curl -L -o "$TMP_FILE" "$URL"

echo "Creating install directory..."
mkdir -p "$INSTALL_DIR"

echo "Extracting to $INSTALL_DIR..."
tar -xzf "$TMP_FILE" -C "$INSTALL_DIR" --strip-components=1

echo "Ensuring applications directory exists..."
mkdir -p "$DESKTOP_DIR"

echo "Creating desktop file..."
cat << 'EOF' > "$DESKTOP_DIR/antigravity.desktop"
[Desktop Entry]
Name=Antigravity
Comment=Code Editing. Redefined.
Exec=/opt/Antigravity/antigravity
Icon=/opt/Antigravity/resources/app/resources/linux/antigravity.png
Type=Application
Categories=Development;IDE;
Terminal=false
EOF

echo "Cleaning up..."
rm -f "$TMP_FILE"

echo "Antigravity installed successfully."