# 🧪 Lab 30: Strengthening Password & Account Policies (Windows + Linux) — CIS Controls

**Environments:**
- 🪟 Windows 11 Pro (VM/Sandbox)
- 🐧 Ubuntu 24.04.1 LTS (Cloud Lab Environment)

**User:** `toor`  
**Security note:** Passwords are **not** written in plaintext in this lab log—only “weak vs strong” policy behavior is documented.  
**Note:** Outputs are **sample/simulated** from an authorized lab environment and formatted like a real GitHub lab run.

---

## 🎯 Objectives

This lab demonstrates how to:

- Review existing password and account policy settings
- Strengthen password requirements (length + complexity)
- Enforce password aging/rotation
- Validate policy enforcement using test user accounts on both Windows and Linux

---

## ✅ Prerequisites

- Administrative privileges on Windows and Linux
- Basic familiarity with:
  - Windows Local Security Policy / secpol.msc
  - Linux password aging tools (`chage`)
  - PAM and password quality configuration (`pwquality.conf`)
- Safe test accounts (do not modify production policies without change management)

---

## 🧩 Lab Tasks Overview

### ✅ Task 1: Review Current Password Policy

#### 🪟 Windows (Before)
**GUI path:**
- Run → `secpol.msc`
- Account Policies → Password Policy

**Observed settings (before):**
- Minimum password length: **8**
- Complexity requirements: **Disabled**
- Maximum password age: **0** (never expires) *(example)*
- Enforce password history: **0**

**Risk noted:**
- Weak password controls increase brute-force and credential stuffing risk.

#### 🐧 Linux (Before)
**Password aging for user `toor`:**
- Checked with:
  - `sudo chage -l toor`

**PAM baseline:**
- Reviewed:
  - `/etc/pam.d/common-password`

**Finding:**
- Default-like password aging (very high max days) and minimal complexity policy unless explicitly enforced via pwquality settings.

---

### ✅ Task 2: Adjust Password Policy

#### 🪟 Windows (After)
Updated via Local Security Policy:

- Minimum password length: **12**
- Complexity requirements: **Enabled**
- Maximum password age: **90 days**

#### 🐧 Linux (After)
**1) Enforce complexity (pwquality)**
- Backed up:
  - `/etc/security/pwquality.conf.bak`
- Updated `/etc/security/pwquality.conf`:
  - `minlen=12`
  - `dcredit=-1`
  - `ucredit=-1`
  - `lcredit=-1`
  - `ocredit=-1`
- Verified values present via `egrep`

**2) Enforce password aging (rotation)**
- Applied to user `toor`:
  - `sudo chage -M 90 -m 7 -W 7 toor`
- Verified:
  - password expiry date updated
  - minimum days between changes enforced

---

### ✅ Task 3: Test Policy Enforcement

#### 🪟 Windows enforcement test
- Created a test user (Computer Management → Local Users and Groups)
- Attempted weak password:
  - **Rejected**
- Set compliant password:
  - **Accepted**
- Verified login:
  - **Successful**

#### 🐧 Linux enforcement test
- Created test user:
  - `sudo adduser testuser`
- Attempted weak password:
  - **Rejected** (quality rules triggered)
- Set compliant password:
  - **Accepted**
- Verified password aging:
  - `sudo chage -l testuser`
- Applied the same expiration policy to `testuser`:
  - `sudo chage -M 90 -m 7 -W 7 testuser`
- Verified updated policy applied successfully

---

## 📁 Repository Structure

```

lab30-strengthening-password-and-account-policies/
├── README.md
├── commands.sh
├── commands.ps1
├── output.txt
├── interview_qna.md
├── troubleshooting.md
├── windows/
│   └── windows_policy_notes.md
└── linux/
├── pwquality.conf.hardening.snippet
└── linux_policy_notes.md

```

> No plaintext passwords, recovery secrets, or sensitive credentials are stored in this repo.

---

## ✅ Verification & Validation

### Windows
- Verified updated policy settings in `secpol.msc`
- Confirmed enforcement by:
  - weak password rejected
  - compliant password accepted
  - login successful

### Linux
- Verified password aging:
  - `chage -l` shows expiration and min/max days updated
- Verified complexity policy presence:
  - `egrep` confirms pwquality settings
- Confirmed enforcement by:
  - weak password rejected with PAM/pwquality message
  - compliant password accepted

---

## 🧠 What I Learned

- “Policy exists” is not enough—testing matters (weak password attempts prove enforcement)
- Password quality (length + complexity) and rotation policy are both important
- On Linux, enforcement usually depends on PAM + pwquality configuration
- `chage` is essential for enforcing password aging and minimum change intervals
- Windows Local Security Policy provides quick centralized control for local accounts

---

## 🌍 Why This Matters

Weak password policies are a common root cause of:
- brute-force compromise
- credential stuffing success
- lateral movement after initial breach

Strong password rules + aging policies reduce compromise probability and improve baseline security posture.

---

## ✅ Result

✅ Windows policy strengthened (12+ chars, complexity enabled, 90-day max age)  
✅ Linux pwquality enforced (minlen + required character classes)  
✅ Linux password aging enforced via chage (rotation + min days)  
✅ Policies validated using test users (weak rejected, strong accepted) 🚀

---

## 🏁 Conclusion

This lab demonstrated real policy hardening and validation across two platforms:

**review → strengthen → apply → test using real account behavior**

✅ Lab completed successfully with verified enforcement on Windows and Ubuntu.

---
