# Scriptly

Scriptly is a lightweight Linux utility for installing applications using structured shell scripts.

It focuses on clean, manual installations from official sources such as `tar.gz` and `AppImage` packages.

---

## 🚀 Current Support

Scriptly currently supports:

- Visual Studio Code (Linux x64)

---

## 🔮 Future Plans

Support for additional IDEs and developer tools will be added in future updates, such as:

- IntelliJ IDEA
- PyCharm
- Android Studio
- Other popular development tools

---
## ⚙️ Requirements

- Linux (64-bit recommended)
- bash
- curl
- tar
- sudo privileges

---

## 🛠 Installation Example

To install any app:

```bash
chmod +x scripts/install<app>.sh
sudo ./scripts/install<app>.sh
```