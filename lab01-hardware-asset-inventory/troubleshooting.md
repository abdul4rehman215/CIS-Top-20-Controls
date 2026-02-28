# 🛠️ Troubleshooting Guide — Lab 01: Hardware Asset Inventory (CIS Controls)

> This guide lists common issues encountered while creating an inventory and validating discoverable hosts using `nmap`.

---

## 1) `nmap: command not found`

### ✅ Problem
Running:
```bash
nmap --version
````

returns:

```text
bash: nmap: command not found
```

### 💡 Cause

`nmap` is not installed on the system by default.

### ✅ Resolution

Install it using:

```bash
sudo apt update
sudo apt install nmap -y
```

---

## 2) `sudo: a password is required` or permission denied

### ✅ Problem

`sudo` commands fail due to missing privileges or password prompt issues.

### 💡 Cause

* Current user is not in the sudoers group
* `sudo` requires authentication
* Lab environment restrictions

### ✅ Resolution

* Confirm user has sudo rights:

```bash
groups
```

* If allowed, add user to sudo group:

```bash
sudo usermod -aG sudo <username>
```

* Re-login or reboot the session after group changes.

> ✅ In managed cloud lab environments, sudo access is usually pre-configured.

---

## 3) Scanning the wrong subnet (no hosts found)

### ✅ Problem

Running a scan like:

```bash
nmap -sP 192.168.1.0/24
```

shows no results or irrelevant results.

### 💡 Cause

The system is not on that subnet. Cloud networks commonly use ranges like `172.31.x.x`.

### ✅ Resolution

Identify the active interface IP and subnet:

```bash
ip a show ens5
```

Then scan the relevant range, for example:

```bash
nmap -sP 172.31.10.0/24
```

---

## 4) `nmap -sP` shows deprecation / recommends `-sn`

### ✅ Problem

Some environments/tools suggest using `-sn` instead of `-sP`.

### 💡 Cause

Modern `nmap` versions replaced `-sP` with `-sn`, but `-sP` is still commonly referenced in older lab guides.

### ✅ Resolution

Either is acceptable for host discovery.
For strict lab alignment, use:

```bash
nmap -sP <subnet>
```

For modern syntax:

```bash
nmap -sn <subnet>
```

---

## 5) Devices not appearing in scan results

### ✅ Problem

Expected devices are not visible in ping sweep output.

### 💡 Cause

Common reasons include:

* ICMP blocked by firewalls
* Hosts are powered off / sleeping
* Devices are in another VLAN/subnet
* Network segmentation and cloud restrictions
* Security groups / NACLs in cloud environments

### ✅ Resolution

* Try scanning specific IPs if known:

```bash
nmap -sn <ip-address>
```

* Use ARP-based discovery on local LAN (if applicable):

```bash
sudo nmap -sn --send-ip <subnet>
```

* Validate using alternative sources:

  * DHCP lease tables
  * Switch MAC/ARP tables
  * Endpoint management (MDM/EDR)
  * Physical audits

---

## 6) Inventory file formatting looks misaligned

### ✅ Problem

The text table columns don’t align when viewing or editing.

### 💡 Cause

Terminal editors may display tabs/spaces differently depending on font and settings.

### ✅ Resolution

* Use fixed-width fonts in terminal (default in most terminals)
* Keep spacing consistent
* Optionally convert to CSV for spreadsheet import:

  * `hardware_inventory.csv`

---

## 7) Cloud lab limitation: inventory contains “example office assets”

### ✅ Problem

The inventory list includes office devices (PCs, laptops, printers), but the scan shows only cloud hosts.

### 💡 Cause

Cloud lab networks reflect actual cloud instances and gateways, not simulated office endpoints.

### ✅ Resolution

Document this limitation (as done in `scan_validation_notes.txt`) and explain:

* In real environments, scan the real office subnet (e.g., `192.168.1.0/24`)
* Cross-check with local infrastructure sources (DHCP/switch/AP controllers)

---

## ✅ Final Tip: Keeping it Audit-Ready

For real-world usage:

* Keep inventory updates tied to change management
* Record scan date/time and scope
* Store evidence logs/reports alongside inventory
* Use consistent naming and IDs across all teams

---
