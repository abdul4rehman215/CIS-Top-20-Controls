# 🧠 Interview Q&A — Lab 05: Secure Configuration for Endpoints (CIS Control 5)

> This Q&A focuses on endpoint hardening, benchmark-driven configuration, service reduction, SSH security, and password policy enforcement.

---

## 1) What is the purpose of applying a security benchmark (like CIS-style guidance)?
Security benchmarks provide proven configuration recommendations that reduce attack surface and enforce secure defaults. They help standardize hardening across systems and support audits.

---

## 2) Why use an audit tool like Lynis on Linux?
Lynis performs a system security audit and highlights weaknesses (warnings) and improvement areas (suggestions). It provides structured guidance for hardening.

---

## 3) In this lab, what was the key Lynis warning and how was it addressed?
The key warning was SSH hardening. It was addressed by explicitly setting:
- `PermitRootLogin no`
and verifying with `sshd -t` and `sshd -T`.

---

## 4) Why is disabling SSH root login considered a baseline hardening step?
It reduces the chance of brute-force attacks targeting root and forces attackers to compromise a normal user first, which adds friction and improves auditing/accountability.

---

## 5) What does `sshd -t` do?
It validates the SSH configuration file syntax. No output typically means the config is valid.

---

## 6) What does `sshd -T` show?
It prints the effective runtime configuration values after all defaults and includes are processed. It’s useful for confirming what is actually active.

---

## 7) Why should unnecessary services be disabled on endpoints?
Because every running service can expose ports, processes, and vulnerabilities. Disabling unused services reduces attack surface and reduces the chance of exploitation.

---

## 8) Why was Bluetooth not disabled in this lab?
Because `bluetooth.service` was not present on the cloud VM (common for server/cloud instances). The lab still demonstrated the method using another service.

---

## 9) Why might `avahi-daemon` be considered unnecessary on many servers?
Avahi provides mDNS/DNS-SD service discovery. On server/cloud endpoints, it’s often not required and can be disabled to reduce exposure and noise.

---

## 10) What does `systemctl disable --now <service>` do?
It stops the service immediately (`--now`) and prevents it from starting at boot (`disable`).

---

## 11) What is the role of `/etc/security/pwquality.conf`?
It defines password strength requirements (length and complexity rules) enforced by PAM modules such as `pam_pwquality.so`.

---

## 12) What do these settings mean in `pwquality.conf`?
- `minlen=12` → minimum password length
- `dcredit=-1` → require at least 1 digit
- `ucredit=-1` → require at least 1 uppercase letter
- `lcredit=-1` → require at least 1 lowercase letter
- `ocredit=-1` → require at least 1 special character

---

## 13) Why verify PAM includes `pam_pwquality.so`?
Because setting pwquality rules alone is not enough—PAM must actually apply them during password change operations.

---

## 14) What is the value of keeping a configuration checklist?
A checklist provides audit-ready evidence, ensures repeatability, and helps teams verify that required hardening steps were completed consistently.

---

## 15) How do Windows policies in this lab reduce brute-force risk?
Account lockout settings (threshold and duration) slow brute-force attempts by locking accounts after repeated failed logons, making password guessing attacks harder.
