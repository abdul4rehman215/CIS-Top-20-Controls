# 🎤 Interview Q&A — Lab 24: SIEM Integration for Logs (Filebeat → Elasticsearch)

> Below are interview-style questions and answers based on the Filebeat deployment, Elasticsearch ingestion validation, and alert testing performed in this lab.

---

## 1) What is a SIEM and why is it useful?
A SIEM (Security Information and Event Management) centralizes logs from multiple systems, enabling correlation, investigation, dashboards, and alerting. It helps detect threats (e.g., brute force, suspicious authentication patterns) and supports incident response with searchable evidence.

---

## 2) Why did you use Filebeat in this lab?
Filebeat is a lightweight log shipper from Elastic that monitors log files and forwards events to Elasticsearch or Logstash. It’s commonly used to build a reliable ingestion pipeline into an ELK-based SIEM.

---

## 3) What log sources did you configure Filebeat to collect?
I configured Filebeat to collect:
- `/var/log/*.log`

This includes common system logs such as auth logs, syslog, and other `.log` files.

---

## 4) Where did Filebeat send logs in this lab?
Filebeat sent logs directly to Elasticsearch:
- `hosts: ["localhost:9200"]`

This confirmed local SIEM endpoint connectivity in the lab environment.

---

## 5) Why did you back up `filebeat.yml` before editing it?
Because configuration changes can break ingestion. A backup allows quick rollback to restore working defaults if syntax errors or incorrect output settings cause Filebeat to fail.

---

## 6) How did you validate the Filebeat configuration syntax?
Using:
- `sudo filebeat test config`

Output:
- `Config OK`

---

## 7) How did you validate connectivity to Elasticsearch?
Using:
- `sudo filebeat test output`

This confirmed:
- DNS resolution
- connection to localhost:9200
- successful handshake with Elasticsearch and version detection

---

## 8) How did you verify Filebeat was running as a service?
Using:
- `sudo service filebeat status`

The output showed:
- `Active: active (running)` and the Filebeat main PID.

---

## 9) How did you generate logs to test ingestion?
I generated test authentication log entries using:
- `logger -p authpriv.warning "LAB24_TEST: ..."`

Then created multiple events in a loop to simulate bursts and threshold behavior.

---

## 10) Why did you use a unique marker like `LAB24_TEST`?
A unique marker makes verification easy:
- you can search logs locally (`grep`)
- you can query Elasticsearch or Kibana for that exact token
It reduces confusion with background system logs.

---

## 11) How did you confirm the events existed locally before checking SIEM?
By searching the auth log:
- `sudo grep "LAB24_TEST" /var/log/auth.log | tail -n 8`

This confirmed log generation worked locally before checking shipping/indexing.

---

## 12) How did you verify Filebeat created an index in Elasticsearch?
Using:
- `curl -s http://localhost:9200/_cat/indices?v`

This showed a `filebeat-*` index such as:
- `filebeat-8.12.2-2026.02.28`

---

## 13) How did you verify the test logs were searchable in Elasticsearch?
Using a search query:
- `curl -s "http://localhost:9200/filebeat-*/_search?q=message:LAB24_TEST&size=3"`

The results showed:
- messages containing LAB24_TEST
- fields like `host.hostname` and `log.file.path`

---

## 14) What alert did you create and what was the trigger condition?
Alert created:
- `LAB24 - Failed Login Threshold`

Trigger:
- **More than 5 matching events in 5 minutes**
- Query:
  - `message:"LAB24_TEST: failed login"`

---

## 15) How did you test the alert rule?
I generated another burst of matching events and verified ingestion count using:
- `_count` query for the burst pattern

Then confirmed the rule was **TRIGGERED** in the Kibana Alerts UI (documented).

---

## 16) What is a common operational risk with shipping all `/var/log/*.log`?
It may ingest too much data (noise), increasing storage and making detection harder. In real deployments, you typically:
- enable specific Filebeat modules
- filter by log type (auth, syslog, nginx, etc.)
- apply parsing/normalization rules

---

## 17) Why is this lab important for SOC workflows?
Because it demonstrates an end-to-end monitoring pipeline:
**generate logs → ship logs → index logs → search logs → alert on patterns**

This is the foundation of detection engineering, incident triage, and investigations.
