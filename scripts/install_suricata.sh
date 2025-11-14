#!/bin/bash
# install_suricata.sh
# Purpose: Install Suricata IDS on Ubuntu/Debian and enable service.
# Usage: sudo ./install_suricata.sh

set -euo pipefail

echo "==> Installing Suricata IDS (requires sudo privileges)..."

# Update packages
sudo apt update

# Install prerequisites
sudo apt install -y ca-certificates lsb-release curl gnupg

# Install Suricata (from Ubuntu repo)
sudo apt install -y suricata

# Verify installation
if command -v suricata >/dev/null 2>&1; then
  echo "Suricata installed: $(suricata --build-info | head -n 1)"
else
  echo "ERROR: Suricata installation failed."
  exit 1
fi

# Enable and start service
sudo systemctl enable --now suricata

# Show status summary
sudo systemctl status --no-pager suricata | sed -n '1,6p'

# Optionally run suricata-update if available (useful to fetch rules)
if command -v suricata-update >/dev/null 2>&1; then
  echo "suricata-update found — updating rules (this requires network access)..."
  sudo suricata-update
  sudo systemctl restart suricata
fi

echo "==> Suricata installation and service start complete."
