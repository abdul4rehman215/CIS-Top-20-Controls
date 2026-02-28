# 🧠 Interview Q&A — Lab 10: Data Recovery Capabilities (CIS Controls)

> This Q&A covers backup concepts, manual archiving, scheduling backups, restore validation, and integrity verification.

---

## 1) Why are data recovery capabilities important in cybersecurity?
They ensure systems can recover from incidents like ransomware, accidental deletion, corruption, or hardware failures—reducing downtime and preventing permanent data loss.

---

## 2) What is the difference between backup and recovery?
- **Backup:** creating a copy of data for safekeeping.
- **Recovery:** restoring that data successfully and verifying it is usable and intact.

---

## 3) Why is it not enough to just “create backups”?
Because a backup is only valuable if it can be restored correctly. Backups must be tested regularly with restore drills.

---

## 4) What does `tar -czvf` do in the backup command?
- `-c` create archive
- `-z` gzip compression
- `-v` verbose output
- `-f` specify archive filename

---

## 5) Why use `.tar.gz` archives?
They bundle directory structures into a single file and compress the contents, saving space and making it easier to store/transfer.

---

## 6) Why did the restore directory contain `home/toor/Documents/...` inside it?
Because the archive was created using an absolute path (`/home/toor/Documents`). Tar preserved that path when extracting.

---

## 7) How could you avoid restoring the full absolute path structure?
One approach is to archive relative paths (run tar from the parent directory), e.g.:
- `cd /home/toor`
- `tar -czvf DocumentsBackup.tar.gz Documents`

---

## 8) What does `crontab -e` do?
It opens the user’s crontab editor to schedule recurring tasks (like daily backups).

---

## 9) What does this cron entry do?
```bash
0 2 * * * tar -czvf /home/toor/DocumentsBackup_$(date +\%F).tar.gz /home/toor/Documents
````

It runs daily at 02:00 AM and creates a dated backup archive using the current date (YYYY-MM-DD) appended to the filename.

---

## 10) Why include dates in backup filenames?

So you can keep multiple restore points over time, enabling recovery from earlier versions (useful for detecting when corruption/ransomware started).

---

## 11) How does `diff -r` verify backup integrity?

It recursively compares files and directories. If it produces no output, the directories match, indicating the restore is identical to the original.

---

## 12) What are common best practices for backup storage?

* store backups off-host (different system/storage)
* use encryption for sensitive data
* maintain versioning (multiple restore points)
* restrict access to backup storage
* monitor backup success/failure logs

---

## 13) How does backup strategy help against ransomware?

If ransomware encrypts live data, clean backups allow restoration without paying ransom—assuming backups are isolated and not encrypted by the attacker.

---

## 14) What security risk exists if backups are stored on the same system?

Attackers or ransomware can delete or encrypt backups too. That’s why offsite/immutable backups are recommended.

---

## 15) What is a realistic improvement to this lab’s backup approach?

* store backup archives in a dedicated backup directory
* use permissions and encryption
* automate rotation (keep last N backups)
* schedule verification checks (hashing or periodic restore tests)

---
