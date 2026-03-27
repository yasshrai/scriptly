#!/bin/bash

set -e

URL="https://windsurf.com/api/windsurf/download-redirect?build=linux-x64&isNext=false"
TMP_FILE="/tmp/windsurf.tar.gz"
INSTALL_DIR="/opt/windsurf"
DESKTOP_DIR="/usr/share/applications"

# Absolute path of the script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Starting Windsurf installation..."

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

echo "Downloading Windsurf..."
curl -L -o "$TMP_FILE" "$URL"

echo "Creating install directory..."
mkdir -p "$INSTALL_DIR"

echo "Extracting to $INSTALL_DIR..."
tar -xzf "$TMP_FILE" -C "$INSTALL_DIR" --strip-components=1

echo "Ensuring applications directory exists..."
mkdir -p "$DESKTOP_DIR"

echo "Copying desktop file..."
DESKTOP_SOURCE="$SCRIPT_DIR/../configs/windsurf.desktop"

if [[ -f "$DESKTOP_SOURCE" ]]; then
    cp "$DESKTOP_SOURCE" "$DESKTOP_DIR/"
else
    echo "Error: windsurf.desktop not found in configs folder."
    exit 1
fi

echo "Cleaning up..."
rm -f "$TMP_FILE"

echo " Windsurf installed successfully."