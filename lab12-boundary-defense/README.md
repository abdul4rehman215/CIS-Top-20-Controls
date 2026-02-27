# 🧱🌐 Lab 12: Boundary Defense (CIS Controls)

> **Environment:** Ubuntu 24.04.1 LTS (Cloud Lab Environment)  
> **User:** toor  
> **Firewall:** UFW (host-based boundary control)  
> **Category:** CIS Top 20 Controls (Lab 12 of 15)

---

## 🎯 Objectives

By the end of this lab, I was able to:

- Understand the significance of boundary defenses in protecting internal systems.
- Document network boundaries using a simple network diagram.
- Verify and configure inbound/outbound firewall rules using UFW.
- Test and validate boundary controls by attempting unauthorized access to blocked ports.

---

## ✅ Prerequisites

- Basic understanding of networking concepts (IP addressing, gateways, ports).
- Access to a network with router/firewall (or cloud network simulation).
- CLI familiarity.
- UFW installed/configured on Linux.

---

## 🧪 Lab Environment

| Component | Details |
|---|---|
| OS | Ubuntu 24.04.1 LTS |
| Environment | Cloud Lab Environment |
| User | toor |
| Firewall | UFW |
| Port Enumeration | `ss` |
| Boundary Testing | `nc` (netcat) |
| Interface | `ens5` |
| Test Target IP | `172.31.10.207` |
| Test Ports | `8080` (blocked), `22` (allowed) |

---

## 🗂️ Repository Structure (Lab Folder)

```text id="z5q0iv"
lab12-boundary-defense/
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
├── troubleshooting.md
├── scripts/
│   └── (none for this lab)
└── artifacts/
    ├── boundary_defense_notes.txt
    └── network_boundary_diagram.txt
```

> ✅ Notes:
>
> * The network diagram was created in draw.io in the lab workflow.
> * For repo portability, a **text-based diagram** is included as `network_boundary_diagram.txt`.
> * A configuration/testing notes file is included as `boundary_defense_notes.txt`.

---

## ✅ Task Summary (What I Did)

### ✅ Task 1: Document the Network Boundary

Identified boundary components:

* Internet (untrusted/external)
* Router/Default Gateway (first-hop boundary device)
* Firewall enforcement point (UFW on the Ubuntu host for this lab)
* Internal endpoints (Ubuntu host + other internal devices if present)

Created a simple diagram showing traffic flow and boundary control points.

---

### ✅ Task 2: Verify Inbound and Outbound Firewall Rules

* Checked current UFW rules:

  * confirmed **default incoming = deny**
  * confirmed SSH allowed (22/tcp)
  * confirmed Telnet denied (23)
* Enumerated listening ports using `ss` to avoid blocking required services.
* Added an explicit deny rule for an unused inbound port (8080) to enforce deny-by-default behavior even if services start later.

---

### ✅ Task 3: Test Boundary Controls

* Verified netcat is available.
* Identified test target IP on `ens5`.
* Attempted connection to blocked port `8080`:

  * observed timeout (consistent with firewall filtering)
* Confirmed allowed access to SSH port `22`:

  * connection succeeded

---

## ✅ Verification & Validation

* Verified firewall rules:

  * `sudo ufw status verbose`
  * `sudo ufw status`
* Verified listening ports:

  * `sudo ss -tuln`
* Verified blocking behavior:

  * `nc -vz <ip> 8080` → timeout (blocked)
* Verified permitted access:

  * `nc -vz <ip> 22` → succeeded (allowed)

---

## 🧠 What I Learned

* Boundary defense is about controlling traffic between trusted and untrusted zones.
* A secure default posture is:

  * deny inbound by default
  * allow only required ports/services
* Explicit deny rules can prevent accidental exposure if new services start later.
* Testing matters: the firewall policy should be validated with connection attempts.

---

## 🎯 Why This Matters

A strong boundary defense helps prevent:

* unauthorized access to internal services
* opportunistic scanning and exploitation
* lateral movement from exposed services
* accidental exposure due to misconfiguration

---

## 🌍 Real-World Applications

* Perimeter firewall rule design (allowlist-only)
* Host-based firewall hardening for servers
* Micro-segmentation and workload isolation
* Regular boundary validation using SOC testing techniques

---

## ✅ Result

* ✅ Network boundary diagram documented.
* ✅ UFW rules reviewed (deny inbound by default).
* ✅ Port 8080 denied (unused inbound).
* ✅ Boundary test confirmed blocked access to 8080 and allowed access to SSH.

---

## 🧾 Conclusion

This lab demonstrated a boundary defense workflow:

Document → Review firewall policy → Deny unused ports → Test unauthorized access → Validate allowed services.

✅ Lab completed successfully on a cloud lab environment.

---

## 📦 Artifacts Created (Committed to Repo)

Stored under `artifacts/`:

* `boundary_defense_notes.txt`
* `network_boundary_diagram.txt`

---
