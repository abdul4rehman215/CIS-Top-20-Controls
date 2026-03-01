# 🛡️ CIS Top 20 Controls — Defensive Controls Implementation Portfolio (30 Labs)

> **Security Controls Implementation • System Hardening • Asset Control • Logging & SIEM • Cloud Baselines • Encryption • Backup Validation • Incident Response**

### A structured, execution-first 30-lab portfolio implementing **CIS-style baseline controls** across endpoints, networks, and cloud systems — with reproducible steps, validation evidence, and documentation artifacts.

> Progression: **inventory → hardening → monitoring → access control → SIEM → cloud security → encryption → backup verification → IR**

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

<!-- ===================== REPO METADATA ===================== -->
![RepoSize](https://img.shields.io/github/repo-size/abdul4rehman215/CIS-Top-20-Controls?style=for-the-badge)
![Stars](https://img.shields.io/github/stars/abdul4rehman215/CIS-Top-20-Controls?style=for-the-badge)
![Forks](https://img.shields.io/github/forks/abdul4rehman215/CIS-Top-20-Controls?style=for-the-badge)
![LastCommit](https://img.shields.io/github/last-commit/abdul4rehman215/CIS-Top-20-Controls?style=for-the-badge)

</div>

---

## 🎯 Executive Summary

This repository demonstrates hands-on implementation of **CIS-aligned defensive security controls** across 30 structured labs.

It showcases practical capability in:

- Asset inventory & exposure validation (hardware/software reconciliation)
- Vulnerability scanning & remediation tracking (OpenVAS)
- Least-privilege enforcement & access governance
- Endpoint & network hardening (Linux + Windows)
- Firewall & boundary defense (UFW, iptables)
- Log monitoring & SIEM integration (ELK, Wazuh)
- Encryption at rest (BitLocker, LUKS) and in transit (TLS/HTTPS)
- Backup, restore & integrity validation (diff + hashing)
- Incident response lifecycle documentation & containment concepts
- Cloud instance hardening (OpenStack security groups)

This is **execution-first security engineering**:
commands are run, outputs validated, controls tested, and evidence documented per lab.

The portfolio reflects practical defensive operations aligned with real-world SOC environments — not theoretical exercises.

---

## 📌 About This Repository

This is a structured 30-lab security engineering program focused on implementing foundational and operational defensive controls across:

- Endpoint security
- Network hardening
- Identity & access governance
- Logging & SIEM workflows
- Encryption enforcement
- Backup validation
- Cloud security configuration
- Incident response process execution

All labs were executed in controlled Ubuntu and Windows lab environments using open-source tooling.

Each lab includes:

- Command execution steps
- Validation outputs
- Configuration artifacts (sanitized)
- Structured documentation
- Troubleshooting notes

The progression moves from baseline controls (inventory, hardening, firewalling) to operational security (SIEM integration, encryption verification, policy enforcement).

---

## 👤 Who This Repository Is For

This portfolio is designed for:

- SOC Analyst (Tier 1 / Tier 2) roles
- Blue Team & Defensive Security learners
- System / Endpoint Hardening engineers
- Junior Detection Engineering candidates
- IT professionals transitioning into cybersecurity
- Recruiters evaluating hands-on defensive capability

It demonstrates the ability to implement, validate, and document real security controls — not just describe them.

---

## 🗂️ Labs Index (1–30)

> Click any lab title to jump directly to its folder.

---

# 🗂 Lab Architecture Overview


# 🧱 Section 1 — Security Foundations (Labs 1–15)


<!-- ======================= Section 1 Focus Badges ======================= -->
<div align="left">

![Category](https://img.shields.io/badge/Category-Security%20Foundations-2b2b2b?style=for-the-badge)
![Focus](https://img.shields.io/badge/Focus-Asset%20Control-1f6feb?style=for-the-badge)
![Focus](https://img.shields.io/badge/Focus-System%20Hardening-8b5cf6?style=for-the-badge)
![Focus](https://img.shields.io/badge/Focus-Logging%20%26%20Boundary%20Defense-f97316?style=for-the-badge)
![Focus](https://img.shields.io/badge/Focus-Access%20%26%20Encryption-22c55e?style=for-the-badge)

</div>

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

### These labs implement foundational baseline controls across endpoints and networks using open-source tooling and validation workflows.

---

# 🔐 Section 2 — Security Hardening, Operations & Encryption (Labs 16–30)

<!-- ======================= Section 2 Focus Badges ======================= -->
<div align="left">

![Category](https://img.shields.io/badge/Category-Operations%20%26%20Enforcement-2b2b2b?style=for-the-badge)
![Focus](https://img.shields.io/badge/Focus-Identity%20%26%20Policy%20Control-1f6feb?style=for-the-badge)
![Focus](https://img.shields.io/badge/Focus-OS%20Hardening%20%26%20Patching-8b5cf6?style=for-the-badge)
![Focus](https://img.shields.io/badge/Focus-SIEM%20%26%20Endpoint%20Monitoring-f97316?style=for-the-badge)
![Focus](https://img.shields.io/badge/Focus-Cloud%20%26%20Encryption-22c55e?style=for-the-badge)

</div>

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

### These labs expand from baseline hardening into operational SOC controls and encryption validation workflows.

---

## ✅ Validation Style (How Evidence Is Proved)

Across labs, validation is explicitly demonstrated with:

* **Before/after checks** (ports, services, policies, configs)
* **Negative tests** (unauthorized access fails, blocked ports time out)
* **Integrity proof** (diff output, SHA256 hashes)
* **Security telemetry proof** (auth logs, SIEM indexes, Wazuh alerts)
* **TLS proof** (`curl -I`, handshake/cipher confirmation)

---

## 🧰 Tools & Technologies Used

<details>
<summary><b> Click to expand </b></summary>

### 🖥️ Operating Systems

* **Ubuntu 24.04/24.04.1 LTS** (primary lab host)
* **Windows** (inventory exports, policies, encryption tooling)

### 🌐 Networking & Discovery

* `nmap`, `ss`, `netstat` (net-tools), `ip`, `ip route`, `nc` (netcat)

### 🔎 Vulnerability & Endpoint Security

* **OpenVAS / Greenbone (GVM)**
* **Lynis** (baseline auditing approach)
* **ClamAV** (`freshclam`, `clamscan`)

### 🔥 Firewalls & Boundary Controls

* `ufw`, `iptables` (+ save/restore)
* Service management: `systemctl`

### 📊 Logging / SIEM / Monitoring

* `rsyslog`, `/var/log/auth.log`, `grep`, `tail`
* **Elastic Stack**: Elasticsearch + Kibana
* **Filebeat** (log shipper)
* **Wazuh** (manager/dashboard; endpoint alert validation)

### 💾 Backup / Recovery / Integrity

* `tar`, `gzip`, `cron`, `crontab`, `diff`, `sha256sum`

### 🔐 Secure Access & Encryption

* **OpenSSH** (SSH hardening)
* **Apache2 TLS** (OpenSSL cert generation + TLS handshake validation)
* **Nginx TLS** (HTTPS + redirect)
* **BitLocker** (Windows), **LUKS / cryptsetup** (Linux)
* Windows utilities: **7-Zip AES-256**, **VeraCrypt**

### ☁️ Cloud Security

* **OpenStack** (Horizon + CLI)
* Security groups (restrictive ingress rules)
* MFA workflow enforcement

</details

---

## 🗂️ Repository Structure

This repository is organized as a **30-lab defensive controls portfolio**:

```text
CIS-Top-20-Controls/
├─ 🔹 Security Foundations (Labs 1–15)
├─ 🔹 Security Hardening, Operations & Encryption (Labs 16–30)
└─ README.md
````

**Track Overview**

* **Labs 1–15:** Security Foundations (inventory, hardening, logging, boundary defense, encryption, access control)
* **Labs 16–30:** Operations & Enforcement (identity controls, patching, SIEM, cloud security, encryption validation, backup assurance)

## 🧱 Standard Lab Folder Structure

Each lab follows a consistent, GitHub-ready structure:

```text
labXX-lab-name/
├── README.md              # Objectives, steps, validation checklist
├── commands.sh            # Executed commands (copy/paste runnable where applicable)
├── output.txt             # Sanitized outputs (proof of validation)
├── reports/               # Findings, policies, configs, verification notes
├── troubleshooting.md     # Common issues + fixes
└── interview_qna.md       # (optional) interview-ready questions & answers
```

> This structure ensures **reproducibility**, **evidence capture**, and **portfolio-grade documentation** across all labs.

---

## 🎓 Learning Outcomes Across 30 Labs

After completing all 30 labs, this portfolio demonstrates the ability to:

- Build and reconcile **hardware & software asset inventories** with discovery validation
- Perform vulnerability scanning and document remediation priorities (OpenVAS/GVM)
- Enforce **least privilege** (admin access governance + need-to-know access models)
- Harden Linux and Windows systems using baseline security standards
- Implement deny-by-default firewall and boundary defense controls (UFW/iptables)
- Enable logging, perform log triage, and integrate events into SIEM workflows (ELK/Wazuh)
- Configure and validate encryption controls (BitLocker, LUKS, TLS/HTTPS)
- Design and test backup, restore, and integrity verification workflows (diff + hashes)
- Apply patch management and password/account policy enforcement
- Execute documented incident response containment and recovery steps
- Secure cloud instances by designing restrictive security group rules (OpenStack)

This is practical implementation — not theoretical configuration summaries.

---

## 🌍 Real-World Alignment

These labs are designed to mirror defensive security work performed in production environments:

- CIS-style baseline security control implementation and validation
- SOC visibility workflows: log collection → triage → alert thresholds
- Access governance: admin privilege control and need-to-know enforcement
- Boundary defense: firewalling, exposure reduction, and verification testing
- Encryption enforcement to meet data protection and compliance requirements
- Recovery assurance through backup verification and integrity checks
- Cloud hardening using least-exposure network security groups
- Incident readiness through documented response workflows and containment actions

All labs were executed in controlled lab environments using open-source tooling.

---

## 📈 Professional Relevance

This portfolio reflects capability aligned with:

- SOC Analyst (Tier 1 / Tier 2)
- Blue Team & Defensive Security roles
- System / Endpoint Hardening Engineer
- Security Operations Engineer
- Junior Security Administrator

It demonstrates:

- Security-first, validation-driven mindset
- Strong documentation and evidence discipline
- Practical implementation of baseline controls across OS, network, and cloud layers
- Repeatable verification workflows (ports, logs, backups, encryption behavior)

---

## 🧪 Real-World Simulation

All labs were executed in controlled environments and designed to simulate realistic **defensive security operations** workflows:

- **Asset visibility & exposure management** (inventory + scanning + reconciliation)
- **Hardening & secure configuration enforcement** (services, policies, SSH, Windows controls)
- **Monitoring & detection readiness** (audit logs, SIEM shipping, alert validation)
- **Boundary defense verification** (deny-by-default, allowed service checks, blocked port tests)
- **Data protection enforcement** (BitLocker/LUKS + TLS configuration + HTTPS redirects)
- **Recovery assurance** (backup restore validation with diff + hash verification)
- **Cloud security baselining** (restrictive security groups, removal of overly broad rules)
- **Incident readiness execution** (containment concepts + lifecycle documentation)

This repository represents operational defensive controls implementation — not theoretical notes.

---

# 📊 Security Skills Heatmap

This heatmap reflects **hands-on defensive controls implementation across 30 labs** in:

**Asset Governance • System Hardening • Access Control • Logging & SIEM • Encryption • Cloud Security • Recovery Assurance • Incident Readiness**

> Exposure bars represent depth of practical implementation and validation.

| Skill Area | Exposure Level | Practical Depth | Tools / Technologies Used |
|------------|----------------|----------------|---------------------------|
| 🗂 Asset Inventory & Discovery | ██████████ 100% | HW/SW inventory, Nmap reconciliation, exposure validation | nmap, dpkg-query, WMIC |
| 🔎 Vulnerability Scanning | █████████░ 90% | OpenVAS scanning, severity review, remediation documentation | OpenVAS / GVM |
| 👥 Least Privilege & Access Control | ██████████ 100% | sudo governance, group-based ACLs, permission validation | sudo, chmod, chown, PAM |
| 🖥 Endpoint Hardening (Linux) | ██████████ 100% | Service minimization, SSH hardening, baseline enforcement | systemctl, Lynis |
| 🪟 Endpoint Hardening (Windows) | █████████░ 90% | Policy enforcement, feature reduction, password controls | Local Security Policy |
| 🔥 Firewall & Boundary Defense | ██████████ 100% | Deny-by-default, rule validation, blocked port testing | UFW, iptables, nc |
| 📜 Logging & Audit Monitoring | █████████░ 90% | Auth log triage, suspicious pattern filtering | rsyslog, grep |
| 📡 SIEM Integration | █████████░ 90% | Log shipping, index validation, alert rule testing | ELK, Filebeat, Wazuh |
| ☁️ Cloud Security Baselines | ████████░░ 80% | Restrictive security groups, exposure reduction | OpenStack |
| 🔐 Encryption (Data at Rest) | █████████░ 90% | BitLocker, LUKS configuration + reboot validation | BitLocker, cryptsetup |
| 🌐 Encryption (Data in Transit) | █████████░ 90% | TLS config, HTTPS enforcement, redirect validation | Apache, Nginx, OpenSSL |
| 💾 Backup & Recovery Assurance | ██████████ 100% | tar backups, restore validation, diff + hash integrity checks | tar, diff, sha256sum |
| 🔄 Patch & Policy Enforcement | █████████░ 90% | OS updates, password complexity, expiration validation | apt, Windows Update |
| 🚨 Incident Response Readiness | ████████░░ 80% | IR phase documentation, containment concepts | ClamAV, firewall controls |

## 📌 Proficiency Scale

- ██████████ = Implemented end-to-end with validation & documented evidence  
- █████████░ = Strong working implementation with practical verification  
- ████████░░ = Functional exposure with applied context  

This heatmap reflects **operational defensive capability**, not isolated configuration steps — covering:

> Inventory → Hardening → Monitoring → Access Control → SIEM → Cloud → Encryption → Recovery → Incident Readiness

---

## 🧪 How To Use

```bash
# Clone repository
git clone https://github.com/abdul4rehman215/CIS-Top-20-Controls.git
cd CIS-Top-20-Controls

# Open any lab
cd labXX-name

# Review documentation
cat README.md

# Execute commands (if applicable)
bash commands.sh

# Review outputs / reports
cat output.txt
````

Each lab is self-contained and follows a structured defensive workflow:

1. **Objective** – What control is being implemented
2. **Implementation** – Commands & configuration steps
3. **Validation** – Proof via logs, port checks, policy enforcement, encryption behavior, or restore testing
4. **Artifacts** – Config snippets, reports, sanitized outputs
5. **Troubleshooting Notes** – Operational considerations

---

### 📂 Lab Structure

```
labXX-name/
│
├── README.md
├── commands.sh (or documented command blocks)
├── output.txt (sanitized validation outputs)
├── reports/
└── troubleshooting.md
```

---

This repository is designed to be:

* 📘 Educational (defensive security training)
* 🔍 Validation-focused (controls are tested, not just configured)
* 🛡️ Aligned with CIS-style baseline implementation
* 📎 Interview-ready (clear evidence of hands-on execution)

---

## 🧪 Execution Environment

All 30 labs were executed in controlled lab environments designed to simulate real defensive security operations.

### Environment Characteristics

- **Ubuntu 24.04 LTS** (primary lab host)
- **Windows 11 Pro** (policy, encryption, and endpoint testing)
- **OpenStack cloud instances** (security group & exposure control testing)
- Open-source security tooling (OpenVAS, Lynis, ELK, Wazuh, ClamAV, UFW, iptables)
- Segmented test networks for firewall and boundary validation
- Local TLS/HTTPS deployments for encryption verification
- Backup and restore simulations using non-production datasets

Controls were not only configured — they were validated through:

- Port verification tests
- Log generation & SIEM indexing checks
- Encryption behavior validation (reboot + access tests)
- Backup restore + integrity comparisons (diff + sha256sum)

This portfolio reflects implementation + verification, not configuration alone.

---

## 🎯 Intended Use

This repository is designed to support:

- Defensive security training
- SOC operations skill development
- System & endpoint hardening practice
- Secure configuration validation workflows
- Encryption and recovery assurance testing
- Cloud baseline security implementation
- Incident response documentation exercises

All techniques are demonstrated strictly within authorized lab environments and are intended for defensive security improvement.

---

## ⚖️ Ethical & Legal Notice

All research, simulations, and security control testing in this repository were conducted:

- In isolated, authorized lab environments
- Against self-configured or intentionally vulnerable systems
- Using synthetic or non-sensitive datasets
- For educational and professional defensive development purposes

No production systems were targeted.
No unauthorized access was performed.

The techniques demonstrated are intended solely for responsible defensive security implementation and training.

---

# ⭐ Final Note

This repository reflects **real, execution-first defensive security work** — not theoretical configuration notes.

It demonstrates the ability to implement and validate controls across the full defensive lifecycle:

> **Inventory → Hardening → Access Control → Monitoring → SIEM → Encryption → Recovery → Enforcement**

Security engineering is not just configuration.  
It is **control implementation + validation + repeatability.** 🛡️

If this portfolio adds value, consider starring ⭐ the repository.

---

## 👨‍💻 Author

**Abdul Rehman**

Defensive Security • SOC Operations • System Hardening • SIEM • Cloud Baselines • Encryption Controls

### 📧 Reach Out

  <a href="https://github.com/abdul4rehman215">
    <img src="https://img.shields.io/badge/Follow-181717?style=for-the-badge&logo=github&logoColor=white" alt="Follow" />
  </a>  
  <a href="https://linkedin.com/in/abdul4rehman215">
     <img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white&v=1" />
  </a>
  <a href="mailto:abdul4rehman215@gmail.com">
    <img src="https://img.shields.io/badge/Email-EE0000?style=for-the-badge&logo=gmail&logoColor=white" />
  </a>

---

