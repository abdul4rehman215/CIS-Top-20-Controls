# 🛠️ Troubleshooting Guide — Lab 10: Data Recovery Capabilities (CIS Control 10)

> This guide covers common issues when creating tar backups, scheduling with cron, restoring archives, and verifying integrity.

---

## 1) `tar: Cannot stat: No such file or directory`

### ✅ Problem
Running tar backup fails because the source folder doesn’t exist.

### 💡 Cause
Incorrect path, folder not created, or typo.

### ✅ Resolution
Verify path exists:
```bash
ls -ld /home/toor/Documents
````

Create it if missing:

```bash id="m7t7e3"
mkdir -p ~/Documents
```

---

## 2) Backup archive created but is empty or missing expected files

### ✅ Problem

Archive exists but doesn’t contain files you expected.

### 💡 Cause

* wrong source path
* files were created in a different directory
* ran tar before creating files

### ✅ Resolution

List expected files:

```bash id="u8mg1k"
find ~/Documents -type f -maxdepth 2 -print
```

Inspect archive contents:

```bash id="5z0ijb"
tar -tzvf DocumentsBackup.tar.gz | head -n 50
```

Then recreate archive with correct path.

---

## 3) Restore creates nested directories like `home/toor/Documents/...`

### ✅ Problem

Restore result looks like:
`/home/toor/RestoredDocuments/home/toor/Documents/...`

### 💡 Cause

Archive was created using an absolute path (`/home/toor/Documents`), so tar preserved that structure.

### ✅ Resolution

This is normal. Compare using the correct restored path (as done in the lab):

```bash id="v7xyi4"
diff -r /home/toor/Documents /home/toor/RestoredDocuments/home/toor/Documents
```

If you prefer restoring without absolute paths, create the archive using relative paths:

```bash id="x7w4h7"
cd /home/toor
tar -czvf DocumentsBackup.tar.gz Documents
```

---

## 4) Cron job not running

### ✅ Problem

Backups are scheduled but no new dated backups appear.

### 💡 Cause

* cron daemon not running
* incorrect cron syntax
* command uses paths that fail in cron environment
* permissions issues

### ✅ Resolution

1. Verify cron service:

```bash id="gdmvf0"
systemctl status cron --no-pager
```

2. Ensure your command uses full paths (tar is usually in `/usr/bin/tar`):

```bash id="n8d25a"
which tar
```

3. Add logging to cron entry for debugging:

```bash id="ca0nrg"
0 2 * * * /usr/bin/tar -czvf /home/toor/DocumentsBackup_$(date +\%F).tar.gz /home/toor/Documents >> /home/toor/backup_cron.log 2>&1
```

4. Verify cron entry installed:

```bash id="l6vnw2"
crontab -l
```

---

## 5) Cron syntax error with `%` in date

### ✅ Problem

Cron job runs incorrectly due to `%` handling.

### 💡 Cause

In crontab, `%` has special meaning (newline). It must be escaped as `\%`.

### ✅ Resolution

Use the escaped format (as done in this lab):

```bash id="0yde18"
0 2 * * * tar -czvf /home/toor/DocumentsBackup_$(date +\%F).tar.gz /home/toor/Documents
```

---

## 6) `diff -r` reports differences after restore

### ✅ Problem

Integrity verification shows differences.

### 💡 Cause

* files changed after backup was created
* restore path compared incorrectly
* file timestamps or generated content changed (rare unless files are dynamic)

### ✅ Resolution

1. Ensure correct comparison path:

```bash id="8g8m3t"
diff -r /home/toor/Documents /home/toor/RestoredDocuments/home/toor/Documents
```

2. Re-run backup and restore immediately, then compare again.

3. Inspect which files differ:

```bash id="2dtdxv"
diff -r /home/toor/Documents /home/toor/RestoredDocuments/home/toor/Documents | head -n 50
```

---

## 7) Permission denied when restoring to target directory

### ✅ Problem

Extraction fails due to insufficient permissions.

### 💡 Cause

Target directory is not writable.

### ✅ Resolution

Use a directory you own (like your home), or adjust permissions:

```bash id="tybt1x"
mkdir -p /home/toor/RestoredDocuments
tar -xzvf DocumentsBackup.tar.gz -C /home/toor/RestoredDocuments
```

If restoring to protected paths, use sudo carefully:

```bash id="9sm8r8"
sudo tar -xzvf DocumentsBackup.tar.gz -C /target/path
```

---

## ✅ Final Tip: Backups Must Be Tested

A backup strategy is only trustworthy if:

* it runs reliably on schedule
* restores work consistently
* integrity is verified (diff/hashes)
* backups are stored off-host or in protected storage

---
