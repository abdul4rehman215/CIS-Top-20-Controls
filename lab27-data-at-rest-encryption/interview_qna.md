# 🎤 Interview Q&A — Lab 27: Data at Rest Encryption (BitLocker + LUKS)

> Below are interview-style questions and answers based on encrypting a Windows volume using BitLocker and encrypting a Linux partition using LUKS/cryptsetup, including key-management-safe documentation practices.

---

## 1) What is “data at rest encryption”?
Data at rest encryption protects data stored on disk (HDD/SSD/volumes) by ensuring the contents are unreadable without the correct key/passphrase. This protects against theft, unauthorized access to detached disks, and snapshot/volume compromise.

---

## 2) Why is encrypting data at rest important in cloud environments?
Cloud environments are still vulnerable to:
- stolen snapshots
- detached volumes mounted elsewhere
- unauthorized access via misconfigured storage permissions
Encryption reduces impact if storage media is exposed.

---

## 3) What tool did you use for Windows encryption in this lab?
I used **BitLocker** on Windows 11 Pro to encrypt a test volume (example: drive E:). BitLocker provides full-volume encryption integrated into Windows.

---

## 4) What encryption mode did BitLocker use?
BitLocker used the default:
- **XTS-AES 128-bit**
and I chose:
- **Encrypt entire drive** for comprehensive protection.

---

## 5) How did you manage the BitLocker recovery key safely?
The recovery key was generated and saved securely (offline/password manager/encrypted vault). It was not stored in plaintext logs or committed to GitHub. This follows best practice because recovery keys are highly sensitive.

---

## 6) How did you verify BitLocker encryption worked?
After encryption completed, I rebooted and confirmed:
- the drive showed a locked state
- accessing the drive prompted for the BitLocker password
- without the password, contents were inaccessible

---

## 7) What tool did you use for Linux encryption?
I used **LUKS** via `cryptsetup` on Ubuntu 24.04.1 to encrypt a test partition (`/dev/nvme1n1p1`).

---

## 8) What does `cryptsetup luksFormat` do?
`cryptsetup luksFormat` initializes a partition as a LUKS encrypted container. It writes LUKS headers and prepares the device to require a passphrase/key for access.

---

## 9) Why did you create a filesystem after opening the LUKS device?
After opening the encrypted container, the system exposes a decrypted mapping under `/dev/mapper/...`. A filesystem (ext4 in this lab) is created on that decrypted mapping so the encrypted volume can be mounted and used normally.

---

## 10) What is the difference between the encrypted device and the mapped decrypted device?
- Encrypted device: `/dev/nvme1n1p1` (raw encrypted container)
- Decrypted mapping: `/dev/mapper/my_encrypted_partition` (unlocked view)
You format and mount the mapper device, not the raw encrypted block device.

---

## 11) How did you verify the LUKS mapping existed?
Using `lsblk`, which showed:
- `/dev/nvme1n1p1` → mapped to `my_encrypted_partition` (type: crypt)

---

## 12) How did you validate that encryption “locks” data when closed?
I:
- unmounted the filesystem
- closed the mapping (`cryptsetup close`)
- rebooted
After reboot, `/mnt` was empty until I unlocked and mounted the encrypted device again.

---

## 13) How did you confirm the data persisted and remained protected?
After reboot, I unlocked the encrypted partition and mounted it again, then verified the test file existed:
- `/mnt/secret.txt`
This showed data persistence with access only after unlock.

---

## 14) What are LUKS key slots and why are they useful?
LUKS supports multiple key slots, allowing multiple passphrases/keys to unlock the same encrypted volume. This supports:
- adding a secondary recovery passphrase
- rotating keys without re-encrypting the entire disk
- shared admin access where appropriate

---

## 15) What is the key security practice highlighted in this lab?
Never store passphrases or recovery keys in plaintext logs or repositories. Document “stored securely” and keep secrets in offline storage or secure vaults/password managers.
