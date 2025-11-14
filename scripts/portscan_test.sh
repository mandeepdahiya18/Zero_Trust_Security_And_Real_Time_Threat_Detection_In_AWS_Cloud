#!/bin/bash
# portscan_test.sh
# Purpose: Run a controlled nmap scan against a target IP to generate Suricata/GuardDuty observations.
# Usage: sudo ./portscan_test.sh <target-ip>
# Example: sudo ./portscan_test.sh 198.51.100.5

set -euo pipefail

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <target-ip-or-hostname>"
  exit 1
fi

TARGET="$1"

echo "==> WARNING: Only scan targets you own or have permission to scan."
read -p "Continue to scan ${TARGET}? (y/N): " CONFIRM
if [[ ! "${CONFIRM,,}" =~ ^y(es)?$ ]]; then
  echo "Aborting scan."
  exit 0
fi

# Install nmap if not present
if ! command -v nmap >/dev/null 2>&1; then
  echo "nmap not found — installing..."
  sudo apt update
  sudo apt install -y nmap
fi

# Run a stealthy SYN scan (default), limited to common ports
echo "==> Running nmap scan against ${TARGET} (top 1000 ports)."
sudo nmap -sS -Pn --top-ports 1000 "${TARGET}"

# For more verbose output, you can use:
# sudo nmap -sS -Pn -p- -T4 --open ${TARGET}

echo "==> Scan complete. Check Suricata logs (eve.json) and GuardDuty console for findings."
