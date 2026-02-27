# 🛠️ Troubleshooting Guide — Lab 06: Monitoring & Analysis of Audit Logs (CIS Control 6)

> This guide covers common issues when enabling, collecting, and analyzing audit logs on Windows and Linux.

---

## 1) Windows Security log is empty or missing expected events

### ✅ Problem
Event Viewer → Windows Logs → Security shows few/no logon success/failure entries.

### 💡 Cause
Audit policies may not be enabled for required categories, or system activity has not generated events yet.

### ✅ Resolution
- Open Local Security Policy:
  - `secpol.msc`
- Enable Success/Failure for:
  - Audit account logon events
  - Audit logon events
  - Audit account management
- Generate a test event (e.g., log off/on or attempt a failed login on a test account).

---

## 2) `secpol.msc` not available

### ✅ Problem
`secpol.msc` does not open.

### 💡 Cause
Some Windows editions may not include Local Security Policy (commonly Home).

### ✅ Resolution
Use a Windows edition that supports it (Pro/Enterprise/Education), or configure auditing using other administrative tools/policy methods in supported environments.

---

## 3) Can’t export Windows Security logs to EVTX

### ✅ Problem
“Save All Events As…” fails or is blocked.

### 💡 Cause
- Insufficient permissions
- File path restrictions
- Disk space issues

### ✅ Resolution
- Run Event Viewer as Administrator
- Export to a user-writable path:
  - `C:\Users\<User>\Desktop\Security.evtx`
- Ensure enough disk space is available.

---

## 4) Linux: `/var/log/auth.log` doesn’t exist

### ✅ Problem
`/var/log/auth.log` is missing or empty.

### 💡 Cause
- Logging configuration differs across distros
- Some systems rely primarily on `journalctl` (systemd journal)
- rsyslog may not be installed or running

### ✅ Resolution
- Confirm rsyslog is installed and running:
```bash
systemctl status rsyslog --no-pager
````

* Confirm auth logging rule exists in `/etc/rsyslog.conf`:

```bash
sudo grep -n "auth\.\*" /etc/rsyslog.conf
```

* Restart rsyslog:

```bash
sudo systemctl restart rsyslog
```

* If system uses journald heavily, use:

```bash
sudo journalctl | grep -i sshd | tail -n 50
sudo journalctl _COMM=sshd | tail -n 50
```

---

## 5) `sudo systemctl restart rsyslog` fails

### ✅ Problem

Restart fails or rsyslog service not found.

### 💡 Cause

rsyslog may not be installed, disabled, or replaced depending on system logging configuration.

### ✅ Resolution

* Install rsyslog (Ubuntu/Debian):

```bash
sudo apt update
sudo apt install rsyslog -y
```

* Enable and start:

```bash
sudo systemctl enable --now rsyslog
```

---

## 6) Permission denied when copying `/var/log/auth.log`

### ✅ Problem

`cp /var/log/auth.log ~/log_analysis/` fails with permission denied.

### 💡 Cause

`/var/log/auth.log` is often readable only by root or certain groups (e.g., `adm`).

### ✅ Resolution

Copy using sudo:

```bash
sudo cp /var/log/auth.log ~/log_analysis/
```

Then adjust ownership if needed (optional):

```bash
sudo chown "$USER":"$USER" ~/log_analysis/auth.log
```

---

## 7) `grep 'Failed' auth.log` returns nothing

### ✅ Problem

No failed login attempts appear in output.

### 💡 Cause

* No failed events occurred
* Different log patterns (varies by auth method)
* SSH service may not be installed or used

### ✅ Resolution

* Search for other authentication markers:

```bash
grep -i "authentication failure" auth.log | tail
grep -i "sshd" auth.log | tail
```

* Generate test failures in a controlled way (only in a lab environment).

---

## 8) IP extraction command doesn’t output expected results

### ✅ Problem

This command doesn’t show correct IP counts:

```bash
grep "Failed password" auth.log | awk '{print $(NF-3)}'
```

### 💡 Cause

Log format may differ across versions, or “Failed password” line structure differs.

### ✅ Resolution

Confirm the field position by printing the full line and counting fields:

```bash
grep "Failed password" auth.log | head -n 1
```

Alternative approach: extract “from <IP>” robustly:

```bash
grep "Failed password" auth.log | awk '{for (i=1;i<=NF;i++) if ($i=="from") print $(i+1)}' | sort | uniq -c | sort -nr | head
```

---

## 9) Event Viewer filter doesn’t show “Logon Failure”

### ✅ Problem

Filtering for “Logon Failure” shows nothing.

### 💡 Cause

* Auditing not enabled for failures
* The event text differs; using Event IDs is more reliable

### ✅ Resolution

Filter by Event ID (common examples):

* **4625** = failed logon
* **4624** = successful logon
  (Exact IDs depend on Windows version and auditing configuration)

---

## ✅ Final Tip: Make Log Analysis Repeatable

For consistent investigations:

* centralize logs into an analysis folder
* store commands used and outputs as evidence
* record “what happened”, “how you confirmed it”, and “what mitigation you recommend”
* integrate into SIEM when possible for continuous monitoring

---
