# 🛜🔐 Lab 11: Secure Configuration for Network Devices (CIS Control 11)

> **Environment(s):**
> - **Windows/Linux host:** used to find gateway + access device
> - **Network Device CLI (simulation):** Cisco-like IOS CLI used for configuration steps  
>
> **Linux Host (lab):** Ubuntu 24.04.1 LTS  
> **Linux User:** toor  
> **Category:** CIS Top 20 Controls (Lab 11 of 15)

---

## 🎯 Objectives

By the end of this lab, I was able to:

- Understand the importance of securing network device configurations.
- Access a network device management interface using:
  - Web UI
  - SSH
  - Console
- Change default credentials by creating a new admin user.
- Disable unnecessary services (e.g., disable HTTP while keeping HTTPS).
- Export and document final configuration settings for future reference.

---

## ✅ Prerequisites

- Basic networking fundamentals (IP addressing, default gateway).
- Familiarity with routers/switches and management interfaces.
- Ability to use CLI tools and interpret command output.
- Access to network devices or simulation tools (Cisco-like CLI).

---

## 🧪 Lab Environment

### 🖥️ Host Systems (used to find gateway / access device)
| Host | Purpose |
|---|---|
| Windows | `ipconfig` to identify default gateway (example: `192.168.1.1`) |
| Linux (Ubuntu) | `ip route` to identify gateway in lab network (example: `172.31.0.1`) |

### 🖧 Network Device (Simulation)
| Component | Details |
|---|---|
| CLI Style | Cisco-like IOS |
| Device Name | Router |
| Example Gateway Used | `192.168.1.1` |
| Secure Management | SSH v2 enabled, Telnet disabled |
| Web Management | HTTPS enabled, HTTP disabled |
| Credentials | created local user `newuser` |

---

## 🗂️ Repository Structure (Lab Folder)

```text id="gjpv4k"
lab11-secure-configuration-for-network-devices/
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
├── troubleshooting.md
└── artifacts/
    └── final_device_config.txt
```

> ✅ Note:
>
> * This lab uses a **network device CLI simulation** output for configuration steps.
> * The documentation artifact captures the final secure configuration snapshot.

---

## ✅ Tasks Overview (What I Did)

### ✅ Task 1: Access the Device’s Management Interface

#### 🌐 Web Interface

* Identified the gateway/device IP (example):

  * `192.168.1.1`
* Accessed via browser:

  * `http://192.168.1.1`
* Logged in using default credentials in the test device:

  * `admin/admin`

#### 🔐 SSH Access

* Enabled SSH v2 and restricted VTY access to SSH-only:

  * `ip ssh version 2`
  * `line vty 0 4`
  * `transport input ssh`
* Connected from Linux host:

  * `ssh admin@192.168.1.1`
* Accepted fingerprint and authenticated successfully.

#### 🧩 Console Access

* Connected using serial terminal settings (PuTTY example):

  * Serial / COM3 / 9600 baud
* Confirmed console session access at the device prompt.

---

### ✅ Task 2: Change Default Credentials + Disable Unnecessary Services

#### 👤 Change Default Credentials

* Created a new local user:

  * `username newuser password newpassword`
* Saved configuration:

  * `write memory`

#### 🧱 Disable Unnecessary Services

* Reviewed service status:

  * `show services`
* Disabled insecure management service:

  * `no ip http server`
* Kept HTTPS enabled:

  * `ip http secure-server`
* Saved configuration:

  * `copy running-config startup-config`
* Verified again using `show services`.

---

### ✅ Task 3: Document Final Configuration Settings

* Exported relevant configuration using:

  * `show running-config`
* Logged the secure configuration summary into:

  * `artifacts/final_device_config.txt`

---

## ✅ Verification & Validation

* Verified gateway discovery:

  * Windows: `ipconfig`
  * Linux: `ip route`
* Verified secure management access:

  * SSH v2 enabled and working
  * VTY lines accept SSH only
* Verified service hardening:

  * HTTP management disabled
  * HTTPS enabled
* Verified configuration saved:

  * `write memory` and/or `copy running-config startup-config`
* Verified documentation artifact exists:

  * `final_device_config.txt`

---

## 🧠 What I Learned

* Default credentials create major risk and must be changed immediately.
* SSH v2 is preferred for secure device management (avoid Telnet).
* Web management should prefer HTTPS; HTTP should be disabled when possible.
* Documenting final configs supports:

  * audits
  * troubleshooting
  * repeatable secure baselines

---

## 🎯 Why This Matters

Network devices control traffic flow across the environment. Weak device management security can lead to:

* unauthorized access to routing/switching infrastructure
* traffic interception or redirection
* network-wide compromise
* persistence via malicious configuration changes

Hardening management access and disabling unsafe services reduces these risks.

---

## 🌍 Real-World Applications

* Router/switch baseline hardening for production networks
* Secure remote management for branch devices
* Compliance controls (CIS/ISO change tracking)
* SOC investigations (configuration evidence review)

---

## ✅ Result

* ✅ Accessed management via Web UI, SSH, and Console methods.
* ✅ Created a new local admin user to replace default credential usage.
* ✅ Disabled HTTP management and retained HTTPS.
* ✅ Exported and documented key secure configuration settings.

---

## 🧾 Conclusion

This lab demonstrated a practical secure configuration workflow for network devices:

Discover gateway → Access management → Harden credentials → Enable SSH-only access → Disable insecure services → Save and document config.

✅ Lab completed successfully using a host system + Cisco-like CLI simulation.

---

## 📦 Artifacts Created (Committed to Repo)

Stored under `artifacts/`:

* `final_device_config.txt`

---
