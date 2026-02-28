# 📊🕵️ Lab 06: Monitoring & Analysis of Audit Logs (CIS Controls)

> **Environments:**  
> - **Windows:** Event Viewer + Local Security Policy  
> - **Linux:** Ubuntu 24.04.1 LTS (Cloud Lab Environment)  
>
> **Linux User:** toor  
> **Category:** CIS Top 20 Controls (Lab 06 of 15)

---

## ✅ Objectives

By the end of this lab, I was able to:

- Understand why audit logs are essential for system security and integrity.
- Enable and collect logs on both Windows and Linux systems.
- Use common tools and commands to analyze authentication/audit logs.
- Identify suspicious log patterns and validate a brute-force style behavior using log filtering and counting.

---

## ✅ Prerequisites

- Basic Windows and Linux OS knowledge.
- Access to a Windows machine (physical/VM) with Local Security Policy.
- Access to a Linux machine (physical/VM).
- Basic CLI experience.
- Internet connection if installing tools is required.

---

## 🧪 Lab Environment

### 🪟 Windows
| Component | Details |
|---|---|
| Tools | Event Viewer (`eventvwr`), Local Security Policy (`secpol.msc`) |
| Log Source | Windows Logs → Security |
| Artifact | `Security.evtx` (exported) |

### 🐧 Linux
| Component | Details |
|---|---|
| OS | Ubuntu 24.04.1 LTS |
| Environment | Cloud Lab Environment |
| User | toor |
| Logging Stack | `rsyslog` + `/var/log/auth.log` |
| Analysis Tools | `grep`, `awk`, `sort`, `uniq`, `tail` |
| Collected Log Location | `~/log_analysis/auth.log` |

---

## 🗂️ Repository Structure (Lab Folder)

```text id="a6x8s5"
lab06-monitoring-and-analysis-of-audit-logs/
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
├── troubleshooting.md
├── scripts/
│   └── (none for this lab)
└── artifacts/
    ├── auth.log
    ├── windows_security.evtx
    └── notes.md
```

> ✅ Notes about artifacts:
>
> * Linux `auth.log` is copied into a safe analysis folder and then committed as an artifact.
> * Windows Security log export is stored as `windows_security.evtx` for consistency.
> * `notes.md` documents investigation observations and conclusions (optional but recommended for portfolio evidence).

---

## ✅ Tasks Overview (What I Did)

### ✅ Task 1: Enable Verbose Logging

#### 🪟 Windows

* Opened Event Viewer and navigated to:

  * `Windows Logs > Security`
* Enabled audit logging through Local Security Policy:

  * `Audit account logon events` → Success, Failure
  * `Audit logon events` → Success, Failure
  * `Audit account management` → Success, Failure

#### 🐧 Linux

* Opened rsyslog configuration and verified auth logging:

  * ensured `auth.* /var/log/auth.log` exists in `/etc/rsyslog.conf`
* Restarted `rsyslog` and confirmed it is running.

---

### ✅ Task 2: Collect Logs (Centralize for Analysis)

* Created a central folder for analysis:

  * `~/log_analysis`
* Copied auth logs into the analysis folder to avoid editing live logs:

  * copied `/var/log/auth.log` → `~/log_analysis/auth.log`
* On Windows, exported Security logs from Event Viewer:

  * saved as `Security.evtx`

---

### ✅ Task 3: Analyze Logs for Suspicious Entries

#### 🐧 Linux Analysis

* Filtered for suspicious failed logins:

  * focused on brute-force patterns (`Failed password`)
* Identified repeated attempts and extracted IP frequency:

  * counted attempts per source IP
* Checked if any successful authentication occurred after failures:

  * reviewed “Accepted” entries

#### 🪟 Windows Analysis

* Opened exported security logs and filtered for:

  * “Logon Failure”
* Looked for patterns:

  * repeated failures in short time
  * repeated usernames
  * unknown sources

---

## 🧾 Case Study: Brute-Force Pattern (Observed)

Based on Linux `auth.log` sample:

* repeated failed attempts
* common brute-force usernames attempted:

  * `admin`, `test`, `root`, `guest`, `oracle`
* attempts originating from a single external-looking source IP
* verified whether compromise occurred by checking success logs

Typical next steps (defensive controls):

* IP allowlisting / firewall restrictions
* rate-limiting with Fail2Ban
* disable password auth for SSH (keys-only)
* ensure SSH root login is disabled (done in endpoint hardening lab)

---

## ✅ Verification & Validation

### Linux

* Confirmed auth logging configured in rsyslog:

  * verified `auth.* /var/log/auth.log`
* Confirmed rsyslog running
* Confirmed logs copied into analysis directory
* Confirmed suspicious pattern via filtering and IP counting

### Windows

* Confirmed Security logging visible in Event Viewer
* Confirmed audit policies enabled
* Confirmed Security log exported to EVTX

---

## 🧠 What I Learned

* Audit logs are critical for detecting:

  * brute-force attempts
  * unauthorized access
  * suspicious authentication behavior
* Centralizing logs simplifies analysis and reduces risk of tampering with live files.
* Simple command-line techniques (`grep`, `awk`) are powerful for:

  * pattern detection
  * frequency analysis
  * quick triage investigations
* Logs should drive response decisions (hardening, rate limiting, access restrictions).

---

## 🎯 Why This Matters

Monitoring audit logs helps:

* detect attacks early
* preserve evidence for incident response
* support compliance and accountability
* reduce time-to-detect (TTD) and time-to-respond (TTR)

---

## 🌍 Real-World Applications

* SOC analyst triage workflows (auth log review + pivoting)
* detecting brute-force, credential stuffing, and scanning
* enforcing compliance evidence requirements
* feeding logs into SIEM tools (ELK/Graylog/Splunk-like workflows)

---

## ✅ Result

* ✅ Windows audit logging enabled and Security logs exported.
* ✅ Linux authentication logging validated and centralized into `~/log_analysis`.
* ✅ Suspicious brute-force pattern identified using filtering and frequency analysis.
* ✅ Verified whether successful access followed failed attempts.

---

## 🧾 Conclusion

This lab established an audit-log workflow across Windows and Linux:

Enable → Collect → Centralize → Analyze → Identify suspicious patterns → Document findings.

✅ Lab completed successfully using Windows + Ubuntu cloud lab environments.

---

## 📦 Artifacts Created (Committed to Repo)

Stored under `artifacts/`:

### 🐧 Linux

* `auth.log` *(copied from `/var/log/auth.log`)*

### 🪟 Windows

* `windows_security.evtx` *(exported from Event Viewer Security logs)*

### Notes (Optional but recommended)

* `notes.md` *(brief investigation notes and conclusions)*

---
