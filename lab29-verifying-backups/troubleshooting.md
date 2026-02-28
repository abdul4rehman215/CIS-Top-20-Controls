# 🛠️ Troubleshooting Guide — Lab 29: Verifying Backups (Restore + Compare + Integrity)

> This guide covers common issues when restoring a tar backup archive, validating restored data, comparing directories, and verifying integrity with checksums.

---

## 1) `backup.tar.gz` not found
### Symptoms
- `ls: cannot access 'backup.tar.gz': No such file or directory`

### Fix
- Confirm correct working directory:
  - `pwd`
- Search for the archive:
  - `find ~ -name "backup.tar.gz" 2>/dev/null`
- Verify naming (date-stamped backups often differ).

---

## 2) `tar` restore fails with gzip or format errors
### Symptoms
- `gzip: stdin: not in gzip format`
- `tar: This does not look like a tar archive`

### Causes
- wrong file type (not really .tar.gz)
- corrupted archive
- partial download/copy

### Fix
- Check file type:
  - `file backup.tar.gz`
- Re-copy/re-download archive from backup source
- If checksum exists, verify it before restore.

---

## 3) Restored directory is empty or missing expected structure
### Causes
- wrong `-C` destination path
- archive contains different top-level directory structure

### Fix
- List archive contents before extracting:
  - `tar -tzf backup.tar.gz | head -n 50`
- Ensure destination exists:
  - `mkdir -p restored_backup_directory/`
- Restore again with correct path:
  - `tar -xzvf backup.tar.gz -C restored_backup_directory/`

---

## 4) Permission denied during restore
### Symptoms
- tar errors like “Cannot open: Permission denied”

### Fix
- Restore into a user-owned directory
- Or use sudo if appropriate:
  - `sudo tar -xzvf backup.tar.gz -C restored_backup_directory/`
> Be careful: restoring with sudo may change ownership outcomes.

---

## 5) `diff -r` shows differences but you expected none
### Causes
- original changed after backup was created
- timestamps/metadata differences (if comparing in a way that includes them)
- permissions/ownership differences
- line ending or whitespace changes

### Fix
- Confirm backup timestamp/version
- Inspect specific diffs:
  - `diff -r original_directory/ restored_backup_directory/original_directory/ | head -n 50`
- If only metadata differs, focus on content-based checksums.

---

## 6) Checksums do not match
### Causes
- corruption in archive or restore process
- wrong files compared (path mismatch)
- original file changed after backup creation

### Fix
- Confirm you're hashing the intended pair:
  - `ls -l original_directory/file1.txt restored_backup_directory/original_directory/file1.txt`
- Hash multiple files to confirm scope:
  - `find original_directory -type f -exec sha256sum {} \; > original.hashes`
  - `find restored_backup_directory/original_directory -type f -exec sha256sum {} \; > restored.hashes`
  - `diff -u original.hashes restored.hashes | head -n 80`

---

## 7) Restore works but scripts are not executable
### Cause
Archive may not preserve permissions depending on how it was created.

### Fix
- Confirm permissions:
  - `ls -l restored_backup_directory/original_directory/scripts/backup.sh`
- Reapply executable bit if required:
  - `chmod +x restored_backup_directory/original_directory/scripts/backup.sh`
- Consider creating backups with permission preservation options (policy-dependent).

---

## 8) Restoring overwrote existing files (avoid this)
### Prevention
- Always restore into a clean directory
- Use a unique restore path per verification run:
  - `restored_backup_directory_YYYYMMDD/`

---

## 9) Best practice recommendation
- Maintain an automated backup verification schedule
- Always test restores (not only archive creation)
- Keep verification logs for audit and incident readiness
