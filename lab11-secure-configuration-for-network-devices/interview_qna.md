# 🧠 Interview Q&A — Lab 11: Secure Configuration for Network Devices (CIS Controls)

> This Q&A covers network device hardening, secure management access, disabling insecure services, and configuration documentation.

---

## 1) Why is securing network device configurations important?
Because routers and switches control network traffic. If compromised, attackers can intercept traffic, redirect routes, create persistence, or take over the network.

---

## 2) What is a default gateway and why is it relevant here?
The default gateway is typically the router IP that forwards traffic outside the local network. It’s commonly the management IP used to access the router.

---

## 3) How do you find the default gateway on Windows?
Using:
```cmd
ipconfig
````

Look for “Default Gateway”.

---

## 4) How do you find the default gateway on Linux?

Using:

```bash
ip route | head
```

Look for the line starting with `default via`.

---

## 5) Why is using default credentials dangerous?

Default usernames/passwords are widely known and often published online. Attackers routinely try them to gain administrative access.

---

## 6) What is the advantage of SSH over Telnet for device management?

SSH encrypts traffic (credentials and commands). Telnet sends data in plaintext, making it vulnerable to sniffing and MITM attacks.

---

## 7) What does `ip ssh version 2` achieve?

It forces SSH version 2, which is more secure than SSH v1 and is the standard in modern environments.

---

## 8) What does this configuration do?

```text
line vty 0 4
 transport input ssh
```

It restricts remote management (VTY lines) to accept only SSH connections and blocks Telnet.

---

## 9) Why should HTTP management be disabled on network devices?

HTTP management is unencrypted, exposing credentials and sessions. HTTPS provides encryption and is preferred for web-based administration.

---

## 10) What does `no ip http server` do?

It disables the HTTP server on the device, preventing unencrypted web management access.

---

## 11) Why keep `ip http secure-server` enabled?

It enables HTTPS management (encrypted). This supports secure web administration when needed.

---

## 12) What is the purpose of saving configuration with `write memory` or `copy running-config startup-config`?

It ensures changes persist after reboot. Without saving, changes may exist only in running memory and be lost on restart.

---

## 13) Why is documentation of final configuration important?

It helps with:

* audits and compliance checks
* troubleshooting and change tracking
* rebuilding devices consistently (baseline configs)
* incident response investigations

---

## 14) What additional security hardening is recommended beyond this lab?

* Restrict management access to trusted IPs/VLANs (ACLs)
* Disable unused services (CDP if not needed, legacy protocols)
* Use strong passwords and enable MFA where supported
* Enable logging and send logs to a central syslog/SIEM
* Use role-based accounts (least privilege) instead of shared admin access

---

## 15) Why is accepting an SSH host key fingerprint important?

It helps prevent man-in-the-middle attacks. You should verify the fingerprint out-of-band before trusting it in production.

---
