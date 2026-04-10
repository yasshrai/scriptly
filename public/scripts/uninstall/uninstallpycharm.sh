#!/bin/bash

# Must run as root
if [[ $EUID -ne 0 ]]; then
   echo -e "\e[31m==>\e[0m Please run with sudo."
   exit 1
fi

echo -e "\e[31m==>\e[0m Uninstalling Pycharm..."

echo -e "\e[31m==>\e[0m Removing installation directory..."
rm -rf /opt/pycharm

echo -e "\e[31m==>\e[0m Removing desktop entry..."
rm -f /usr/share/applications/pycharm.desktop

echo -e "\e[31m==>\e[0m Pycharm has been uninstalled successfully."
