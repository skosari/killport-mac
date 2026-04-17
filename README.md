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
sudo curl -fsSL https://raw.githubusercontent.com/skosari/killport-mac/main/killport -o /usr/local/bin/killport && sudo chmod +x /usr/local/bin/killport
```

---

## Usage

```sh
killport <port>     # kill whatever is on that port
killport list       # list all listening ports
```

### killport list

```sh
killport list
# Listening ports:
#
#   *:3847      node        87078      TCP
#   *:5000      ControlCe   1045       TCP
#   *:7000      ControlCe   1045       TCP
#   127.0.0.1:52081  node   82545      TCP
```
