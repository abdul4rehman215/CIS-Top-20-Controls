# 🌐🧱 Lab 09: Limiting Network Ports, Protocols, & Services (CIS Controls)

> **Environment:** Ubuntu 24.04.1 LTS (Cloud Lab Environment)  
> **User:** toor  
> **Firewall Tools:** UFW + iptables  
> **Category:** CIS Top 20 Controls (Lab 09 of 15)

---

## 🎯 Objectives

By the end of this lab, I was able to:

- Enumerate and analyze open network ports on a Linux system.
- Disable or block unused ports/services using the system firewall.
- Validate firewall changes and confirm no unwanted services are running/listening.
- Demonstrate port-blocking using **UFW** and **iptables**.

---

## ✅ Prerequisites

- Linux-based operating system.
- Basic CLI skills.
- Internet access (for installing tools if missing).

---

## 🧪 Lab Environment

| Component | Details |
|---|---|
| OS | Ubuntu 24.04.1 LTS |
| Environment | Cloud Lab Environment |
| User | toor |
| Port Enumeration Tools | `netstat`, `ss` |
| Firewall Tools | `ufw`, `iptables` |
| Persistence Artifact | `/etc/iptables/rules.v4` |

---

## 🗂️ Repository Structure (Lab Folder)

```text id="ud9jqp"
lab09-limiting-network-ports-protocols-and-services/
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
├── troubleshooting.md
└── artifacts/
    └── rules.v4
```

> ✅ Note:
>
> * The system file is stored at `/etc/iptables/rules.v4`.

---

## ✅ Tasks Overview (What I Did)

### ✅ Task 1: Check Open Ports on a Local System

* Created a working directory for the lab.
* Attempted to use `netstat` to list open ports.
* Installed `net-tools` because `netstat` was missing (common on modern Ubuntu).
* Enumerated listening ports using:

  * `netstat -tuln`
  * `ss -tuln`
* Reviewed results and identified expected services (SSH, local-only web UI, DNS stub resolver).

### ✅ Task 2: Disable or Block Unused Ports/Services Using Firewall

* Used UFW (Ubuntu firewall) to deny insecure Telnet port **23**.
* Enabled UFW and ensured SSH remained allowed to prevent lockout.
* Applied firewall rule:

  * `ufw deny 23`
* Verified firewall status and rules using verbose output.
* Demonstrated the equivalent iptables rule:

  * `iptables -A INPUT -p tcp --dport 23 -j DROP`
* Saved iptables rules to a file for persistence:

  * `/etc/iptables/rules.v4`

### ✅ Task 3: Validate Changes

* Rechecked listening ports using `netstat` and `ss`.
* Confirmed port **23** is not listening.
* Confirmed port **23** is blocked by firewall rules.

---

## ✅ Verification & Validation

* Confirmed installed tools:

  * `netstat` available after installing `net-tools`
* Confirmed listening ports (before and after) using:

  * `netstat -tuln`
  * `ss -tuln`
* Confirmed UFW is active + rules applied:

  * `ufw status verbose`
* Confirmed iptables rule exists:

  * `iptables -L INPUT -n --line-numbers`
* Confirmed persistence file saved:

  * `/etc/iptables/rules.v4`
* Confirmed port 23 not listening:

  * `ss -tuln | grep ":23" || echo "Port 23 is not listening"`

---

## 🧠 What I Learned

* Open ports represent exposed services and must be minimized.
* `ss` is a modern replacement for `netstat` on many Linux systems.
* Blocking a port with firewall rules:

  * does **not** remove a listening service
  * but prevents access even if a service starts later
* Enabling UFW on remote systems requires careful handling to avoid locking out SSH.
* iptables rules can be saved to files for persistence, but restoration behavior depends on system configuration.

---

## 🎯 Why This Matters

Limiting ports/services reduces:

* attack surface
* exposure to legacy/insecure protocols (like Telnet)
* opportunities for remote exploitation

This is a core hardening step for:

* servers
* cloud instances
* enterprise endpoints

---

## 🌍 Real-World Applications

* Server hardening baseline implementation
* SOC investigations into unexpected listening services
* Cloud security posture improvements (least exposure principle)
* Firewall policy enforcement for compliance audits

---

## ✅ Result

* ✅ Enumerated listening ports using `netstat` and `ss`.
* ✅ Enabled UFW safely (kept SSH allowed) and denied port 23.
* ✅ Added iptables rule to drop TCP traffic to port 23 and saved the rule file.
* ✅ Verified port 23 is not listening and is blocked by firewall configuration.

---

## 🧾 Conclusion

This lab demonstrated a practical workflow for limiting exposed services:

Discover → Review → Block/Disable → Verify → Document.

✅ Lab completed successfully on a cloud lab environment.

---

## 📦 Artifacts Created (Committed to Repo)

Stored under `artifacts/`:

* `rules.v4` *(copy of `/etc/iptables/rules.v4`)*
