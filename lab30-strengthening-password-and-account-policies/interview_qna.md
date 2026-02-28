# 🎤 Interview Q&A — Lab 30: Strengthening Password & Account Policies (Windows + Linux)

> Below are interview-style questions and answers based on reviewing existing password policies, hardening them on Windows and Ubuntu, and validating enforcement using test accounts.

---

## 1) Why are password and account policies important?
Password policies reduce the risk of account compromise by enforcing strong passwords and limiting how long credentials remain valid. Account policies (like lockout/aging) reduce brute-force success and improve baseline security posture.

---

## 2) What changes did you make to the Windows password policy?
I updated Windows Local Security Policy settings to:
- Minimum password length: **12**
- Password complexity requirements: **Enabled**
- Maximum password age: **90 days**

This moved from a weaker baseline (8 chars, complexity disabled, no expiration) to stronger enforcement.

---

## 3) Where do you configure these password policies in Windows?
Using:
- Run → `secpol.msc`
- Account Policies → Password Policy

For domain environments, these are typically managed via Group Policy in Active Directory.

---

## 4) How did you validate Windows policy enforcement?
By creating a test local user and attempting:
- a weak password → rejected
- a compliant password → accepted
Then confirming the test user could log in successfully.

---

## 5) On Linux, which tools did you use to review password policy?
- `chage -l <user>` to review password aging/expiration settings
- `/etc/pam.d/common-password` to inspect the PAM password stack
- `/etc/security/pwquality.conf` for password quality/complexity rules

---

## 6) What does `chage` control?
`chage` controls password aging policy, including:
- maximum password age (rotation interval)
- minimum days between password changes
- warning period before expiration
- account expiration

---

## 7) What did the baseline Linux `chage -l` output indicate?
It indicated a default-like policy where the password effectively never expires (max days set very high). This is common on fresh systems unless explicitly hardened.

---

## 8) How did you enforce password complexity on Ubuntu?
By configuring pwquality rules in:
- `/etc/security/pwquality.conf`

Applied settings included:
- `minlen=12`
- requiring at least one digit, uppercase, lowercase, and special character (via `dcredit/ucredit/lcredit/ocredit`)

---

## 9) What do `dcredit/ucredit/lcredit/ocredit` mean?
They control required character classes:
- `dcredit=-1` requires at least 1 digit
- `ucredit=-1` requires at least 1 uppercase letter
- `lcredit=-1` requires at least 1 lowercase letter
- `ocredit=-1` requires at least 1 special character

Negative values indicate “require at least N”.

---

## 10) How did you enforce password rotation on Ubuntu?
Using:
- `sudo chage -M 90 -m 7 -W 7 <user>`

Meaning:
- max age = 90 days
- min days between changes = 7
- warning period = 7 days before expiration

---

## 11) How did you validate Linux enforcement worked?
I created a test account and attempted to set:
- a weak password → rejected with pwquality warnings
- a compliant password → accepted
Then verified aging policy via `chage -l`.

---

## 12) Why did you apply `chage` separately to the test user?
Because changing password aging for `toor` does not automatically apply to new users unless you modify system defaults (e.g., `/etc/login.defs`). For consistent enforcement, you apply the policy to each account or set defaults for new users.

---

## 13) What’s a common mistake teams make with password policies?
They configure policies but do not test enforcement. Practical validation (weak vs strong attempts) ensures policies are actually active in real account behavior.

---

## 14) What’s the security tradeoff with password expiration?
Expiration can reduce long-term credential exposure but may also cause users to create predictable passwords if forced too frequently. A balanced approach uses:
- strong MFA
- strong password policy
- reasonable rotation intervals
- monitoring and lockout controls

---

## 15) What is the biggest takeaway from this lab?
Policy hardening must be:
**reviewed → updated → tested → verified**
across platforms, and implemented in a way that avoids storing passwords or secrets in plaintext documentation.
