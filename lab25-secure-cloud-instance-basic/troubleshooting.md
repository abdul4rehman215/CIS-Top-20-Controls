# 🛠️ Troubleshooting Guide — Lab 25: Secure Cloud Instance (Basic) — OpenStack

> This guide covers common issues when launching an instance, applying security group rules via OpenStack CLI, and enabling MFA for console access.

---

## 1) `openstack` CLI command not found
### Symptoms
- `openstack: command not found`

### Fix
- Install OpenStack client (varies by environment) or use the lab’s preconfigured CLI host.
- Confirm credentials are sourced (RC file):
  - `source openrc.sh` (example, depends on lab)

---

## 2) `openstack server list` returns empty
### Causes
- wrong project/tenant
- wrong region
- credentials not scoped correctly

### Fix
- Verify you are in the correct project:
  - check Horizon project selector
- Verify region:
  - `openstack endpoint list --service compute` (advanced)
- Re-source correct RC credentials for the correct project.

---

## 3) Instance stuck in BUILD or ERROR state
### Causes
- quota limits (vCPU/RAM/disk)
- image unavailable or corrupted
- network issues (no valid network)
- flavor not supported in AZ

### Fix
- Check details:
  - `openstack server show <server-id>`
- Try a smaller flavor
- Verify quota:
  - `openstack quota show`
- Confirm network exists and is attached.

---

## 4) No IP assigned / cannot reach instance
### Causes
- wrong network attached
- DHCP issue
- missing router to external network (if needed)
- security group blocks access

### Fix
- Verify network assignment:
  - `openstack server show <server-id> -c addresses`
- Ensure correct security group attached
- If external access needed, allocate floating IP and associate (depends on lab design).

---

## 5) Security group rule create fails (bad parameters)
### Symptoms
- CLI errors about invalid port ranges or parameters

### Fix
- Ensure correct syntax:
  - `openstack security group rule create --protocol tcp --dst-port 22:22 --remote-ip 0.0.0.0/0 <sg-id>`
- Confirm you are using `<security-group-id>` (correct ID, correct formatting)

---

## 6) Accidentally opened too many ports
### Symptoms
- rule like `1:65535` exists

### Fix
- List rules:
  - `openstack security group rule list <sg-id>`
- Delete the offending rule:
  - `openstack security group rule delete <rule-id>`
- Re-check rules after changes.

---

## 7) You can’t SSH even though port 22 is allowed
### Causes
- instance has no reachable IP (private only)
- SSH daemon not running
- wrong keypair used
- wrong username
- security group attached to different port/instance

### Fix
- Confirm security group attached to instance:
  - `openstack server show <server-id> -c security_groups`
- Confirm instance has the correct IP:
  - private vs floating IP
- Use correct cloud username for image (often `ubuntu` for Ubuntu images)
- Confirm keypair matches the one used at launch.

---

## 8) MFA not available in Horizon / identity backend doesn’t support it
### Causes
- Lab OpenStack deployment may not have MFA configured at the identity provider (Keystone/SSO)

### Fix
- Use the provider’s supported MFA method (SSO, external IdP)
- If Horizon lacks MFA UI, document limitation and implement MFA at IdP level.

---

## 9) MFA enabled but login fails
### Causes
- time drift on phone
- wrong OTP app/account selected
- backup codes used incorrectly

### Fix
- Sync time on authenticator device
- Re-scan QR code if re-enrolled
- Use backup code if OTP fails (store offline securely)

---

## 10) Best practice: restrict SSH source instead of `0.0.0.0/0`
### Why
Allowing SSH from anywhere increases brute-force exposure.

### Improvement
- Restrict to your IP range:
  - `--remote-ip <your-public-ip>/32`
- Use bastion host or VPN access for administration.

---

## 11) Don’t store cloud credentials or backup codes in GitHub
### Never commit
- OpenStack RC files
- tokens
- private keys
- MFA backup codes

### Safe to commit
- security group rule documentation
- screenshots or text notes (redacted)
- commands and simulated outputs
