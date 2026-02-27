# 🧪 Lab 22: Hardening a Windows System (CIS Controls)

**Environment:** Windows 11 Pro (VM / Sandbox Lab)  
**User Context:** Local Administrator (PowerShell run as Administrator)  
**Note:** PowerShell outputs in this lab are **sample/simulated** from an authorized lab VM and formatted like a real transcript for GitHub documentation.

---

## 🎯 Objectives

This lab focuses on applying baseline Windows hardening measures to reduce attack surface and improve account security.

By completing this lab, I was able to:

- Disable unnecessary Windows features/services (example: **Telnet Client**)
- Enforce strong password policies (history, minimum length, complexity)
- Configure account lockout policies to reduce brute-force risk
- Capture and compare system configuration **before vs after** hardening changes using PowerShell exports

---

## ✅ Prerequisites

- Windows 10/11/Server running in a VM or sandbox environment
- Local admin access
- Familiarity with:
  - PowerShell
  - Local Group Policy Editor (`gpedit.msc`)
  - Windows security policy validation tools (`secedit`, `net accounts`)

---

## 🧩 Lab Tasks Overview

### ✅ Task 1: Disable Unnecessary Windows Services/Features (Telnet Client)
- Checked current Telnet Client feature state
- Disabled Telnet Client using PowerShell
- Verified the feature was successfully disabled

**Why this matters:** Telnet is plaintext/insecure and typically unnecessary in modern environments.

---

### ✅ Task 2: Enforce Password Complexity + Account Lockout Policies

#### 2.1 Password Policy (via Local Group Policy)
Configured:
- Enforce password history: **5**
- Minimum password length: **8**
- Password complexity requirements: **Enabled**

Verified via:
- `secedit /export` and pattern search within exported policy file

#### 2.2 Account Lockout Policy (via Local Group Policy)
Configured:
- Lockout threshold: **5** invalid attempts
- Lockout duration: **15 minutes**
- Reset lockout counter after: **30 minutes**

Verified via:
- `net accounts`

---

### ✅ Task 3: Compare System State Before vs After Hardening

- Captured initial hardening state in `C:\InitialSystemState.csv`
- Captured final hardening state in `C:\FinalSystemState.csv`
- Compared objects using `Compare-Object` to show improvements clearly

The comparison confirmed:
- Telnet: **Enabled → Disabled**
- Password policy strengthened
- Lockout controls enabled

---

## 📁 Repository Structure

```

lab22-hardening-windows-system/
├── README.md
├── commands.ps1
├── output.txt
├── interview_qna.md
├── troubleshooting.md
└── artifacts/
├── password_policy.cfg
├── InitialSystemState.csv
└── FinalSystemState.csv

```

> `artifacts/` stores exported policy and before/after state captures (safe for portfolio, no secrets included).

---

## ✅ Verification & Validation

Hardening steps were validated using:

- Feature state validation:
  - `Get-WindowsOptionalFeature -Online -FeatureName TelnetClient`
- Password policy export validation:
  - `secedit /export /cfg C:\password_policy.cfg`
  - `Select-String` checks for key settings
- Lockout policy validation:
  - `net accounts`
- Before/after state comparison:
  - `Compare-Object (Import-Csv ...) (Import-Csv ...) -Property ...`

---

## 🧠 What I Learned

- Windows hardening is a combination of:
  - reducing attack surface (removing legacy features)
  - strengthening identity controls (password + lockout)
  - validating and documenting changes for auditability
- PowerShell makes hardening **repeatable and measurable**
- Exporting policies (`secedit`) and capturing state (`Export-Csv`) supports compliance and troubleshooting

---

## 🌍 Why This Matters

Many Windows compromises start with:
- weak authentication policies
- brute-force password attacks
- unnecessary services/features expanding attack surface

Hardening reduces risk and supports secure baselines in enterprise environments.

---

## ✅ Result

✅ Telnet Client disabled and verified  
✅ Password policy enforced (history/length/complexity) and confirmed via exported policy  
✅ Account lockout enforced and confirmed via `net accounts`  
✅ Before/after configuration captured and compared using CSV exports + `Compare-Object`

---

## 🏁 Conclusion

This lab demonstrated a practical Windows hardening workflow with measurable improvements:

**Disable legacy features → enforce account policy → validate via exports → compare before/after state**

✅ Lab completed successfully (Windows hardening + policy enforcement + validation artifacts).

---
