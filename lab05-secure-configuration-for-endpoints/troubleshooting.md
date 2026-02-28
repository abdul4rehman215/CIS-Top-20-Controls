# 🛠️ Troubleshooting Guide — Lab 05: Secure Configuration for Endpoints (CIS Controls)

> This guide covers common issues when auditing and hardening Linux endpoints and applying basic policies on Windows.

---

## 1) `sudo apt-get install lynis` fails (package not found)

### ✅ Problem
Installing Lynis fails with “Unable to locate package lynis”.

### 💡 Cause
- Repositories not updated
- Universe repository disabled
- Network/DNS issues

### ✅ Resolution
1) Update package lists:
```bash
sudo apt update
````

2. Ensure Universe repo is enabled:

```bash
sudo add-apt-repository universe
sudo apt update
```

3. Retry install:

```bash
sudo apt-get install lynis -y
```

---

## 2) Lynis audit runs but output is extremely long

### ✅ Problem

`sudo lynis audit system` prints a lot of information.

### 💡 Cause

Lynis performs many checks across kernel, auth, services, filesystems, networking, etc.

### ✅ Resolution

This is expected. Use:

* the summary at the end (Warnings/Suggestions/Hardening Index)
* Lynis log files:

```bash
sudo less /var/log/lynis.log
sudo cat /var/log/lynis-report.dat
```

---

## 3) `sudo sshd -t` returns errors after editing `sshd_config`

### ✅ Problem

After editing `/etc/ssh/sshd_config`, validation shows errors.

### 💡 Cause

* typos
* invalid directives
* wrong formatting
* duplicated/conflicting configuration lines

### ✅ Resolution

1. Re-open config and fix syntax:

```bash
sudo nano /etc/ssh/sshd_config
```

2. Validate again:

```bash
sudo sshd -t
```

3. If still failing, look at the exact error line number and correct that section.

> ⚠️ Don’t restart SSH until `sshd -t` is clean, or you risk locking yourself out (especially on remote servers).

---

## 4) SSH restart fails or disconnects remote session

### ✅ Problem

Restarting SSH breaks remote access or fails.

### 💡 Cause

* incorrect sshd config
* service restart on a remote-only environment
* firewall/security group restrictions

### ✅ Resolution

* Always validate config first:

```bash
sudo sshd -t
```

* If remote, prefer reload over restart when possible:

```bash
sudo systemctl reload ssh
```

* Keep an existing session open while testing new settings.

---

## 5) `sshd -T | grep permitrootlogin` does not show expected value

### ✅ Problem

You set `PermitRootLogin no` but the effective config doesn’t show `no`.

### 💡 Cause

* The line is commented or placed incorrectly
* Another config file overrides it (Include directives)
* SSH service wasn’t restarted/reloaded

### ✅ Resolution

1. Confirm the setting exists (and is not commented):

```bash
sudo grep -n "PermitRootLogin" /etc/ssh/sshd_config
```

2. Validate and restart/reload:

```bash
sudo sshd -t
sudo systemctl restart ssh
```

3. Re-check effective config:

```bash
sudo sshd -T | grep permitrootlogin
```

---

## 6) `bluetooth.service` not found

### ✅ Problem

Checking Bluetooth service shows:

```text
Unit bluetooth.service could not be found.
```

### 💡 Cause

Cloud/server systems typically don’t include Bluetooth services.

### ✅ Resolution

This is expected. Select another optional/non-essential service to demonstrate disabling. In this lab, `avahi-daemon` was used.

---

## 7) `avahi-daemon.service` not installed or not running

### ✅ Problem

`systemctl status avahi-daemon` shows “Unit could not be found”.

### 💡 Cause

Avahi may not be installed on minimal cloud images.

### ✅ Resolution

That’s OK. The lab concept is still valid:

* list services
* disable unused ones
  Choose a service that exists but is not required by your endpoint role.

---

## 8) Password policy changes in `pwquality.conf` don’t seem to apply

### ✅ Problem

You changed `/etc/security/pwquality.conf` but password rules don’t enforce.

### 💡 Cause

PAM may not be using `pam_pwquality.so` in the password stack.

### ✅ Resolution

Confirm PAM includes pwquality:

```bash
sudo grep -n "pam_pwquality.so" /etc/pam.d/common-password
```

If missing, you would need to enable it (carefully, in accordance with system policy).
In this lab, it was already present.

---

## 9) Editing config files without backups causes recovery difficulty

### ✅ Problem

A change breaks functionality and there is no easy rollback.

### 💡 Cause

No backup before editing.

### ✅ Resolution

Always backup first:

```bash
sudo cp /etc/security/pwquality.conf /etc/security/pwquality.conf.bak
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak
```

---

## 10) Windows `gpedit.msc` not available

### ✅ Problem

Running `gpedit.msc` fails.

### 💡 Cause

Group Policy Editor is not available on some Windows editions (commonly Home).

### ✅ Resolution

* Use a Windows edition that supports Group Policy (Pro/Enterprise/Education)
* Or apply similar policies using PowerShell / local security policy tools where possible

---

## ✅ Final Tip: Make Hardening Repeatable

To make endpoint hardening consistent:

* follow benchmark checklists
* document each change
* verify after applying changes (config validation + service status)
* keep artifacts as evidence for audits and future reviews

---
