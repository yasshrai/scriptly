# Cursor Installer (Linux x64)

This script installs (and updates) Cursor using the official Linux x64 AppImage release.

## Requirements
- Linux 64-bit (x86_64)
- curl
- sudo privileges

## Installation
Run the following from the project root:

```bash
chmod +x scripts/installcursor.sh
sudo ./scripts/installcursor.sh
```

## Installation Paths
Application file: /opt/cursor/Cursor.appimage  
Icon file: /opt/cursor/cursor.png  
Desktop entry: /usr/share/applications/cursor.desktop  

After installation, you can launch Cursor from your application menu.