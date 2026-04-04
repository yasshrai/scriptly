#!/bin/bash

# Must run as root
if [[ $EUID -ne 0 ]]; then
   echo "Please run with sudo."
   exit 1
fi

echo "Uninstalling Pycharm..."

echo "Removing installation directory..."
rm -rf /opt/pycharm

echo "Removing desktop entry..."
rm -f /usr/share/applications/pycharm.desktop

echo "Pycharm has been uninstalled successfully."
