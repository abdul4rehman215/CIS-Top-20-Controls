# 🧪 Lab 26: Endpoint Security Tool Introduction (Wazuh) — CIS Controls

**Environment:** Ubuntu 24.04.1 LTS (Cloud Lab Environment)  
**User:** `toor`  
**Endpoint Security Tool (Lab):** Wazuh Manager (open-source)  
**Note:** Outputs are **sample/simulated** from an authorized lab environment and formatted like a real GitHub lab run.

---

## 🎯 Objectives

This lab introduced endpoint security tooling through Wazuh by:

- Understanding the role of endpoint security tools (endpoint monitoring + alerting)
- Installing and validating an endpoint security solution (Wazuh Manager)
- Verifying reporting into a centralized dashboard (Wazuh Dashboard)
- Triggering safe test activity (EICAR) to validate detection and alert generation

---

## ✅ Prerequisites

- Ubuntu-compatible system with administrative privileges
- Internet access for package downloads
- Basic understanding of endpoint security concepts
- Familiarity with Linux CLI and systemd services

---

## 🧩 Lab Tasks Overview

### ✅ Task 1: Install an Endpoint Security Solution (Wazuh Manager)

**1) Prepare environment**
- Updated package lists using apt

**2) Install Wazuh repository + manager**
- Downloaded and ran Wazuh APT repository setup script
- Installed `wazuh-manager` package
- Verified service is enabled and running via systemd

**Validation:**
- `systemctl status wazuh-manager` shows active/running

---

### ✅ Task 2: Configure Dashboard Reporting (Visibility)

- Accessed Wazuh Dashboard in browser (lab environment pre-configured)
- Verified:
  - Manager connected
  - Local agent visibility
  - Alerts visible in Security Events panel

**Note:** In real deployments, Wazuh typically includes separate components (Indexer + Dashboard). In this lab, the dashboard stack was pre-configured.

---

### ✅ Task 3: Trigger Alerts (Safe Test)

**EICAR test file**
- Created an `eicar.com` test file containing the standard EICAR string
- Verified file exists and generated file access activity (`cat eicar.com`)
- Confirmed detection by checking Wazuh alert logs:
  - `/var/ossec/logs/alerts/alerts.json`

**Validation:**
- Alert entries present showing:
  - file path
  - rule id / rule level
  - agent name
- Alert searchable in Wazuh Dashboard

> EICAR is a benign test pattern, not real malware.

---

## 📁 Repository Structure

```

lab26-endpoint-security-tool-introduction/
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
├── troubleshooting.md
├── configs/
│   └── wazuh_repo_setup_notes.md
├── tests/
│   └── eicar_test_procedure.md
└── artifacts/
└── eicar.com

```
 
> This lab uses safe placeholders and a benign test pattern (EICAR).

---

## ✅ Verification & Validation

This lab was validated through:

- Repository installation and manager setup:
  - APT repo setup script executed successfully
  - `apt-get install wazuh-manager` completed
- Service state verification:
  - `systemctl status wazuh-manager` shows active/running
- Dashboard visibility verification:
  - login successful
  - manager connected
  - alerts visible/searchable
- Detection verification:
  - EICAR test file created and accessed
  - Wazuh alert entries appear in `alerts.json`
  - dashboard shows alert by searching/filtering for `eicar`

---

## 🧠 What I Learned

- Endpoint security tools help detect, record, and alert on suspicious behavior at the host level
- Wazuh can provide:
  - file integrity monitoring
  - alerting and correlation
  - dashboard-based investigation
- Safe test artifacts like EICAR are essential for validating monitoring pipelines without real malware
- Verification should be done via:
  - local logs
  - dashboard visibility/search

---

## 🌍 Why This Matters

Endpoint compromise is one of the most common starting points for attacks. An endpoint security tool helps:

- detect suspicious file activity and behavior early
- improve incident response with searchable evidence
- standardize monitoring across hosts

---

## ✅ Result

✅ Wazuh Manager installed and verified running  
✅ Dashboard reporting verified (manager connected, alerts visible)  
✅ EICAR test file created and detection confirmed (alerts.json + dashboard) 🚀

---

## 🏁 Conclusion

This lab demonstrated an endpoint security validation workflow:

**Install endpoint tool → verify service → confirm dashboard reporting → trigger safe test → validate alerts**

✅ Lab completed successfully using Wazuh as an open-source endpoint security solution.

===
