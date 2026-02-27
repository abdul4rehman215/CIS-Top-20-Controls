# 🛠️ Troubleshooting Guide — Lab 24: SIEM Integration for Logs (Filebeat → Elasticsearch)

> This guide covers common issues when installing Filebeat, shipping logs to Elasticsearch, validating ingestion, and testing alerts in a lab ELK environment.

---

## 1) Filebeat `.deb` download fails (curl errors)
### Symptoms
- 404 Not Found
- connection timeout
- SSL/TLS errors

### Fix
- Confirm the version exists and URL is correct.
- Retry download:
  - `curl -L -O <url>`
- Verify network access:
  - `ping -c 2 artifacts.elastic.co`
- If proxy restrictions exist, configure proxy environment variables.

---

## 2) `dpkg -i` fails due to missing dependencies
### Symptoms
- dependency errors during dpkg install

### Fix
- Install missing deps automatically:
  - `sudo apt-get -f install -y`
- Then rerun:
  - `sudo dpkg -i filebeat-<version>-amd64.deb`

---

## 3) Filebeat fails `test config`
### Symptoms
- YAML indentation errors
- unknown keys
- “error loading config file”

### Fix
- YAML is indentation-sensitive (spaces, not tabs).
- Validate:
  - `sudo filebeat test config`
- Re-check your `filebeat.inputs` indentation.

---

## 4) Filebeat `test output` fails to connect to Elasticsearch
### Symptoms
- connection refused
- timeout
- authentication errors

### Fix
- Verify Elasticsearch is running:
  - `curl -s http://localhost:9200`
- Verify correct host/port in config.
- If Elasticsearch is remote:
  - confirm firewall/security group access
  - confirm routing and DNS
- If authentication is enabled:
  - confirm username/password or use the Filebeat keystore

---

## 5) Warning: `TLS... WARN secure connection disabled`
### Explanation
This happens when Elasticsearch is using HTTP (no TLS). It’s acceptable for labs, but in production you should enable TLS.

### Fix (production mindset)
- Use HTTPS endpoints and certificates
- Configure Filebeat with SSL settings and secure credentials storage

---

## 6) Filebeat service won’t start
### Symptoms
- `service filebeat status` shows failed
- systemd logs show config error

### Fix
- Check service logs:
  - `sudo journalctl -u filebeat -n 50 --no-pager`
- Validate config:
  - `sudo filebeat test config`
- Fix YAML and restart:
  - `sudo service filebeat restart`

---

## 7) Logs exist locally but don’t appear in Elasticsearch
### Causes
- wrong input paths
- Filebeat not harvesting the intended file
- permissions issues
- Elasticsearch output misconfigured

### Fix
- Confirm log exists:
  - `ls -l /var/log/auth.log`
- Confirm Filebeat input path matches:
  - `/var/log/*.log` (auth.log fits)
- Check Filebeat internal logs:
  - `sudo journalctl -u filebeat -n 200 --no-pager`
- Generate a new log line and retry search.

---

## 8) Index not created (`filebeat-*` missing)
### Fix
- Verify Elasticsearch health:
  - `curl -s http://localhost:9200/_cluster/health?pretty`
- Restart Filebeat after config:
  - `sudo service filebeat restart`
- Re-check indices:
  - `curl -s http://localhost:9200/_cat/indices?v | head`

---

## 9) Elasticsearch query returns 0 hits for test marker
### Causes
- query syntax mismatch
- ingestion delay
- events in a different field

### Fix
- Widen query:
  - `q=LAB24_TEST`
- Increase time / size:
  - `size=10`
- Verify local log grep shows entries exist.
- Check Kibana Discover time range (Last 15 min vs Last 24h).

---

## 10) Kibana Discover shows nothing even though Elasticsearch has hits
### Causes
- wrong index pattern
- wrong time range
- Kibana not connected to correct ES instance

### Fix
- Ensure index pattern is `filebeat-*`
- Expand time range (Last 24 hours)
- Verify Kibana is connected to the same Elasticsearch cluster.

---

## 11) Alert rule doesn’t trigger
### Causes
- threshold not met
- time window too small
- query mismatch
- ingestion delay

### Fix
- Confirm event count using Elasticsearch `_count` query
- Ensure query matches exact message text
- Trigger more events (burst)
- Ensure alert rule is enabled and action configured

---

## 12) Security best practice: don’t commit real credentials
### Reminder
This lab used placeholder credentials in config (`elastic/changeme`).  
In production:
- use Filebeat keystore
- use secret managers
- avoid committing passwords into repositories
