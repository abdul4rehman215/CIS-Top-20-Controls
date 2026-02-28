# 🎤 Interview Q&A — Lab 29: Verifying Backups (Restore + Compare + Checksums)

> Below are interview-style questions and answers based on restoring a tar backup, validating file presence, comparing directories, verifying integrity with SHA256, and documenting verification results.

---

## 1) Why is backup verification important?
Because a backup is only valuable if it can be restored successfully. Verification ensures backups are complete, readable, and not corrupted—so recovery works during incidents like ransomware, accidental deletion, or system failure.

---

## 2) What is the difference between “backup creation” and “backup verification”?
- Backup creation: producing an archive/copy of data (tar/rsync/etc.)
- Backup verification: restoring or testing the backup and proving it matches expected data (structure + integrity)

---

## 3) What tool did you use to restore the backup in this lab?
I used `tar` to extract a gzip-compressed tar archive:
- `tar -xzvf backup.tar.gz -C restored_backup_directory/`

---

## 4) What do the flags `-xzvf` mean in `tar -xzvf`?
- `x` = extract
- `z` = gzip decompression
- `v` = verbose output (show files as they extract)
- `f` = specify the archive file name

---

## 5) Why did you restore into a separate directory?
Restoring into a dedicated restore path prevents overwriting production data. It’s safer for testing and allows comparisons between original and restored content.

---

## 6) How did you confirm the restore succeeded?
I checked:
- directory presence with `ls -l restored_backup_directory/`
- file list with:
  - `find restored_backup_directory/original_directory -maxdepth 2 -type f -print`

This confirmed expected files were restored.

---

## 7) How did you compare restored files to the original?
Using a recursive directory compare:
- `diff -r original_directory/ restored_backup_directory/original_directory/`

---

## 8) What does it mean if `diff -r` produces no output?
No output indicates the directories are identical—same file contents and structure for the compared paths.

---

## 9) Why did you also use checksums after diff?
Checksums validate integrity at the file level using cryptographic hashing. Even if a file appears identical, hashes confirm exact byte-level equality.

---

## 10) What command did you use for integrity verification?
- `sha256sum original_directory/file1.txt restored_backup_directory/original_directory/file1.txt`

Matching hash values confirm file integrity.

---

## 11) What types of issues can backup verification reveal?
Examples:
- corrupted archive (bad storage/media)
- missing files (incomplete backup)
- permission/ownership mismatches
- wrong restore path or wrong backup version
- changed files not included in backup window

---

## 12) If verification fails, what are your next troubleshooting steps?
- restore again to rule out transient issues
- verify archive integrity (hash/checksum if available)
- inspect tar errors or logs
- validate storage health and filesystem issues
- check permissions and ownership differences

---

## 13) Why is documentation part of backup verification?
Documentation provides an audit trail and repeatability:
- which archive was tested
- which restore commands were used
- what results were observed
This helps teams trust backups and repeat checks regularly.

---

## 14) What is the key takeaway from this lab?
Backups must be tested. A reliable verification workflow is:
**restore → confirm files → compare directories → validate checksums → document results**
