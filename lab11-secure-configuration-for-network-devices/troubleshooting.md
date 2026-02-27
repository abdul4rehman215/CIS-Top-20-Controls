# 🛠️ Troubleshooting Guide — Lab 11: Secure Configuration for Network Devices (CIS Control 11)

> This guide covers common issues when accessing and hardening network device management interfaces (Web UI, SSH, Console) and saving configuration changes.

---

## 1) Can't access device web interface at `http://192.168.1.1`

### ✅ Problem
Browser times out or fails to load the router admin page.

### 💡 Cause
- Incorrect gateway/device IP
- You are not on the same network/subnet
- Device web management disabled
- Firewall blocks access to management interface

### ✅ Resolution
- Confirm gateway IP:
  - Windows:
    ```cmd
    ipconfig
    ```
  - Linux:
    ```bash
    ip route | head
    ```
- Ping the device:
```bash id="k6x9cu"
ping -c 2 192.168.1.1
````

* If web UI is disabled, use SSH or console access instead.

---

## 2) Default credentials don't work

### ✅ Problem

`admin/admin` or `admin/password` fails.

### 💡 Cause

* Device credentials already changed
* Different vendor default credentials
* Account locked due to too many attempts

### ✅ Resolution

* Check documentation/vendor label if available.
* Use console access for recovery.
* In production, follow reset procedures carefully (may require physical access).

---

## 3) SSH connection fails (connection refused / timed out)

### ✅ Problem

`ssh admin@192.168.1.1` fails.

### 💡 Cause

* SSH not enabled on device
* Management interface not reachable
* SSH restricted to specific IPs (ACL)
* Wrong port (SSH not on 22)
* Firewall blocks inbound SSH

### ✅ Resolution

* Enable SSH on device console:

```text
enable
configure terminal
ip ssh version 2
line vty 0 4
transport input ssh
```

* Verify reachability (ping).
* Verify SSH service status / allowed management access (vendor-specific).
* If port differs:

```bash id="8bl8ki"
ssh -p <port> admin@192.168.1.1
```

---

## 4) SSH warns about unknown host key / fingerprint

### ✅ Problem

SSH shows:

* authenticity can't be established
* asks to continue connecting

### 💡 Cause

First-time connection or host key changed.

### ✅ Resolution

* In production, verify the fingerprint via trusted source (device console or documentation).
* If key changed unexpectedly, investigate for possible MITM or device reimage.

---

## 5) “transport input ssh” doesn’t prevent Telnet in some environments

### ✅ Problem

Telnet still works or is enabled elsewhere.

### 💡 Cause

* Device may have multiple line configs (vty ranges)
* Telnet enabled in another configuration section
* Vendor behavior differs slightly

### ✅ Resolution

* Confirm all VTY lines configured:

```text
line vty 0 15
transport input ssh
```

* Verify with show commands (vendor-specific):

```text
show running-config | section line vty
```

---

## 6) `show services` command not available on some devices

### ✅ Problem

Device doesn’t recognize `show services`.

### 💡 Cause

Different vendors/IOS versions use different commands.

### ✅ Resolution

Use alternatives:

* `show running-config`
* `show ip http server status` (Cisco-like)
* `show ip ssh`
* `show version`
  Exact command depends on platform.

---

## 7) Disabling HTTP also disables HTTPS unexpectedly

### ✅ Problem

After `no ip http server`, HTTPS web UI is not reachable.

### 💡 Cause

Some platforms treat HTTP/HTTPS services differently, or HTTPS may require separate enablement/cert configuration.

### ✅ Resolution

* Ensure HTTPS is enabled explicitly:

```text
ip http secure-server
```

* Confirm status (vendor-specific):

```text
show ip http server status
```

* If HTTPS requires certificates, configure PKI accordingly (platform-dependent).

---

## 8) Configuration changes lost after reboot

### ✅ Problem

Device reboots and changes are gone.

### 💡 Cause

Changes were made to running-config but not saved to startup-config.

### ✅ Resolution

Save configuration:

```text
write memory
```

or

```text
copy running-config startup-config
```

---

## 9) Cannot save config (permission/storage issue)

### ✅ Problem

Saving config fails or reports error.

### 💡 Cause

* Storage is full or read-only
* Privilege level insufficient
* Startup-config locked (rare)

### ✅ Resolution

* Confirm privilege mode:

```text
enable
```

* Check storage space (platform-specific):

```text
show flash:
```

* Resolve storage constraints and retry save.

---

## ✅ Final Tip: Harden Management Access Beyond Basics

After enabling SSH and disabling HTTP, production-ready steps often include:

* restrict management to a dedicated VLAN
* apply ACLs (allow only admin IPs)
* disable unused discovery protocols if not required (e.g., CDP)
* enable centralized logging (syslog/SIEM)
* implement role-based access (least privilege)
* enforce strong password/crypto policies and rotate credentials

---
