# 🛠️ Troubleshooting Guide — Lab 27: Data at Rest Encryption (BitLocker + LUKS)

> This guide covers common issues when enabling BitLocker on Windows and configuring LUKS encryption on Ubuntu, including reboot validation and safe key management.

---

## Windows (BitLocker)

## 1) BitLocker option missing in Control Panel
### Causes
- Windows edition does not support BitLocker (e.g., Home)
- Device not using supported configuration

### Fix
- Confirm Windows edition is Pro/Enterprise/Server
- Use a VM/Sandbox that supports BitLocker features
- In some cases, enable required Windows features or use device encryption alternative

---

## 2) BitLocker cannot start due to TPM requirements
### Symptoms
- BitLocker asks for TPM or refuses to enable

### Fix (lab-friendly)
- In VM, enable virtual TPM (if supported)
- Alternatively, allow BitLocker without TPM using Group Policy:
  - Computer Configuration → Administrative Templates → Windows Components → BitLocker Drive Encryption → Operating System Drives
  - “Require additional authentication at startup” → allow BitLocker without compatible TPM
> Only do this in lab environments or when your organization policy allows it.

---

## 3) Recovery key not accessible when needed (high risk)
### Fix
- Always store recovery key in a secure location:
  - offline storage
  - secure password manager
  - encrypted vault
- Never store recovery keys in plaintext or commit them to GitHub

---

## 4) Drive does not prompt for password after reboot
### Causes
- Auto-unlock enabled
- You are testing a data drive instead of OS drive behavior

### Fix
- Check BitLocker settings for the drive:
  - manage auto-unlock settings
- For data volumes, Windows may allow auto-unlock depending on policy

---

## Linux (LUKS / cryptsetup)

## 5) `cryptsetup: command not found`
### Fix
- Install cryptsetup:
  - `sudo apt-get update`
  - `sudo apt-get install cryptsetup -y`

---

## 6) Wrong device selected (most dangerous mistake)
### Risk
Encrypting the wrong disk can destroy data.

### Prevention
- Always confirm device with:
  - `lsblk`
  - `sudo fdisk -l`
- Validate size and mountpoints carefully before `luksFormat`.

---

## 7) `fdisk` partition not visible after creation
### Fix
- Re-read partition table:
  - `sudo partprobe /dev/nvme1n1`
- Or reboot (last resort in labs)
- Re-check:
  - `lsblk /dev/nvme1n1`

---

## 8) `cryptsetup luksFormat` fails
### Causes
- device busy or mounted
- permission issues
- incorrect device path

### Fix
- Ensure the partition is not mounted:
  - `mount | grep nvme1n1`
- Unmount if needed:
  - `sudo umount /dev/nvme1n1p1`
- Retry luksFormat with correct path.

---

## 9) `cryptsetup open` fails (wrong passphrase)
### Fix
- Confirm correct device path
- Retry passphrase carefully
- If passphrase is lost and no other key slot exists, data is not recoverable (by design)

---

## 10) Mapping exists but mount fails
### Causes
- filesystem not created yet
- wrong device mounted

### Fix
- Ensure filesystem exists:
  - `sudo blkid /dev/mapper/my_encrypted_partition`
- If empty, create filesystem:
  - `sudo mkfs.ext4 /dev/mapper/my_encrypted_partition`
- Mount the mapper device (not the raw encrypted partition):
  - `sudo mount /dev/mapper/my_encrypted_partition /mnt`

---

## 11) After reboot, `/mnt` is empty (expected behavior)
### Explanation
LUKS volumes are not mounted automatically unless configured in `/etc/crypttab` and `/etc/fstab`.

### Fix (manual unlock)
- `sudo cryptsetup open /dev/nvme1n1p1 my_encrypted_partition`
- `sudo mount /dev/mapper/my_encrypted_partition /mnt`

---

## 12) Key management best practices (don’t break your repo safety)
### Do
- Store passphrases and recovery keys securely (offline/vault/password manager)
- Use secondary key slots for recovery (if policy allows):
  - `sudo cryptsetup luksAddKey /dev/nvme1n1p1`

### Don’t
- Commit keys/passphrases into GitHub
- Store secrets in plaintext notes or output logs
