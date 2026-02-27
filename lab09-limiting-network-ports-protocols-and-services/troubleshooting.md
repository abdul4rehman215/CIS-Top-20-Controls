# 🛠️ Troubleshooting Guide — Lab 09: Limiting Network Ports, Protocols, & Services (CIS Control 9)

> This guide covers common issues when enumerating ports and applying firewall rules with UFW and iptables.

---

## 1) `sudo: netstat: command not found`

### ✅ Problem
Running:
```bash
sudo netstat -tuln
````

returns:

```text
sudo: netstat: command not found
```

### 💡 Cause

`netstat` is part of the `net-tools` package, which may not be installed by default on modern Ubuntu.

### ✅ Resolution

Install `net-tools`:

```bash id="d27nlz"
sudo apt update
sudo apt install net-tools -y
```

---

## 2) `ss` output differs from `netstat`

### ✅ Problem

You see different formatting or output between `ss` and `netstat`.

### 💡 Cause

They are different tools with different display formats. Both can be correct.

### ✅ Resolution

Use either for verification:

```bash id="b5e6er"
sudo ss -tuln
sudo netstat -tuln
```

---

## 3) Enabling UFW disconnects SSH

### ✅ Problem

Running `sudo ufw enable` risks breaking the SSH connection.

### 💡 Cause

UFW blocks incoming traffic by default (depending on configuration). If SSH isn’t allowed first, you can lock yourself out.

### ✅ Resolution

Best practice on remote servers:

```bash id="xmpu6x"
sudo ufw allow 22/tcp
sudo ufw enable
```

If already disconnected, recovery may require console access (cloud provider console, recovery shell).

---

## 4) `ufw` shows active but rule doesn’t seem to work

### ✅ Problem

You denied a port but connections still appear possible.

### 💡 Cause

* Rule order or different profile
* You tested locally (localhost bypass expectations)
* Service binds only to localhost or a different interface
* Another firewall system is also managing rules

### ✅ Resolution

Check rules:

```bash id="lm1jmz"
sudo ufw status verbose
```

Confirm you are testing from a remote host (not localhost).
Also confirm service exposure:

```bash id="6jpzbn"
sudo ss -tuln
```

---

## 5) Confusion: “port not listed” vs “port blocked”

### ✅ Problem

Port 23 doesn’t show in `ss/netstat`, so you’re unsure if firewall worked.

### 💡 Cause

`ss/netstat` show *listening services*, not firewall blocks. A blocked port may not appear at all.

### ✅ Resolution

* Use firewall status to confirm block:

```bash id="fit1qj"
sudo ufw status verbose
```

* Confirm a port is not listening:

```bash id="yrfh3b"
sudo ss -tuln | grep ":23" || echo "Port 23 is not listening"
```

---

## 6) iptables rule added but not persistent after reboot

### ✅ Problem

iptables rules disappear after reboot.

### 💡 Cause

iptables rules are not automatically persistent unless a persistence mechanism is configured.

### ✅ Resolution

In this lab, rules were saved to:

* `/etc/iptables/rules.v4`

Persistence depends on system tooling (varies). Common solutions include:

* iptables-persistent (on Debian/Ubuntu)
* nftables (modern default in some distros)
* systemd unit restoring rules on boot

---

## 7) `iptables-save > /etc/iptables/rules.v4` fails (directory missing)

### ✅ Problem

Saving rules fails because `/etc/iptables/` doesn’t exist.

### 💡 Cause

Ubuntu does not always create this directory by default.

### ✅ Resolution

Create directory and re-save:

```bash id="zv4r5c"
sudo mkdir -p /etc/iptables
sudo iptables-save > /etc/iptables/rules.v4
```

---

## 8) UFW and iptables interaction confusion

### ✅ Problem

UFW is enabled but you also add manual iptables rules; unsure which one applies.

### 💡 Cause

UFW manages firewall rules using iptables/nft underneath. Adding manual iptables rules can create confusion or conflicts.

### ✅ Resolution

* Prefer one management method consistently (UFW for simplicity).
* If demonstrating both, document clearly that iptables rules were added for learning purposes.
* Verify using:

```bash id="9nz4n9"
sudo ufw status verbose
sudo iptables -L INPUT -n --line-numbers | head
```

---

## ✅ Final Tip: Focus on Least Exposure

* Only allow ports required for the system role
* Keep SSH restricted (IP allowlist + keys only if possible)
* Regularly audit listening services (`ss -tuln`)
* Document firewall rules and verify after changes

---
