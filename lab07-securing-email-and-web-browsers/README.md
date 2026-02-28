# 📧🛡️ Lab 07: Securing Email & Web Browsers (CIS Controls)

> **Environment:** Ubuntu 24.04.1 LTS (Cloud Lab Environment)  
> **User:** toor  
> **Tools:** Mozilla Thunderbird, Mozilla Firefox, NoScript, uBlock Origin  
> **Category:** CIS Top 20 Controls (Lab 07 of 15)

---

## 🎯 Objectives

By the end of this lab, I was able to:

- Understand why securing **email clients** and **web browsers** is critical for endpoint security.
- Enable phishing/junk filtering capabilities inside an email client (Thunderbird).
- Install and verify browser security extensions (NoScript + uBlock Origin).
- Review and tighten unsafe default browser settings (tracking + phishing protection + fingerprinting defenses).
- Document security configuration changes using a checklist.

---

## ✅ Prerequisites

- Basic understanding of email and web browsing technologies.
- Familiarity with installing software/plugins.
- Access to an email client + web browser.

---

## 🧪 Lab Environment

| Component | Details |
|---|---|
| OS | Ubuntu 24.04.1 LTS |
| Environment | Cloud Lab Environment |
| User | toor |
| Email Client | Mozilla Thunderbird |
| Web Browser | Mozilla Firefox |
| Browser Add-ons | NoScript, uBlock Origin |
| Documentation Method | checklist (`browser_email_security_checklist.md`) |

---

## 🗂️ Repository Structure (Lab Folder)

```text
lab07-securing-email-and-web-browsers/
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
├── troubleshooting.md
└── artifacts/
    └── browser_email_security_checklist.md
```

> ✅ Note: This lab focuses on software installation, GUI configuration steps, and verification.

---

## ✅ Tasks Overview (What I Did)

### ✅ Task 1: Enable Phishing Filters in an Email Client (Thunderbird)

* Installed Mozilla Thunderbird.
* Enabled junk/phishing filtering features inside Thunderbird:

  * Adaptive junk controls enabled
  * Trust junk mail headers enabled
* Performed a safe phishing-like test email simulation and confirmed it was flagged.

### ✅ Task 2: Install/Activate Browser Security Plugins (Firefox)

* Confirmed Firefox installation.
* Installed browser hardening add-ons:

  * **NoScript** (script blocker)
  * **uBlock Origin** (ads/trackers/pop-up blocker)
* Tested the extensions on a high-ad test page and verified:

  * scripts blocked by default
  * pop-ups blocked
  * tracking/ads requests blocked

### ✅ Task 3: Modify Unsafe Default Browser Settings (Firefox)

* Reviewed Firefox Privacy & Security settings.
* Applied recommended security configuration:

  * Enhanced Tracking Protection: **Standard → Strict**
  * Deceptive Content and Dangerous Software Protection: **enabled**
  * Block Fingerprinting: **enabled**
* Documented every setting and rationale inside a checklist file.

---

## ✅ Verification & Validation

* Verified Thunderbird version:

  * `thunderbird --version`
* Verified Firefox version:

  * `firefox --version`
* Confirmed NoScript and uBlock Origin installed via Firefox Add-ons UI.
* Verified blocker effectiveness on a high-ad page:

  * uBlock request counter increased
  * NoScript indicated blocked scripts
  * pop-ups did not appear
* Confirmed checklist file exists:

  * `browser_email_security_checklist.md`

---

## 🧠 What I Learned

* Email clients are common phishing entry points; filters reduce user exposure.
* Browser extensions significantly reduce risk from:

  * malicious scripts
  * drive-by downloads
  * ad-based malware delivery
  * tracking and fingerprinting
* Tightening default privacy/security settings improves protection without needing complex tools.
* A checklist makes security changes auditable and repeatable.

---

## 🎯 Why This Matters

Email and browsers are among the most targeted applications:

* phishing campaigns
* malicious attachments/links
* credential harvesting
* malvertising
* session hijacking and tracking

Hardening these endpoints reduces real-world compromise risk.

---

## 🌍 Real-World Applications

* Secure baseline configuration for user workstations
* SOC hardening checklist for endpoints
* Reducing phishing success rates through layered controls
* Building safer browsing environments for corporate users

---

## ✅ Result

* ✅ Thunderbird installed and junk/phishing controls enabled + tested.
* ✅ Firefox installed and hardened using NoScript + uBlock Origin.
* ✅ Browser defaults tightened (Strict tracking protection + fingerprinting protection).
* ✅ All changes documented in a checklist for compliance and review.

---

## 🧾 Conclusion

This lab improved endpoint security by applying practical protections to the two most attacked user applications:

Email + Browser.

✅ Lab completed successfully on a cloud lab environment.

---

## 📦 Artifacts Created (Committed to Repo)

Stored under `artifacts/`:

* `browser_email_security_checklist.md`

---
