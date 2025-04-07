from pathlib import Path

# Define folder structure
base_path = Path("/root/wordpress-raspberrypi-setup")
docs_path = base_path / "docs"
config_path = base_path / "config"

# Create directory structure
docs_path.mkdir(parents=True, exist_ok=True)
config_path.mkdir(parents=True, exist_ok=True)

# Create README.md
readme_content = """# WordPress on Raspberry Pi Setup

This project provides a reusable WordPress setup running on Ubuntu Server and Raspberry Pi. It's ideal for personal websites, portfolios, and learning purposes.

## ✅ What's Included

- Ubuntu Server installation on Raspberry Pi
- LAMP stack setup (Apache, MariaDB, PHP)
- WordPress installation and setup
- SSL setup with Let's Encrypt
- File permissions and plugin management
- Clean WordPress files (without uploads)
- Backup and restore example

## 📁 Contents

- `wordpress-clean-setup.tar.gz` – base WordPress files (without media uploads)
- `docs/setup-guide.md` – full installation steps
- `config/wp-config-sample.php` – WordPress config template
- `config/apache-vhost.conf` – Apache virtual host config
- `config/backup-script.sh` – shell script to create backups

## 🚀 Getting Started

1. Flash Ubuntu Server on a Raspberry Pi
2. Follow the setup guide in `docs/setup-guide.md`
3. Extract the WordPress archive to your web root
4. Customize your configuration and go live!
"""

# Create setup-guide.md
setup_guide_content = """# Full Setup Guide: WordPress on Raspberry Pi

## 🧰 Requirements

- Raspberry Pi 4 or 5
- Ubuntu Server 22.04/24.04 LTS
- Internet connection
- Static IP or dynamic DNS

---

## 🔧 1. Install Ubuntu Server on Raspberry Pi

Flash Ubuntu Server using Raspberry Pi Imager. After first boot:

```bash
sudo apt update && sudo apt upgrade -y
