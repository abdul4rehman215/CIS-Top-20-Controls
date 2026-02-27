#!/bin/bash
# Lab 05: Secure Configuration for Endpoints (CIS Control 5)
# Commands Executed During Lab (Windows + Linux)
# Note: Windows commands are listed for documentation; run them on Windows.

# -----------------------------
# Task 1: Apply Benchmark / Guideline
# -----------------------------

# Windows (Group Policy - manual GUI step)
gpedit.msc

# Linux: Create working directory + checklist
mkdir -p Lab_Secure_Endpoint_Config
cd Lab_Secure_Endpoint_Config
nano configuration_checklist.md

# Linux: Install Lynis (audit tool)
sudo apt-get install lynis -y

# Update checklist item (Installed Lynis)
sed -i 's/- \[ \] Installed Lynis (audit tool)/- [x] Installed Lynis (audit tool)/' configuration_checklist.md

# Linux: Run Lynis system audit
sudo lynis audit system

# Update checklist item (Performed Lynis audit)
sed -i 's/- \[ \] Performed Lynis system audit/- [x] Performed Lynis system audit/' configuration_checklist.md

# Linux: Check current SSH root login setting
sudo grep -nE '^\s*PermitRootLogin|^\s*#\s*PermitRootLogin' /etc/ssh/sshd_config | head

# Linux: Edit SSH config (disable root login)
sudo nano /etc/ssh/sshd_config

# Validate SSH config syntax
sudo sshd -t

# Restart SSH service
sudo systemctl restart ssh

# Confirm effective setting
sudo sshd -T | grep permitrootlogin

# Update checklist item (Applied SSH hardening)
sed -i 's/- \[ \] Applied recommended remediation(s) (SSH hardening)/- [x] Applied recommended remediation(s) (SSH hardening)/' configuration_checklist.md

# -----------------------------
# Task 2: Disable Unnecessary Services
# -----------------------------

# Windows (PowerShell)
Get-Service

# Linux: List services
sudo systemctl list-units --type=service

# Check bluetooth service existence (example)
systemctl status bluetooth.service --no-pager

# Check avahi-daemon service (example)
systemctl status avahi-daemon.service --no-pager

# Disable and stop avahi-daemon (reduce attack surface if not needed)
sudo systemctl disable --now avahi-daemon.service

# Verify service is disabled
systemctl is-enabled avahi-daemon.service

# Update checklist items (service review + disable)
sed -i 's/- \[ \] Reviewed running services (systemctl)/- [x] Reviewed running services (systemctl)/' configuration_checklist.md
sed -i 's/- \[ \] Disabled non-essential services (example: bluetooth.service if present)/- [x] Disabled non-essential services (example: bluetooth.service if present)/' configuration_checklist.md

# -----------------------------
# Task 3: Enforce Password Complexity
# -----------------------------

# Linux: Verify pwquality config exists
ls -l /etc/security/pwquality.conf

# Backup config (realistic)
sudo cp /etc/security/pwquality.conf /etc/security/pwquality.conf.bak

# Edit pwquality.conf
sudo nano /etc/security/pwquality.conf

# Verify applied values
sudo grep -nE '^(minlen|dcredit|ucredit|lcredit|ocredit)=' /etc/security/pwquality.conf

# Verify PAM includes pwquality module
sudo grep -n "pam_pwquality.so" /etc/pam.d/common-password

# Update checklist items (pwquality + PAM + documented)
sed -i 's/- \[ \] Configured \/etc\/security\/pwquality.conf/- [x] Configured \/etc\/security\/pwquality.conf/' configuration_checklist.md
sed -i 's/- \[ \] Verified PAM includes pwquality module (where applicable)/- [x] Verified PAM includes pwquality module (where applicable)/' configuration_checklist.md
sed -i 's/- \[ \] Documented settings applied/- [x] Documented settings applied/' configuration_checklist.md

# View final checklist
cat configuration_checklist.md
