# 🧠 Interview Q&A — Lab 04: Controlled Use of Administrative Privileges (CIS Control 4)

> This Q&A focuses on least privilege, sudo group auditing, sudoers configuration, and safe privilege changes.

---

## 1) What does “controlled use of administrative privileges” mean?
It means limiting admin-level access to only the accounts that truly need it, enforcing least privilege, and regularly auditing privileged users to reduce security risk.

---

## 2) Why is it risky to have too many admin accounts?
Because every admin account increases the attack surface. If a privileged account is compromised, an attacker can gain full control of the system, disable security controls, or exfiltrate data.

---

## 3) On Ubuntu, which group commonly grants administrative privileges?
The `sudo` group. Users in the `sudo` group can execute commands as root (depending on sudoers rules).

---

## 4) What does this line in `/etc/sudoers` mean: `%sudo ALL=(ALL:ALL) ALL`?
It means any user in the `sudo` group can run **any command** as **any user** (including root), typically after authenticating.

---

## 5) Why is `visudo` recommended over editing `/etc/sudoers` directly?
Because `visudo` performs syntax validation and prevents broken sudo configurations that could lock administrators out of privileged access.

---

## 6) How can you quickly list users with sudo privileges?
Check group membership:
```bash
cat /etc/group | grep sudo
````

You can also use:

```bash
getent group sudo
```

---

## 7) What is the difference between `sudo` and `wheel` groups?

Different Linux distributions use different group conventions:

* Ubuntu/Debian typically use `sudo`
* RHEL/CentOS/Fedora often use `wheel`
  Both can be configured to allow privileged access via sudoers.

---

## 8) What is the purpose of removing an intern account from sudo?

Intern accounts typically don’t need persistent admin rights. Removing sudo reduces the chance of privilege misuse or compromise, aligning with least privilege.

---

## 9) What does `sudo deluser intern1 sudo` do?

It removes user `intern1` from the `sudo` group, downgrading privileges so they no longer have admin access via sudo group membership.

---

## 10) Why might you downgrade privileges instead of deleting the account?

Downgrading preserves the account for legitimate access while removing unnecessary elevated rights. Deleting may be appropriate later if the account is no longer needed.

---

## 11) What does `sudo userdel tempadmin` do?

It deletes the user account `tempadmin` from the system. This is useful for removing unused temporary privileged accounts and reducing attack surface.

---

## 12) Why should you document privilege changes in a change log?

Documentation supports:

* audits and compliance
* accountability
* troubleshooting (knowing what changed and why)
* rollback planning if something breaks

---

## 13) Why check `/var/log/auth.log` after privilege changes?

Because it records sudo usage and authentication-related events. Reviewing it helps confirm actions were executed and detects errors or suspicious activity.

---

## 14) What does `sudo -v` verify?

It refreshes or validates sudo credentials for the current user. If it succeeds, it confirms sudo is still functional for the admin user.

---

## 15) What best practice should be followed before making privilege changes in production?

Use a change process:

* confirm business need
* document changes + approvals
* ensure at least one verified admin account remains
* test access before ending the session
* have a rollback plan

---
