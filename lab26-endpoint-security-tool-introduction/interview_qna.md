# 🎤 Interview Q&A — Lab 26: Endpoint Security Tool Introduction (Wazuh)

> Below are interview-style questions and answers based on installing Wazuh Manager, verifying dashboard reporting, and validating detection using a safe EICAR test file.

---

## 1) What is an endpoint security tool?
An endpoint security tool monitors and protects endpoints (servers, laptops, desktops) by collecting security events, detecting suspicious behavior, and generating alerts. It supports visibility, incident response, and detection across hosts.

---

## 2) Why did you choose Wazuh for this lab?
Wazuh is open-source and provides endpoint monitoring capabilities such as file integrity monitoring, log analysis, alerting, and centralized dashboard visibility—useful for SOC-style workflows without vendor licensing.

---

## 3) What component did you install in this lab?
I installed **Wazuh Manager**, which is the core server-side component responsible for:
- collecting and analyzing security events
- applying detection rules
- generating alerts and storing logs for review

---

## 4) How did you install Wazuh Manager on Ubuntu?
The process was:
1) Update package lists (`apt-get update`)
2) Download and run the Wazuh repository setup script (`setup_repo.sh`)
3) Install the package:
   - `sudo apt-get install wazuh-manager -y`

---

## 5) How did you verify Wazuh Manager was running?
Using systemd:
- `sudo systemctl status wazuh-manager`

This showed the service was active/running and listed key Wazuh processes (managerd, db, modulesd, analysisd).

---

## 6) What is the purpose of the Wazuh Dashboard?
The dashboard provides centralized visibility into:
- agents and their status
- security events and alerts
- filtering/searching and investigation
It supports triage and monitoring workflows.

---

## 7) What does it mean that “manager connected” was visible in the dashboard?
It indicates the dashboard can communicate with the manager/indexer stack and retrieve security events. It’s a baseline verification that the monitoring pipeline is functional.

---

## 8) What is the EICAR test file and why is it used?
EICAR is a standardized, benign test string used to validate that security tools detect suspicious patterns without using real malware. It’s safe and commonly used to verify alerting and detection logic.

---

## 9) How did you create the EICAR test file in this lab?
I created a directory and a file named `eicar.com`, then pasted the EICAR string into it using a text editor. I also triggered a read event with `cat` to generate access activity.

---

## 10) How did you confirm Wazuh detected the test file?
I checked Wazuh alerts locally via:
- `/var/ossec/logs/alerts/alerts.json`

The log showed an alert referencing:
- rule level (example level 5)
- description indicating EICAR detection
- file path to the test file

---

## 11) What does “rule level” indicate in Wazuh alerts?
Rule level represents alert severity/priority. Higher levels typically indicate more suspicious or higher-impact events. In the lab, the EICAR alert was logged as a low/medium severity detection event.

---

## 12) Why is it useful to verify alerts in both logs and the dashboard?
- Logs confirm detection at the system level (source of truth).
- Dashboard confirms centralized visibility and searchability.
Verifying both ensures the endpoint tool and reporting pipeline are working correctly.

---

## 13) What security capability did this lab demonstrate end-to-end?
It demonstrated an endpoint monitoring workflow:
**install → verify service → generate safe test event → confirm alert locally → validate dashboard visibility**

This is the foundation of endpoint detection and response readiness.

---

## 14) What should you avoid committing to GitHub when working with endpoint tools?
Never commit:
- credentials or tokens
- private keys
- sensitive logs with real user data
- production hostnames/IPs (unless sanitized)

This lab used a safe test file and simulated outputs appropriate for a portfolio.
