# 🧪 Lab 21: Patch Management Basics (CIS Controls)

**Environments Covered (Multi-Platform Lab):**
- 🐧 Ubuntu 24.04.1 LTS (apt-based)
- 🐧 CentOS Linux 7 (Core) (yum-based)
- 🪟 Windows (GUI steps)

**Note:** Terminal outputs in this lab are **sample/simulated** outputs from an authorized lab environment and are formatted like real execution logs for GitHub documentation.

---

## 🎯 Objectives

This lab demonstrates core patch management operations across multiple operating systems:

- Understand why patch management is critical for security and stability
- Check for available updates on different platforms
- Apply pending updates using command-line tools (Linux)
- Document the updates applied
- Reboot systems if required
- Perform post-update validation and identify potential issues

---

## ✅ Prerequisites

- Basic OS concepts (Windows + Linux)
- Familiarity with command line usage
- Access to:
  - Windows system (or Windows VM)
  - Ubuntu Linux system (apt)
  - CentOS/RHEL Linux system (yum)
- Administrative privileges (sudo/admin)

---

## 📌 Introduction

Patch management is the process of **systematically checking, applying, and validating updates** for:

- operating systems
- applications
- security tools and libraries

It is essential for:
- vulnerability mitigation (security fixes)
- stability improvements (bug fixes)
- feature enhancements
- compliance requirements

This lab focuses on the “baseline workflow”:
**check → update → document → reboot (if needed) → validate**

---

## 🧩 Lab Tasks Overview

### ✅ Task 1: Checking for Available Updates

#### 🪟 Windows (GUI)
- Open **Settings** → **Update & Security** → **Windows Update**
- Click **Check for updates**
- Document observed results:
  - updates available (example)
  - reboot requirement status (example)

#### 🐧 Ubuntu (apt)
- Update package lists:
  - `sudo apt update`
- List upgradeable packages:
  - `apt list --upgradable`

#### 🐧 CentOS 7 (yum)
- Check updates:
  - `sudo yum check-update`

---

### ✅ Task 2: Applying Pending Updates

#### 🪟 Windows (GUI)
- Click **Install now** (if updates available)
- Document:
  - installed updates (example)
  - restart requirement status

#### 🐧 Ubuntu (apt)
- Apply upgrades:
  - `sudo apt upgrade -y`
- Document updates applied:
  - captured “before/after” logic in `updates_applied.log`
  - note: after upgrading, `apt list --upgradable` often becomes empty

#### 🐧 CentOS 7 (yum)
- Apply upgrades:
  - `sudo yum update -y`
- Document update details:
  - `sudo yum list updates >> updates_applied.log`
- Verify log file exists

---

### ✅ Task 3: Reboot and Validate Updates

#### Reboot check + reboot (Linux)
- Ubuntu reboot check:
  - `/var/run/reboot-required`
- Reboot system if required:
  - `sudo reboot`
- (SSH disconnect expected after reboot)

#### Post-update validation (Linux)
- Check logs for errors:
  - `dmesg | grep -i "error"`
- Validate key software versions:
  - `bash --version`
  - `openssh -V` (Ubuntu)
  - `openssl version` (CentOS)

> Note: Some VM/cloud environments show non-critical ACPI/hardware warnings in `dmesg`.

---

## 📁 Repository Structure

```

lab21-patch-management-basics/
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
├── troubleshooting.md
├── logs/
│   ├── ubuntu_updates_applied.log
│   └── centos_updates_applied.log
└── windows/
└── windows_update_notes.md

```

> Because this lab is multi-platform, deliverables are split into OS-specific logs/notes for clarity.

---

## ✅ Deliverables Produced

### 🐧 Ubuntu
- Patch checks and upgrades documented
- Reboot requirement checked and reboot performed
- Post-reboot validation captured (dmesg + version checks)
- Log file:
  - `logs/ubuntu_updates_applied.log`

### 🐧 CentOS 7
- Patch checks and upgrades documented
- Update details written to log
- Post-update validation captured (dmesg + version checks)
- Log file:
  - `logs/centos_updates_applied.log`

### 🪟 Windows
- GUI-based update process documented in notes
- Example results recorded:
  - updates available/installed
  - restart requirement status
- Notes file:
  - `windows/windows_update_notes.md`

---

## 🧠 What I Learned

- Patch management must be consistent and routine to reduce vulnerability exposure
- Update workflows differ by platform:
  - Ubuntu uses `apt`
  - CentOS uses `yum`
  - Windows uses GUI workflows (or PowerShell in enterprise automation)
- Proper patching includes:
  - documenting what changed
  - rebooting when required
  - validating system stability after updates
- Version strings may not show backported security fixes (especially in vendor-maintained distros)

---

## 🌍 Why This Matters

Most real-world compromises leverage **known vulnerabilities** with available patches.

A reliable patch management process:
- reduces attack surface
- prevents repeatable exploit paths
- improves system stability
- supports compliance and audit requirements

---

## ✅ Result

✅ Updates checked across Windows + Ubuntu + CentOS  
✅ Updates applied using apt and yum  
✅ Updates documented via log files  
✅ Reboot validated where required  
✅ Post-update health checks completed (dmesg + version verification)

---

## 🏁 Conclusion

This lab reinforced patch management as a foundational defensive practice:

**Identify updates → apply patches → document changes → reboot if needed → validate stability**

✅ Lab completed successfully (Windows + Ubuntu apt + CentOS yum) with documented and reproducible output logs.

---
