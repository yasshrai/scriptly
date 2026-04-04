#!/bin/bash

set -e

URL="https://edgedl.me.gvt1.com/android/studio/ide-zips/2025.3.3.6/android-studio-panda3-linux.tar.gz"
TMP_FILE="/tmp/androidstudio.tar.gz"
INSTALL_DIR="/opt/androidstudio"
DESKTOP_DIR="/usr/share/applications"

# Absolute path of the script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Starting Android Studio  installation..."

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

echo "Downloading Android Studio..."
curl -L -o "$TMP_FILE" "$URL"

echo "Creating install directory..."
mkdir -p "$INSTALL_DIR"

echo "Extracting to $INSTALL_DIR..."
tar -xzf "$TMP_FILE" -C "$INSTALL_DIR" --strip-components=1

echo "Ensuring applications directory exists..."
mkdir -p "$DESKTOP_DIR"

echo "Creating desktop file..."
cat << 'EOF' > "$DESKTOP_DIR/androidstudio.desktop"
[Desktop Entry]
Name=androidstudio
Comment=Code Editing. Redefined.
Exec=/opt/androidstudio/bin/studio
Icon=/opt/androidstudio/bin/studio.png
Type=Application
Categories=Development;IDE;
Terminal=false
EOF

echo "Cleaning up..."
rm -f "$TMP_FILE"

echo "Android Studio installed successfully."

