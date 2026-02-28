# 🧠 Interview Q&A — Lab 02: Software Asset Inventory (CIS Controls)

> This Q&A covers software inventory collection on Windows and Linux, CSV exporting, and the process of flagging UNKNOWN/EOL software.

---

## 1) Why is software asset inventory important for security?
Because vulnerabilities depend on **what software is installed and which versions**. Without an inventory, you can’t reliably patch, scan, or detect risky applications.

---

## 2) What does the Windows WMIC command `wmic product get name,version,vendor` do?
It queries installed applications registered through Windows Installer (MSI) and prints the software **Name**, **Version**, and **Vendor**.

---

## 3) What limitation does `wmic product` have in real environments?
It may not show software installed outside MSI (portable apps, some Store apps, custom installers), and it can be slow on some systems. Some organizations prefer registry-based inventory tools or endpoint management solutions.

---

## 4) Why export software inventory to CSV?
CSV makes it easy to:
- open in spreadsheets
- sort/filter by vendor/version
- mark UNKNOWN/EOL entries
- generate compliance reports

---

## 5) On Linux (Debian/Ubuntu), why use `dpkg-query` for inventory?
Because Debian-based systems manage installed packages using `dpkg/apt`. `dpkg-query` provides reliable package listing with versions and maintainers.

---

## 6) What output format did we use in Linux and why?
We used:
`Package,Version,Maintainer`
This is spreadsheet-friendly (CSV style), making analysis easier.

---

## 7) Why does the lab mention `rpm -qa` if we used Ubuntu?
Because `rpm` is used on RPM-based distros (RHEL/CentOS/Fedora). The lab demonstrates cross-platform concepts: dpkg vs rpm.

---

## 8) What does it mean when `rpm: command not found` appears on Ubuntu?
It indicates the OS is not RPM-based and does not have rpm tools installed by default. That’s expected in Ubuntu/Debian environments.

---

## 9) What does “EOL software” mean?
EOL means **End-of-Life**, where vendors stop providing:
- security patches
- bug fixes
- support updates
Running EOL software increases risk because known vulnerabilities remain unpatched.

---

## 10) What does “UNKNOWN software” mean in an inventory review?
Software that cannot be verified easily, has unclear vendor information, or appears suspicious/unapproved. It may indicate shadow IT or potentially unwanted applications.

---

## 11) What is a quick way to detect “unknown” entries in Linux exports?
Look for missing or unusual maintainer/vendor fields. In this lab:
```bash
awk -F',' 'NF<3 || $3=="" {print NR ":" $0}' installed_software.csv | head
````

---

## 12) Why are packages like OpenSSH/OpenSSL/sudo considered “security-critical”?

They influence authentication, encryption, and privilege management. If outdated, they can expose the system to serious exploits and privilege escalation.

---

## 13) Why is spreadsheet analysis useful after collecting the inventory?

Because it allows:

* tagging status (OK/EOL/UNKNOWN/REVIEW)
* filtering by vendor/version
* comparing versions against vendor security advisories
* prioritizing upgrade/removal actions

---

## 14) How do organizations normally manage software inventory at scale?

Common solutions include:

* endpoint management (Intune, SCCM, Jamf)
* EDR/agent-based tools
* vulnerability scanners
* configuration management (Ansible, Puppet)
* asset management platforms (CMDB)

---

## 15) What is the real-world outcome of maintaining software inventory properly?

* Faster patching
* Reduced attack surface
* Better compliance posture
* Faster incident response (knowing what was installed helps investigations)

---
