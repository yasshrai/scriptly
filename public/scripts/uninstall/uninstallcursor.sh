#!/bin/bash

set -e

INSTALL_DIR="/opt/cursor"
DESKTOP_DIR="/usr/share/applications"

echo "Starting Cursor uninstallation..."

if [[ $EUID -ne 0 ]]; then
   echo "Please run with sudo."
   exit 1
fi

if [ -d "$INSTALL_DIR" ]; then
    echo "Removing Cursor directory..."
    rm -rf "$INSTALL_DIR"
fi

if [ -f "$DESKTOP_DIR/cursor.desktop" ]; then
    echo "Removing desktop file..."
    rm "$DESKTOP_DIR/cursor.desktop"
fi

echo "Cursor uninstalled successfully."
