# 🧪 Lab 24: SIEM Integration for Logs (CIS Controls)

**Environment:** Ubuntu 24.04.1 LTS (Cloud Lab Environment)  
**User:** `toor`  
**Test Host:** `ip-172-31-10-176`  
**Network Interface:** `ens5`  
**SIEM Stack (Lab):** ELK (Elasticsearch + Kibana)  
**Log Shipper:** Filebeat → Elasticsearch  
**Note:** Outputs below are **sample/simulated** from an authorized lab environment and formatted like a real lab run for GitHub documentation.

---

## 🎯 Objectives

In this lab, I learned how to:

- Install and configure a log forwarder (**Filebeat**) on a Linux host
- Send system logs to a SIEM endpoint (**Elasticsearch**)
- Validate that logs are being indexed and searchable
- Confirm visibility in the SIEM search interface (Kibana Discover / Elasticsearch query)
- Create and test a basic alert rule based on a failed-login threshold pattern

---

## ✅ Prerequisites

- Basic understanding of logging and SIEM concepts
- Administrative privileges on test host
- A working SIEM endpoint (ELK) to receive logs
- Network access between shipper and SIEM endpoint
- Familiarity with Linux terminal and basic HTTP queries (curl)

---

## 🧩 Lab Tasks Overview

### ✅ Task 1: Set Up a Log Forwarder (Filebeat)

**1) Prepare lab workspace**
- Created a structured workspace for packages/configs/tests/notes

**2) Install Filebeat**
- Downloaded Filebeat `.deb` package from Elastic artifacts
- Installed via `dpkg`
- Verified Filebeat version

**3) Configure Filebeat**
- Backed up default config
- Updated `/etc/filebeat/filebeat.yml` to:
  - collect log files from `/var/log/*.log`
  - ship logs directly to Elasticsearch at `localhost:9200`
- Validated configuration syntax:
  - `filebeat test config`
- Validated output connectivity:
  - `filebeat test output`

**4) Start Filebeat**
- Started filebeat service and verified status

---

### ✅ Task 2: Send Logs to SIEM (Generate + Ship Events)

**1) Generate test authentication events**
- Used `logger` to write authpriv warning events containing a unique marker:
  - `LAB24_TEST`
- Generated a burst of repeated failures to simulate threshold-based detection
- Verified events exist locally in `/var/log/auth.log`

**2) Verify indexing in Elasticsearch**
- Confirmed Filebeat index exists via `_cat/indices`
- Searched Filebeat indices for the marker pattern:
  - `message:LAB24_TEST`

This confirmed logs were shipped, ingested, and searchable.

---

### ✅ Task 3: Verify SIEM Integration (Dashboards + Alerting)

**1) Verify in Kibana (documented)**
- Used Kibana Discover:
  - index pattern: `filebeat-*`
  - query: `LAB24_TEST`
- Confirmed fields such as:
  - `host.hostname`
  - `log.file.path`
  - `message`
  - `@timestamp`

**2) Create a custom alert (documented)**
- Rule name: `LAB24 - Failed Login Threshold`
- Index: `filebeat-*`
- Condition: more than 5 matching events in 5 minutes
- Query: `message:"LAB24_TEST: failed login"`
- Action: Log / Email (lab simulation)

**3) Trigger alert condition**
- Generated another burst of failed-login messages
- Confirmed count in Elasticsearch
- Confirmed alert fired in Kibana Alerts UI (documented)

---

## 📁 Repository Structure

```

lab24-siem-integration-for-logs/
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
├── troubleshooting.md
├── configs/
│   ├── filebeat.yml
│   └── filebeat.yml.bak
├── notes/
│   ├── kibana_verification.md
│   └── alert_rule_definition.md
└── tests/
└── lab24_test_events.md

```id="7z2rzi"

> Passwords in configs are kept as lab placeholders (example only).  
> In real environments, secrets should be stored using secure keystores or secret managers (not committed).

---

## ✅ Verification & Validation

The SIEM integration was validated through:

- Filebeat installed and version verified:
  - `filebeat version`
- Filebeat config verified:
  - `filebeat test config` → Config OK
- Filebeat output verified:
  - `filebeat test output` → reachable Elasticsearch, version returned
- Filebeat service active:
  - `service filebeat status` shows active/running
- Local log generation confirmed:
  - `grep "LAB24_TEST" /var/log/auth.log`
- Elasticsearch indexing confirmed:
  - `_cat/indices` shows `filebeat-*`
- Search confirmed ingestion:
  - `_search?q=message:LAB24_TEST` returns events
- Alert testing confirmed:
  - `_count` confirms threshold test events
  - Kibana Alerts UI shows rule triggered (documented)

---

## 🧠 What I Learned

- Log shipping requires both:
  - correct input configuration (what files to watch)
  - correct output configuration (where to send logs)
- Unique markers (like `LAB24_TEST`) are extremely helpful for testing pipelines
- Elasticsearch queries provide quick validation even before dashboards are built
- Alerting is most effective when rules are based on:
  - patterns (failed logins)
  - thresholds/time windows (burst behavior)
- Proper SIEM integration is foundational for correlation, detection, and incident response workflows

---

## 🌍 Why This Matters

Centralized logging is essential for:
- detecting brute-force attempts and authentication abuse
- correlating events across systems
- incident response investigations (timelines and evidence)
- compliance and audit requirements

A working SIEM pipeline (shipper → index → search → alert) is a core SOC capability.

---

## ✅ Result

✅ Filebeat installed and configured to monitor `/var/log/*.log`  
✅ Logs shipped and indexed in Elasticsearch (`filebeat-*`)  
✅ Verified events using Elasticsearch search and Kibana Discover  
✅ Custom alert created and successfully triggered using simulated failed-login events 🚀

---

## 🏁 Conclusion

This lab demonstrated end-to-end SIEM log integration:

**Install shipper → configure inputs/outputs → ship events → verify index/search → create alert → trigger and validate**

✅ Lab completed successfully with a working Filebeat → Elasticsearch pipeline and tested alert logic.

---
