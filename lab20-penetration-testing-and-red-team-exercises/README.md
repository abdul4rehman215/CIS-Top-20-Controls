# 🧪 Lab 20: Penetration Testing & Red Team Exercises (CIS Controls)

**Environment:** Ubuntu 24.04.1 LTS (Cloud Lab Environment)  
**User:** `toor`  
**Target VM (Lab):** `192.168.56.101` *(authorized test VM, host-only network)*  
**Important Note:** Outputs in this lab are **sample/simulated** outputs from an authorized test VM environment.

---

## 🎯 Objectives

This lab provides hands-on exposure to penetration testing and red team style workflows by:

- Understanding the core concepts of penetration testing and red team exercises
- Using open-source tooling for discovery and vulnerability scanning
- Identifying exposed services and common misconfiguration risks
- Performing a **benign exploit attempt** in a controlled, authorized lab
- Summarizing findings and proposing practical security improvements

---

## ✅ Prerequisites

- Basic networking and cybersecurity fundamentals
- Familiarity with Linux command line
- VM-based test environment (authorized)
- Tools installed/available:
  - **Nmap**
  - **Metasploit Framework**

---

## 🧩 Lab Tasks Overview

### ✅ Task 1: Scanning with Nmap
- Updated package lists and installed Nmap
- Performed service/version scan against the target VM:
  - `nmap -sV 192.168.56.101`
- Identified exposed services and attack surface, including FTP, SSH, HTTP, and SMB

---

### ✅ Task 2: Vulnerability Scanning with Metasploit (Auxiliary Modules)
- Launched Metasploit console
- Used SMB version scanner to identify SMB dialect and Samba version:
  - `auxiliary/scanner/smb/smb_version`
- Recorded results for risk assessment (exposure vs. confirmed vulnerability)

---

### ✅ Task 3: Attempting a Benign Exploit (Safe Lab Verification)
- Selected a well-known historical module:
  - `exploit/unix/ftp/vsftpd_234_backdoor`
- Attempted exploitation against the target VM
- Result was **safe failure** (no session created), reinforcing that:
  - banners alone are not proof of exploitability
  - validation requires controlled testing and evidence

---

## 📁 Repository Structure

```

lab20-penetration-testing-and-red-team-exercises/
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
├── troubleshooting.md
└── reports/
└── findings_summary.md

````

> Note: The `reports/` directory is used to keep the findings and recommendations cleanly separated from raw outputs.  
> (This lab includes strong security relevance, so a dedicated findings report is appropriate.)

---

## 🧾 Summary of Findings (Lab Notes)

### 🔍 Open Ports & Services Identified (Nmap `-sV`)
- **21/tcp (FTP)** — vsftpd 2.3.4 (banner)
- **22/tcp (SSH)** — OpenSSH (remote administration exposed)
- **80/tcp (HTTP)** — Apache web server
- **139/tcp, 445/tcp (SMB)** — Samba service exposed

### 🧪 Risk Observations
- **FTP exposed:** risk of weak credentials, legacy configuration, and historically risky service patterns
- **SMB exposed:** increases attack surface (shares, authentication policy, exposure scope)
- **HTTP exposed:** requires patching + secure configuration (headers, modules, TLS posture)
- **Exploit attempt:** vsftpd backdoor module did **not** succeed → **no session created**
  - key takeaway: **banner ≠ vulnerability**

---

## ✅ Recommended Improvements (Fixes / Hardening)

### Reduce Attack Surface
- Disable **FTP** if not required; prefer **SFTP over SSH**
- Restrict **SMB** to internal networks only (deny external exposure)

### Authentication Hardening
- Enforce strong authentication controls:
  - prefer SSH keys over passwords
  - disable anonymous access
  - remove/default credentials
  - apply account lockout controls where applicable

### Patch Management & Validation
- Keep services updated and verify real versions beyond banners
- Review configs and logs for confirmation rather than relying on string identifiers only

### Firewall & Network Controls
- Allow only required ports from trusted IPs/subnets
- Log denied traffic and monitor for scanning patterns

---

## 🧠 What I Learned

- Discovery and version scanning is a foundational step to measure attack surface
- Metasploit auxiliary modules help gather information safely before exploitation
- “Exploit attempt” must be ethical and authorized; safe failure is still useful evidence
- Real security assessment requires **validation** (not assumptions based on banners)
- Reporting and remediation recommendations are just as important as scanning

---

## 🌍 Why This Matters

Penetration testing and red team exercises help organizations:

- discover exposed services and misconfigurations before attackers do
- validate defensive posture under realistic conditions
- prioritize remediation by business risk
- improve monitoring, hardening, and security culture

---

## ✅ Result

- Nmap scan identified exposed services on the lab target VM
- Metasploit SMB version scan confirmed SMB reachability and Samba version
- Benign vsftpd exploit attempt failed safely (no session created)
- Findings were summarized and security improvements proposed

---

## 🏁 Conclusion

This lab demonstrated a basic but realistic penetration testing workflow in an authorized VM lab:

**Scan → Enumerate → Validate risk → Attempt benign verification → Report findings → Recommend fixes**

✅ Lab completed successfully (authorized testing, simulated output captured, and remediation guidance documented).

---

## 📚 Additional Resources

```text
Nmap Documentation:
https://nmap.org/book/man.html

Metasploit Unleashed:
https://www.offensive-security.com/metasploit-unleashed/
````

---
