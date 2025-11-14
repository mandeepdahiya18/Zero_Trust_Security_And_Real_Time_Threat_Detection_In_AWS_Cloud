#!/bin/bash
# update_rules.sh
# Purpose: Update Suricata rule sets using suricata-update. Restarts Suricata after update.
# Usage: sudo ./update_rules.sh

set -euo pipefail

echo "==> Updating Suricata rules..."

if ! command -v suricata-update >/dev/null 2>&1; then
  echo "suricata-update not found. Install it via 'sudo apt install suricata' or use distribution-specific package."
  exit 1
fi

# Update rules (this will fetch ET Open by default)
sudo suricata-update

# Optionally show what rule-files are configured (suricata.yaml)
echo "==> Checking suricata.yaml for rule file paths (first 200 lines):"
sudo sed -n '1,200p' /etc/suricata/suricata.yaml | sed -n '1,200p'

echo "==> Restarting Suricata service..."
sudo systemctl restart suricata

# Quick status
sudo systemctl is-active --quiet suricata && echo "Suricata restarted successfully." || echo "Suricata failed to restart."

echo "==> Rule update complete. Check /var/log/suricata/eve.json and fast.log for alerts and logs."
