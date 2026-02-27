# 🧠 Interview Q&A — Lab 06: Monitoring & Analysis of Audit Logs (CIS Control 6)

> This Q&A covers audit logging concepts, Windows Security logs, Linux rsyslog/auth.log configuration, and brute-force pattern detection.

---

## 1) Why are audit logs important for security?
Audit logs provide visibility into authentication, privilege usage, and system events. They support detection, investigation, incident response, and compliance audits.

---

## 2) Which Windows log commonly contains authentication audit events?
The **Security** log in Event Viewer:
- Event Viewer → Windows Logs → Security

---

## 3) Why enable both Success and Failure auditing for logon events?
- **Failures** help detect brute-force attempts and unauthorized access attempts.
- **Success** helps confirm legitimate access and detect suspicious successful logins after repeated failures.

---

## 4) What tool is used to configure audit policy on Windows in this lab?
Local Security Policy (`secpol.msc`) under:
- Security Settings → Local Policies → Audit Policy

---

## 5) On Linux, what is the role of rsyslog?
`rsyslog` is a system logging service that collects and writes logs to files like `/var/log/auth.log`, supporting monitoring and investigation.

---

## 6) What does this rsyslog rule do: `auth.* /var/log/auth.log`?
It routes authentication-related messages (auth facility) to `/var/log/auth.log`, enabling centralized visibility into login activity and sudo usage.

---

## 7) Why restart rsyslog after editing its config?
To apply configuration changes. Without restart/reload, the updated logging rules may not take effect.

---

## 8) Why copy logs to `~/log_analysis/` instead of analyzing `/var/log/auth.log` directly?
Copying logs:
- avoids accidentally modifying live logs
- preserves evidence
- enables safe analysis workflows
- supports incident response best practices

---

## 9) What does `grep 'Failed' auth.log` help identify?
It filters log entries containing “Failed”, commonly revealing failed login attempts (e.g., failed SSH passwords).

---

## 10) How did the lab confirm a brute-force style pattern?
By:
- observing repeated failed attempts in a short time
- noting common usernames (admin/test/root/guest/oracle)
- counting repeated attempts per IP using `awk` and `uniq -c`

---

## 11) Why is counting failures per IP useful?
It helps detect concentration of failed attempts from a single source, indicating automated brute-force behavior rather than normal user mistakes.

---

## 12) What is the difference between “invalid user” and a valid user failure in SSH logs?
- **invalid user**: account does not exist on the system
- valid user failure: the user exists but password/auth failed  
Attackers often try common usernames that may not exist.

---

## 13) Why check for “Accepted” events after failed logins?
To see whether the attacker eventually succeeded, or whether successful logins are normal/internal and separate from the brute-force attempts.

---

## 14) In this lab, what made the successful login look normal?
It showed:
- accepted **publickey** authentication
- for user `toor`
- from an internal host IP (`172.31.10.25`)  
This contrasts with external brute-force attempts using passwords.

---

## 15) What are common defensive actions after detecting brute-force attempts?
- restrict SSH access (allowlist IPs / VPN only)
- enable Fail2Ban or rate limiting
- disable password authentication (keys only)
- ensure root login is disabled
- monitor and alert through SIEM
