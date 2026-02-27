# 🛠️ Troubleshooting Guide — Lab 22: Hardening a Windows System

> This guide covers common issues when disabling Windows optional features, applying password/lockout policies via Local Group Policy, and validating the changes using PowerShell tools.

---

## 1) PowerShell commands fail due to missing admin privileges
### Symptoms
- Access denied
- Commands do not apply changes
- Feature disable operations fail

### Fix
- Run PowerShell as Administrator:
  - Start Menu → search “PowerShell” → right-click → **Run as administrator**

---

## 2) `Get-WindowsOptionalFeature` command not recognized
### Symptoms
- “The term ‘Get-WindowsOptionalFeature’ is not recognized…”

### Cause
The DISM PowerShell module may not be available in some environments or restricted shells.

### Fix
- Ensure you are using Windows 10/11/Server with standard management tools.
- Alternative (DISM CLI):
  - `dism /online /get-features | findstr TelnetClient`

---

## 3) Telnet Client disables but still appears “Enabled”
### Symptoms
- After disabling, state still shows Enabled

### Causes
- Feature state not refreshed
- A pending operation exists

### Fix
- Re-run:
  - `Get-WindowsOptionalFeature -Online -FeatureName TelnetClient`
- If restart is required (rare for Telnet client, depends on system):
  - reboot and re-check

---

## 4) `gpedit.msc` not available
### Symptoms
- “Windows cannot find ‘gpedit.msc’”

### Cause
Group Policy Editor may not exist on Windows Home editions.

### Fix
- Use Windows Pro/Enterprise/Server editions (as in this lab).
- Alternative: configure policies via Local Security Policy (`secpol.msc`) or registry (advanced).

---

## 5) Password policy changes don’t reflect immediately
### Symptoms
- `net accounts` still shows old values

### Fix
- Ensure changes were applied in the correct policy path:
  - Computer Configuration → Windows Settings → Security Settings → Account Policies
- Run:
  - `gpupdate /force`
- Re-check:
  - `net accounts`

---

## 6) `secedit /export` fails or file not found
### Symptoms
- Export fails
- `C:\password_policy.cfg` not created

### Fix
- Confirm write permissions to `C:\`
- Use a safe path:
  - `secedit /export /cfg "$env:TEMP\password_policy.cfg"`
- Ensure PowerShell is running as Administrator.

---

## 7) `Select-String` returns no matches for password settings
### Symptoms
- No output from Select-String pattern search

### Causes
- Export file format differs
- Pattern mismatch

### Fix
- Confirm file exists:
  - `Get-Item C:\password_policy.cfg`
- Preview content:
  - `Get-Content C:\password_policy.cfg | Select-Object -First 50`
- Adjust search patterns if needed:
  - `Select-String -Path C:\password_policy.cfg -Pattern "PasswordHistorySize"`

---

## 8) Account lockout settings cause admin lockout risk
### Risk
Aggressive lockout settings can lock legitimate users (including admins) during testing or after typo failures.

### Safe practice
- Apply lockout policies carefully in a VM/staging environment first
- Ensure you have console access or recovery options
- Use reasonable thresholds (e.g., 5 attempts) and lockout durations (e.g., 15 min)

---

## 9) CSV export commands fail (Export-Csv errors)
### Symptoms
- “Export-Csv: Cannot bind argument…” or file write errors

### Fix
- Ensure object is piped properly:
  - `$obj | Export-Csv ...`
- Confirm the path exists and is writable
- If restricted path, write to:
  - `$env:TEMP\InitialSystemState.csv`

---

## 10) Compare-Object shows unexpected differences
### Causes
- Data formatting differences (spaces)
- Different machine name or environment variables
- Policy changes not applied before final export

### Fix
- Ensure policy changes were applied (`gpupdate /force`)
- Re-export final state
- Normalize values (Trim used in lab)
- Compare only key properties (as done in the lab)
