#!/bin/bash
# setup_apache.sh
# Purpose: Install and configure Apache2 web server (Ubuntu/Debian).
# Usage: sudo ./setup_apache.sh

set -euo pipefail

echo "==> Installing Apache2..."

sudo apt update
sudo apt install -y apache2

echo "==> Enabling and starting apache2 service..."
sudo systemctl enable --now apache2

# Optional: create a simple index.html to verify
WEB_ROOT="/var/www/html"
TEST_PAGE="${WEB_ROOT}/index.html"

if [ -w "${WEB_ROOT}" ] || [ "$(id -u)" -eq 0 ]; then
  echo "Creating a simple test page at ${TEST_PAGE}"
  sudo tee "${TEST_PAGE}" >/dev/null <<'EOF'
<!doctype html>
<html>
  <head><title>Apache Test Page</title></head>
  <body>
    <h1>Apache is running</h1>
    <p>This instance is part of the Zero-Trust monitoring lab.</p>
  </body>
</html>
EOF
  sudo chown www-data:www-data "${TEST_PAGE}" || true
fi

echo "==> Apache installation complete. Visit http://<instance-ip>/ to verify."
