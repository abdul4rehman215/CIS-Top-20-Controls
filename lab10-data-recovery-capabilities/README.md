# 💾🧯 Lab 10: Data Recovery Capabilities (CIS Control 10)

> **Environment:** Ubuntu 24.04.1 LTS (Cloud Lab Environment)  
> **User:** toor  
> **Focus:** Manual backup + scheduled backup + restore verification  
> **Category:** CIS Top 20 Controls (Lab 10 of 15)

---

## 🎯 Objectives

By the end of this lab, I was able to:

- Understand why data recovery is critical to security and operational resilience.
- Perform a **manual backup** using open-source tools (`tar` + gzip).
- Configure a **scheduled backup** using `cron`.
- Restore data into a separate directory and verify **integrity** using `diff`.

---

## ✅ Prerequisites

- Basic CLI knowledge.
- Linux system access (Ubuntu or similar).
- Text editor (nano/vim/gedit).
- Sudo/admin access for system operations.
- Familiarity with basic file/directory navigation.

---

## 🧪 Lab Environment

| Component | Details |
|---|---|
| OS | Ubuntu 24.04.1 LTS |
| Environment | Cloud Lab Environment |
| User | toor |
| Tools Used | `nano`, `mkdir`, `find`, `tar`, `ls`, `crontab`, `diff` |
| Backup Format | `.tar.gz` (tar + gzip) |

---

## 🗂️ Repository Structure (Lab Folder)

```text id="d5blvd"
lab10-data-recovery-capabilities/
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
├── troubleshooting.md
├── scripts/
│   └── (none for this lab)
└── artifacts/
    ├── DocumentsBackup.tar.gz
    ├── crontab.txt
    ├── notes.txt
    ├── credentials_policy.txt
    └── reports/
        └── system_audit_report.txt
```

> ✅ Notes:
>
> * The original files were created under `~/Documents/`.
> * The backup archive was created in the home directory as `DocumentsBackup.tar.gz`.
> * For GitHub evidence, the **sample files** and **crontab output** are stored under `artifacts/`.

---

## ✅ Tasks Overview (What I Did)

### ✅ Task 1: Select a Folder for Backup

* Selected directory:

  * `/home/toor/Documents`
* Created realistic sample “important” files:

  * `notes.txt`
  * `credentials_policy.txt`
  * `reports/system_audit_report.txt`
* Verified file list using `find`.

### ✅ Task 2: Perform Manual + Scheduled Backup

#### ✅ Manual Backup

* Created a compressed archive using:

  * `tar -czvf DocumentsBackup.tar.gz /home/toor/Documents`
* Verified the archive exists and checked its size.

#### ✅ Scheduled Backup (Cron)

* Edited user crontab and scheduled a daily backup at 2:00 AM:

  * `0 2 * * * tar -czvf /home/toor/DocumentsBackup_$(date +\%F).tar.gz /home/toor/Documents`
* Verified cron entry using `crontab -l`.

### ✅ Task 3: Restore Backup + Verify Integrity

* Restored the archive into a separate directory:

  * `/home/toor/RestoredDocuments`
* Verified restored files exist.
* Verified integrity by comparing original vs restored directories using `diff -r`.

  * **No output** means directories are identical (integrity confirmed).

---

## ✅ Verification & Validation

* Verified original data exists:

  * `find ~/Documents -type f -maxdepth 2 -print`
* Verified backup archive exists:

  * `ls -lh DocumentsBackup.tar.gz`
* Verified scheduled backup configured:

  * `crontab -l`
* Verified restore succeeded:

  * `find /home/toor/RestoredDocuments -type f -maxdepth 4 -print`
* Verified integrity:

  * `diff -r <original> <restored>` → no output

---

## 🧠 What I Learned

* Backups must be tested—**a backup is only useful if restore works**.
* `tar` is a simple and powerful tool for archiving and compressing directories.
* Cron jobs allow consistent, automated backups.
* Using absolute paths in tar archives preserves directory structure during restore.
* `diff -r` is an easy integrity check for folder-level comparison.

---

## 🎯 Why This Matters

Data recovery supports:

* ransomware recovery readiness
* accidental deletion or corruption recovery
* operational continuity and resilience
* audit/compliance evidence for backup controls

A strong recovery strategy reduces downtime and prevents permanent data loss.

---

## 🌍 Real-World Applications

* Daily backup automation for user data and critical configs
* Disaster recovery preparation (restore drills)
* Immutable or versioned backup workflows
* Evidence-based recovery validation for compliance

---

## ✅ Result

* ✅ Created sample data and backed it up into a compressed archive.
* ✅ Scheduled daily automated backups via cron.
* ✅ Restored data into a separate directory successfully.
* ✅ Verified restore integrity with `diff` (no differences found).

---

## 🧾 Conclusion

This lab demonstrated an end-to-end recovery workflow:

Create data → Backup → Schedule automation → Restore → Verify integrity.

✅ Lab completed successfully on a cloud lab environment.

---

## 📦 Artifacts Created (Committed to Repo)

Stored under `artifacts/`:

* `DocumentsBackup.tar.gz`
* `crontab.txt` *(saved output from `crontab -l`)*
* Sample source files:

  * `notes.txt`
  * `credentials_policy.txt`
  * `reports/system_audit_report.txt`

---
