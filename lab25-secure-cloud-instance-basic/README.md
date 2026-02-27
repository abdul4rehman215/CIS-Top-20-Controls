# 🧪 Lab 25: Secure Cloud Instance (Basic) — OpenStack (CIS Controls)

**Cloud Platform (Lab):** OpenStack (Horizon Console + CLI)  
**Instance OS:** Ubuntu 24.04 LTS (Noble) *(example)*  
**User:** `toor`  
**Project/Tenant:** `training-project`  
**Region:** `RegionOne`  
**Note:** Outputs are **sample/simulated** from an authorized OpenStack-based training cloud.

---

## 🎯 Objectives

This lab demonstrates the basics of securing a cloud VM at launch time by:

- Launching a minimal cloud instance (VM) using OpenStack
- Restricting inbound access via security groups to **only necessary ports**
- Enabling **MFA** for cloud console login
- Documenting cloud security configuration for auditability and repeatability

---

## ✅ Prerequisites

- Basic understanding of cloud VMs and networking
- OpenStack account access (Horizon + CLI credentials)
- Familiarity with security groups (firewall-like rules)
- A 2FA/MFA authenticator app (e.g., Google Authenticator, Authy)

---

## 🧩 Lab Tasks Overview

### ✅ Task 1: Launch a Small Cloud VM (OpenStack)
Performed in the OpenStack Horizon dashboard:

- Logged into Horizon console successfully
- Confirmed:
  - project/tenant: `training-project`
  - region: `RegionOne`
- Selected:
  - Image: Ubuntu 24.04 LTS (Noble)
  - Flavor: `m1.small` *(1 vCPU, 2GB RAM, 20GB disk — example)*
- Configured:
  - Instance Name: `secure-lab25-ubuntu`
  - Availability Zone: `nova` *(example)*
  - Network: `private-net`
  - Keypair: `toor-key`

**Result:**
- Launch Status: SUCCESS
- Instance State: ACTIVE
- Private IP assigned: `10.0.0.25`

**CLI Verification:**
- Confirmed instance appears as ACTIVE using `openstack server list`

---

### ✅ Task 2: Limit Inbound Ports to 22/80/443 (Security Groups)

Security group used:
- `sg-secure-lab25`

Actions performed:

- Listed security groups and identified target SG ID
- Audited existing rules and found an overly permissive ingress rule:
  - `tcp 1:65535 ingress 0.0.0.0/0`
- Removed the wide-open rule
- Added required inbound rules only:
  - TCP 22 (SSH)
  - TCP 80 (HTTP)
  - TCP 443 (HTTPS)
- Verified final security group rule set

**Result:**
Ingress restricted to only 22/80/443.

> Note: Egress was left as default allow-outbound (common in many environments), but could be restricted depending on policy.

---

### ✅ Task 3: Enable MFA for Cloud Console Login

Performed in the OpenStack account/security settings:

- Enabled MFA/2FA in account settings
- Scanned QR code using Google Authenticator
- Confirmed OTP linking
- Generated backup codes and stored securely offline
- Tested login successfully (password + OTP required)

**Result:**
- MFA Status: Enabled
- Authenticator: Google Authenticator
- Test Login: Successful

---

### ✅ Task 4: Document Security Configuration

Created a Markdown documentation file capturing:

- Instance details
- Security group name
- Inbound rule table (protocol/port/source/description)
- Notes about removing overly permissive rules and enabling MFA

Deliverable:
- `docs/security_group_rules.md`

---

## 📁 Repository Structure

```

lab25-secure-cloud-instance-basic/
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
├── troubleshooting.md
├── docs/
│   └── security_group_rules.md
└── notes/
└── mfa_setup_notes.md

```id="4s8t8b"

> MFA backup codes are **not** stored in the repo (stored offline).  
> Avoid committing secrets (cloud RC files, tokens, private keys).

---

## ✅ Verification & Validation

This lab was validated using:

- Instance status verification:
  - `openstack server list` shows ACTIVE + private IP
- Security group validation:
  - `openstack security group rule list <sg-id>` confirms:
    - wide-open ingress removed
    - only 22/80/443 ingress present
- MFA verification:
  - successful re-login required password + OTP (documented)
- Documentation created:
  - Markdown rule table for audit

---

## 🧠 What I Learned

- Cloud security starts at provisioning time (image, keypair, network selection)
- Security groups are a primary layer of defense (limit exposure)
- Removing overly permissive ingress rules greatly reduces attack surface
- MFA is one of the most effective account protections for cloud consoles
- Documentation is essential for audits, team handoff, and repeatability

---

## 🌍 Why This Matters

Many cloud breaches begin with:
- exposed management ports
- overly permissive firewall/security group rules
- compromised console credentials

Applying least privilege rules (only needed ports) + MFA significantly reduces risk and improves baseline cloud security posture.

---

## ✅ Result

✅ VM launched successfully and verified ACTIVE via CLI  
✅ Ingress restricted to only **22/80/443**  
✅ Overly permissive rule removed (1–65535 ingress)  
✅ MFA enabled and verified via test login  
✅ Security configuration documented for GitHub/audit trail 🚀

---

## 🏁 Conclusion

This lab demonstrated a secure-by-default cloud provisioning approach:

**Launch instance → restrict inbound exposure → protect console with MFA → document security controls**

✅ Lab completed successfully with OpenStack security group hardening and MFA enabled.

---
