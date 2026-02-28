# Windows Policy Notes — Lab 30 (Windows 11 Pro)

## Policy Review (Before)
Path:
- Run (Win + R) → `secpol.msc`
- Account Policies → Password Policy

Observed settings (before):
- Minimum password length: 8
- Password must meet complexity requirements: Disabled
- Maximum password age: 0 (Password never expires) [example]
- Enforce password history: 0

Finding:
- Current settings allow short passwords and no complexity enforcement.

Risk:
- Weak passwords increase risk of brute force and credential stuffing.

---

## Policy Hardening (After)
Updated settings:
- Minimum password length: 12
- Password must meet complexity requirements: Enabled
- Maximum password age: 90 days

---

## Enforcement Test
- Created a test user (Computer Management → Local Users and Groups → Users)
- Attempted weak password: Rejected (did not meet complexity/length)
- Attempted compliant password: Accepted
- Test user login: Successful
