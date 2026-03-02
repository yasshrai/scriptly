# Visual Studio Code Installer (Linux x64)

This script installs (update too) Visual Studio Code using the official Linux x64 tar.gz release.

## Requirements
- Linux 64-bit (x86_64)
- curl
- tar
- sudo privileges

## Installation
Run the following from the project root:

```bash
chmod +x scripts/installvscode.sh
sudo ./scripts/installvscode.sh
```
## Installation Paths
Application files: /opt/vscode
Desktop entry: /usr/share/applications

After installation, you can launch it from your application menu 