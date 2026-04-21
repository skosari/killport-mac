<div align="center">

<pre>
██╗  ██╗██╗██╗     ██╗     ██████╗  ██████╗ ██████╗ ████████╗
██║ ██╔╝██║██║     ██║     ██╔══██╗██╔═══██╗██╔══██╗╚══██╔══╝
█████╔╝ ██║██║     ██║     ██████╔╝██║   ██║██████╔╝   ██║   
██╔═██╗ ██║██║     ██║     ██╔═══╝ ██║   ██║██╔══██╗   ██║   
██║  ██╗██║███████╗███████╗██║     ╚██████╔╝██║  ██╗   ██║   
╚═╝  ╚═╝╚═╝╚══════╝╚══════╝╚═╝      ╚═════╝ ╚═╝  ╚═╝   ╚═╝   
</pre>

**Kill ports · manage firewall · SSH easy connect · Wake on LAN · remote shutdown · network scanning — macOS**

Also available for [Linux](https://github.com/skosari/killport-linux) · [Windows](https://github.com/skosari/killport-win) · [Windows CMD](https://github.com/skosari/killport-cmd)

AI-powered pentesting, vulnerability scanning, and automated hardening via [Ollama](https://ollama.com) — runs entirely on your hardware

[![Version](https://img.shields.io/badge/version-1.10.38-00b4d8?style=flat-square)](#)
[![Platform](https://img.shields.io/badge/platform-macOS-00b4d8?style=flat-square&logo=apple&logoColor=white)](#)
[![Shell](https://img.shields.io/badge/shell-bash-00b4d8?style=flat-square&logo=gnubash&logoColor=white)](#)
[![License](https://img.shields.io/badge/license-Source%20Available-00b4d8?style=flat-square)](LICENSE)

</div>

---

## Install

**Option 1 — curl one-liner**

```sh
curl -fsSL https://raw.githubusercontent.com/skosari/killport-mac/main/install.sh | bash
```

**Option 2 — Manual**

```sh
sudo mkdir -p /usr/local/bin && \
curl -fsSL https://raw.githubusercontent.com/skosari/killport-mac/main/killport \
  -o /tmp/killport && sudo mv /tmp/killport /usr/local/bin/killport && sudo chmod +x /usr/local/bin/killport
```

---

## Commands

| Command | Description |
|---|---|
| `killport` | Show help |
| `killport setup` | Interactive pro setup wizard (WoL, Ollama, SSH, remote shutdown) |
| `killport <port>` | Kill whatever is running on that port |
| `killport attack <ip>` | AI pentest: scan all ports + analysis (requires Ollama) |
| `killport attack <ip>:<port>` | AI pentest: single port deep dive (requires Ollama) |
| `killport attack log` | View attack history |
| `killport audit` | Review firewall rules with plain-English findings |
| `killport cert <host:port>` | Inspect TLS certificate (expiry, SANs, cipher) |
| `killport close <port>` | Close a port from external connections |
| `killport closedports` | Show all listening ports with no external access |
| `killport code` | Launch opencode AI coding assistant with your saved Ollama config |
| `killport code <model>` | Launch opencode with a specific Ollama model |
| `killport code model` | Pick a model from your Ollama library |
| `killport code install` | Install opencode |
| `killport config` | Configure Ollama host and model |
| `killport dns <domain>` | DNS recon: A/MX/TXT/NS/AXFR zone transfer test |
| `killport fix <ip:port>` | Detect vulns and generate/apply a hardening fix (requires Ollama) |
| `killport forward <port> <host:port>` | Forward a local port to a remote host:port |
| `killport ip` | Show IP addresses, DNS, and network info |
| `killport list` | List all listening ports |
| `killport open <port>` | Open a port to external connections |
| `killport openports` | Show all ports open to external access |
| `killport openports <ip>` | Probe an IP to verify which ports are reachable |
| `killport ports` | Inspect all ports with live firewall status |
| `killport scan` | Scan local network for all active computers |
| `killport scan <ip>` | Scan ports on a remote host |
| `killport scan <ip> all` | Scan all 65535 ports on a remote host |
| `killport shutdown` | Scan network and pick a machine to shut down |
| `killport shutdown <ip>` | Send a shutdown signal to a remote machine via SSH |
| `killport shutdown <name>` | Shut down a saved host by name |
| `killport shutdown list` | Show all saved shutdown hosts |
| `killport restart` | Scan network and pick a machine to restart |
| `killport restart <ip>` | Send a restart signal to a remote machine via SSH |
| `killport restart <name>` | Restart a saved host by name |
| `killport restart list` | Show all saved shutdown/restart hosts |
| `killport sniff <ip:port>` | Capture traffic to/from a specific host:port |
| `killport sniff <port>` | Capture and display traffic on a port |
| `killport ssh` | Generate a token so another machine can SSH into this one |
| `killport ssh <name>` | SSH to a saved connection using your key |
| `killport ssh ks:<token>` | Accept a token — adds their key and enables SSH access |
| `killport ssh list` | Show all saved SSH connections |
| `killport status <port>` | Show if a port is open or closed |
| `killport stress <ip:port>` | Authorized connection flood / stress test |
| `killport uninstall` | Remove killport and all firewall rules |
| `killport update` | Update to the latest version |
| `killport vuln <ip:port>` | Detect service version + query CVE database |
| `killport watch <port>` | Monitor live connections to a local port |
| `killport wol` | Wake a LAN computer — scan network or pick a saved host |
| `killport wol <name>` | Wake a saved host by name |
| `killport wol list` | Show all saved WoL hosts |
| `killport wol save <name> <mac> [ip]` | Save a host for quick wake |

---

## Examples

### `killport 3000`
```
  Port 3000 is in use:

  PID:     48291
  User:    sam
  Name:    node
  Command: node server.js

Killed.
```

### `killport list`
```
  PORT     PID(S)            ADDRESS                   PROCESS
  ───────  ────────────────  ────────────────────────  ──────────────────────
  22       1953              *                         sshd
  80       1024 (+11 more)   *                         nginx
  3000     48291             *                         node
  5432     312               *                         postgres
  6379     2048              127.0.0.1                 redis-server

  5 service(s) listening
```

### `killport openports`
```
  Firewall-Open Ports  (external access via killport)
  ────────────────────────────────────────────

  ●  80        listening   nginx
  ●  443       listening   nginx
  ○  8080      not listening

  ────────────────────────────────────────────
  3 port(s) open  ·  2 listening

  To verify external reachability from another machine:
  killport openports 192.168.1.42
```

### `killport openports 192.168.1.42`
```
  External Port Check  → 192.168.1.42
  ────────────────────────────────────────────

  ●  22        open   ssh
  ●  80        open   http
  ●  443       open   https

  ────────────────────────────────────────────
  3 open port(s) found  ·  scanned 30 common ports via nmap
```

### `killport ports`
```
  Port Inspector  (local view)
  ────────────────────────────────────────────

  Firewall  ENABLED   pfctl is active
  LAN IP    192.168.1.42

  PORT      PROCESS         ACCESS
  ────────  ──────────────  ──────────
  ●  80       nginx           open         (killport rule)
  ●  443      nginx           open         (killport rule)
  ○  3000     node            blocked
  ○  5432     postgres        blocked
```

### `killport status 3000`
```
  Port 3000 status:

  Firewall:  CLOSED  (no killport rule — external access blocked)
  Listening: YES  (PID: 48291 — node)
```

### `killport scan 192.168.1.10`
```
  killport scan  192.168.1.10
  ────────────────────────────────────────────

  Scanning common ports...

  PORT     SERVICE             VERSION
  ────────────────────────────────────────────────────
  22       ssh                 OpenSSH 9.2p1
  80       http                nginx 1.24.0
  3306     mysql               MySQL 8.0.33
  6379     redis               Redis key-value store

  Host latency: 0.0012 s latency
```

### `killport watch 3000`
```
  killport watch  port 3000  (Ctrl+C to stop)
  ────────────────────────────────────────────

  TIME        REMOTE                      STATE           PROCESS
  ──────────────────────────────────────────────────────────────
  14:32:01    192.168.1.55:51204          ESTABLISHED     node
  14:32:04    192.168.1.55:51205          ESTABLISHED     node
  14:32:09    192.168.1.55:51204          CLOSE_WAIT      node
```

### `killport cert github.com`
```
  killport cert  github.com:443
  ────────────────────────────────────────────

  Subject :  CN=github.com
  Issuer  :  C=US, O=DigiCert Inc, CN=DigiCert TLS Hybrid ECC SHA384 2020 CA1
  Expires :  2026-03-26  (341 days)
  SANs    :
    github.com
    www.github.com

  Protocol: Tls13
  Cipher  : Aes128
```

### `killport sniff 443`
```
  killport sniff  port 443  (Ctrl+C to stop)
  ────────────────────────────────────────────

  Filter: port 443. Requires sudo.

  14:32:01.123  192.168.1.55.51204 > 192.168.1.1.443: Flags [S]
  14:32:01.124  192.168.1.1.443 > 192.168.1.55.51204: Flags [S.]
```

### `killport sniff 192.168.1.10:22`
```
  killport sniff  192.168.1.10:22  (Ctrl+C to stop)
  ────────────────────────────────────────────

  Filter: host 192.168.1.10 and port 22. Requires sudo.

  14:33:10.441  192.168.1.42.52100 > 192.168.1.10.22: Flags [S]
  14:33:10.442  192.168.1.10.22 > 192.168.1.42.52100: Flags [S.]
```

### `killport vuln 192.168.1.10:22`
```
  killport vuln  192.168.1.10:22
  ────────────────────────────────────────────

  Detecting service on port 22...

  Service:  ssh
  Version:  OpenSSH 9.2p1

  Querying NVD database...

  85 CVE(s) found — showing top 10:

  CVE-2023-38408  [CRITICAL  9.8]
  The PKCS#11 feature in ssh-agent in OpenSSH before 9.3p2 has an insufficiently...

  CVE-2023-51385  [MEDIUM  6.5]
  In ssh in OpenSSH before 9.6, OS command injection might occur if a user name or...
```

### `killport fix 192.168.1.10:22`
```
  killport fix  192.168.1.10:22
  ────────────────────────────────────────────

  Detecting service on port 22...

  Service:  ssh
  Version:  OpenSSH 9.2p1

  ✓  Target is this machine — can apply fixes directly.

  Querying NVD database...

  85 CVE(s) — top 5 shown:
  CVE-2023-38408  [CRITICAL  9.8]  ...
  CVE-2023-51385  [MEDIUM  6.5]    ...

  ────────────────────────────────────────────
  AI Remediation Advice

  UPGRADE: brew upgrade openssh

  CONFIG:
    PermitRootLogin no
    MaxAuthTries 3
    X11Forwarding no
    PermitEmptyPasswords no

  NETWORK: sudo pfctl -e && echo "block in proto tcp to any port 22" | sudo pfctl -f -

  ────────────────────────────────────────────
  Apply these fixes now? (requires sudo)  [yes/N]: yes

    [fix] Backed up sshd_config
    [fix] sshd_config hardened
    [fix] SSH service restarted
    [fix] OpenSSH upgrade attempted
    [fix] Fix script completed

  ────────────────────────────────────────────
  ✓  Fixes applied.  Verify with: killport vuln 192.168.1.10:22
```

### `killport audit`
```
  killport audit  firewall rule review
  ────────────────────────────────────────────

  Rules:

    pass in proto tcp from any to any port 80
    pass in proto tcp from any to any port 443
    pass in proto tcp from any to any port 22

  Findings:

  ⚠  Port 22 (SSH) referenced — confirm it's restricted to trusted IPs.
  ✓  No catch-all pass rule.
  ⚠  No logging rules — consider adding 'log' to firewall rules.

  Run 'killport ports' to cross-reference currently exposed ports.
```

### `killport dns github.com`
```
  killport dns  github.com
  ────────────────────────────────────────────

  A         140.82.121.4
  AAAA      (none)
  MX        10 aspmx.l.google.com
  NS        ns-1707.awsdns-21.co.uk
            ns-421.awsdns-52.com
  TXT       "v=spf1 ip4:192.30.252.0/22 include:_netblocks.google.com ~all"

  REVERSE
    140.82.121.4  →  lb-140-82-121-4-iad.github.com

  AXFR
    ✓  Zone transfers blocked.
```

### `killport forward 8080 192.168.1.10:80`
```
  killport forward  localhost:8080  →  192.168.1.10:80
  ────────────────────────────────────────────

  ✓  socat  —  forwarding port 8080 to 192.168.1.10:80
  Press Ctrl+C to stop.
```

### `killport stress 192.168.1.10:80`
```
  killport stress  authorized connection flood testing
  ────────────────────────────────────────────

  Target:   192.168.1.10:80  (service: http)

  Duration in seconds — auto-starting in 10s [default 30]:  

  ⚠  This will flood 192.168.1.10:80 for 30s at up to 20 concurrent connections.
  Only test systems you own or have written authorization to test.

  Type yes to confirm: yes

  ────────────────────────────────────────────
  30s · 20 threads · http

  ⠸  [████████████████░░░░░░░░]  12,847 req  428/s  0 err  18s left

  ════════════════════════════════════════════════════════
  STRESS TEST COMPLETE
  ════════════════════════════════════════════════════════
  Service:   http  (192.168.1.10:80)
  Duration:  30s  ·  Threads: 20
  Requests:  18,432  (614/s avg  ·  891/s peak)
  Errors:    0  (0%)
  After:     ONLINE — still responding
  ════════════════════════════════════════════════════════
```

### `killport attack 192.168.1.10`
```
  AI Pentest  →  192.168.1.10  (47 common ports)
  ────────────────────────────────────────────

  Connecting to Ollama at localhost:11434...
  Model: deepseek-r1:8b

  Scanning 47 common ports on 192.168.1.10...

  ●  22        ssh           OpenSSH 8.9p1 Ubuntu
  ●  80        http          Apache httpd 2.4.52
  ●  6379      redis         Redis key-value store

  Agent starting  target: 192.168.1.10  ·  model: deepseek-r1:8b

  💭 I'll start by scanning port 6379 for Redis — unauthenticated Redis is a common critical finding
  ▶  SCAN_PORT 6379
  💭 No password required. I'll try WORDLIST to confirm full access.
  ▶  WORDLIST redis 6379
     CRITICAL: Redis has NO password — fully open to anyone
  ▶  HTTP_PATHS 80
     200  /admin
     200  /.env
  ▶  HTTP_PROBE 80 /.env
  ▶  REPORT

  Writing report...

  ══════════════════════════════════════════════════════════════
    SECURITY REPORT  ·  192.168.1.10  ·  2025-04-18 14:32
    Model: deepseek-r1:8b
  ══════════════════════════════════════════════════════════════

    PORT 6379 — REDIS
    Risk: 🔴 Critical
    ────────────────────────────────────────────────────────────────
    ⚠  NO PASSWORD REQUIRED — anyone on the network can connect

    How to fix it:
      1. Add  requirepass YOURPASSWORD  to /etc/redis/redis.conf
      2. Add  bind 127.0.0.1  to redis.conf
      3. Run: killport fix 192.168.1.10:6379

  ══════════════════════════════════════════════════════════════
  ── What to do first ──
  ══════════════════════════════════════════════════════════════
    1. [CRITICAL] Set a password on redis (port 6379)
    2. [HIGH] Review /.env exposure on http (port 80)

  Logged to: ~/.config/killport/attack.log
```

---

## Security Toolkit

killport includes a full suite of network security tools beyond just killing ports.

### Vulnerability Detection → `killport vuln`

Detects service version via nmap and queries the [NVD](https://nvd.nist.gov) CVE database for known vulnerabilities:

```sh
killport vuln 192.168.1.10:22    # SSH
killport vuln 192.168.1.10:6379  # Redis
killport vuln 192.168.1.10:3306  # MySQL
```

### One-Command Hardening → `killport fix`

Follows up on `vuln` findings with an automated fix. Detects whether the target is the local machine or remote:

- **Local target** — applies config hardening and restarts the service directly (with confirmation)
- **Remote target** — generates a ready-to-run fix script with `scp` + `ssh` deploy instructions

```sh
killport fix 127.0.0.1:6379      # harden local Redis
killport fix 192.168.1.10:22     # generate SSH fix script for remote machine
```

Supports: SSH, Redis, MySQL, PostgreSQL, MongoDB, Nginx/Apache, FTP, Telnet, Memcached.

### Port Scanner → `killport scan`

Fast nmap scan without the AI overhead — useful when you just want to see what's open:

```sh
killport scan 192.168.1.10        # common ports
killport scan 192.168.1.10 all    # all 65535 ports
```

### TLS Certificate Inspector → `killport cert`

```sh
killport cert github.com          # checks port 443 by default
killport cert 192.168.1.10:8443   # custom port
```

Shows subject, issuer, expiry with days-remaining color coding (green/yellow/red), SANs, and TLS protocol/cipher.

### Live Traffic Capture → `killport sniff`

```sh
killport sniff 443                    # all traffic on port 443
killport sniff 192.168.1.10:22        # traffic to/from a specific host:port
```

Wraps `tcpdump` with clean formatting. Requires `sudo`.

### Live Connection Monitor → `killport watch`

```sh
killport watch 3000    # watch connections arriving on port 3000 in real time
```

Shows each new connection with timestamp, remote IP, TCP state, and process name.

### DNS Recon → `killport dns`

```sh
killport dns example.com
```

Queries A, AAAA, MX, NS, TXT records, reverse DNS for all A records, and attempts a zone transfer (AXFR) against each nameserver — flags misconfigured servers that allow it.

### Firewall Audit → `killport audit`

```sh
killport audit
```

Reviews your pfctl rules and highlights: catch-all pass rules, dangerous exposed ports (MySQL, Redis, MongoDB, etc.), missing logging rules, and allowlists.

### Port Forwarder → `killport forward`

```sh
killport forward 8080 192.168.1.10:80   # tunnel local:8080 → remote:80
```

Uses `socat` when available (full multi-connection), falls back to `nc`.

### Stress Test → `killport stress`

Authorized connection flood testing for load and resilience:

```sh
killport stress 192.168.1.10:80    # HTTP flood
killport stress 192.168.1.10:6379  # Redis PING flood
killport stress 192.168.1.10:22    # TCP connection flood
```

20 concurrent threads, live progress bar, reports requests/s, peak rate, error rate, and whether the service is still responsive after the test. Requires explicit `yes` confirmation.

---

## AI Penetration Testing

> **Point it at any machine on your network. Watch an AI hunt for vulnerabilities in real time.**

`killport attack` is a fully agentic AI pentest tool powered by [Ollama](https://ollama.com) — your local AI, running entirely on your hardware, no cloud, no API keys. It **thinks**, **acts**, and **investigates** — probing services, testing credentials, hunting for exposed paths, and attempting to crack hashes — then delivers a plain-English security report with specific fix steps.

**Everything runs locally. Your scan data never leaves your machine.**

### Setup

1. [Install Ollama](https://ollama.com/download) and pull a model:
   ```sh
   ollama pull llama3.2
   # reasoning model (slower but deeper analysis):
   ollama pull deepseek-r1:8b
   ```
2. Configure killport:
   ```sh
   killport config
   ```
3. Run:
   ```sh
   killport attack 192.168.1.10
   ```

### Commands

```sh
killport attack 192.168.1.10            # scan 47 common ports
killport attack allports 192.168.1.10   # scan all 65535 ports
killport attack 192.168.1.10:6379       # single port deep dive
killport config                  # configure Ollama host + model
killport attack log                     # view past attack reports
```

### Agent tools

| Tool | What the AI can do |
|---|---|
| `SCAN_PORT` | Deep nmap scan with version detection |
| `BANNER_GRAB` | Raw TCP banner grab |
| `HTTP_PROBE` | Fetch HTTP/HTTPS paths, extract hashes |
| `HTTP_PATHS` | Probe 20+ sensitive paths: `/admin`, `/.env`, `/.git/HEAD`, etc. |
| `WORDLIST` | Credential spray: SSH, FTP, Redis, MySQL, PostgreSQL, HTTP |
| `NMAP_SCRIPT` | Run any nmap NSE script |
| `CRACK_HASH` | Crack MD5/SHA1/SHA256/bcrypt via hashcat or john |

### SSH Easy Connect → `killport ssh`

Connect two Macs over SSH with a single copy-paste — no manual key copying, no `authorized_keys` editing.

**On the Mac you want to connect *from*:**

```sh
killport ssh
```

Generates an Ed25519 keypair (stored at `~/.killport/id_ed25519`) and outputs a self-contained token:

```
  killport ssh — Key Exchange
  ────────────────────────────────────────────

  Using existing key: ~/.killport/id_ed25519.pub

  Run this on the other Mac:

  killport ssh ks:eyJ1c2VyIjoic2FtIiwiaXAiOiIxOTIuMTY4LjEuNDIiLCJwdWJrZXkiOiJzc2...

  Then connect from this Mac with:
  ssh -i ~/.killport/id_ed25519 <their-user>@<their-ip>

  Your IP on this machine: 192.168.1.42
```

**On the Mac you want to connect *to* — paste the token:**

```sh
killport ssh ks:<token>
```

```
  ✓ Key added to ~/.ssh/authorized_keys
  From: sam@192.168.1.42

  They can now connect with:
  ssh -i ~/.killport/id_ed25519 sam@192.168.1.55
```

The token is self-contained — it encodes your public key, username, and IP as base64 JSON. No server, no pastebin, no manual file editing. Works Mac↔Mac and Mac↔Linux.

**After accepting, the connection is saved by name.** Look it up any time without memorising IPs:

```sh
killport ssh list          # see all saved connections
killport ssh sams-mbp      # print the exact ssh command for that person
```

```
  SSH Easy Connect — sams-mbp
  ────────────────────────────────────────────

  sam (192.168.1.42) — key accepted 2026-04-19

  They connect to this Mac with:
  ssh -i ~/.killport/id_ed25519 youruser@192.168.1.55
```

### Shutdown & Restart → `killport shutdown` / `killport restart`

Send a shutdown or restart signal to any Mac, Linux, or Windows machine on your network over SSH. On first use you'll be asked for the OS and SSH username — save the host by name so you never have to type the IP again. Hosts are shared between both commands.

```sh
killport shutdown                  # scan your /24 subnet and pick a machine
killport shutdown 192.168.1.50     # shutdown by IP (prompts OS + user, offers to save)
killport shutdown mini             # shutdown a saved host by name
killport shutdown list             # show all saved hosts

killport restart                   # scan network and pick a machine to restart
killport restart 192.168.1.50      # restart by IP
killport restart mini              # restart a saved host by name
killport restart list              # same list as shutdown (shared hosts file)
```

With no argument, both commands ping-sweep your local subnet, show every live host, and let you pick by number. They then ask for the OS type (mac / linux / windows) and SSH username, send the command, and offer to save the host for next time.

Supports macOS (`sudo shutdown -h now` / `sudo shutdown -r now`), Linux (`sudo shutdown -h now` / `sudo shutdown -r now`), and Windows (`shutdown /s /t 0 /f` / `shutdown /r /t 0 /f`). Uses the killport SSH key (`~/.killport/id_ed25519`) — set that up first with `killport ssh`.

---

### Wake on LAN → `killport wol`

Wake any machine on your network — Mac, PC, or Linux — as long as Wake on LAN is enabled in its BIOS or system settings.

```sh
killport wol                        # scan network, pick a machine to wake
killport wol mydesktop              # wake a saved host by name
killport wol aa:bb:cc:dd:ee:ff      # wake by MAC address directly
```

Running `killport wol` with no arguments ping-sweeps your local /24 subnet, reads the ARP table, and shows every reachable device with its MAC address. Saved hosts appear at the top marked with `★`.

```
  Wake on LAN
  ────────────────────────────────────────────

  Scanning 192.168.1.1–254...

  ★ = saved host

   1  ★ mydesktop            aa:bb:cc:dd:ee:ff  192.168.1.50
   2    MacBook-Pro.local     11:22:33:44:55:66  192.168.1.12
   3    raspberrypi.local     de:ad:be:ef:ca:fe  192.168.1.99

  Enter number to wake, or 's <num> <name>' to save a discovered host:
  → 
```

From the list, enter a number to send the magic packet, or type `s 2 mydesktop` to save host #2 as "mydesktop" and wake it in one step.

**Saving hosts for quick access:**

```sh
killport wol save mydesktop aa:bb:cc:dd:ee:ff 192.168.1.50
killport wol save homeserver de:ad:be:ef:ca:fe
killport wol list
killport wol delete mydesktop
```

Saved hosts are stored in `~/.config/killport/wol_hosts`. The magic packet is broadcast over UDP port 9 using Python3 — no extra tools needed.

---

## Uninstall

**Option 1 — built-in command**

```sh
killport uninstall
```

Removes the binary and all pfctl firewall rules created by `killport open`.

**Option 2 — curl**

```sh
curl -fsSL https://raw.githubusercontent.com/skosari/killport-mac/main/uninstall.sh | bash
```

---

<div align="center">

Made by [skosari](https://github.com/skosari) · [killport-mac](https://github.com/skosari/killport-mac) · [killport-win](https://github.com/skosari/killport-win) · [killport-linux](https://github.com/skosari/killport-linux)

</div>
