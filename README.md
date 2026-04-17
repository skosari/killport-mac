# killport-mac

Kill whatever is running on a port. macOS.

```sh
killport 8080
# Port 8080 is in use:
#
#   PID:     12345
#   User:    siamakkosari
#   Name:    node
#   Command: node /path/to/server.js
#
# Killed.
```

---

## Install

### Option 1 — Homebrew (recommended)

```sh
brew tap skosari/killport-mac
brew install killport
```

### Option 2 — curl (one-liner)

```sh
curl -fsSL https://raw.githubusercontent.com/skosari/killport-mac/main/install.sh | bash
```

### Option 3 — Manual

```sh
curl -fsSL https://raw.githubusercontent.com/skosari/killport-mac/main/killport \
  -o /usr/local/bin/killport && chmod +x /usr/local/bin/killport
```

---

## Usage

```sh
killport <port>
```
