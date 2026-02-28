# 🧪 Lab 29: Verifying Backups (Restore + Compare + Integrity Check) — CIS Controls

**Environment:** Ubuntu 24.04.1 LTS (Cloud Lab Environment)  
**User:** `toor`  
**Note:** Outputs are **sample/simulated** from an authorized lab environment and formatted like a real backup verification run.

---

## 🎯 Objectives

This lab focuses on verifying backup reliability by learning how to:

- Restore a backup archive (`backup.tar.gz`) using `tar`
- Verify that restored files exist and match the original structure
- Compare restored vs original files using `diff -r`
- Confirm file integrity using checksums (`sha256sum`)
- Document the verification outcome and what to do if issues appear

---

## ✅ Prerequisites

- Basic Linux CLI knowledge
- A previously created backup archive (e.g., tar/rsync/Bacula)
- File permissions to read original data and write restore results
- A safe lab workspace (so testing does not overwrite production files)

---

## 🧩 Lab Tasks Overview

### ✅ Task 1: Restore the Backup

**1) Prepare workspace**
- Created a controlled lab directory:
  - `original_directory/`
  - `restored_backup_directory/`
  - `logs/`

**2) Confirm backup archive exists**
- Verified `backup.tar.gz` present before restore

**3) Restore using tar**
- Extracted archive into restore folder:
  - `tar -xzvf backup.tar.gz -C restored_backup_directory/`

**4) Verify restored files exist**
- Checked restored folder listing
- Used `find` to confirm restored files were present

---

### ✅ Task 2: Compare Restored Files to Original

- Compared full directory trees using:
  - `diff -r original_directory/ restored_backup_directory/original_directory/`

**Result interpretation**
- No output from `diff` means content matches exactly.

---

### ✅ Task 3: Verify Integrity and Document Results

**1) Hash verification**
- Compared SHA256 hashes for a representative file:
  - `sha256sum original_directory/file1.txt restored_backup_directory/original_directory/file1.txt`

**Result**
- Matching hashes confirm file integrity.

**2) Document verification outcome**
- Created verification notes log describing:
  - restore process
  - comparison results
  - integrity check
  - issue-handling plan if future mismatches occur

---

## 📁 Repository Structure

```

lab29-verifying-backups/
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
├── troubleshooting.md
├── logs/
│   └── verification_notes.md
└── artifacts/
└── backup.tar.gz.sample

```

> `backup.tar.gz.sample` is a placeholder reference for documentation. 

---

## ✅ Verification & Validation

Backup verification was validated through:

- Archive presence check:
  - `ls -lh backup.tar.gz`
- Restore success and file presence:
  - `tar -xzvf ...`
  - `find restored_backup_directory/...`
- Full directory recursive comparison:
  - `diff -r ...`
- Hash-based integrity check:
  - `sha256sum ...`
- Verification log created in `logs/verification_notes.md`

---

## 🧠 What I Learned

- Backups are only trustworthy if restores are tested regularly
- A clean restore path prevents overwriting production data
- `diff -r` provides fast directory-level correctness checking
- Checksums confirm integrity even when files “look” correct
- Writing verification notes creates an audit trail and helps repeat the process consistently

---

## 🌍 Why This Matters

Backups are critical for:
- ransomware recovery
- accidental deletion recovery
- system rebuilds
- compliance and audit

But backups that are never tested can fail when needed most. Verification ensures backups are usable and complete.

---

## ✅ Result

✅ Backup restored successfully from `backup.tar.gz`  
✅ Restored file structure verified  
✅ `diff -r` confirmed directories match (no differences)  
✅ `sha256sum` confirmed file integrity  
✅ Verification notes documented for audit/repeatability 🚀

---

## 🏁 Conclusion

This lab demonstrated a practical backup verification workflow:

**restore → confirm file presence → compare directories → validate hashes → document outcome**

✅ Lab completed successfully with verified backup integrity and documented verification results.

---
