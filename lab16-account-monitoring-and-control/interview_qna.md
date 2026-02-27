# 🎤 Interview Q&A — Lab 16: Account Monitoring & Control

Below are interview-style questions and answers based on the work completed in this lab. These focus on practical Linux administration and security hardening aligned with CIS account governance.

---

## 1) Why is `/etc/passwd` important in account auditing?
`/etc/passwd` is the primary local database that lists user accounts on a Linux system. It provides key attributes such as username, UID, GID, home directory, and default shell, which helps identify which accounts are interactive users versus service accounts.

---

## 2) What’s the difference between a human user account and a service account?
Human accounts usually have:
- A UID ≥ 1000 (commonly on Ubuntu)
- A real home directory (e.g., `/home/user`)
- An interactive shell (e.g., `/bin/bash`)

Service accounts typically have:
- Low UIDs (often < 1000)
- `nologin` or `/bin/false` shells
- Used to run services (not intended for interactive logins)

---

## 3) How did you identify service accounts quickly in this lab?
By filtering accounts based on UID using:
- `awk -F: '$3 < 1000 {print $1}' /etc/passwd`

This lists accounts that generally represent non-human/service users on Ubuntu systems.

---

## 4) Why should obsolete accounts be disabled before deletion?
Disabling (locking) accounts is safer because:
- It prevents immediate login access
- It preserves data and audit trails
- It allows a review period before permanent deletion

Deletion is final and may break services if the account was still in use.

---

## 5) What does `usermod -L username` do?
It locks the user's password by modifying the password hash entry (usually in `/etc/shadow`), preventing normal password-based authentication for that account.

---

## 6) How did you verify the account was locked?
Using:
- `sudo passwd -S username`

The output contains a status flag:
- `L` means **locked**.

Example:
- `username L 2026-02-28 0 99999 7 -1`

---

## 7) What is the difference between `userdel username` and `userdel -r username`?
- `userdel username` removes the account entry but may leave the home directory.
- `userdel -r username` removes the account and the user’s home directory/mail spool.

Admins prefer `-r` only when they are sure the data is no longer needed.

---

## 8) How did you confirm the user was removed from the system?
By checking the account database using:
- `getent passwd username`

No output indicates the user no longer exists in NSS/account sources.

---

## 9) What is `TMOUT` and why is it useful?
`TMOUT` is a shell environment variable that automatically logs out an idle shell session after a defined number of seconds.  
It reduces risk from unattended terminals, especially on shared or administrative systems.

---

## 10) Where did you configure the session timeout and why there?
I appended it to `/etc/profile` so that it can apply broadly to users who load system-wide shell profile settings (commonly for interactive login shells).

---

## 11) How did you apply `/etc/profile` changes immediately without rebooting?
By sourcing the file:
- `source /etc/profile`

Then verifying:
- `echo $TMOUT`

---

## 12) What is PAM and why is it relevant to account lockout policies?
PAM (Pluggable Authentication Modules) controls authentication behavior across Linux services.  
A lockout policy in PAM can block authentication attempts after repeated failures, helping prevent brute-force attacks.

---

## 13) What does this PAM rule mean?

`auth required pam_tally2.so deny=5 unlock_time=600 onerr=fail audit even_deny_root`

- `deny=5` → lock after 5 failed attempts  
- `unlock_time=600` → unlock after 600 seconds (10 minutes)  
- `onerr=fail` → fail closed if module errors occur  
- `audit` → audit events (where supported)  
- `even_deny_root` → apply the rule to root as well

---

## 14) How did you confirm the PAM lockout rule was added successfully?
By verifying it exists in the configuration:
- `grep -n "pam_tally2" /etc/pam.d/common-auth`

This confirms the rule is present and shows its line number.

---

## 15) What are common risks of misconfiguring session timeouts or lockout policies?
- Session timeouts too short can disrupt legitimate administration work.
- Lockout policies can cause accidental denial of access (including for admins) if thresholds are too strict.
- Applying lockouts to root (`even_deny_root`) can be dangerous without proper recovery access (e.g., console access).

Good practice is to test carefully and ensure recovery paths exist.
