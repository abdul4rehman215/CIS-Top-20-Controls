# Backup Verification Notes (Lab 29)

## Restore
- Archive: backup.tar.gz
- Restore command: tar -xzvf backup.tar.gz -C restored_backup_directory/
- Result: Completed successfully, no tar errors observed.

## Comparison
- Command: diff -r original_directory/ restored_backup_directory/original_directory/
- Result: No output => directories identical.

## Integrity check
- Command: sha256sum original_directory/file1.txt restored_backup_directory/original_directory/file1.txt
- Result: Hash values match.

## Issues
- None observed in this verification run.
- If issues appear in future:
  - Re-run restore
  - Verify archive checksum and storage health
  - Check permissions/ownership differences
