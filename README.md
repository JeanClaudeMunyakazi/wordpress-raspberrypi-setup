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

This project transforms a Raspberry Pi 4 (8GB RAM) into a fully functional web server using Ubuntu Server 24.04.2 LTS. With a 128GB microSD card as the primary storage, the setup supports a robust LAMP stack, comprising Apache, MariaDB, and PHP, followed by the installation of WordPress as a content management system (CMS). To enhance security and accessibility, an SSL certificate was implemented, and a custom domain name was configured. It's ideal for personal websites, portfolios, and learning purposes.

##  What's Included

- Ubuntu Server installation on Raspberry Pi
- LAMP stack setup (Apache, MariaDB, PHP)
- WordPress installation and setup
- SSL setup with Let's Encrypt
- File permissions and plugin management
- Clean WordPress files (without uploads)
- Backup and restore example

##  Contents

- `wordpress-clean-setup.tar.gz` – base WordPress files (without media uploads)
- `docs/setup-guide.md` – full installation steps
- `config/wp-config-sample.php` – WordPress config template
- `config/apache-vhost.conf` – Apache virtual host config
- `config/backup-script.sh` – shell script to create backups

##  Getting Started

1. Flash Ubuntu Server on a Raspberry Pi
2. Follow the setup guide in `docs/setup-guide.md`
3. Extract the WordPress archive to your web root
4. Customize your configuration and go live!

"""
## Energy Consumption Cost Estimation

Running a self-hosted WordPress site on a Raspberry Pi is highly energy-efficient. Here's an estimate of the power usage and cost for continuous operation.

### Estimated Power Usage

| Raspberry Pi Model | Avg Power Consumption | Daily Usage | Monthly Usage | Yearly Usage |
|--------------------|-----------------------|-------------|----------------|----------------|
| Pi 4 (8GB)         | ~3.5W                 | ~0.084 kWh  | ~2.52 kWh     | ~30.66 kWh     |
| Pi 5 (16GB)        | ~6.0W                 | ~0.144 kWh  | ~4.32 kWh     | ~52.56 kWh     |

> *Actual consumption may vary based on connected peripherals, cooling, and workload.*

### Cost Estimation (Germany 🇩🇪 Example)

Assuming an average electricity price of **€0.35 per kWh**:

| Raspberry Pi Model | Monthly Cost | Yearly Cost |
|--------------------|--------------|-------------|
| Pi 4 (8GB)         | ~€0.88       | ~€10.73     |
| Pi 5 (16GB)        | ~€1.51       | ~€18.40     |

### Why It Matters

- **Low Cost**: Running your own WordPress site at under €1–2/month.
- **Green Hosting**: Great for energy-conscious personal or educational projects.
- **24/7 Uptime**: Ideal for consistently available self-hosted portfolios or blogs.

# Create setup-guide.md
setup_guide_content = """# Full Setup Guide: WordPress on Raspberry Pi

##  Requirements

- Raspberry Pi 4 or 5
- Ubuntu Server 22.04/24.04 LTS
- Internet connection
- Static IP or dynamic DNS

---

##  1. Install Ubuntu Server on Raspberry Pi

Flash Ubuntu Server using Raspberry Pi Imager. After first boot:

```bash
sudo apt update && sudo apt upgrade -y
