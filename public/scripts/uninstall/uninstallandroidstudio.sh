#!/bin/bash

# Must run as root
if [[ $EUID -ne 0 ]]; then
   echo -e "\e[31m==>\e[0m Please run with sudo."
   exit 1
fi

echo -e "\e[31m==>\e[0m Uninstalling Android Studio..."

echo -e "\e[31m==>\e[0m Removing installation directory..."
rm -rf /opt/androidstudio

echo -e "\e[31m==>\e[0m Removing desktop entry..."
rm -f /usr/share/applications/androidstudio.desktop

echo -e "\e[31m==>\e[0m Android Studio has been uninstalled successfully."
