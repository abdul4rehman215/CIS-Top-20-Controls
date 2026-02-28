# Linux Policy Notes — Lab 30 (Ubuntu 24.04.1)

## Baseline Review
### Password aging (user: toor)
Checked with:
- `sudo chage -l toor`

Observed (before):
- Maximum number of days: 99999
- Password expires: never
- Minimum days between password changes: 0
- Warning days: 7

### PAM baseline (password stack)
Reviewed:
- `/etc/pam.d/common-password`

Finding:
- `pam_unix.so` present; strong complexity enforcement typically comes from pwquality (`/etc/security/pwquality.conf`).

---

## Policy Hardening Applied
### 1) Password complexity (pwquality)
Backed up:
- `/etc/security/pwquality.conf.bak`

Updated in `/etc/security/pwquality.conf`:
- minlen=12
- dcredit=-1
- ucredit=-1
- lcredit=-1
- ocredit=-1

Verified with:
- `sudo egrep -n "^(minlen|dcredit|ucredit|lcredit|ocredit)" /etc/security/pwquality.conf`

### 2) Password aging / rotation (chage)
Applied to user `toor`:
- `sudo chage -M 90 -m 7 -W 7 toor`

Verified:
- Password expires date set
- Min days between changes enforced

---

## Enforcement Testing (testuser)
1) Created test user:
- `sudo adduser testuser`

2) Weak password attempt:
- Rejected (too short / dictionary check)

3) Compliant password:
- Accepted

4) Applied password aging policy to `testuser` as well:
- `sudo chage -M 90 -m 7 -W 7 testuser`

Verified with:
- `sudo chage -l testuser`
