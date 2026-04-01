#!/bin/bash

set -e

INSTALL_DIR="/opt/vscode"
DESKTOP_DIR="/usr/share/applications"

echo "Starting VSCode uninstallation..."

if [[ $EUID -ne 0 ]]; then
   echo "Please run with sudo."
   exit 1
fi

if [ -d "$INSTALL_DIR" ]; then
    echo "Removing vscode directory..."
    rm -rf "$INSTALL_DIR"
fi

if [ -f "$DESKTOP_DIR/vscode.desktop" ]; then
    echo "Removing desktop file..."
    rm "$DESKTOP_DIR/vscode.desktop"
fi

echo "VSCode uninstalled successfully."
