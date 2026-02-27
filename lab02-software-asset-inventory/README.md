# 💿 Lab 02: Software Asset Inventory (CIS Control 2)

> **Environments:**  
> - **Windows:** Command Prompt (Administrator)  
> - **Linux:** Ubuntu 24.04.1 LTS (Cloud Lab Environment)  
>
> **Linux User:** toor  
> **Category:** CIS Top 20 Controls (Lab 02 of 15)

---

## 🎯 Objectives

By the end of this lab, I was able to:

- Identify and inventory installed software on **Windows** and **Linux** using command-line tools.
- Export software inventory results into **CSV** for spreadsheet-based analysis.
- Create a process to flag **Unknown** and **End-of-Life (EOL)** software entries.
- Practice practical asset management techniques used in real organizations.

---

## ✅ Prerequisites

- Familiarity with command line on Windows and Linux.
- A Windows machine or VM with **Administrator** access.
- A Linux machine or VM (Ubuntu 24.04.1 LTS in this lab).
- Spreadsheet software (LibreOffice Calc / Excel / Google Sheets).

---

## 🧪 Lab Environment

### 🪟 Windows
| Component | Details |
|---|---|
| Shell | Command Prompt (Administrator) |
| Tool Used | `wmic` |
| Output Format | CSV |

### 🐧 Linux
| Component | Details |
|---|---|
| OS | Ubuntu 24.04.1 LTS |
| Environment | Cloud Lab Environment |
| User | toor |
| Tools Used | `dpkg-query`, `dpkg`, `awk`, `egrep`, `nano`, `ls`, `head` |
| Output Format | CSV |

---

## 🗂️ Repository Structure (Lab Folder)

```text
lab02-software-asset-inventory/
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
├── troubleshooting.md
├── scripts/
│   └── (none for this lab)
└── artifacts/
    ├── windows_installed_software.csv
    ├── linux_installed_software.csv
    └── eol_unknown_flagging_notes.txt
```

> ✅ Note: The original Windows CSV was generated in `C:\Windows\System32\installed_software.csv`.
> For repository consistency, it is saved here as: **`artifacts/windows_installed_software.csv`**.

---

## ✅ Tasks Overview (What I Did)

### ✅ Task 1: Inventory Software on Windows (WMIC)

* Ran WMIC to list installed software (Name, Version, Vendor).
* Exported installed software inventory to CSV for spreadsheet analysis.
* Verified CSV file creation on Windows.

### ✅ Task 2: Inventory Software on Linux (dpkg-query)

* Used `dpkg-query` to export installed packages into a CSV-friendly format:

  * Package, Version, Maintainer
* Validated RPM tool availability on Ubuntu and documented why it is not present.
* Saved the export as a CSV file and confirmed its size and preview contents.

### ✅ Task 3: Highlight Unknown or End-of-Life (EOL) Software

* Performed quick command-line checks to:

  * detect missing maintainer/vendor fields (unknown entries)
  * review versions of common security-critical packages
* Wrote structured notes for spreadsheet-based flagging:

  * OK / UNKNOWN / EOL / REVIEW

---

## ✅ Verification & Validation

### 🪟 Windows Validation

* Confirmed installed software list printed using:

  * `wmic product get name,version,vendor`
* Confirmed CSV export completed using:

  * `wmic product get name,version,vendor /format:csv > installed_software.csv`
* Confirmed file existence and size using:

  * `dir installed_software.csv`

### 🐧 Linux Validation

* Confirmed dpkg inventory export created using:

  * `dpkg-query -W -f='${binary:Package},${Version},${Maintainer}\n' > installed_software.csv`
* Confirmed file size and preview using:

  * `ls -lh installed_software.csv`
  * `head -n 15 installed_software.csv`
* Confirmed no missing maintainer fields (quick check) using:

  * `awk -F',' 'NF<3 || $3=="" {print NR ":" $0}' installed_software.csv | head`
* Reviewed security-critical package versions using:

  * `dpkg -l | egrep 'openssh|openssl|python3|sudo|curl|nmap' | head -n 20`
* Confirmed artifact files exist using:

  * `ls -l`

---

## 🧠 What I Learned

* Software inventory is critical because vulnerabilities often depend on exact **versions** installed.
* Windows and Linux require different approaches:

  * Windows: WMIC (MSI-based inventory view)
  * Linux: dpkg-query (package manager inventory)
* Exporting to CSV enables analysis for:

  * compliance checks
  * EOL identification
  * risk review
* A “flagging process” helps prioritize remediation:

  * remove unknown applications
  * upgrade EOL applications
  * patch security-critical packages quickly

---

## 🎯 Why This Matters

Software asset inventory helps prevent:

* Unknown software introducing malware/risk
* Running unsupported/EOL applications that no longer receive patches
* Compliance failures (audit requirements often require software inventory)

It directly supports:

* vulnerability management
* patch management
* endpoint hardening
* incident response investigations

---

## 🌍 Real-World Applications

* Quarterly software audits and compliance reporting
* Identifying “shadow IT” or unauthorized tools
* Detecting risky or outdated versions before exploitation
* Supporting SOC/IR teams during incident triage

---

## ✅ Result

* ✅ Windows software inventory collected using WMIC and exported to CSV.
* ✅ Linux software inventory collected using dpkg-query and exported to CSV.
* ✅ A structured method to flag UNKNOWN/EOL software was documented for spreadsheet analysis.
* ✅ Verified inventory artifacts exist and can be reviewed using spreadsheet tools.

---

## 🧾 Conclusion

This lab demonstrated end-to-end software inventory creation across two operating systems:

* Windows inventory was exported via WMIC into CSV format.
* Linux package inventory was exported via dpkg-query into CSV format.
* A practical workflow for reviewing UNKNOWN/EOL software was documented for later analysis.

✅ Lab completed successfully using Windows + Ubuntu cloud lab environments.

---

## 📦 Artifacts Created (Committed to Repo)

Stored under `artifacts/`:

### 🐧 Linux

* `linux_installed_software.csv` *(exported from dpkg-query)*
* `eol_unknown_flagging_notes.txt`

### 🪟 Windows

* `windows_installed_software.csv` *(exported from WMIC and copied into repo folder)*

---
