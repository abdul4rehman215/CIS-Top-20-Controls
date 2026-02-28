# 🧠 Interview Q&A — Lab 15: Wireless Access Control (CIS Controls)

> This Q&A covers wireless security controls, WPA2/WPA3, WPS risk, and validation of unauthorized access prevention.

---

## 1) What is wireless access control?
Wireless access control ensures only authorized users/devices can connect to a Wi-Fi network by enforcing authentication and encryption policies (e.g., WPA2/WPA3).

---

## 2) Why is WPA2/WPA3 encryption important?
It encrypts wireless traffic and requires authentication. Without WPA2/WPA3, attackers can intercept traffic and connect to the network without proper authorization.

---

## 3) What is the difference between WPA2-PSK and WPA3-SAE?
- **WPA2-PSK:** uses a shared passphrase; secure with AES and strong passwords but can be vulnerable to offline attacks if passwords are weak.
- **WPA3-SAE:** improves protection against offline guessing and provides stronger authentication (more resilient to brute-force).

---

## 4) Why was WPA2-PSK (AES) used in this lab instead of WPA3?
Because the lab router model did not support WPA3. WPA2-PSK (AES) is still a secure baseline when configured correctly.

---

## 5) Why is AES important in wireless encryption settings?
AES is a modern secure cipher used with WPA2/WPA3. Avoiding legacy ciphers (like TKIP) reduces exposure to known weaknesses.

---

## 6) What makes a wireless passphrase “strong”?
- 12+ characters (preferably longer)
- mixture of uppercase/lowercase
- digits and special characters
- not a common word or guessable pattern

---

## 7) What is WPS and why should it be disabled?
WPS (Wi-Fi Protected Setup) allows quick pairing using a PIN or push-button method. Some implementations are vulnerable to brute-force or bypass, so disabling WPS reduces attack surface.

---

## 8) What happens to connected clients after changing Wi-Fi encryption/passphrase?
Clients typically disconnect and must re-authenticate using the new security settings. This prevents old credentials from continuing to work.

---

## 9) How did the lab verify unauthorized users cannot connect?
A second device attempted to connect using an incorrect password and received an authentication failure message.

---

## 10) Why is testing with a second device important?
It provides real proof that the access control mechanism is enforced and not just “configured on paper.”

---

## 11) What is the default gateway and why was it checked?
The default gateway is usually the router IP address. Identifying it helps locate the router admin interface (e.g., `192.168.1.1`).

---

## 12) What are additional wireless security settings to harden beyond this lab?
- Disable remote router admin access (WAN management)
- Change default router admin credentials
- Disable UPnP if not needed
- Use a separate guest network for untrusted devices
- Keep router firmware updated
- Consider MAC allowlisting (limited value, can be spoofed)

---

## 13) Why is router admin access a security concern?
If an attacker gains router admin access, they can:
- change DNS settings (hijack traffic)
- weaken encryption
- capture credentials
- allow backdoor access

---

## 14) Is MAC filtering enough for wireless access control?
No. MAC addresses can be spoofed. MAC filtering can add friction but should not replace WPA2/WPA3 encryption and strong authentication.

---

## 15) What is a good ongoing practice for wireless security?
- periodically rotate Wi-Fi passphrases
- review connected devices
- disable unused features (WPS, UPnP)
- apply firmware updates
- keep guest and IoT networks segmented
