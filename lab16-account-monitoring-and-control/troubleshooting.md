# 🛠️ Troubleshooting — Lab 16: Account Monitoring & Control

This guide covers common issues that may occur while auditing users, locking/removing accounts, and applying session timeout / lockout policies on Ubuntu 24.04.

---

## 1) `sudo: command not found` or permission denied
### Symptoms
- `sudo: command not found`
- `user is not in the sudoers file`
- `permission denied`

### Fix
- Ensure you are using a privileged account.
- Verify `sudo` is installed (Ubuntu typically has it):
  - `which sudo`
- If you have root access, add the user to sudo group:
  - `usermod -aG sudo <user>`

---

## 2) `awk` filter doesn’t show expected service accounts
### Symptoms
- Output missing expected accounts
- Output includes unexpected accounts

### Notes / Fix
- UID boundaries differ across distros.
  - Ubuntu commonly uses **UID >= 1000** for human users.
  - Some environments use **UID >= 500** or other thresholds.
- Confirm the threshold by checking `/etc/login.defs`:
  - `grep -E "^(UID_MIN|UID_MAX)" /etc/login.defs`

---

## 3) `sudo passwd -S username` doesn’t show `L` after locking
### Symptoms
- Status not showing `L`
- Lock appears not applied

### Fix
- Confirm the user exists:
  - `getent passwd username`
- Re-run lock:
  - `sudo usermod -L username`
- Ensure no typo in username.

---

## 4) `userdel: user username is currently used by process ...`
### Symptoms
- `userdel` fails because user has running processes

### Fix
- Identify processes owned by the user:
  - `ps -u username`
- Terminate processes (carefully):
  - `sudo pkill -u username`
- Then retry deletion:
  - `sudo userdel username`

---

## 5) Home directory still exists after deleting user
### Symptoms
- `/home/username` remains after `userdel username`

### Explanation
This is expected if `userdel` is used **without** the `-r` option.

### Fix
If you are sure you want to remove home directory too:
- `sudo userdel -r username`

If the user is already deleted and directory remains:
- `sudo rm -rf /home/username`

---

## 6) `TMOUT` not applied after adding to `/etc/profile`
### Symptoms
- `echo $TMOUT` returns empty or 0

### Causes / Fix
- `/etc/profile` is applied to login shells; some sessions may not load it.
- Apply immediately:
  - `source /etc/profile`
- Start a new login shell session:
  - log out and log back in

### Additional check
If using bash non-login shell behavior, consider `.bashrc` usage.  
For system-wide policy, `/etc/profile` is common, but shell/session type matters.

---

## 7) PAM change causes login/authentication issues (HIGH RISK)
### Symptoms
- Login failures after PAM modification
- Unexpected lockouts
- SSH login fails

### Immediate Safety Recommendations
- Always keep a second root/admin session open before editing PAM.
- Ensure you have console access or recovery access in cloud environments.

### Fix / Recovery Steps
1. Re-open and review the PAM file:
   - `sudo nano /etc/pam.d/common-auth`
2. Comment out or remove the `pam_tally2` line temporarily to regain access.
3. Validate file syntax and rule placement.
4. Re-test authentication after adjustments.

---

## 8) `pam_tally2` module not available / deprecated
### Symptoms
- Authentication logs show module missing
- PAM errors referencing `pam_tally2.so`
- On newer systems, `pam_faillock` is preferred

### Fix
- Confirm module availability:
  - `ls /lib/security/pam_tally2.so 2>/dev/null || ls /lib/x86_64-linux-gnu/security/pam_tally2.so 2>/dev/null`
- If unavailable, use `pam_faillock` based policy (preferred on many modern distros).
- Keep lab configuration aligned to what your lab text specifies, but adapt safely in production.

---

## 9) Lockout policy affects root (`even_deny_root`) and blocks admin access
### Symptoms
- Root account becomes locked out after failed attempts
- Admin access becomes difficult

### Prevention / Best Practice
- Use `even_deny_root` only when you have guaranteed recovery paths.
- Consider excluding root in production and applying strong SSH key authentication + MFA where possible.
- In lab environments, document the impact clearly.

---

## 10) Verification commands show nothing and you’re unsure if changes worked
### Helpful checks
- Confirm user exists:
  - `getent passwd <user>`
- Confirm TMOUT:
  - `echo $TMOUT`
- Confirm PAM rule exists:
  - `grep -n "pam_tally2" /etc/pam.d/common-auth`

If these match expected results, the lab steps are applied correctly.
