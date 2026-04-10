#!/bin/bash

set -e

INSTALL_DIR="/opt/vscode"
DESKTOP_DIR="/usr/share/applications"

echo -e "\e[31m==>\e[0m Starting VSCode uninstallation..."

if [[ $EUID -ne 0 ]]; then
   echo -e "\e[31m==>\e[0m Please run with sudo."
   exit 1
fi

if [ -d "$INSTALL_DIR" ]; then
    echo -e "\e[31m==>\e[0m Removing vscode directory..."
    rm -rf "$INSTALL_DIR"
fi

if [ -f "$DESKTOP_DIR/vscode.desktop" ]; then
    echo -e "\e[31m==>\e[0m Removing desktop file..."
    rm "$DESKTOP_DIR/vscode.desktop"
fi

echo -e "\e[31m==>\e[0m VSCode uninstalled successfully."
