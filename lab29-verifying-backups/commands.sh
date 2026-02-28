#!/bin/bash
# Lab 29 — Verifying Backups (Restore + Compare + Integrity Check)
# Commands Executed During Lab (sequential, no explanations)

mkdir -p ~/Lab29_Backups/{original_directory,restored_backup_directory,logs}
cd ~/Lab29_Backups

ls -lh backup.tar.gz

tar -xzvf backup.tar.gz -C restored_backup_directory/

ls -l restored_backup_directory/
find restored_backup_directory/original_directory -maxdepth 2 -type f -print

diff -r original_directory/ restored_backup_directory/original_directory/

sha256sum original_directory/file1.txt restored_backup_directory/original_directory/file1.txt

nano logs/verification_notes.md
