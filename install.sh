#!/usr/bin/env bash

set -euo pipefail

INSTALL_DIR="/usr/local/bin"
SCRIPT_NAME="killport"
REPO="skosari/killport-mac"
RAW_URL="https://raw.githubusercontent.com/${REPO}/main/killport"

echo "Installing killport..."

if ! curl -fsSL "$RAW_URL" -o "/tmp/$SCRIPT_NAME"; then
  echo "Error: Failed to download killport"
  exit 1
fi

chmod +x "/tmp/$SCRIPT_NAME"

if [ -w "$INSTALL_DIR" ]; then
  mv "/tmp/$SCRIPT_NAME" "$INSTALL_DIR/$SCRIPT_NAME"
else
  sudo mv "/tmp/$SCRIPT_NAME" "$INSTALL_DIR/$SCRIPT_NAME"
fi

echo "killport installed to $INSTALL_DIR/$SCRIPT_NAME"
echo "Try: killport 8080"
