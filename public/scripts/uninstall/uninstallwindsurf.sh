#!/bin/bash

set -e

INSTALL_DIR="/opt/windsurf"
DESKTOP_DIR="/usr/share/applications"

echo -e "\e[31m==>\e[0m Starting windsurf uninstallation..."

if [[ $EUID -ne 0 ]]; then
   echo -e "\e[31m==>\e[0m Please run with sudo."
   exit 1
fi

if [ -d "$INSTALL_DIR" ]; then
    echo -e "\e[31m==>\e[0m Removing windsurf directory..."
    rm -rf "$INSTALL_DIR"
fi

if [ -f "$DESKTOP_DIR/windsurf.desktop" ]; then
    echo -e "\e[31m==>\e[0m Removing desktop file..."
    rm "$DESKTOP_DIR/windsurf.desktop"
fi

echo -e "\e[31m==>\e[0m windsurf uninstalled successfully."
