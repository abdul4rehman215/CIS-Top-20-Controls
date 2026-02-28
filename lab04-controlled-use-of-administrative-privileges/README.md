# 🔐 Lab 04: Controlled Use of Administrative Privileges (CIS Controls)

> **Environment:** Ubuntu 24.04.1 LTS (Cloud Lab Environment)  
> **User:** toor  
> **Category:** CIS Top 20 Controls (Lab 04 of 15)

---

## 🎯 Objectives

By the end of this lab, I was able to:

- Identify all accounts with **administrative privileges** on a Linux system.
- Control admin access by **removing/downgrading** unnecessary privileged accounts.
- Document changes and verify stability using system logs and privilege checks.

---

## ✅ Prerequisites

- Basic Linux system administration knowledge (users/groups).
- Comfort with terminal/CLI usage.
- `sudo` access for privileged operations.
- Understanding of least privilege and why excessive admin accounts increase risk.

---

## 🧪 Lab Environment

| Component | Details |
|---|---|
| OS | Ubuntu 24.04.1 LTS |
| Environment | Cloud Lab Environment |
| User | toor |
| Privilege Model | `sudo` group + `/etc/sudoers` |
| Key Tools | `cat`, `grep`, `visudo`, `deluser`, `userdel`, `id`, `tail`, `sudo` |

---

## 🗂️ Repository Structure (Lab Folder)

```text
lab04-controlled-use-of-administrative-privileges/
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
├── troubleshooting.md
└── artifacts/
    └── change_log.txt
```

> ✅ Note: This lab is user/group management + documentation based.

---

## 🔐 Security Note (Important)

This lab modifies user privilege levels:

* Removing users from `sudo`
* Deleting unnecessary accounts

⚠️ In production environments, privilege changes should follow:

* change management approvals
* backup of configs
* rollback plan
* documented ticket/audit trail

---

## ✅ Tasks Overview (What I Did)

### ✅ Task 1: List All Accounts with Administrative Privileges

* Checked membership of the `sudo` group to identify privileged users.
* Checked for `wheel` group usage (common on some distros, not used here).
* Inspected `/etc/sudoers` safely using `visudo` to confirm privilege rules.

### ✅ Task 2: Remove or Downgrade Unnecessary Admin Accounts

* Assessed each privileged account for necessity:

  * `toor` → required
  * `secops` → required
  * `intern1` → not required (intern role)
* Removed `intern1` from the `sudo` group to downgrade privileges.
* Removed a temporary privileged account `tempadmin` completely using `userdel`.

### ✅ Task 3: Document Changes and Verify System Stability

* Created a change log documenting:

  * what changed
  * who was affected
  * why it was done
* Reviewed authentication logs (`/var/log/auth.log`) to confirm actions were recorded and no errors occurred.
* Confirmed sudo still works for the main admin account using `sudo -v`.

---

## ✅ Verification & Validation

* Verified privileged users via:

  * `cat /etc/group | grep sudo`
* Verified `wheel` group not used:

  * `cat /etc/group | grep wheel`
* Verified sudoers config rule:

  * `%sudo   ALL=(ALL:ALL) ALL`
* Verified `intern1` still exists but has no sudo privileges:

  * `id intern1`
* Verified `tempadmin` account deletion:

  * `id tempadmin` → not found
* Verified log stability via:

  * `sudo tail /var/log/auth.log`
* Verified admin functionality still intact:

  * `sudo -v`

---

## 🧠 What I Learned

* Administrative privileges should be tightly controlled and regularly audited.
* Group membership (`sudo`) is a common mechanism for privilege assignment.
* `visudo` is the safest way to view/edit sudoers to prevent syntax errors.
* Downgrading privileges (remove from sudo) is often better than deleting accounts immediately.
* Removing unused admin accounts reduces attack surface and limits privilege escalation options.

---

## 🎯 Why This Matters

Unnecessary admin privileges increase risk by:

* expanding the attack surface
* enabling privilege escalation paths
* increasing damage potential if accounts are compromised

Least privilege helps ensure users only have the access they truly need.

---

## 🌍 Real-World Applications

* Removing admin rights from temporary roles (interns, contractors)
* Eliminating stale/admin accounts after offboarding or role changes
* Supporting compliance audits (CIS, ISO, SOC processes)
* Hardening systems used in production environments

---

## ✅ Result

* ✅ Identified privileged users by checking sudo group + sudoers configuration.
* ✅ Downgraded an intern account by removing sudo membership.
* ✅ Deleted an unnecessary temporary privileged account.
* ✅ Verified changes through logs and sudo validation checks.
* ✅ Documented everything in a change log artifact.

---

## 🧾 Conclusion

This lab demonstrates a practical least-privilege workflow:

* identify privileged accounts
* reduce unnecessary admin access
* document changes for auditability
* validate system stability

✅ Lab completed successfully on a cloud lab environment.

---

## 📦 Artifacts Created (Committed to Repo)

Stored under `artifacts/`:

* `change_log.txt`

---
