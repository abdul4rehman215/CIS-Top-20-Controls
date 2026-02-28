# Secure Endpoint Configuration Checklist

Date: 2026-02-28
System: Ubuntu 24.04.1 LTS
User: toor

## Task 1 - Benchmark / Guideline
- [ ] Installed Lynis (audit tool)
- [ ] Performed Lynis system audit
- [ ] Applied recommended remediation(s) (SSH hardening)

## Task 2 - Unnecessary Services
- [ ] Reviewed running services (systemctl)
- [ ] Disabled non-essential services (example: bluetooth.service if present)

## Task 3 - Password Complexity
- [ ] Configured /etc/security/pwquality.conf
- [ ] Verified PAM includes pwquality module (where applicable)
- [ ] Documented settings applied
