# 🎤 Interview Q&A — Lab 23: Hardening a Linux System (Ubuntu 24.04.1)

> Below are interview-style questions and answers based on the Linux hardening steps completed in this lab (package cleanup, SSH hardening, CIS baseline planning, and Lynis auditing).

---

## 1) What does “Linux system hardening” mean?
Linux hardening is the process of reducing attack surface and improving system security by removing unnecessary components, tightening configurations, and applying security baselines (e.g., CIS). It aims to minimize exploitation opportunities and enforce secure defaults.

---

## 2) Why is removing unused packages a hardening step?
Unused packages increase attack surface because:
- they add binaries/tools that could be abused
- they may introduce services or dependencies
- they expand patching workload
Removing them reduces exposure and maintenance overhead.

---

## 3) How did you identify an unnecessary package in this lab?
I reviewed installed packages and then explicitly searched for telnet using:
- `dpkg -l | grep -E "^ii" | grep -i telnet`

This confirmed telnet was installed and could be removed.

---

## 4) Why was telnet chosen for removal?
Telnet is a legacy plaintext protocol and is insecure by design. In modern environments, it is generally unnecessary and should be replaced by secure alternatives like SSH.

---

## 5) What is `apt autoremove` and why did you run it?
`apt autoremove` removes unused dependencies that are no longer required after packages are removed. It helps keep the system minimal and reduces leftover components that increase attack surface.

---

## 6) What SSH hardening change did you implement?
I disabled direct remote root login by ensuring the SSH setting:
- `PermitRootLogin no`

This forces administrators to log in with a normal account and elevate privileges using sudo.

---

## 7) Why is disabling root SSH login important?
It reduces the risk of:
- brute-force password attacks targeting the root account
- direct privileged access exposure
- attackers gaining full control immediately if root credentials are compromised

---

## 8) Why did you back up `sshd_config` before editing?
Backing up critical configuration files supports rollback and reduces risk. If the edit introduces syntax errors or breaks SSH access, a backup provides a safe recovery path.

---

## 9) How did you verify the SSH configuration change?
Using:
- `sudo grep -n "^PermitRootLogin" /etc/ssh/sshd_config`

This confirmed the directive exists and is set to `no`.

---

## 10) How did you apply the SSH configuration changes?
By restarting the SSH service:
- `sudo systemctl restart ssh`

Then verifying it is running via:
- `sudo systemctl status ssh --no-pager`

---

## 11) What is key-based SSH authentication and why is it recommended?
Key-based authentication uses asymmetric cryptography instead of passwords. It is recommended because:
- it resists brute-force password guessing
- it enables stronger authentication practices
- it supports passphrases and hardware-backed keys
After keys are confirmed working, disabling password authentication is often recommended.

---

## 12) What does `ssh-copy-id` do?
It installs the public key into the remote user’s `~/.ssh/authorized_keys` file. This enables key-based logins without manually editing remote files.

---

## 13) What is the CIS Linux Benchmark and how did you use it here?
The CIS Benchmark provides detailed hardening guidance. In this lab, I documented a CIS-aligned baseline approach and selected safe, high-impact controls:
- remove unused packages
- SSH hardening
- patching discipline
- review listening services and restrict as needed

---

## 14) Why did you run Lynis?
Lynis is a security auditing tool that identifies hardening gaps and provides recommendations. It helps prioritize next steps beyond basic changes by generating warnings/suggestions.

---

## 15) What were some Lynis findings in your summary?
Key findings included:
- firewall appears inactive (ufw not enabled)
- recommend disabling PasswordAuthentication after key verification
- apply pending security updates
- review sysctl kernel hardening settings
It also reported a hardening index of 72 with several warnings and suggestions.

---

## 16) What would be the next hardening steps after this lab?
Next steps (CIS-aligned) could include:
- enable UFW and allow only required ports
- disable SSH password authentication after keys are confirmed
- configure unattended security updates
- implement sysctl kernel hardening baseline
- verify file permissions and audit users/sudoers
