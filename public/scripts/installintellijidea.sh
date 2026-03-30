#!/bin/bash

set -e

URL="https://download.jetbrains.com/idea/idea-2026.1.tar.gz"
TMP_FILE="/tmp/intellijidea.tar.gz"
INSTALL_DIR="/opt/intellij"
DESKTOP_DIR="/usr/share/applications"

# Absolute path of the script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Starting IntellijIdea installation..."

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

echo "Downloading Intellijidea..."
curl -L -o "$TMP_FILE" "$URL"

echo "Creating install directory..."
mkdir -p "$INSTALL_DIR"

echo "Extracting to $INSTALL_DIR..."
tar -xzf "$TMP_FILE" -C "$INSTALL_DIR" --strip-components=1

echo "Ensuring applications directory exists..."
mkdir -p "$DESKTOP_DIR"

echo "Creating desktop file..."
cat << 'EOF' > "$DESKTOP_DIR/intellij.desktop"
[Desktop Entry]
Name=IntellijIdea
Comment=Code Editing. Redefined.
Exec=/opt/intellij/bin/idea
Icon=/opt/intellij/bin/idea.png
Type=Application
Categories=Development;IDE;
Terminal=false
EOF

echo "Cleaning up..."
rm -f "$TMP_FILE"

echo "IntellijIdea installed successfully."