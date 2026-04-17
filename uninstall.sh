#!/usr/bin/env bash
set -euo pipefail

echo "Uninstalling killport..."

# Remove binary
if [ -f /usr/local/bin/killport ]; then
    sudo rm /usr/local/bin/killport
    echo "  Removed /usr/local/bin/killport"
fi

# Remove pfctl anchor file (contains all ports opened via killport open)
if [ -f /etc/pf.anchors/killport ]; then
    sudo rm /etc/pf.anchors/killport
    echo "  Removed /etc/pf.anchors/killport"
fi

# Remove anchor lines from pf.conf and reload
if sudo grep -q 'killport' /etc/pf.conf 2>/dev/null; then
    sudo sed -i '' '/anchor "killport"/d' /etc/pf.conf
    sudo sed -i '' '/load anchor "killport"/d' /etc/pf.conf
    sudo pfctl -f /etc/pf.conf 2>/dev/null || true
    echo "  Cleaned pf.conf"
fi

echo "killport uninstalled."
