# 🛠️ Troubleshooting Guide — Lab 23: Hardening a Linux System (Ubuntu 24.04.1)

> This guide covers common issues when removing packages, changing SSH settings, setting up key-based authentication, and running Lynis audits in a cloud VM environment.

---

## 1) `apt list --installed` output is huge and hard to review
### Tip
Instead of scrolling the full list, filter for high-risk or unnecessary packages:
- Search for legacy tools:
  - `dpkg -l | grep -i telnet`
- List installed services:
  - `systemctl list-unit-files --type=service --state=enabled`
- List listening ports (baseline):
  - `ss -tulpn`

---

## 2) Removing a package breaks a dependency you still need
### Symptoms
- apt warns that additional packages will be removed
- important tools disappear

### Fix
- Review apt removal plan carefully before confirming
- Use:
  - `apt-cache rdepends <package>`
- If removed unintentionally, reinstall:
  - `sudo apt install <package>`

---

## 3) SSH restart causes loss of access (high risk)
### Symptoms
- SSH session disconnects after config changes
- cannot reconnect

### Prevention (best practice)
- Always keep a second SSH session open before restarting ssh
- Validate config syntax before restart:
  - `sudo sshd -t`
- Apply changes carefully

### Recovery
- Use cloud console / recovery access if available
- Restore backup:
  - `sudo cp /etc/ssh/sshd_config.bak /etc/ssh/sshd_config`
  - `sudo systemctl restart ssh`

---

## 4) `grep "^PermitRootLogin"` returns nothing
### Cause
The directive may not exist (default config may rely on defaults).

### Fix
- Add explicitly:
  - `PermitRootLogin no`
- Or search the file for existing directive:
  - `sudo grep -n "PermitRootLogin" /etc/ssh/sshd_config`

---

## 5) `systemctl restart ssh` fails
### Symptoms
- service fails to restart
- status shows error

### Fix
- Validate config:
  - `sudo sshd -t`
- Inspect logs:
  - `sudo journalctl -u ssh -n 50 --no-pager`
- Fix syntax issues, then restart again.

---

## 6) SSH keys generated but login still asks for password
### Causes
- key not copied correctly
- wrong username or host
- permissions issues on remote `~/.ssh`
- SSH server config still requires password (allowed by default)

### Fix
- Verify key exists locally:
  - `ls -l ~/.ssh/id_rsa ~/.ssh/id_rsa.pub`
- Re-run copy:
  - `ssh-copy-id user@host`
- Check remote permissions:
  - `chmod 700 ~/.ssh`
  - `chmod 600 ~/.ssh/authorized_keys`

---

## 7) `ssh-copy-id` fails due to host key prompt or connectivity
### Symptoms
- “authenticity of host can’t be established”
- connection refused / timeout

### Fix
- Confirm network route and target availability
- Accept host key only for known lab targets
- Ensure SSH is running on remote host
- If blocked, confirm firewall/security group rules

---

## 8) Lynis install fails (package not found)
### Fix
- Update package lists:
  - `sudo apt update`
- Ensure Universe repo is enabled (Ubuntu):
  - `sudo add-apt-repository universe`
- Retry:
  - `sudo apt install lynis -y`

---

## 9) Lynis shows “firewall inactive” warning
### Explanation
Lynis flags when UFW is not enabled.

### Fix (if required by your policy)
- Enable UFW:
  - `sudo ufw enable`
- Allow required ports only (example SSH):
  - `sudo ufw allow 22/tcp`

> Only enable firewall if it will not break required connectivity in your lab environment.

---

## 10) Lynis reports “disable PasswordAuthentication” warning
### Meaning
After key-based authentication is confirmed, disabling SSH passwords reduces brute-force risk.

### Safe approach
- First confirm key-only login works.
- Then update `/etc/ssh/sshd_config`:
  - `PasswordAuthentication no`
- Validate config:
  - `sudo sshd -t`
- Restart SSH:
  - `sudo systemctl restart ssh`

---

## 11) Lynis suggests sysctl kernel hardening
### Approach
Start with safe baseline settings and test gradually. Kernel hardening can impact networking and performance, so changes should be staged and documented.

---

## 12) Keeping the repo safe (keys + secrets)
### Reminder
Never commit:
- private keys (`id_rsa`)
- `.ssh` directories
- tokens/passwords
Only commit:
- configuration snippets
- hardening documentation
- audit summaries (like the Lynis tail)
