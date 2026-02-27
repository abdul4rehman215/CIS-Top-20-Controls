# 🛠️ Troubleshooting Guide — Lab 19: Incident Response & Management (CentOS 7)

> This guide covers common issues that may occur when setting up Suricata and ClamAV, applying containment rules via iptables, and performing recovery steps on CentOS 7.

---

## 1) `sudo: command not found` or permission denied
### Symptoms
- `sudo: command not found`
- `permission denied`
- `user is not in the sudoers file`

### Fix
- Confirm you are using the correct lab user (e.g., `centos`) with sudo access.
- If you have root access, add user to sudoers (admin-only action).

---

## 2) `suricata: command not found`
### Cause
Suricata is not installed by default in CentOS 7 minimal images.

### Fix (as done in lab)
- Install EPEL:
  - `sudo yum install -y epel-release`
- Install Suricata:
  - `sudo yum install -y suricata`
- Verify:
  - `suricata -V`

---

## 3) Suricata fails to start on interface `eth0`
### Symptoms
- Errors referencing AF_PACKET or interface not found
- Permission errors

### Fix
- Confirm interface name:
  - `ip a`
- Ensure you run Suricata with sudo:
  - `sudo suricata -c /etc/suricata/suricata.yaml -i eth0`
- If your lab uses a different interface name (e.g., `ens3`), replace `eth0`.

---

## 4) Suricata runs in foreground and blocks terminal
### Explanation
Foreground mode is expected when started directly from terminal.

### Options
- Stop with **Ctrl+C** (as done in lab)
- In real operations, run as a service or in daemon mode to write logs continuously.

---

## 5) `iptables: command not found` or rules not listing
### Symptoms
- `iptables: command not found`
- `iptables -L` fails

### Fix
- Ensure iptables is installed (CentOS usually includes it)
- Run with sudo:
  - `sudo iptables -L INPUT -n --line-numbers`

---

## 6) You added iptables rules but they disappear after reboot
### Cause
iptables rules are not persistent by default on some CentOS setups.

### Fix (conceptual)
- Install persistence tooling (varies by environment)
- Save rules for restore on boot (enterprise standard practice)

> In lab, persistence is not required unless explicitly asked.

---

## 7) Locking yourself out via iptables rules
### Symptoms
- SSH disconnects
- No remote access after rule changes

### Prevention
- Always keep an existing session open when applying rules.
- Avoid adding broad DROP rules on SSH management paths.
- Use narrow rules targeting specific IPs only (as done in lab).

### Recovery
- Use console access (cloud provider console) if available
- Remove the rule using line number:
  - `sudo iptables -D INPUT <num>`

---

## 8) `clamscan: command not found`
### Cause
ClamAV not installed by default.

### Fix (as done in lab)
- Install:
  - `sudo yum install -y clamav clamav-update`
- Verify:
  - `clamscan -V`

---

## 9) `freshclam` update fails
### Symptoms
- DNS resolution errors
- connection refused
- timeouts

### Fix
- Confirm network access:
  - `ping -c 2 8.8.8.8`
  - `curl -I https://database.clamav.net`
- Retry update:
  - `sudo freshclam`

---

## 10) Full filesystem scan is very slow
### Explanation
Scanning `/` recursively can take significant time and resources.

### Practical approach
- In production, target likely locations first:
  - `/tmp`, `/var/tmp`, `/home`, `/var/www`, `/opt`
- Use logging and measured scanning windows

> In this lab, scanning `/` was used to demonstrate end-to-end eradication.

---

## 11) EICAR test file detected — is it real malware?
No. EICAR is a safe antivirus test signature used to validate that detection/removal workflows work properly. It is commonly used in labs.

---

## 12) Recovery update command mismatch (apt vs yum)
### Symptoms
- `apt-get: command not found`

### Fix
CentOS uses yum:
- `sudo yum update -y`

This correction was applied during the lab scenario.

---

## 13) Health checks show high load after scan
### Symptoms
- load average elevated after running `clamscan`
- memory pressure

### Explanation
Large scans are resource intensive.

### Fix
- Wait for system to settle
- Re-check with:
  - `uptime`
  - `free -m`
- Schedule scans during low-usage windows in real environments
