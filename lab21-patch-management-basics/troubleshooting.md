# 🛠️ Troubleshooting Guide — Lab 21: Patch Management Basics (Windows + Ubuntu + CentOS)

> This guide covers common issues during patch checking, applying updates, reboot validation, and post-update health checks across Windows and Linux platforms.

---

## 1) `apt update` fails with repository or DNS errors (Ubuntu)
### Symptoms
- `Temporary failure resolving ...`
- `Failed to fetch ...`
- repo signature errors

### Fix
- Verify networking:
  - `ping -c 2 8.8.8.8`
  - `ping -c 2 archive.ubuntu.com`
- Retry update:
  - `sudo apt update`
- If key/repo issues occur:
  - verify correct Ubuntu release repositories
  - check `/etc/apt/sources.list.d/`

---

## 2) `apt upgrade` prompts for configuration decisions
### Symptoms
- interactive prompts about replacing config files
- service restart prompts

### Fix
- Review carefully in production.
- In labs, accept defaults unless instructed.
- Consider using:
  - `sudo apt upgrade -y` (still may prompt for certain config conflicts)
- For fully non-interactive upgrades, admin workflows may use additional flags (use with caution).

---

## 3) Ubuntu shows “packages can be upgraded” but `apt list --upgradable` is empty
### Causes
- metadata mismatch
- partial upgrade state
- caches not refreshed

### Fix
- Refresh metadata:
  - `sudo apt update`
- Try:
  - `apt list --upgradable`

---

## 4) After update, `apt list --upgradable` becomes empty
### Explanation
This is expected. It means:
- upgrades were successfully applied
- no pending packages remain

For documentation, capture “before” and “after” if possible.

---

## 5) `yum check-update` returns exit code 100 (CentOS)
### Explanation
This is normal: yum uses exit codes:
- `0` = no updates
- `100` = updates available

### Fix
Treat it as informational and proceed to:
- `sudo yum update -y`

---

## 6) `yum update` fails with mirror or repository issues
### Symptoms
- timeout contacting mirrors
- repo metadata download failures

### Fix
- Verify network connectivity
- Clean yum caches:
  - `sudo yum clean all`
  - `sudo yum makecache`
- Retry update:
  - `sudo yum update -y`

---

## 7) Reboot required but system cannot reboot cleanly (Linux)
### Symptoms
- SSH drops (expected)
- system fails to come back online

### Fix
- Wait and reconnect via SSH
- If still unreachable:
  - use cloud console access if available
  - verify instance health checks
  - confirm security group/firewall rules still allow SSH

---

## 8) `/var/run/reboot-required` file check not present on some distros
### Explanation
This method is common on Ubuntu, but not universal.

### Alternatives
- Check kernel vs running services:
  - `needs-restarting` (RHEL-based, if installed)
- In enterprise environments, patch tools provide reboot guidance.

---

## 9) Post-update `dmesg` shows “error” messages
### Explanation
In VMs/cloud, some ACPI/hardware warnings can appear and are not always critical.

### What to look for
- repeated failures
- driver crashes
- kernel panic lines
- filesystem errors
- services failing repeatedly

Use additional checks:
- `systemctl --failed`
- `journalctl -p err -b`

---

## 10) Windows Update shows “Restart required” repeatedly
### Causes
- cumulative updates pending completion
- multiple updates chained
- update servicing stack behavior

### Fix
- Restart and re-check Windows Update
- Ensure update process completes fully
- In managed environments, follow organizational patch policy and maintenance windows

---

## 11) Version strings don’t “look new” after patching (especially on CentOS/RHEL)
### Explanation
Vendor distributions backport security fixes without always changing upstream version strings dramatically.

### Best practice
- Rely on vendor security advisories and installed package release numbers
- Confirm installed RPM versions:
  - `rpm -q bash curl openssl sudo`

---

## 12) Best practices to reduce patch risk in production
- Take backups/snapshots before patching
- Use maintenance windows
- Test on staging systems first
- Keep rollback plan ready
- Document changes and validate critical services post-update
