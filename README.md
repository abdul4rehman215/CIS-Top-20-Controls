# 🛡️ CIS Top 20 Controls – Defensive Security Engineering Portfolio (30 Labs)

> **SOC Operations • System Hardening • Asset Control • SIEM • Cloud • Encryption • Incident Response • Patch Management**

A structured, execution-first 30-lab security engineering portfolio implementing CIS-style baseline controls across endpoints, networks, cloud systems, SIEM pipelines, and encryption workflows.
A **30-lab, execution-first** portfolio mapped to **CIS Controls** style defensive engineering:  
inventory → hardening → monitoring → access control → SIEM → cloud security → encryption → backup verification → IR.

---

<div align="center">

<!-- ===================== BADGES: PLATFORM & STACK ===================== -->

![OS](https://img.shields.io/badge/%F0%9F%90%A7%20OS-Ubuntu%2024.04-orange?style=for-the-badge&logo=ubuntu)
![Linux](https://img.shields.io/badge/%F0%9F%90%A7%20Linux-Defensive%20Ops-black?style=for-the-badge&logo=linux)
![Windows](https://img.shields.io/badge/%F0%9F%AA%9F%20Windows-Inventory%20%26%20Policy-0078D6?style=for-the-badge&logo=windows)
![Networking](https://img.shields.io/badge/%F0%9F%8C%90%20Networking-Nmap%20%7C%20Netcat-1f6feb?style=for-the-badge&logo=cisco)
![Shell](https://img.shields.io/badge/%F0%9F%92%BB%20Shell-Bash%20%7C%20CLI-4EAA25?style=for-the-badge&logo=gnu-bash)

<!-- ===================== BADGES: SOC FOCUS ===================== -->

![Focus](https://img.shields.io/badge/Focus-CIS%20Top%2020%20Controls-red?style=for-the-badge)
![Focus](https://img.shields.io/badge/%F0%9F%94%8E%20Focus-SOC%20Controls-red?style=for-the-badge)
![BlueTeam](https://img.shields.io/badge/Blue%20Team-Defensive%20Security-blue?style=for-the-badge)
![Hardening](https://img.shields.io/badge/System-Hardening-critical?style=for-the-badge)
![Hardening](https://img.shields.io/badge/%F0%9F%9B%A1%EF%B8%8F%20Hardening-Endpoints%20%26%20Servers-6f42c1?style=for-the-badge)
![Monitoring](https://img.shields.io/badge/%F0%9F%93%A1%20Monitoring-Logs%20%26%20Alerts-0ea5e9?style=for-the-badge)
![IR](https://img.shields.io/badge/%F0%9F%9A%A8%20Incident%20Response-Detect%20%E2%86%92%20Recover-d73a49?style=for-the-badge)

<!-- ===================== BADGES: SPECIALIZATION ===================== -->

![SIEM](https://img.shields.io/badge/%F0%9F%93%8A%20SIEM-ELK%20%7C%20Filebeat-005571?style=for-the-badge&logo=elastic)
![Wazuh](https://img.shields.io/badge/%F0%9F%9B%A0%EF%B8%8F%20EDR%2FSIEM-Wazuh-0b7285?style=for-the-badge)
![Cloud](https://img.shields.io/badge/%E2%98%81%EF%B8%8F%20Cloud-OpenStack-ED1944?style=for-the-badge&logo=openstack)
![Encryption](https://img.shields.io/badge/%F0%9F%94%90%20Encryption-Rest%20%26%20Transit-1a7f37?style=for-the-badge)

<!-- ===================== BADGES: SCOPE & STATUS ===================== -->

![Labs](https://img.shields.io/badge/%F0%9F%A7%AA%20Labs-30%20Hands--On-brightgreen?style=for-the-badge)
![Docs](https://img.shields.io/badge/%F0%9F%93%9D%20Evidence-Commands%20%2B%20Outputs%20%2B%20Notes-blueviolet?style=for-the-badge)
![Level](https://img.shields.io/badge/Level-Foundations%20%E2%86%92%20Operational-blue?style=for-the-badge)
![Status](https://img.shields.io/badge/%E2%9C%85%20Status-Completed-success?style=for-the-badge)

</div>

---

## 🎯 Executive Summary

This repository is a **CIS Controls–aligned** lab portfolio showing real defensive engineering workflows across:
- **Asset inventory** (hardware/software) with discovery reconciliation  
- **Vulnerability scanning** + remediation documentation  
- **Least privilege** for admin access and controlled permissions  
- **Endpoint/network hardening** (services, SSH, policies, firewall)  
- **Monitoring & log analysis**, SIEM log shipping, alert rules  
- **Encryption** at rest (BitLocker/LUKS) and in transit (TLS on Apache/Nginx)  
- **Backup + restore verification** (diff + hashes)  
- **Incident response** lifecycle documentation + containment concepts  

Every lab is **execution-first**: commands run, outputs captured, changes validated, and results documented inside lab folders.

---

## 🧭 Repository Structure

Each lab folder contains reproducible, GitHub-ready artifacts:

```text
labXX-<topic>/
├─ README.md               # Objective + steps + validation
├─ commands.*              # Commands executed (or embedded command blocks)
├─ output.*                # Captured outputs / sanitized evidence
├─ reports/                # Findings, checklists, policies, verification notes
├─ interview_qna.md        # (optional) interview-ready Q&A
└─ troubleshooting.md      # Common issues + fixes
````

---

# 🧱 Section 1 — Security Foundations (Labs 1–15)

**Focus:** Asset Inventory • Hardening • Firewalling • Monitoring • Encryption • Access Control

These labs implement foundational baseline controls across endpoints and networks using open-source tooling and validation workflows.

---

## 📚 Labs Index (1–15)

| Lab | Title | Focus Area |
|-----|-------|------------|
| 01 | [Hardware Asset Inventory](./lab01-hardware-asset-inventory) | Asset discovery & reconciliation |
| 02 | [Software Asset Inventory](./lab02-software-asset-inventory) | Installed software auditing |
| 03 | [Basic Vulnerability Scanning](./lab03-basic-vulnerability-scanning) | OpenVAS / GVM scanning |
| 04 | [Controlled Admin Privileges](./lab04-controlled-use-of-administrative-privileges) | Least privilege enforcement |
| 05 | [Secure Endpoint Configuration](./lab05-secure-configuration-for-endpoints) | CIS-style hardening |
| 06 | [Audit Log Monitoring & Analysis](./lab06-monitoring-and-analysis-of-audit-logs) | Log triage workflow |
| 07 | [Email & Browser Hardening](./lab07-securing-email-and-web-browsers) | Anti-phishing controls |
| 08 | [Malware Defenses](./lab08-malware-defenses) | ClamAV validation |
| 09 | [Limiting Ports & Services](./lab09-limiting-network-ports-protocols-and-services) | UFW + iptables enforcement |
| 10 | [Data Recovery Capabilities](./lab10-data-recovery-capabilities) | Backup + restore + diff validation |
| 11 | [Network Device Hardening](./lab11-secure-configuration-for-network-devices) | SSH-only management |
| 12 | [Boundary Defense](./lab12-boundary-defense) | Inbound filtering + nc validation |
| 13 | [Data Protection Basics](./lab13-data-protection-basics) | TLS + file encryption |
| 14 | [Need-to-Know Access Control](./lab14-controlled-access-need-to-know) | Linux groups & permissions |
| 15 | [Wireless Access Control](./lab15-wireless-access-control) | WPA2 AES + WPS disable |

---

## 🧠 Skills Demonstrated (Labs 1–15)

- Hardware/software asset reconciliation
- Nmap host discovery validation
- OpenVAS vulnerability triage
- Admin privilege auditing (sudo/wheel)
- CIS-style endpoint hardening mindset
- UFW & iptables rule enforcement
- Port/service minimization
- Backup automation (cron) + integrity validation (diff)
- Router hardening (SSH-only, disable HTTP)
- TLS certificate configuration + handshake validation
- File encryption validation (AES-256)
- Linux access control (chmod/chown/groups)
- Wireless security hardening

---

# 🔐 Section 2 — Security Hardening, Operations & Encryption (Labs 16–30)

**Focus:** Identity Control • OS Hardening • Patch Management • SIEM • Cloud Security • Encryption • Policy Enforcement

These labs expand from baseline hardening into operational SOC controls and encryption validation workflows.

---

## 📚 Labs Index (16–30)

| Lab | Title | Focus Area |
|-----|-------|------------|
| 16 | [Account Monitoring & Control](./lab16-account-monitoring-and-control) | UID auditing + lockout policy |
| 17 | [Security Awareness Training](./lab17-security-awareness-training) | Phishing defense training |
| 18 | [Application Software Security](./lab18-application-software-security) | SQLi/XSS mitigation |
| 19 | [Incident Response & Management](./lab19-incident-response-and-management) | IR lifecycle |
| 20 | [Penetration Testing (Authorized)](./lab20-penetration-testing-and-red-team-exercises) | Nmap + remediation workflow |
| 21 | [Patch Management Basics](./lab21-patch-management-basics) | Update validation |
| 22 | [Hardening Windows System](./lab22-hardening-windows-system) | Policy enforcement |
| 23 | [Hardening Linux System](./lab23-hardening-linux-system) | SSH hardening |
| 24 | [SIEM Log Integration (ELK)](./lab24-siem-integration-for-logs) | Filebeat → Elasticsearch |
| 25 | [Secure Cloud Instance](./lab25-secure-cloud-instance-basic) | OpenStack security groups |
| 26 | [Endpoint Security Tool Intro](./lab26-endpoint-security-tool-introduction) | Wazuh alert validation |
| 27 | [Data at Rest Encryption](./lab27-data-at-rest-encryption) | BitLocker + LUKS |
| 28 | [Data in Transit Encryption](./lab28-data-in-transit-encryption) | Nginx TLS + redirect |
| 29 | [Verifying Backups](./lab29-verifying-backups) | Hash + diff validation |
| 30 | [Strengthening Password Policies](./lab30-strengthening-password-and-account-policies) | pwquality + Windows policy |

---

## 🧠 Skills Demonstrated (Labs 16–30)

- Account auditing & session timeout enforcement
- PAM-based lockout configuration
- Security awareness content development
- SQL injection & XSS mitigation strategies
- Incident lifecycle execution (Detect → Contain → Recover)
- Patch deployment & validation workflows
- SSH hardening & service minimization
- ELK + Filebeat log shipping
- Wazuh endpoint monitoring validation (EICAR)
- OpenStack cloud security groups
- BitLocker + LUKS encryption
- HTTPS enforcement (301 redirect)
- Backup integrity validation (sha256sum)
- Password complexity & expiration enforcement

---

## 🧰 Tools & Technologies Used

### Operating Systems

* **Ubuntu 24.04/24.04.1 LTS** (primary lab host)
* **Windows** (inventory exports, policies, encryption tooling)

### Networking & Discovery

* `nmap`, `ss`, `netstat` (net-tools), `ip`, `ip route`, `nc` (netcat)

### Vulnerability & Endpoint Security

* **OpenVAS / Greenbone (GVM)**
* **Lynis** (baseline auditing approach)
* **ClamAV** (`freshclam`, `clamscan`)

### Firewalls & Boundary Controls

* `ufw`, `iptables` (+ save/restore)
* Service management: `systemctl`

### Logging / SIEM / Monitoring

* `rsyslog`, `/var/log/auth.log`, `grep`, `tail`
* **Elastic Stack**: Elasticsearch + Kibana
* **Filebeat** (log shipper)
* **Wazuh** (manager/dashboard; endpoint alert validation)

### Backup / Recovery / Integrity

* `tar`, `gzip`, `cron`, `crontab`, `diff`, `sha256sum`

### Secure Access & Encryption

* **OpenSSH** (SSH hardening)
* **Apache2 TLS** (OpenSSL cert generation + TLS handshake validation)
* **Nginx TLS** (HTTPS + redirect)
* **BitLocker** (Windows), **LUKS/cryptsetup** (Linux)
* Windows utilities: **7-Zip AES-256**, **VeraCrypt**

### Cloud

* **OpenStack** (Horizon + CLI), security groups, MFA workflow

---

## ✅ Validation Style (How Evidence Is Proved)

Across labs, validation is explicitly demonstrated with:

* **Before/after checks** (ports, services, policies, configs)
* **Negative tests** (unauthorized access fails, blocked ports time out)
* **Integrity proof** (diff output, SHA256 hashes)
* **Security telemetry proof** (auth logs, SIEM indexes, Wazuh alerts)
* **TLS proof** (`curl -I`, handshake/cipher confirmation)

---

## 🔐 Security Notes (Important)

**Never commit sensitive secrets**:

* TLS private keys (`*.key`), recovery keys, MFA backup codes, real passwords.

✅ Recommended `.gitignore` entries:

```gitignore
# Keys / secrets
*.key
*.pem
*.pfx
*.p12
*recovery*
*mfa*
*backup-codes*
.env
secrets*
```

---

## ▶️ How to Use

```bash
# Clone
git clone <YOUR_REPO_URL>
cd CIS-Top-20-Controls

# Open any lab
cd lab09-limiting-network-ports-protocols-and-services
cat README.md
```

Each lab folder contains steps, commands, outputs, and documentation artifacts.

---

## 🎓 Learning Outcomes

After completing Labs 1–30, I can:

* Implement **CIS-style foundational controls** with documented evidence
* Harden endpoints and services while validating security impact
* Ship logs into a SIEM pipeline and reason about alert thresholds
* Apply encryption controls correctly (rest + transit) and verify behavior
* Validate recoverability and integrity of backups with repeatable checks
* Document incident response workflows and containment actions clearly

---

# 🎯 Professional Relevance

This portfolio demonstrates capability aligned with:

- SOC Analyst (Tier 1 / Tier 2)
- System Hardening Engineer
- Blue Team Analyst
- Security Operations Engineer
- Junior Detection Engineer

It reflects:

- Least privilege enforcement
- Deny-by-default firewalling
- Encryption everywhere mindset
- Log visibility + alerting
- Secure configuration validation
- Backup verification discipline

---

# 🧪 Execution Model

All labs were performed in controlled lab environments using:

- Ubuntu cloud instances
- Windows sandbox environments
- OpenStack virtual machines
- Open-source security tooling

No production systems were targeted.

---

# ⚖️ Ethical & Legal Notice

All activities were conducted:

- In authorized lab environments
- Against controlled systems
- For educational and defensive security development

No unauthorized systems were accessed.

## ⚖️ Ethical & Legal Notice

All activities are conducted in **controlled lab environments** for **defensive learning and validation**.
No production systems are targeted. Any security testing is **authorized and sandboxed**.

---

## 👤 Author

**Abdul Rehman**
Defensive Security • SOC • Detection Engineering • Hardening • SIEM • DFIR Foundations

---


# ⭐ Final Note

This repository reflects practical defensive security engineering work:

Asset Control → Hardening → Monitoring → Encryption → Verification → Enforcement.

If this portfolio adds value, consider starring ⭐ the repository.

**Security is not configuration — it is validation.**

---

