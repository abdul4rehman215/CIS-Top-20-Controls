# 🛠️ Troubleshooting Guide — Lab 26: Endpoint Security Tool Introduction (Wazuh)

> This guide covers common issues when installing Wazuh Manager, verifying service status, accessing the dashboard, and validating alerts using the EICAR test pattern.

---

## 1) Wazuh repo setup script fails to download
### Symptoms
- `curl: (6) Could not resolve host`
- `curl: (7) Failed to connect`
- empty or missing `setup_repo.sh`

### Fix
- Verify internet/DNS:
  - `ping -c 2 packages.wazuh.com`
- Retry:
  - `curl -sO https://packages.wazuh.com/4.x/apt/setup_repo.sh`
- Confirm file exists:
  - `ls -l setup_repo.sh`

---

## 2) `sudo bash setup_repo.sh` fails (GPG or repo errors)
### Symptoms
- GPG key import errors
- repository not added
- apt update fails after script

### Fix
- Re-run script with sudo
- Confirm repo file exists:
  - `ls -l /etc/apt/sources.list.d/wazuh.list`
- Refresh package cache:
  - `sudo apt-get update`

---

## 3) `apt-get install wazuh-manager` fails
### Symptoms
- package not found
- dependency errors

### Fix
- Ensure repo was added successfully (step 2)
- Run:
  - `sudo apt-get update`
- Retry install:
  - `sudo apt-get install wazuh-manager -y`

---

## 4) Wazuh Manager service is not running
### Symptoms
- `Active: failed`
- service exits repeatedly

### Fix
- Check logs:
  - `sudo journalctl -u wazuh-manager -n 80 --no-pager`
- Confirm disk space and memory availability
- Restart:
  - `sudo systemctl restart wazuh-manager`
- Re-check:
  - `sudo systemctl status wazuh-manager --no-pager`

---

## 5) Wazuh Dashboard not reachable
### Symptoms
- browser can’t connect
- TLS warning or certificate issues
- login fails

### Causes
- dashboard/indexer not installed (common in real deployments)
- wrong URL or IP
- firewall/security group restrictions

### Fix
- Confirm correct URL provided by the lab (some deployments use a separate host)
- If self-signed cert, accept warning in lab VM
- If dashboard is separate, ensure network access and correct port
- Document limitation if dashboard is not part of the environment

---

## 6) Alerts file not found: `/var/ossec/logs/alerts/alerts.json`
### Causes
- different Wazuh configuration
- alerts output disabled
- path exists but no alerts generated yet

### Fix
- Verify directory exists:
  - `sudo ls -lah /var/ossec/logs/alerts/`
- Search Wazuh logs:
  - `sudo ls -lah /var/ossec/logs/`
- Generate a new event and retry tailing the file.

---

## 7) EICAR file created but no alert appears
### Causes
- file integrity monitoring (FIM) not enabled for that directory
- Wazuh modules not configured to detect EICAR string specifically
- delay in alert processing

### Fix
- Wait a short moment and re-check alerts.json
- Force modification/access events:
  - `touch eicar.com`
  - `cat eicar.com`
- Confirm Wazuh service is running and analysis is active
- Check Wazuh logs for errors:
  - `sudo tail -n 100 /var/ossec/logs/ossec.log`

---

## 8) Dashboard shows no alerts even though alerts.json has entries
### Causes
- dashboard not connected to manager/indexer correctly
- wrong time range in UI
- wrong index or filtering

### Fix
- Expand time range (Last 24h)
- Search using a unique marker (e.g., `eicar` or directory name)
- Confirm “Manager connected” status in dashboard

---

## 9) High resource usage after install
### Symptoms
- CPU/memory spikes
- slow system response

### Fix
- Verify VM sizing is sufficient
- Check processes:
  - `top`
- In labs, allow system to stabilize after service start
- Consider disabling non-required modules in advanced setups (not required for this lab)

---

## 10) Repo safety: don’t commit sensitive endpoint logs
### Best practice
Store:
- simulated outputs
- sanitized alerts
- safe test artifacts (EICAR)

Avoid committing:
- real production logs with usernames/IPs
- credentials, tokens, private keys
