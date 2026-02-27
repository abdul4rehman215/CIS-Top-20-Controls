# 🎤 Interview Q&A — Lab 19: Incident Response & Management

> Below are interview-style questions and answers based on the incident response workflow implemented in this lab (CentOS 7), including roles documentation, detection, containment, eradication, and recovery.

---

## 1) What are the main phases of incident response demonstrated in this lab?
The lab followed the standard incident handling lifecycle:
1) **Detection**
2) **Containment**
3) **Eradication**
4) **Recovery**

This was reinforced through a scenario-based malware infection exercise.

---

## 2) Why are roles and responsibilities important in incident response?
Clear roles prevent confusion and delays during an incident. They ensure:
- ownership of decisions (Incident Lead)
- controlled communication (Communication Lead)
- efficient technical execution (SOC, Sysadmins, Forensics)
This structure reduces downtime and supports accurate reporting.

---

## 3) What does an Incident Lead do during an incident?
The Incident Lead coordinates the entire response by:
- declaring severity
- assigning tasks
- approving impactful containment actions
- ensuring evidence preservation
- driving the transition from containment to eradication and recovery
- leading the post-incident review and final reporting

---

## 4) What does a Communication Lead do, and why is it critical?
The Communication Lead manages internal/external updates to:
- keep stakeholders informed
- prevent panic and misinformation
- maintain consistent messaging
- document decisions and timelines
This is essential for trust, compliance, and post-incident analysis.

---

## 5) Why did you use Suricata in this lab?
Suricata was used for **detection** because it can monitor network traffic and detect suspicious patterns using signatures and anomalies. Running it in live mode validated that the system can observe traffic on `eth0`.

---

## 6) How did you validate Suricata was installed and working?
- Initially: `suricata -V` returned “command not found”
- Installed via EPEL + yum
- After install: `suricata -V` returned version info
- Live capture started successfully using:
  - `sudo suricata -c /etc/suricata/suricata.yaml -i eth0`

---

## 7) What does containment mean, and how did you implement it?
Containment means stopping the spread or limiting impact of an incident.  
In this lab, containment was implemented with host firewall rules using **iptables** to block suspected malicious or infected source IPs.

---

## 8) Why did you use 203.0.113.55 as a “malicious IP” in documentation?
203.0.113.0/24 is TEST-NET-3 reserved for documentation and examples. Using it is safe and avoids accidentally referencing real-world malicious infrastructure in a public portfolio.

---

## 9) How did you verify your containment rules were active?
By listing iptables INPUT chain with line numbers:
- `sudo iptables -L INPUT -n --line-numbers`

This confirmed the DROP rules were present.

---

## 10) Why did you use ClamAV during eradication?
ClamAV is an open-source antivirus tool used to scan for malware signatures. It supports updating signatures (`freshclam`) and scanning/removing threats (`clamscan --remove`).

---

## 11) What was detected during the first malware scan and why is it safe?
The scan detected:
- `/tmp/eicar.com: Eicar-Test-Signature FOUND`

EICAR is a standard antivirus test file used for safe simulation (not real malware). It’s commonly used in labs to demonstrate detection and removal workflows.

---

## 12) Why did you run a second ClamAV scan during the scenario?
To validate eradication. A follow-up scan showing `Infected files: 0` confirms there is no remaining detected malware, which is an essential part of eradication verification.

---

## 13) What was the “recovery” action and why is patching part of recovery?
Recovery included:
- applying system updates using `yum update -y`
- performing health checks (`uptime`, `free -m`)

Patching reduces exposure to known vulnerabilities and helps prevent re-infection through exploited outdated software.

---

## 14) Why did you replace `apt-get` with `yum` in the scenario workflow?
The scenario example included `apt-get`, but the lab environment was **CentOS 7**, where package management is done using `yum`. Using the correct tool is critical during real incidents to avoid delays and mistakes.

---

## 15) What are limitations of host-based containment with iptables?
- Rules can be lost on reboot unless persisted
- It only controls traffic at that host, not across the entire network
- Incorrect rules can block legitimate traffic or lock out admins
In real environments, containment is often layered with network controls (security groups, NAC, firewall policies).

---

## 16) If Suricata is running in the foreground, how do you operate it operationally?
For real operations, Suricata is usually run as a **service** or in daemon mode, writing logs (eve.json, fast.log) for later analysis. In the lab, foreground mode was used for quick verification and stopped with Ctrl+C.

---

## 17) What are “evidence preservation” best practices during incident response?
- Preserve logs and timelines
- Avoid modifying artifacts unnecessarily
- Capture disk/memory images when required
- Record commands executed and changes made
This supports forensics and accurate reporting.

---

## 18) What outcome did this lab demonstrate?
It demonstrated a complete IR workflow:
- roles documented
- detection validated with Suricata
- containment applied using iptables
- eradication performed with ClamAV
- recovery completed with patching and system health verification
