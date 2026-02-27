# 🛠️ Troubleshooting — Lab 02: Software Asset Inventory (CIS Control 2)

> This guide covers common issues when collecting software inventory on Windows and Linux and exporting results to CSV.

---

## 1) Windows: `wmic` is not recognized or missing

### ✅ Problem
Running:
```cmd
wmic product get name,version,vendor
````

returns:

* `'wmic' is not recognized as an internal or external command`

### 💡 Cause

WMIC is deprecated on newer Windows builds and may be removed or not available depending on system version/policies.

### ✅ Resolution

* Confirm you are running Command Prompt as Administrator.
* If WMIC is unavailable, use alternative inventory methods:

  * PowerShell (registry-based approach)
  * Windows settings export via management tools (enterprise)

> ✅ In this lab, WMIC was available and produced output successfully.

---

## 2) Windows: WMIC output is slow or appears to hang

### ✅ Problem

The WMIC command takes a long time to return results.

### 💡 Cause

`wmic product` queries MSI-installed applications and may trigger consistency checks, especially on systems with many apps.

### ✅ Resolution

* Wait for completion (can take several minutes).
* Run during low system activity.
* Consider alternatives for large environments (PowerShell + registry queries or endpoint management tools).

---

## 3) Windows: CSV file not found after export

### ✅ Problem

After:

```cmd
wmic product get name,version,vendor /format:csv > installed_software.csv
```

`dir installed_software.csv` shows nothing.

### 💡 Cause

The file was created in a different working directory than expected.

### ✅ Resolution

* Check current directory:

```cmd
cd
```

* Use an absolute path:

```cmd
wmic product get name,version,vendor /format:csv > C:\Temp\installed_software.csv
```

* Verify with:

```cmd
dir C:\Temp\installed_software.csv
```

---

## 4) Linux: `dpkg-query: command not found`

### ✅ Problem

Running dpkg-query fails.

### 💡 Cause

You are not on a Debian-based system (Ubuntu/Debian), or the system is minimal and missing dpkg tools (rare on Ubuntu).

### ✅ Resolution

* Confirm distro:

```bash
cat /etc/os-release
```

* On Debian/Ubuntu, install dpkg if needed:

```bash
sudo apt update
sudo apt install dpkg -y
```

* On RPM-based distros, use rpm instead:

```bash
rpm -qa --queryformat '%{NAME},%{VERSION},%{PACKAGER}\n'
```

---

## 5) Linux: `rpm: command not found` (expected on Ubuntu)

### ✅ Problem

Running:

```bash
rpm -qa --queryformat '%{NAME},%{VERSION},%{PACKAGER}\n'
```

returns:

```text
bash: rpm: command not found
```

### 💡 Cause

Ubuntu is Debian-based and does not include RPM tooling by default. This is expected behavior.

### ✅ Resolution

Use dpkg-based inventory instead:

```bash
dpkg-query -W -f='${binary:Package},${Version},${Maintainer}\n'
```

---

## 6) Linux: Exported CSV is too large to open smoothly

### ✅ Problem

The exported inventory file is large (hundreds of KB or MB) and spreadsheet tools are slow.

### 💡 Cause

Many Linux systems contain hundreds/thousands of installed packages.

### ✅ Resolution

* Filter before exporting (example: only user-installed packages):

```bash
apt-mark showmanual > manual_packages.txt
```

* Or export subsets (example: security-critical tools):

```bash
dpkg -l | egrep 'openssh|openssl|python3|sudo|curl|nmap' > security_packages.txt
```

* Import CSV into Google Sheets or LibreOffice and use filtering.

---

## 7) Spreadsheet columns don’t split correctly

### ✅ Problem

Opening the CSV shows all content in one column.

### 💡 Cause

Delimiter detection may fail depending on regional settings.

### ✅ Resolution

* When importing, choose delimiter: **comma ( , )**
* In LibreOffice:

  * Select **Separated by → Comma**
* In Google Sheets:

  * Import → **Separator type: Comma**

---

## 8) “Unknown software” is unclear how to identify

### ✅ Problem

You’re unsure what counts as UNKNOWN in inventory results.

### 💡 Cause

UNKNOWN is contextual. It depends on organization policy and whether software is approved/verified.

### ✅ Resolution

Use practical checks:

* Missing vendor/maintainer fields
* Suspicious or unverified vendor names
* Tools not approved by policy
* Software installed outside standard deployment methods

Document and flag for review, as done in:

* `eol_unknown_flagging_notes.txt`

---

## 9) “EOL status” cannot be confirmed quickly

### ✅ Problem

Hard to confirm if software is EOL from only version numbers.

### 💡 Cause

EOL requires vendor confirmation (official support lifecycle pages/security advisories).

### ✅ Resolution

Use a structured workflow:

* Search vendor lifecycle docs for that product/version
* Check OS security tracker (for Linux packages)
* Record status as:

  * OK / REVIEW / EOL / UNKNOWN

---

## ✅ Final Tip: Make Inventory Actionable

Inventory becomes valuable when you attach:

* owner/team responsibility (where possible)
* status labels (OK/EOL/UNKNOWN)
* remediation plan (upgrade/remove/monitor)

---
