# 📶🔐 Lab 15: Wireless Access Control (CIS Control 15)

> **Environment:** Home/Lab Wi-Fi Router Admin Web Interface + Client Devices  
> **Client OS Used (example):** Windows/Linux laptop + a second device (unauthorized test)  
> **Category:** CIS Top 20 Controls (Lab 15 of 15)

---

## 🎯 Objectives

By the end of this lab, I was able to:

- Understand and configure wireless access control mechanisms.
- Enable secure wireless encryption (WPA2/WPA3 where available).
- Disable insecure features (WPS).
- Verify that unauthorized users cannot connect without proper authentication.

---

## ✅ Prerequisites

- PC/laptop with a web browser.
- Access to a wireless router (home or lab).
- Basic network/security knowledge (SSID, WPA2/WPA3, passphrases).
- A second device for unauthorized connection testing.

---

## 🧪 Lab Environment

| Component | Details |
|---|---|
| Router admin IP (gateway) | `192.168.1.1` |
| Client device (example) | Windows laptop (ipconfig used) |
| Wi-Fi SSID (example) | `LabWiFi` |
| Security mode configured | **WPA2-PSK (AES)** *(WPA3 not supported on this lab router)* |
| WPS | Disabled |
| Validation | Wrong password fails, correct password connects |

---

## 🗂️ Repository Structure (Lab Folder)

```text id="y3n2m1"
lab15-wireless-access-control/
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
├── troubleshooting.md
└── artifacts/
    └── wireless_security_checklist.md
```

> ✅ Notes:
>
> * Router configuration steps were performed in the **router web GUI** (documented).
> * Lab evidence is captured in a checklist markdown file under `artifacts/`.

---

## ✅ Tasks Overview (What I Did)

### ✅ Task 1: Access Router Admin Page

* Confirmed router IP via default gateway on client device using `ipconfig`.
* Opened browser and navigated to:

  * `http://192.168.1.1`
* Logged into router admin dashboard using credentials from router sticker/manual/lab-provided info.

---

### ✅ Task 2: Enable WPA2 or WPA3 Encryption

* Navigated to router wireless security settings.
* Selected secure mode:

  * ✅ **WPA2-PSK (AES)** *(WPA3 not available on this router model)*
* Set a strong passphrase (12+ chars with complexity).
* Applied changes and confirmed Wi-Fi restarted (clients disconnected temporarily).

---

### ✅ Task 3: Disable WPS

* Located WPS settings under advanced wireless configuration.
* Disabled WPS and saved changes.
* Confirmed setting applied successfully.

---

### ✅ Task 4: Verify Unauthorized Access Prevention

* Disconnected authorized device to simulate re-authentication.
* On a second device (unauthorized test):

  * attempted to join SSID with wrong password
  * confirmed authentication failed
* Reconnected authorized device with correct passphrase:

  * confirmed successful Wi-Fi connection and IP assignment

---

## ✅ Verification & Validation

* Confirmed router IP:

  * `Default Gateway: 192.168.1.1`
* Confirmed encryption enabled:

  * **WPA2-PSK (AES)**
* Confirmed WPS disabled:

  * WPS status set to **Disabled**
* Confirmed enforcement:

  * Wrong password → **authentication failed**
  * Correct password → **connected successfully**

---

## 🧠 What I Learned

* Wireless security is strongest when:

  * WPA2-AES or WPA3 is enabled
  * WPS is disabled
  * passphrases are long and complex
* Changing encryption/passphrases forces re-authentication and reduces unauthorized reuse of prior credentials.
* Validation is critical: testing wrong credentials proves the control actually works.

---

## 🎯 Why This Matters

Wireless networks are a common entry point for attackers. Weak Wi-Fi security can lead to:

* unauthorized access to internal networks
* interception of traffic
* attacks against internal devices and services

Strong encryption + disabling WPS reduces the attack surface dramatically.

---

## 🌍 Real-World Applications

* Securing home networks and small business networks
* Compliance-focused baseline configuration
* SOC / incident response: verifying wireless exposure risk
* Reducing brute-force opportunities and unauthorized device access

---

## ✅ Result

* ✅ Router admin access verified.
* ✅ WPA2-PSK (AES) enabled with a strong passphrase.
* ✅ WPS disabled.
* ✅ Unauthorized connection attempts failed.
* ✅ Authorized devices reconnected successfully.

---

## 🧾 Conclusion

This lab implemented practical wireless access controls:

Access router → enable strong encryption → disable WPS → validate unauthorized access fails → document baseline.

✅ Lab completed successfully in a home/lab wireless environment.

---
