# 🧪 Lab: Hardening a Linux System (CIS Controls)

**Environment:** Ubuntu 24.04.1 LTS (Cloud Lab Environment)  
**User:** `toor`  
**Primary Interface:** `ens5`  
**Note:** Outputs in this lab are **sample/simulated** from an authorized lab VM and formatted like a real hardening session for GitHub documentation.

---

## 🎯 Objectives

This lab covers practical Linux hardening techniques aligned with CIS-style guidance:

- Understand why system hardening is critical for security
- Identify and remove unused packages to reduce attack surface
- Harden SSH configuration (disable root login, prefer keys)
- Document a CIS-aligned baseline approach for Ubuntu
- Run an auditing tool (**Lynis**) to identify gaps and next hardening actions

---

## ✅ Prerequisites

- Basic Linux command line knowledge
- Access to an Ubuntu/CentOS system with sudo privileges
- Internet access for installing tools and references
- Understanding of SSH basics and remote access

---

## 🧩 Lab Tasks Overview

### ✅ Task 1: Remove Unused Packages (Reduce Attack Surface)
- Reviewed installed packages (`apt list --installed`)
- Identified an unnecessary legacy tool: **telnet**
- Removed telnet with apt
- Performed optional cleanup via `apt autoremove`

**Why it matters:** Unused tools/services increase attack surface and provide attackers more potential entry points.

---

### ✅ Task 2: Configure SSH for Enhanced Security

#### 2.1 Disallow Root Login
- Backed up SSH configuration file before editing
- Updated SSH config to ensure:
  - `PermitRootLogin no`
- Restarted SSH service and verified it is active

**Why it matters:** Disabling remote root login reduces direct high-privilege access exposure and encourages least privilege workflows (login as user → escalate via sudo).

#### 2.2 Implement Key-Based Authentication
- Generated an SSH keypair (RSA 4096)
- Copied public key to a remote host using `ssh-copy-id` (lab example host)

**Note:** Disabling password authentication entirely is recommended after confirming key-based login works (documented as a recommended CIS-aligned next step).

---

### ✅ Task 3: Implement a CIS-Aligned Baseline (Documentation)
- Created baseline notes file documenting:
  - which controls were implemented
  - which CIS-aligned controls are recommended next
- Emphasized safe approach:
  - apply hardening changes that do not break required services

---

### ✅ Task 4 (Optional): Run Lynis Security Audit
- Installed Lynis via apt
- Ran `lynis audit system`
- Captured key findings by saving the tail of `/var/log/lynis.log` into a repo-friendly summary file

**Why it matters:** Lynis helps prioritize hardening gaps and provides actionable recommendations aligned to best practices.

---

## 📁 Repository Structure

```

lab23-hardening-linux-system/
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
├── troubleshooting.md
├── notes/
│   └── cis_baseline_notes.md
├── lynis/
│   └── lynis_summary_tail.log
└── artifacts/
└── sshd_config.bak

```id="5c6d0r"

> `artifacts/` is used for safe configuration backups (no secrets).  
> `notes/` contains CIS baseline decisions and next-step recommendations.

---

## ✅ Verification & Validation

Hardening steps were validated using:

- Telnet presence check:
  - `dpkg -l | grep -i telnet`
- Telnet removal:
  - apt output confirms package removed
- SSH hardening validation:
  - `grep -n "^PermitRootLogin" /etc/ssh/sshd_config`
  - `systemctl status ssh` confirms active/running
- SSH keys created:
  - `ssh-keygen` output confirms key generation
  - `ssh-copy-id` confirms key installation on remote host
- CIS baseline documentation saved in repo
- Lynis audit completed and key findings logged:
  - `/var/log/lynis.log` tail saved to `lynis/lynis_summary_tail.log`

---

## 🧠 What I Learned

- Reducing installed packages is a simple but effective hardening step
- SSH hardening is one of the most impactful baseline protections on Linux servers
- CIS-aligned controls should be applied carefully to avoid breaking required workloads
- Auditing tools like Lynis help convert “hardening advice” into a prioritized action list

---

## 🌍 Why This Matters

Linux servers are often exposed through SSH and network services. Hardening reduces risk by:

- removing unnecessary tools
- enforcing safer authentication
- preventing direct root remote access
- validating posture with auditing tools

This improves baseline security and supports real-world operations, compliance, and incident readiness.

---

## ✅ Result

✅ Unused packages removed (telnet) to reduce attack surface  
✅ SSH hardened with `PermitRootLogin no` and service verified running  
✅ Key-based authentication prepared and tested via ssh-copy-id  
✅ CIS-aligned baseline decisions documented  
✅ Lynis audit run and key findings captured for follow-up actions 🚀

---

## 🏁 Conclusion

This lab demonstrated a practical Linux hardening workflow:

**Reduce attack surface → harden SSH → document CIS baseline → audit with Lynis → plan next improvements**

✅ Lab completed successfully with documented hardening steps and audit outputs.

---
