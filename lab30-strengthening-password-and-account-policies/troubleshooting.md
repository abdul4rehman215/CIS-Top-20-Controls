# 🛠️ Troubleshooting Guide — Lab 30: Strengthening Password & Account Policies (Windows + Linux)

> This guide covers common issues when reviewing and enforcing password policies on Windows and Ubuntu, including pwquality/chage behavior and validation pitfalls.

---

## Windows Troubleshooting

## 1) `secpol.msc` not found or cannot open
### Causes
- Windows edition doesn’t include Local Security Policy (common on Home)
- Restricted permissions

### Fix
- Ensure Windows Pro/Enterprise/Server edition
- Run as Administrator
- In domain environments, use Group Policy (GPMC) instead of local policy

---

## 2) Policy changes don’t seem to apply to new passwords
### Causes
- Testing on an account that already has a password set
- Cached policy interpretation / not refreshed

### Fix
- Create a new test user and set password again
- Re-open Local Security Policy to confirm settings persisted
- Validate via behavior: weak password should be rejected

---

## 3) Complexity requirement enabled but “weak” password still accepted
### Causes
- The password may actually meet the complexity rules
- You tested in a context not covered by the local policy (domain vs local confusion)

### Fix
- Ensure password violates both length and complexity
- Verify you edited **Password Policy** (not another section)
- Confirm system is not using domain policy overrides

---

## Linux Troubleshooting

## 4) Weak passwords are still accepted on Ubuntu
### Causes
- pwquality not enforced in PAM stack
- pwquality settings exist but PAM module not using them
- policy applies only to some utilities/users

### Fix
- Verify PAM password stack references pwquality (implementation differs by distro)
- Confirm `libpam-pwquality` is installed (if required by distro setup)
- Re-test using:
  - `sudo passwd testuser`
- Review effective configuration:
  - `/etc/security/pwquality.conf`
  - `/etc/pam.d/common-password`

---

## 5) `passwd: Authentication token manipulation error`
### Causes
- password rejected by quality rules
- account locked or permission issue
- filesystem/permissions issue on `/etc/shadow` (rare but serious)

### Fix
- If accompanied by BAD PASSWORD messages, it indicates policy rejection (expected in this lab)
- If no BAD PASSWORD messages:
  - confirm `/etc/shadow` permissions:
    - should be root-owned and not writable by non-root
  - ensure you used `sudo passwd <user>`

---

## 6) `chage` changes don’t apply to new users automatically
### Explanation
`chage` modifies per-user settings. Updating `toor` does not automatically update `testuser`.

### Fix
- Apply to each user:
  - `sudo chage -M 90 -m 7 -W 7 testuser`
- For defaults on new users, adjust system defaults (policy-dependent):
  - `/etc/login.defs` (and/or useradd defaults)

---

## 7) `chage -l` shows “never” even after changes
### Causes
- command run on the wrong user
- changes not applied (typo or missing sudo)

### Fix
- Re-run with correct username:
  - `sudo chage -l toor`
- Re-apply:
  - `sudo chage -M 90 -m 7 -W 7 <user>`

---

## 8) pwquality settings are present but not enforced
### Causes
- PAM module not reading pwquality.conf
- distro uses different mechanism (yescrypt/pam_unix integration varies)

### Fix
- Confirm enforcement via behavior (weak password rejected)
- If not enforced, add/enable appropriate PAM module per distro guidance
- Keep changes minimal and test carefully (PAM misconfig can lock you out)

---

## 9) Risk: lockout from SSH after PAM/password policy changes
### Prevention
- Keep an existing root/sudo session open while editing PAM
- Validate config syntax carefully
- Test in a safe window

### Recovery
- Use cloud console access if SSH breaks
- Restore from backup:
  - `/etc/security/pwquality.conf.bak`
  - revert PAM changes if applied

---

## 10) Best practice notes
- Don’t store passwords in logs or GitHub
- Test with a dedicated lab user, not production accounts
- Combine strong passwords with MFA and monitoring for best outcomes
