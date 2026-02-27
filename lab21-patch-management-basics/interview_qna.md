# 🎤 Interview Q&A — Lab 21: Patch Management Basics

> Below are interview-style questions and answers based on the multi-platform patch management workflow performed in this lab (Windows + Ubuntu + CentOS).

---

## 1) What is patch management and why is it important?
Patch management is the process of identifying, applying, and validating updates for operating systems and applications. It is important because patches fix security vulnerabilities, bugs, and stability issues. Unpatched systems are a common cause of breaches through known exploits.

---

## 2) What is the typical patch management workflow you followed?
A baseline workflow is:
1) Check for updates  
2) Apply updates  
3) Document changes  
4) Reboot if required  
5) Validate system health and critical software versions  

---

## 3) How do you check for updates on Ubuntu?
- Update package metadata:
  - `sudo apt update`
- List upgradeable packages:
  - `apt list --upgradable`

---

## 4) How do you apply updates on Ubuntu?
- Apply upgrades:
  - `sudo apt upgrade -y`

For larger upgrades, admins may also use:
- `sudo apt full-upgrade` (with more caution)

---

## 5) How do you check for updates on CentOS 7?
- `sudo yum check-update`

This shows which packages have pending updates available from repositories.

---

## 6) How do you apply updates on CentOS 7?
- `sudo yum update -y`

This applies pending updates and handles dependencies.

---

## 7) Why did you document updates and how did you do it?
Documentation supports auditability, troubleshooting, and compliance.  
In the lab:
- Ubuntu: captured upgradeable list into a log file using:
  - `apt list --upgradable | tee updates_applied.log`
- CentOS: appended update details into a log file using:
  - `sudo yum list updates >> updates_applied.log`

---

## 8) Why might `apt list --upgradable` be empty after running `apt upgrade`?
Because upgrades have already been applied. After patching, there may be no remaining upgradeable packages, so the list becomes empty. This is normal and still useful for documentation (“nothing pending”).

---

## 9) How did you check if a reboot was required on Ubuntu?
By checking the presence of:
- `/var/run/reboot-required`

Command used:
- `if [ -f /var/run/reboot-required ]; then echo "Reboot is required"; else echo "Reboot not required"; fi`

---

## 10) What happens to an SSH session during reboot and why is that expected?
An SSH session disconnects because the system is restarting network services and reloading the OS. Seeing:
- “Connection closed by remote host”
is expected behavior during a reboot.

---

## 11) How did you validate system stability after updates?
By:
- checking kernel messages for errors:
  - `dmesg | grep -i "error"`
- verifying key component versions:
  - `bash --version`
  - `openssh -V` (Ubuntu)
  - `openssl version` (CentOS)

---

## 12) Are “ACPI errors” in dmesg always critical?
Not always. In virtualized or cloud environments, ACPI/hardware warnings can appear due to emulated hardware or platform quirks. The important part is checking for repeated critical failures or kernel panics.

---

## 13) Why might CentOS show an older OpenSSL version string even when fully patched?
CentOS/RHEL often use **vendor backporting**: security fixes are applied to older maintained versions without changing the major/minor version string in the same way as upstream projects. Version string alone may not reflect all security patches.

---

## 14) What best practices should be followed before major updates?
- Take backups / snapshots
- Test updates in staging first (if possible)
- Confirm maintenance window for production systems
- Ensure rollback plan exists
- Monitor logs after patching

---

## 15) What are common post-update issues you watch for?
- services failing to restart (systemd errors)
- broken dependencies or package conflicts
- network interface issues
- application compatibility issues
- performance regressions
That’s why logs and quick health checks are essential after updates.
