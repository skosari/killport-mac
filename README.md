<div align="center">

<pre>
██╗  ██╗██╗██╗     ██╗     ██████╗  ██████╗ ██████╗ ████████╗
██║ ██╔╝██║██║     ██║     ██╔══██╗██╔═══██╗██╔══██╗╚══██╔══╝
█████╔╝ ██║██║     ██║     ██████╔╝██║   ██║██████╔╝   ██║   
██╔═██╗ ██║██║     ██║     ██╔═══╝ ██║   ██║██╔══██╗   ██║   
██║  ██╗██║███████╗███████╗██║     ╚██████╔╝██║  ██╗   ██║   
╚═╝  ╚═╝╚═╝╚══════╝╚══════╝╚═╝      ╚═════╝ ╚═╝  ╚═╝   ╚═╝   
</pre>

**Kill whatever is running on a port — macOS**

[![Version](https://img.shields.io/badge/version-1.6.6-00b4d8?style=flat-square)](#)
[![Platform](https://img.shields.io/badge/platform-macOS-00b4d8?style=flat-square&logo=apple&logoColor=white)](#)
[![Shell](https://img.shields.io/badge/shell-bash-00b4d8?style=flat-square&logo=gnubash&logoColor=white)](#)
[![License](https://img.shields.io/badge/license-MIT-00b4d8?style=flat-square)](#)

</div>

---

```
$ killport 3000

Port 3000 is in use:

  PID:     48291
  User:    siamak
  Name:    node
  Command: node server.js

Killed.
```

---

## Install

**Option 1 — Homebrew** *(recommended)*

```sh
brew tap skosari/killport-mac
brew install killport
```

**Option 2 — curl one-liner**

```sh
curl -fsSL https://raw.githubusercontent.com/skosari/killport-mac/main/install.sh | bash
```

**Option 3 — Manual**

```sh
sudo curl -fsSL https://raw.githubusercontent.com/skosari/killport-mac/main/killport \
  -o /usr/local/bin/killport && sudo chmod +x /usr/local/bin/killport
```

---

## Commands

| Command | Description |
|---|---|
| `killport` | Show help |
| `killport <port>` | Kill whatever is running on that port |
| `killport list` | List all listening ports |
| `killport open <port>` | Open a port to external connections (pfctl) |
| `killport close <port>` | Close a port from external connections |
| `killport openports` | Show all ports open to external access |
| `killport closedports` | Show all listening ports with no external access |
| `killport ports` | Inspect all ports with live firewall status |
| `killport opencheck <ip>` | Probe an IP to verify external reachability |
| `killport status <port>` | Show if a port is open or closed |
| `killport ip` | Show IP addresses, DNS, and network info |
| `killport update` | Update to the latest version |

---

## Port Inspector

```
$ killport ports

  Port Inspector  (local view — what this machine sees)
  ────────────────────────────────────────────────────

  Firewall  DISABLED  pfctl is off — all listening ports may be reachable
  LAN IP    192.168.1.42

  PORT      PROCESS         ACCESS
  ────────  ──────────────  ──────────
  ◆  3000    node            likely open  (firewall off)
  ◆  5432    postgres        likely open  (firewall off)
  ○  8080    nginx           blocked

  To truly verify external reachability, run from another machine:
  killport opencheck 192.168.1.42
```

## External Port Check

```
$ killport opencheck 192.168.1.42

  External Port Check  → 192.168.1.42
  ────────────────────────────────────

  ●  22        open   ssh
  ●  3000      open   http

  2 open port(s) found · scanned 30 common ports via nmap
```

---

## Update

```sh
killport update
```

Self-updates by pulling the latest script from this repo. Version is checked via the GitHub API — no CDN caching issues.

---

<div align="center">

Made by [skosari](https://github.com/skosari) · [killport-mac](https://github.com/skosari/killport-mac) · [killport-win](https://github.com/skosari/killport-win) · [killport-linux](https://github.com/skosari/killport-linux)

</div>
