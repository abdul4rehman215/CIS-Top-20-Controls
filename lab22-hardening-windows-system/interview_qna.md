# 🎤 Interview Q&A — Lab 22: Hardening a Windows System

> Below are interview-style questions and answers based on the Windows hardening tasks completed in this lab (Windows 11 Pro VM, PowerShell as Administrator).

---

## 1) What does “Windows hardening” mean?
Windows hardening means reducing a system’s attack surface and strengthening security controls by disabling unnecessary features, enforcing strong authentication policies, and validating security configuration baselines.

---

## 2) Why did you disable the Telnet Client feature?
Telnet is an insecure, legacy protocol that transmits data in plaintext. Disabling Telnet Client reduces exposure to insecure tooling and minimizes unnecessary components that could be abused or misconfigured.

---

## 3) How did you check whether Telnet Client was enabled or disabled?
Using PowerShell:
- `Get-WindowsOptionalFeature -Online -FeatureName TelnetClient`

This returns the feature’s state (Enabled/Disabled).

---

## 4) How did you disable Telnet Client?
Using:
- `Disable-WindowsOptionalFeature -Online -FeatureName TelnetClient`

Then verified using the same `Get-WindowsOptionalFeature` command.

---

## 5) What password policy settings did you enforce in this lab?
- Enforce password history: **5**
- Minimum password length: **8**
- Password complexity requirements: **Enabled**

---

## 6) Why is password history important?
Password history prevents users from cycling between the same few passwords. It increases resistance to password reuse patterns and reduces risk after password compromise.

---

## 7) Why is password complexity important?
Complexity requirements push users away from weak passwords. Stronger passwords increase the cost of guessing and brute-force attacks, especially for local accounts.

---

## 8) What account lockout settings did you configure?
- Lockout threshold: **5** invalid attempts
- Lockout duration: **15 minutes**
- Reset lockout counter after: **30 minutes**

---

## 9) Why is account lockout important?
Account lockout slows or blocks brute-force login attempts by locking accounts after repeated failures. It’s a basic control to reduce password guessing attacks.

---

## 10) How did you verify password policy settings from the command line?
I exported the local security policy using:
- `secedit /export /cfg C:\password_policy.cfg`

Then verified key settings using:
- `Select-String` for PasswordHistorySize, MinimumPasswordLength, PasswordComplexity.

---

## 11) How did you verify lockout policy settings from the command line?
Using:
- `net accounts`

This prints current password and lockout policy details, including threshold and lockout duration.

---

## 12) Why did you capture “before and after” system state?
Capturing before/after provides measurable evidence of security improvement, supports change management, and makes configuration changes auditable and repeatable.

---

## 13) How did you capture the system state?
Using PowerShell to build a structured object containing:
- Telnet feature state
- key password policy values from `net accounts`
- lockout settings from `net accounts`

Then exporting it to CSV:
- `Export-Csv -Path C:\InitialSystemState.csv`
- `Export-Csv -Path C:\FinalSystemState.csv`

---

## 14) How did you compare the initial and final configurations?
Using:
- `Compare-Object (Import-Csv ...) (Import-Csv ...) -Property ...`

This clearly showed improvements like Telnet becoming Disabled and stronger password/lockout policies.

---

## 15) What are common mistakes when hardening Windows systems?
- Disabling features without understanding dependencies
- Enforcing lockout policies too aggressively (risk of self-lockout)
- Not documenting changes or validating them
- Applying hardening without testing in a VM/staging environment
- Not maintaining the configuration over time (drift)

This lab emphasized safe verification and documentation.
