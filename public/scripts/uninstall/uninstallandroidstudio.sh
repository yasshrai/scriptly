#!/bin/bash

# Must run as root
if [[ $EUID -ne 0 ]]; then
   echo "Please run with sudo."
   exit 1
fi

echo "Uninstalling Android Studio..."

echo "Removing installation directory..."
rm -rf /opt/androidstudio

echo "Removing desktop entry..."
rm -f /usr/share/applications/androidstudio.desktop

echo "Android Studio has been uninstalled successfully."
