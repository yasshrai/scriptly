#!/bin/bash

set -e

INSTALL_DIR="/opt/intellij"
DESKTOP_DIR="/usr/share/applications"

echo "Starting IntellijIdea uninstallation..."

if [[ $EUID -ne 0 ]]; then
   echo "Please run with sudo."
   exit 1
fi

if [ -d "$INSTALL_DIR" ]; then
    echo "Removing intellijIdea directory..."
    rm -rf "$INSTALL_DIR"
fi

if [ -f "$DESKTOP_DIR/intellij.desktop" ]; then
    echo "Removing desktop file..."
    rm "$DESKTOP_DIR/intellij.desktop"
fi

echo "IntellijIdea uninstalled successfully."
