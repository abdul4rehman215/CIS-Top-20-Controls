# 🧪 Lab 16: Account Monitoring & Control (CIS Controls)

**Environment:** Ubuntu 24.04.1 LTS (Cloud Lab Environment)  
**Primary User:** `toor`  
**Focus Area:** CIS Control — Account Monitoring & Control

---

## 🎯 Objective

This lab provides hands-on experience in **monitoring and controlling user accounts** on a Linux system using standard, open-source tooling.

By the end of this lab, I was able to:

- List and analyze all user accounts (including service accounts)
- Identify non-human/service accounts using UID-based filtering
- Disable (lock) accounts to prevent logins
- Remove accounts safely and validate removal
- Implement session timeout policy (TMOUT)
- Implement account lockout policy via PAM (failed-login protection)

---

## ✅ Prerequisites

Before starting this lab, the following were required:

- Access to a Linux-based system (Ubuntu/CentOS/etc.)
- Basic Linux command-line knowledge
- Administrative privileges (sudo/root)
- SSH client (if working remotely)

---

## 🧩 Lab Tasks Overview

### ✅ Task 1: List All User Accounts
- Reviewed all accounts via `/etc/passwd`
- Interpreted key passwd fields (username, UID, GID, home directory, shell)
- Identified service accounts by filtering UIDs below 1000

### ✅ Task 2: Disable or Remove Unnecessary Accounts
- Checked for “human-style” accounts using UID validation
- Created a temporary test account to simulate real admin workflow
- Locked the account using `usermod -L`
- Verified lock status using `passwd -S`
- Removed the account using `userdel`
- Confirmed removal using `getent passwd`

### ✅ Task 3: Implement Session Timeout + Lockout Policy
- Enabled automatic session timeout by appending `TMOUT=300` to `/etc/profile`
- Applied changes immediately with `source /etc/profile`
- Verified the value was active using `echo $TMOUT`
- Implemented a PAM-based lockout policy using `pam_tally2`
- Verified the PAM rule was saved correctly with `grep`

---

## 📁 Repository Structure

```

lab16-account-monitoring-and-control/
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
└── troubleshooting.md

```

---

## ✅ Verification & Validation

The following validation steps confirm the lab actions were applied successfully:

- **Service account filtering** verified with UID-based `awk` query  
- **Human account confirmation** verified by inspecting last passwd entries (UID ≥ 1000)
- **Account lock** verified with `passwd -S username` showing status `L`
- **Account removal** verified by `getent passwd username` returning no output
- **Session timeout** verified by `echo $TMOUT` returning `300`
- **Lockout policy** verified by checking PAM config contains the `pam_tally2` rule

---

## 🧠 What I Learned

- `/etc/passwd` provides a complete inventory of accounts on Linux systems
- UID-based filtering is a fast way to separate service accounts from human users
- Locking accounts (`usermod -L`) is safer than deletion when unsure
- Deleting users with `userdel` may leave home directories unless `-r` is used
- Session timeouts (`TMOUT`) reduce risk from unattended sessions
- PAM lockout rules help prevent brute-force authentication attempts

---

## 🌍 Why This Matters

Account monitoring and control directly supports:

- Preventing unauthorized access from stale / forgotten accounts
- Reducing attack surface by limiting active login-capable users
- Enforcing security posture against brute-force attempts
- Building secure operational hygiene for production Linux environments

This is a core system administration and security baseline activity.

---

## 🧰 Real-World Applications

- Routine **user audits** on servers and cloud instances
- Offboarding workflows: lock first, then remove after confirmation
- Hardening jump boxes / bastion hosts by enforcing session timeouts
- Setting brute-force protection controls for SSH and local authentication

---

## ✅ Result

- All system accounts were enumerated and reviewed
- Service accounts were identified using UID filtering
- Temporary obsolete account was created, locked, verified, and removed safely
- Session timeout was configured and verified (`TMOUT=300`)
- PAM lockout protection rule was added and verified in configuration

---

## 🏁 Conclusion

This lab strengthened practical skills in **user account auditing, account lifecycle control (lock/remove), and basic authentication hardening**.

These controls are foundational for secure Linux administration and align with CIS guidance to reduce unauthorized access risk through proper account governance.

✅ **Lab completed successfully on Ubuntu 24.04.1 LTS (Cloud Lab Environment).**
