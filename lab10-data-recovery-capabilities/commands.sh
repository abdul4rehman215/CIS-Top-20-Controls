#!/bin/bash
# Lab 10: Data Recovery Capabilities (CIS Control 10)
# Commands Executed During Lab (Sequential)

# -----------------------------
# Task 1: Select Folder + Create Sample Data
# -----------------------------

mkdir -p ~/Documents

nano ~/Documents/notes.txt
nano ~/Documents/credentials_policy.txt

mkdir -p ~/Documents/reports
nano ~/Documents/reports/system_audit_report.txt

find ~/Documents -type f -maxdepth 2 -print

# -----------------------------
# Task 2: Manual Backup (tar + gzip)
# -----------------------------

cd ~
tar -czvf DocumentsBackup.tar.gz /home/toor/Documents
ls -lh DocumentsBackup.tar.gz

# -----------------------------
# Task 2.2: Scheduled Backup (cron)
# -----------------------------

crontab -e
crontab -l

# -----------------------------
# Task 3: Restore Backup + Verify Integrity
# -----------------------------

mkdir -p /home/toor/RestoredDocuments
tar -xzvf DocumentsBackup.tar.gz -C /home/toor/RestoredDocuments

find /home/toor/RestoredDocuments -type f -maxdepth 4 -print

diff -r /home/toor/Documents /home/toor/RestoredDocuments/home/toor/Documents
