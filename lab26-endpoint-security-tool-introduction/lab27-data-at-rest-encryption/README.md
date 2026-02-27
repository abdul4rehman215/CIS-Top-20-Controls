# 🧪 Lab 27: Data at Rest Encryption (BitLocker + LUKS) — CIS Controls

**Environments:**
- 🪟 Windows 11 Pro (VM/Sandbox) → BitLocker (GUI)
- 🐧 Ubuntu 24.04.1 LTS (Cloud Lab) → LUKS (cryptsetup)

**User:** `toor`  
**Key practice:** Passphrases/recovery keys are **not** stored in plaintext in logs—only documented as “saved securely”.  
**Note:** Outputs are **sample/simulated** from an authorized beginner lab environment and formatted like a real GitHub lab run.

---

## 📌 Introduction

Data-at-rest encryption protects information stored on disks from unauthorized access if:
- a disk is stolen or copied
- a VM snapshot leaks
- a cloud volume is detached and mounted elsewhere

This lab demonstrates two common approaches:
- BitLocker for Windows volumes
- LUKS (Linux Unified Key Setup) for Linux block devices

---

## 🎯 Objectives

- Understand the importance of data-at-rest encryption
- Encrypt a test partition using BitLocker (Windows) and LUKS (Linux)
- Document secure key management practices (no plaintext secrets)
- Verify encryption via reboot / locked-state validation

---

## ✅ Prerequisites

- Admin/root access (Windows + Linux)
- A spare test disk/partition (safe to wipe for encryption testing)
- Basic comfort with:
  - Windows Control Panel navigation
  - Linux CLI (lsblk, fdisk, cryptsetup, mount)

---

## 🧩 Lab Tasks Overview

### ✅ Task 1: Encrypting a Partition Using BitLocker (Windows 11 Pro)

**Actions performed (GUI)**
- Opened Control Panel → System and Security → BitLocker Drive Encryption
- Selected test drive **E:** (Data Volume 10GB) *(example lab disk)*
- Started BitLocker setup:
  - encryption method: **XTS-AES 128-bit (default)**
  - mode: **Encrypt entire drive**

**Key management (documented)**
- Unlock method: Password
- Recovery key: Generated and **saved securely** (offline / password manager / encrypted vault)
- Plaintext storage: **Not used**

**Verification (documented)**
- After reboot:
  - Drive E: shows locked icon
  - Access prompts for BitLocker password
  - Without password: contents inaccessible

---

### ✅ Task 2: Encrypting a Partition Using LUKS (Ubuntu 24.04.1)

**1) Install prerequisites**
- Installed `cryptsetup` via apt

**2) Identify spare disk**
- Found spare unmounted disk:
  - `/dev/nvme1n1` (10G)

**3) Create test partition**
- Created `/dev/nvme1n1p1` (10G) using `fdisk`

**4) Encrypt using LUKS**
- Ran:
  - `cryptsetup luksFormat /dev/nvme1n1p1`
- Confirmed with uppercase `YES`
- Entered a strong passphrase (stored securely; not logged)

**Key management (documented)**
- Passphrase stored securely (no plaintext)
- Recovery approach: secondary key slot can be added if needed using:
  - `cryptsetup luksAddKey`

**5) Open encrypted container**
- Opened mapping:
  - `cryptsetup open /dev/nvme1n1p1 my_encrypted_partition`
- Verified mapping exists with `lsblk`

**6) Create filesystem + mount**
- Created ext4 filesystem:
  - `mkfs.ext4 /dev/mapper/my_encrypted_partition`
- Mounted to `/mnt`
- Wrote a test file:
  - `/mnt/secret.txt`

**7) Verify locked state**
- Unmounted and closed mapping:
  - `umount /mnt`
  - `cryptsetup close my_encrypted_partition`
- Rebooted
- Confirmed `/mnt` empty until unlock+mount
- Unlocked again and validated data persisted and was readable only after decrypt+mount

---

## 📁 Repository Structure

```

lab27-data-at-rest-encryption/
├── README.md
├── commands.sh
├── commands.ps1
├── output.txt
├── interview_qna.md
├── troubleshooting.md
├── windows/
│   └── bitlocker_notes.md
├── linux/
│   └── luks_notes.md
└── artifacts/
└── secret.txt.sample

```

> No passphrases, recovery keys, or secrets are stored in this repo.  
> `secret.txt.sample` is a non-sensitive placeholder demonstrating what was written while the volume was unlocked.

---

## ✅ Verification & Validation

### Windows (BitLocker)
- Drive status confirmed: BitLocker ON
- Reboot validation:
  - drive locked without password
  - prompts for unlock

### Linux (LUKS)
- Disk/partition verified:
  - `lsblk`
- LUKS mapping verified:
  - `/dev/mapper/my_encrypted_partition`
- Data persistence confirmed after reboot:
  - file exists only after unlock + mount
- Locked state verified:
  - mapping removed after close and reboot

---

## 🧠 What I Learned

- Data-at-rest encryption is essential even in cloud environments due to snapshot/volume risks
- Encryption is not just “enable it”—it requires strong key practices and safe documentation
- LUKS workflow is repeatable and testable:
  - format → open → filesystem → mount → close → reboot validate
- BitLocker provides practical full-volume protection for Windows endpoints and laptops

---

## 🌍 Why This Matters

Encryption at rest protects sensitive data against:
- stolen disks/VM images
- unauthorized access to detached volumes
- forensic extraction from unencrypted drives

It is a common baseline requirement in security frameworks and compliance programs.

---

## ✅ Result

✅ BitLocker enabled on a Windows test volume and verified locked after reboot  
✅ LUKS encryption applied to a Linux test partition, mapped, formatted, mounted, tested  
✅ Reboot validation proved data inaccessible until unlocked  
✅ Key management documented safely (no plaintext secrets) 🚀

---

## 🏁 Conclusion

This lab demonstrated practical data-at-rest encryption on both Windows and Linux.  
The workflow emphasized **secure key handling**, **repeatable configuration**, and **verifiable locked-state validation**.

✅ Lab completed successfully (BitLocker + LUKS) with safe documentation practices.

---
