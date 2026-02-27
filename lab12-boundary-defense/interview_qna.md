# 🧠 Interview Q&A — Lab 12: Boundary Defense (CIS Controls)

> This Q&A covers network boundary concepts, firewall policy verification, deny-by-default strategy, and testing blocked vs allowed access.

---

## 1) What is “boundary defense” in cybersecurity?
Boundary defense is the practice of controlling traffic between trusted and untrusted zones (e.g., internet ↔ internal network) using routers, firewalls, and security policies.

---

## 2) What is considered the “network boundary” in typical environments?
The boundary is usually where external/untrusted traffic meets internal/trusted networks, commonly at:
- the router/default gateway
- perimeter firewall
- DMZ segmentation points
- host-based firewalls for individual systems

---

## 3) Why is “deny inbound by default” recommended?
Because it blocks unsolicited inbound connections unless explicitly allowed. This reduces attack surface and prevents accidental exposure of services.

---

## 4) What did `sudo ufw status verbose` confirm in this lab?
It confirmed:
- UFW is active
- default incoming policy is deny
- outgoing is allowed
- logging is enabled
- explicit allow/deny rules exist (SSH allowed, Telnet and 8080 denied)

---

## 5) Why allow SSH (22/tcp) explicitly?
SSH is required for remote administration in many environments. If inbound is denied by default, SSH must be allowed to avoid losing management access.

---

## 6) Why deny port 23 (Telnet)?
Telnet is insecure (plaintext). Blocking it at the boundary prevents legacy/unsafe remote access even if a telnet service is started.

---

## 7) Why deny port 8080 even if nothing is listening on it?
It enforces a preventive boundary control. If an application starts listening on 8080 later, it remains blocked unless intentionally allowed.

---

## 8) What does `ss -tuln` help you do before changing firewall rules?
It shows which ports are currently listening, helping avoid blocking required services accidentally.

---

## 9) What does `nc -vz <ip> <port>` test?
It performs a quick TCP connection test:
- `-v` verbose
- `-z` “zero-I/O” mode (scan/connect test only)
It helps validate whether a port is reachable.

---

## 10) Why did the blocked port test show “Connection timed out” instead of “Connection refused”?
Timeout commonly indicates the firewall is dropping/filtering packets.  
“Connection refused” usually means the host is reachable but no service is listening (or actively rejecting).

---

## 11) Why was SSH tested after blocking 8080?
To confirm system stability and ensure boundary changes did not break required access (SSH remained reachable).

---

## 12) What is the difference between router boundary and host firewall boundary?
- Router/perimeter firewall: controls traffic for the network as a whole.
- Host firewall (UFW): controls traffic to a single endpoint/system.
Both can be layered for defense-in-depth.

---

## 13) What additional boundary defenses are common in real environments?
- network segmentation (VLANs)
- DMZ for public-facing services
- ACLs restricting management access to admin IPs
- IDS/IPS at the perimeter
- geo/IP reputation blocking where appropriate

---

## 14) Why is documentation (network diagram + notes) important for boundary defense?
It provides clarity on traffic flow, policy enforcement points, and helps:
- audits/compliance
- troubleshooting
- security reviews
- repeatable configurations

---

## 15) What is a realistic next hardening step beyond this lab?
Restrict SSH to trusted IP ranges only (allowlist), add logging/alerts for denied traffic, and review firewall rules periodically to ensure they match business needs.
