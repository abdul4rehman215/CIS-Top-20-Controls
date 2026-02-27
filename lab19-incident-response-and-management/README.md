# 🧪 Lab 19: Incident Response & Management (CIS Controls)

**Environment:** CentOS Linux 7 (Core) (Cloud Lab Environment)  
**User:** `centos`  
**Shell Prompt Style:** `-bash-4.2$`  
**Primary Interface:** `eth0`  
**Focus Area:** CIS Control — Incident Response & Management

---

## 🎯 Lab Objectives

This lab builds practical incident response fundamentals and reinforces a structured workflow for handling security incidents.

By the end of this lab, I was able to:

- Understand and document key Incident Response (IR) team roles and responsibilities
- Apply the incident handling lifecycle:
  - **Detection**
  - **Containment**
  - **Eradication**
  - **Recovery**
- Practice a scenario-based workflow for a **malware infection** using open-source tools:
  - **Suricata** (network monitoring / IDS)
  - **ClamAV** (malware scanning / removal)
  - **iptables** (host-based containment)

---

## ✅ Prerequisites

- Basic cybersecurity concepts
- Familiarity with command-line and basic networking
- Access to one or more open-source security tools (ClamAV / Suricata)
- Administrative privileges (sudo) to install tools and apply containment rules

---

## 🧩 Lab Tasks Overview

### ✅ Task 1: Outline Roles and Responsibilities
- Created an IR documentation workspace
- Documented key roles in incident response:
  - **Incident Lead** (coordination and decisions)
  - **Communication Lead** (stakeholder updates + consistent messaging)
- Included supporting roles to reflect real-world IR teams:
  - SOC Analyst / Detection Engineer
  - System Administrator
  - Forensics / Malware Analyst

**Deliverable created:**
- `docs/roles_responsibilities.md`

---

### ✅ Task 2: Define Basic Steps in Incident Handling

This lab followed the classic incident handling workflow:

#### 1) Detection
- Installed and validated **Suricata**
- Started Suricata in LIVE mode on `eth0` to confirm monitoring capability

#### 2) Containment
- Identified the host IP configuration on `eth0`
- Implemented containment by blocking suspected malicious traffic sources using **iptables**
- Used a lab-safe documentation IP:
  - `203.0.113.55` (TEST-NET-3, safe for examples)

#### 3) Eradication
- Installed **ClamAV**
- Updated the malware signatures using `freshclam`
- Performed a recursive scan and removal action:
  - Detected and removed an **EICAR test file** (safe simulation)

#### 4) Recovery
- Applied OS updates using **yum** (correct for CentOS 7)
- Performed quick health checks (`uptime`, `free -m`)
- Confirmed stable system state post-response actions

---

### ✅ Task 3: Scenario-Based Exercise (Malware Infection)

Scenario:
- A system was reported with slow performance and network traffic spikes.

Response flow practiced:

1) **Detection:** Suricata live monitoring on `eth0`  
2) **Containment:** iptables rule to block simulated infected host IP:
   - `172.31.22.120` (realistic same-subnet example)  
3) **Eradication:** freshclam + clamscan removal  
4) **Recovery:** yum update + performance validation

This mirrors real IR operations: detect → contain → remove threat → restore and validate.

---

## 📁 Repository Structure

```

lab19-incident-response-and-management/
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
├── troubleshooting.md
└── Lab19_IR/
├── docs/
│   └── roles_responsibilities.md
├── logs/
└── notes/

```

> Note: `logs/` and `notes/` folders were created as part of the workspace structure. This run focused on documentation + execution outputs; additional logs/notes can be added later if captured from Suricata/ClamAV output files.

---

## ✅ Verification & Validation

This lab’s successful completion was validated through:

- Workspace path confirmation:
  - `pwd` showed `/home/centos/Lab19_IR`
- Suricata installation verified:
  - `suricata -V` succeeded after install
- Suricata live monitoring confirmed:
  - Suricata started in LIVE mode on `eth0`
- Containment verified:
  - `iptables -L INPUT -n --line-numbers` confirmed DROP rules were added
- ClamAV installation + database update verified:
  - `freshclam` updated signatures successfully
- Malware eradication simulated safely:
  - EICAR test file detected and removed (`FOUND` → `Removed`)
  - Second scan confirmed `Infected files: 0`
- Recovery verified:
  - `yum update -y` applied updates
  - `uptime` and `free -m` confirmed system stability

---

## 🧠 What I Learned

- Incident response is both **technical** and **organizational**:
  - Clear roles prevent confusion under pressure
  - Communication must be controlled and consistent
- Detection tools must be available **before** incidents happen (preparedness matters)
- Containment should prioritize stopping spread while preserving evidence
- Eradication must be validated (repeat scan / confirm no remaining infection)
- Recovery includes patching and monitoring to prevent re-infection or persistence
- Platform awareness matters:
  - recovery commands differ across distros (yum vs apt)

---

## 🌍 Why This Matters

Strong incident response capability reduces:

- downtime and operational impact
- data loss and lateral spread
- long-term persistence risk

Organizations that practice IR workflows respond faster, reduce damage, and improve resilience through post-incident learning.

---

## 🧰 Real-World Applications

- SOC and IR team operations (alerts → triage → response)
- Host-level containment during active incidents
- Malware eradication using endpoint tooling
- Evidence preservation and reporting
- Recovery and patch management as part of secure operations

---

## ✅ Result

✅ IR roles and responsibilities documented  
✅ Detection capability validated using Suricata (LIVE IDS mode)  
✅ Containment applied using iptables rules (malicious + infected host simulation)  
✅ Eradication performed using ClamAV (EICAR detected and removed)  
✅ Recovery completed via yum updates + health checks  

---

## 🏁 Conclusion

This lab introduced core **Incident Response & Management** practices and reinforced a repeatable incident handling workflow using open-source tools.

✅ Lab completed successfully in a CentOS 7 cloud lab environment.

---
