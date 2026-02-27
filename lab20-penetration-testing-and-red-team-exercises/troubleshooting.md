# 🛠️ Troubleshooting Guide — Lab 20: Penetration Testing & Red Team Exercises

> This guide covers common issues when running Nmap and Metasploit in an authorized lab environment, plus safe-handling tips to keep a pentest portfolio professional and ethical.

---

## 1) `apt-get: command not found` or package install fails
### Symptoms
- `apt-get: command not found`
- package installation errors

### Cause
Wrong distro or missing repositories.

### Fix
- Confirm OS:
  - `cat /etc/os-release`
- On Ubuntu, use:
  - `sudo apt-get update`
  - `sudo apt-get install nmap`
- On RHEL/CentOS, use `yum`/`dnf` instead.

---

## 2) Nmap scan shows host down
### Symptoms
- `Host seems down`
- no ports detected

### Fix
- Ensure target is running and reachable (same network/subnet).
- Ping (if allowed):
  - `ping -c 2 192.168.56.101`
- If ICMP blocked, use:
  - `nmap -Pn -sV 192.168.56.101`

---

## 3) Nmap is blocked or results inconsistent
### Cause
Firewalls/IDS can block scanning or rate-limit probes.

### Fix (lab-safe)
- Slow scan timing:
  - `nmap -sV -T2 192.168.56.101`
- Confirm you are scanning the correct interface/network.

---

## 4) “localhost” confusion in lab networking
### Explanation
- `localhost` always refers to the current machine.
- Your target (192.168.56.101) must be reachable via the lab network.

### Fix
- Verify routes:
  - `ip route`
- Verify local IP:
  - `ip a`
- Confirm host-only / VM network settings.

---

## 5) Metasploit not installed / `msfconsole: command not found`
### Fix options
- Install Metasploit using your platform’s supported method (varies by distro).
- In controlled labs, Metasploit may already be preinstalled.
- Verify:
  - `which msfconsole`
  - `msfconsole --version`

---

## 6) Metasploit SMB scan fails to connect
### Symptoms
- connection timeouts
- no response

### Fix
- Ensure ports 139/445 are reachable (verify with Nmap).
- Confirm target IP is correct.
- Check that SMB service is running on the target VM.
- If firewall blocks SMB, scanning will fail.

---

## 7) Exploit attempt fails — does that mean the service is secure?
### Explanation
Not necessarily.
Exploit failure can occur due to:
- patched target
- different build/version than banner suggests
- wrong module assumptions
- environmental protections (firewall/IDS)
- service configuration differences

### Best practice
Treat exploit attempts as validation steps; rely on evidence and scope-based testing.

---

## 8) Banner says “vsftpd 2.3.4” but exploit fails
### Explanation
Banner strings can be misleading:
- custom banners
- patched versions reporting old strings
- “safe training” images showing historical banners without actual vulnerability

### Best practice
Validate by:
- configuration review (if permitted)
- logs and controlled behavior checks
- additional enumeration and evidence gathering

---

## 9) Keeping this lab ethical and portfolio-safe
### Recommended documentation practices
- Clearly state: authorized environment, host-only network, lab VM
- Avoid scanning real public IPs or production systems
- Don’t include stolen credentials or real sensitive data
- Explain that exploit attempts are benign verification only

---

## 10) What to do after finishing the lab
### Cleanup (optional, lab-dependent)
- Document scope and results
- Save outputs in `output.txt`
- Store findings in `reports/findings_summary.md`
- If tooling installed only for lab, note it in README (no secrets)
