# 🧠 Interview Q&A — Lab 09: Limiting Network Ports, Protocols, & Services (CIS Control 9)

> This Q&A covers port discovery, service exposure, firewall controls (UFW/iptables), and verification concepts.

---

## 1) Why is limiting open ports and services important?
Because every open port represents a potential attack path. Reducing exposed services lowers the system’s attack surface and reduces the likelihood of exploitation.

---

## 2) What is the difference between a listening port and an allowed port?
- **Listening port:** a service is actively bound to that port and waiting for connections.
- **Allowed port:** firewall rules permit traffic to that port.  
A port can be blocked by firewall even if a service is listening, and a port can be allowed even if nothing is listening.

---

## 3) What does `netstat -tuln` show?
It lists network sockets that are listening:
- `-t` TCP
- `-u` UDP
- `-l` listening sockets
- `-n` numeric output (no DNS/service name resolution)

---

## 4) Why might `netstat` be missing on modern Ubuntu?
Because `netstat` comes from the older `net-tools` package, which is not always installed by default. Modern Ubuntu commonly uses `ss` instead.

---

## 5) What does `ss -tuln` provide compared to `netstat`?
`ss` is the modern tool for socket statistics. It provides similar information, often faster and more detailed than `netstat`.

---

## 6) In the lab output, why is `127.0.0.1:9392` less risky than `0.0.0.0:9392`?
Because `127.0.0.1` is loopback-only (local access). The service is not reachable externally.  
`0.0.0.0` binds to all interfaces and could expose the port to the network.

---

## 7) Why is Telnet (port 23) considered insecure?
Telnet transmits credentials and data in plaintext, making it vulnerable to sniffing and man-in-the-middle attacks. SSH is a secure replacement.

---

## 8) Why did the lab allow SSH (port 22) before enabling UFW?
Enabling a firewall can disrupt existing SSH connections. Allowing port 22 helps avoid locking yourself out of a remote system.

---

## 9) What does `ufw deny 23` do?
It adds a firewall rule to block incoming connections on port 23, preventing Telnet access even if a Telnet service is started.

---

## 10) What does `ufw status verbose` help confirm?
It shows:
- whether the firewall is active
- default policies (deny/allow)
- the rule list and logging level
This provides evidence that security controls are enforced.

---

## 11) What does this iptables rule do?
```bash
iptables -A INPUT -p tcp --dport 23 -j DROP
````

It drops incoming TCP packets destined to port 23 (Telnet), silently blocking attempts.

---

## 12) Why is `iptables-save > /etc/iptables/rules.v4` useful?

It exports the current iptables rules into a file. This can support persistence and documentation. Restoring on boot depends on system configuration.

---

## 13) Why is “port 23 not listening” not the same as “port 23 blocked”?

A port not listening means no service is running there. Blocking ensures that even if a service starts later, the port is not accessible from the network.

---

## 14) What is the value of repeatedly checking ports after changes?

It validates that:

* unexpected services are not running
* changes didn’t introduce new exposures
* the system remains in the intended secure state

---

## 15) What additional hardening steps could be applied beyond blocking Telnet?

* restrict SSH to specific IPs (allowlist)
* disable password auth, use keys only
* enforce MFA via VPN/SSO solutions where possible
* enable firewall logging for denied traffic
* audit services and disable anything not required

---
