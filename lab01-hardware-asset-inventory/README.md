# 🛠️ Lab 01: Hardware Asset Inventory (CIS Control 1)

> **Environment:** Ubuntu 24.04.1 LTS (Cloud Lab Environment)  
> **User:** toor  
> **Category:** CIS Top 20 Controls (Lab 01 of 15)

---

## 🎯 Objectives

By the end of this lab, I was able to:

- Understand why maintaining an accurate **hardware asset inventory** is critical for security and governance.
- Create a simple asset list containing PCs, laptops, servers, printers, and network devices.
- Use an open-source tool (**nmap**) to perform a network scan and validate discoverable assets.

---

## ✅ Prerequisites

- Basic understanding of networks and common hardware devices (PCs, laptops, routers, switches).
- Comfort with the Linux terminal (CLI).
- A reachable network environment for scanning.
- Ability to install tools using `apt`.

---

## 🧪 Lab Environment

| Component | Details |
|---|---|
| OS | Ubuntu 24.04.1 LTS |
| Environment | Cloud Lab Environment |
| User | toor |
| Network Interface | `ens5` |
| Tools Used | `ip`, `nano`, `ls`, `pwd`, `head`, `nmap` |

---

## 🗂️ Repository Structure (Lab Folder)

```text
lab01-hardware-asset-inventory/
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
├── troubleshooting.md
├── scripts/
│   └── (none for this lab)
└── artifacts/
    ├── hardware_inventory.txt
    └── scan_validation_notes.txt
```

> ✅ Note: This lab is primarily command-line and documentation based, so **no scripts** were required.

---

## ✅ Tasks Overview (What I Did)

### ✅ Task 1: Create a Simple Hardware Asset Inventory

* Created a dedicated working directory for inventory documentation.
* Built a structured hardware inventory table in a text file.
* Assigned unique asset IDs and ownership (responsible parties).

### ✅ Task 2: Validate Inventory Using a Network Scan

* Verified `nmap` availability and installed it when missing.
* Identified the local subnet dynamically using `ip a show ens5`.
* Performed a ping sweep (`nmap -sP`) across the subnet range.
* Documented scan results and limitations in a validation notes file.

---

## ✅ Verification & Validation

* Confirmed inventory file creation and contents using:

  * `ls -l`
  * `head -n 15`
* Confirmed `nmap` installation by running:

  * `nmap --version`
* Confirmed host discovery on the subnet using:

  * `nmap -sP 172.31.10.0/24`
* Confirmed both artifact files exist in the inventory directory.

---

## 🧠 What I Learned

* Hardware asset inventory is a foundational security requirement.
* Assigning **unique IDs + owners** helps enforce accountability.
* Network discovery using `nmap` is a practical way to **verify what is visible** on a subnet.
* Cloud lab networks can differ from office LANs, so validation must include documented limitations.

---

## 🎯 Why This Matters

A hardware inventory helps prevent:

* Unknown / unmanaged devices (“shadow IT”)
* Unauthorized endpoints connected to a network
* Missing accountability for updates, patching, and maintenance

This supports security operations like:

* Vulnerability management
* Incident response
* Access control enforcement
* Compliance and audit readiness

---

## 🌍 Real-World Applications

* Maintaining IT asset lists for companies (endpoints, printers, servers, network gear)
* Regular audits using network scans to detect unauthorized devices
* Supporting baseline security controls and compliance frameworks

---

## ✅ Result

* ✅ Created a structured hardware inventory with IDs and ownership.
* ✅ Installed `nmap` and performed a ping sweep scan.
* ✅ Documented discovered hosts and noted limitations in a cloud lab subnet.

---

## 🧾 Conclusion

This lab established a basic but structured approach to hardware asset management:

* An initial inventory was created using a simple table format.
* A network scan was used to demonstrate verification of discoverable assets.
* Findings were documented in validation notes to reflect realistic constraints in a cloud environment.

✅ Lab completed successfully on a cloud lab environment.

---

## 📦 Artifacts Created (Committed to Repo)

These files are stored under `artifacts/`:

* `hardware_inventory.txt`
* `scan_validation_notes.txt`

---
