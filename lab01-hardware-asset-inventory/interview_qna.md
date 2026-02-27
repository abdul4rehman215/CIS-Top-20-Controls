# 🧠 Interview Q&A — Lab 01: Hardware Asset Inventory (CIS Control 1)

This Q&A reinforces concepts practiced in this lab: asset identification, ownership assignment, and verification using network discovery.

---

## 1) Why is hardware asset inventory considered a foundational security control?
Hardware inventory ensures every device on the network is known, tracked, and managed. Unknown devices can introduce vulnerabilities, bypass controls, or enable unauthorized access.

---

## 2) What is the purpose of assigning a unique Asset ID (e.g., PC001, LT001)?
A unique Asset ID enables consistent tracking across the asset lifecycle (procurement → deployment → maintenance → decommissioning) and avoids confusion when multiple devices share similar models.

---

## 3) Why is it important to assign an owner/responsible party for each asset?
Ownership creates accountability for patching, maintenance, security updates, and incident response actions tied to that device.

---

## 4) What type of information should a basic hardware inventory include?
At minimum:
- Asset ID
- Asset type (PC, laptop, router, switch, etc.)
- Model/description
- Serial number (or unique identifier)
- Location
- Owner/responsible team

---

## 5) In this lab, why was `nmap` used?
`nmap` was used for network discovery to identify reachable hosts. This helps validate the inventory by showing what devices respond on the subnet.

---

## 6) What does `nmap -sP` do?
`-sP` performs a ping sweep (host discovery) to identify which IP addresses respond as “up” in a range. In newer versions of nmap, `-sn` is typically used for the same purpose.

---

## 7) Why did we run `ip a show ens5` before scanning?
To determine the actual IP address and subnet range used in the lab environment. This prevents scanning the wrong range and makes the scan realistic for a dynamic network.

---

## 8) Why might some devices not appear in a ping sweep scan, even if they exist?
Common reasons include:
- ICMP/ping blocked by firewall
- Device in a different subnet/VLAN
- Host is powered off or sleeping
- Security controls drop discovery traffic
- Cloud networks restrict ARP/ICMP visibility

---

## 9) What is the difference between an “inventory list” and “scan results”?
- Inventory list is an administrative record of all owned/managed assets.
- Scan results show only what is currently discoverable on the network (and may miss devices due to filtering or segmentation).

---

## 10) In the lab, why didn’t the scan validate the “office devices” in the inventory list?
Because the environment is a cloud lab network. The inventory list was treated as a small-office example, but the scan discovers actual reachable cloud hosts (gateway + instances), not simulated office endpoints.

---

## 11) How would you improve the inventory verification process in a real organization?
- Scan all production subnets (authorized scope)
- Use authenticated scanning where possible
- Cross-check with DHCP leases, switch ARP/MAC tables, and endpoint management tools (MDM/EDR)
- Include non-responsive devices through physical audits or management-plane queries

---

## 12) Why is asset inventory important for vulnerability management?
You cannot patch or assess systems you don’t know exist. Inventory enables coverage tracking and prioritization of patching and scanning.

---

## 13) How does hardware inventory support incident response?
During an incident, responders need to quickly identify:
- where the device is
- who owns it
- what it is used for
- whether it is critical
This speeds containment and recovery decisions.

---

## 14) What risks come from unmanaged devices on a network?
- Rogue access points
- Unpatched vulnerable systems
- Unauthorized data exfiltration paths
- Shadow IT services
- Compliance and audit failures

---

## 15) How often should hardware inventory be updated in real environments?
Best practice:
- Continuous updates via asset management tools
- Scheduled audits (monthly/quarterly)
- Immediate updates for onboarding/offboarding, hardware replacements, and changes in ownership/location
