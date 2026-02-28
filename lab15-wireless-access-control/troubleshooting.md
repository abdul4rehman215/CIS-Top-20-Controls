# 🛠️ Troubleshooting Guide — Lab 15: Wireless Access Control (CIS Controls)

> This guide covers common issues when accessing router admin pages, enabling WPA2/WPA3 encryption, disabling WPS, and validating authorized vs unauthorized connectivity.

---

## 1) Cannot open router admin page (`http://192.168.1.1`)

### ✅ Problem
Browser shows timeout / page not found.

### 💡 Cause
- Wrong router IP
- Not connected to the router network
- Router admin interface disabled or moved to HTTPS
- Local firewall/VPN interfering

### ✅ Resolution
1) Confirm default gateway IP:
- Windows:
  ```cmd
  ipconfig
````

Look for **Default Gateway**.

* Linux:

  ```bash
  ip route | head
  ```

2. Ping router:

```bash id="y9m2n1"
ping -c 2 192.168.1.1
```

3. Try HTTPS (some routers redirect to HTTPS):

* `https://192.168.1.1`

4. Disable VPN temporarily and retry.

---

## 2) Router login credentials don’t work

### ✅ Problem

Admin login fails.

### 💡 Cause

* Credentials already changed
* Wrong username/password
* Caps lock / keyboard layout mismatch
* Account lockout after repeated attempts

### ✅ Resolution

* Check router sticker/manual or lab-provided credentials.
* Try correct admin username (often `admin`) but varies.
* If forgotten, follow router reset procedure (requires physical access; document reset carefully).

---

## 3) WPA3 option not available

### ✅ Problem

Router security settings only show WPA2 or mixed modes.

### 💡 Cause

Router firmware/hardware does not support WPA3.

### ✅ Resolution

Use **WPA2-PSK (AES)** as secure baseline.
Avoid:

* WEP
* WPA (legacy)
* WPA2-TKIP (weak)

---

## 4) Clients cannot reconnect after changing Wi-Fi password

### ✅ Problem

Devices fail to connect after applying new passphrase.

### 💡 Cause

* Old saved network profile still stored
* Typo in password
* Router restarted and SSID changed unexpectedly
* Device cached incorrect credentials

### ✅ Resolution

* “Forget” the network on the client device and reconnect.
* Re-enter the passphrase carefully.
* Restart Wi-Fi on device (toggle off/on) and retry.
* Recheck router Wi-Fi SSID and security mode.

---

## 5) Enabling WPA2/WPA3 disconnects everyone and router becomes unreachable

### ✅ Problem

After applying security settings, admin page is unreachable.

### 💡 Cause

Wi-Fi restart applies settings and disconnects all clients; you may lose access temporarily.

### ✅ Resolution

* Wait briefly for Wi-Fi to restart.
* Reconnect using new passphrase.
* If still unreachable, connect via Ethernet (best practice for admin changes).
* Power-cycle router only if necessary.

---

## 6) WPS setting not found

### ✅ Problem

Cannot locate WPS option.

### 💡 Cause

Different router UI layout or vendor naming.

### ✅ Resolution

Check:

* Wireless → Advanced
* Wi-Fi Protected Setup
* WPS PIN / Push Button setup
* Security settings sections
  If not present, it may already be disabled or unsupported.

---

## 7) WPS disabled but devices using “push button connect” no longer work

### ✅ Problem

Some devices can’t connect using WPS after it’s disabled.

### 💡 Cause

That’s expected: WPS convenience feature removed.

### ✅ Resolution

Connect devices manually using SSID + passphrase.
For IoT devices, use vendor app provisioning securely.

---

## 8) Unauthorized test device can still connect

### ✅ Problem

A device connects even when you expected it to fail.

### 💡 Cause

* Device already had correct password saved
* You tested with the wrong device/account
* Guest network is open or using different password
* Router still in mixed/weak mode

### ✅ Resolution

* Ensure you intentionally enter a wrong password.
* “Forget” the SSID on the test device and retry with wrong password.
* Verify router is set to **WPA2-PSK (AES)** (or WPA3 if available).
* Check if you tested the correct SSID (guest vs main Wi-Fi).

---

## 9) Internet access fails after Wi-Fi security changes

### ✅ Problem

Wi-Fi connects but no internet.

### 💡 Cause

* Router WAN issue unrelated to Wi-Fi encryption
* DNS misconfiguration
* ISP connection down
* Router reboot incomplete

### ✅ Resolution

* Verify router WAN status in admin page.
* Reboot router if needed.
* Confirm DNS settings are correct (automatic/ISP or trusted DNS).
* Test by pinging a public IP:

```bash id="p1m2n9"
ping -c 2 8.8.8.8
```

---

## ✅ Final Tip: Wireless Security Baseline

For a strong home/lab baseline:

* WPA2-PSK (AES) or WPA3-SAE
* WPS disabled
* strong router admin password (not default)
* firmware kept updated
* guest network for untrusted devices
* disable UPnP if not needed

```

---

✅ **Lab 15 complete.**  
If you want, next we can generate a **main repository README** for *CIS Top 20 Controls (Labs 1–15)* and a clean **root folder structure** that matches everything we created.

---
