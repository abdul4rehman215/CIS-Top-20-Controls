# 🧰🔒 Lab 05: Secure Configuration for Endpoints (CIS Controls)

> **Environments:**  
> - **Linux:** Ubuntu 24.04.1 LTS (Cloud Lab Environment)  
> - **Windows:** Group Policy / PowerShell (Windows subtasks)  
>
> **Linux User:** toor  
> **Category:** CIS Top 20 Controls (Lab 05 of 15)

---

## 🎯 Objectives

By the end of this lab, I was able to:

- Implement secure configurations on endpoint systems.
- Apply benchmark-style guidance (CIS-style hardening approach) using auditing + remediation.
- Disable unnecessary services to reduce attack surface.
- Enforce password complexity rules on Linux (pwquality + PAM verification).
- Document configuration changes using a checklist for traceability and audit-readiness.

---

## ✅ Prerequisites

- Basic OS concepts and command-line usage.
- Access to a test system running Windows and/or Linux.
- Internet access to install audit tools and benchmarks/guidelines.
- A text editor for documentation (`nano` used in this lab).

---

## 🧾 Overview

Secure endpoint configuration is a foundational defense step. By applying benchmark-style guidance, removing unnecessary services, and enforcing strong password policies, endpoints become harder to compromise and easier to audit.

This lab follows a **CIS-style** approach:
- Audit → Identify gaps → Apply remediation → Document changes

---

## 🧪 Lab Environment

### 🐧 Linux
| Component | Details |
|---|---|
| OS | Ubuntu 24.04.1 LTS |
| Environment | Cloud Lab Environment |
| User | toor |
| Tools Used | `lynis`, `systemctl`, `sshd`, `grep`, `sed`, `nano`, `cp`, `cat` |
| Key Config Files | `/etc/ssh/sshd_config`, `/etc/security/pwquality.conf`, `/etc/pam.d/common-password` |

### 🪟 Windows
| Component | Details |
|---|---|
| Tools Used | Group Policy Editor (`gpedit.msc`), PowerShell (`Get-Service`) |
| Focus Areas | Account lockout policy, password policy, service review |

---

## 🗂️ Repository Structure (Lab Folder)

```text
lab05-secure-configuration-for-endpoints/
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
├── troubleshooting.md
└── artifacts/
    └── configuration_checklist.md
```

> ✅ Note: This lab focused on configuration changes and verification commands.

---

## ✅ Tasks Overview (What I Did)

### ✅ Task 1: Apply a Security Benchmark / Guideline

* Selected CIS-style benchmark guidance for endpoint hardening.
* **Windows example:** applied Group Policy security settings (Account Lockout Policy).
* **Linux:** installed `lynis`, ran `lynis audit system`, and implemented one recommended remediation (SSH hardening).

### ✅ Task 2: Disable Unnecessary Services

* **Windows example:** reviewed services with PowerShell `Get-Service`.
* **Linux:** reviewed active services using `systemctl`.
* Disabled an unnecessary service (example: `avahi-daemon`) where present to reduce attack surface.

### ✅ Task 3: Enforce Password Complexity Rules

* **Windows example:** applied password policy settings via Group Policy.
* **Linux:** hardened password policy using `/etc/security/pwquality.conf` with complexity requirements.
* Verified PAM configuration includes `pam_pwquality.so`.

### ✅ Documentation Checklist

* Created a checklist file and updated it as tasks were completed, producing a traceable evidence document.

---

## ✅ Verification & Validation

### 🔎 Audit Verification (Linux)

* Verified Lynis installed and audit executed.
* Reviewed Lynis warnings/suggestions and acted on SSH-related hardening.

### 🔎 SSH Hardening Verification (Linux)

* Confirmed `PermitRootLogin` setting applied:

  * validated syntax using `sshd -t`
  * confirmed runtime effective config using `sshd -T | grep permitrootlogin`

### 🔎 Services Verification (Linux)

* Enumerated services with `systemctl list-units --type=service`.
* Confirmed targeted service disabled using:

  * `systemctl is-enabled <service>`

### 🔎 Password Policy Verification (Linux)

* Verified pwquality parameters with:

  * `grep -nE '^(minlen|dcredit|ucredit|lcredit|ocredit)='`
* Verified PAM includes pwquality module with:

  * `grep -n "pam_pwquality.so" /etc/pam.d/common-password`

### 🔎 Documentation Verification

* Verified checklist completion by viewing:

  * `cat configuration_checklist.md`

---

## 🧠 What I Learned

* Benchmarks like CIS provide actionable secure configuration guidance.
* Auditing tools (Lynis) help identify weaknesses and suggest remediation.
* Hardening SSH is a common and high-impact security improvement (disabling root login is a baseline step).
* Disabling unnecessary services reduces exposed attack surface.
* Password complexity enforcement requires:

  * pwquality configuration
  * PAM integration verification
* A checklist makes endpoint hardening **auditable, repeatable, and traceable**.

---

## 🎯 Why This Matters

Secure endpoint configuration reduces common risks like:

* brute-force attacks (lockout policies + password complexity)
* remote compromise via weak SSH settings
* unnecessary service exposure (more open services = more attack surface)
* audit failures due to missing documentation

---

## 🌍 Real-World Applications

* Hardening servers before production deployment
* Meeting baseline compliance requirements (CIS/ISO/SOC-style internal policies)
* Supporting vulnerability management and incident response
* Creating standardized endpoint baselines for IT operations

---

## ✅ Result

* ✅ Installed Lynis and completed a system security audit (Linux).
* ✅ Applied SSH hardening by disabling root login and verifying configuration.
* ✅ Reviewed and disabled a non-essential service (example: avahi-daemon).
* ✅ Enforced Linux password complexity rules (pwquality + PAM verification).
* ✅ Produced a complete checklist documenting all endpoint security changes.

---

## 🧾 Conclusion

This lab demonstrated a practical, benchmark-aligned endpoint hardening workflow:

Audit → Harden configs → Disable unnecessary services → Enforce password policy → Document everything.

✅ Lab completed successfully on Windows + Ubuntu cloud lab environments.

---

## 📦 Artifacts Created (Committed to Repo)

Stored under `artifacts/`:

* `configuration_checklist.md`

---
