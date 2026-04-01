#!/bin/bash

set -e

INSTALL_DIR="/opt/Antigravity"
DESKTOP_DIR="/usr/share/applications"

echo "Starting antigravity uninstallation..."

if [[ $EUID -ne 0 ]]; then
   echo "Please run with sudo."
   exit 1
fi

if [ -d "$INSTALL_DIR" ]; then
    echo "Removing antigravity directory..."
    rm -rf "$INSTALL_DIR"
fi

if [ -f "$DESKTOP_DIR/antigravity.desktop" ]; then
    echo "Removing desktop file..."
    rm "$DESKTOP_DIR/antigravity.desktop"
fi

echo "Antigravity uninstalled successfully."
