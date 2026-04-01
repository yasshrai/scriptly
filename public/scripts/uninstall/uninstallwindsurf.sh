#!/bin/bash

set -e

INSTALL_DIR="/opt/windsurf"
DESKTOP_DIR="/usr/share/applications"

echo "Starting windsurf uninstallation..."

if [[ $EUID -ne 0 ]]; then
   echo "Please run with sudo."
   exit 1
fi

if [ -d "$INSTALL_DIR" ]; then
    echo "Removing windsurf directory..."
    rm -rf "$INSTALL_DIR"
fi

if [ -f "$DESKTOP_DIR/windsurf.desktop" ]; then
    echo "Removing desktop file..."
    rm "$DESKTOP_DIR/windsurf.desktop"
fi

echo "windsurf uninstalled successfully."
