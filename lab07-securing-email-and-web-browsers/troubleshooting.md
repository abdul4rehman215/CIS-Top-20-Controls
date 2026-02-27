# 🛠️ Troubleshooting Guide — Lab 07: Securing Email & Web Browsers (CIS Control 7)

> This guide covers common issues when installing Thunderbird/Firefox, enabling phishing protections, and configuring browser security add-ons/settings.

---

## 1) Thunderbird installation fails (package errors)

### ✅ Problem
`sudo apt-get install thunderbird -y` fails due to repository or dependency issues.

### 💡 Cause
- Package lists outdated
- Network/DNS issues
- Repository temporarily unavailable

### ✅ Resolution
1) Update repositories:
```bash
sudo apt update
````

2. Retry installation:

```bash id="hmlfz0"
sudo apt-get install thunderbird -y
```

3. Check connectivity if downloads fail:

```bash id="wqu7vm"
ping -c 2 archive.ubuntu.com
```

---

## 2) Thunderbird opens but no “Tools” menu is visible

### ✅ Problem

UI layout differs and the Tools menu is hidden.

### 💡 Cause

Thunderbird UI changes depending on version and platform theme.

### ✅ Resolution

* Use the application menu (≡) to access settings
* Look for:

  * Account Settings
  * Junk settings
* Alternatively press **Alt** to show the classic menu bar.

---

## 3) Junk/phishing filtering doesn’t appear to work

### ✅ Problem

Test messages are not flagged as Junk.

### 💡 Cause

* Filtering not enabled for that account
* Training data not yet built (adaptive filters improve over time)
* Test email doesn’t match typical phishing characteristics
* Server-side filtering behavior differs

### ✅ Resolution

* Confirm junk settings are enabled for the correct account.
* Mark multiple test messages as Junk to train adaptive filters.
* Verify that spam/junk headers (if used) are trusted and present.

---

## 4) Firefox installation shows “already the newest version”

### ✅ Problem

`sudo apt-get install firefox -y` says it is already installed.

### 💡 Cause

Firefox is already present in the system image.

### ✅ Resolution

This is expected. Verify:

```bash
firefox --version
```

---

## 5) Can’t install add-ons (NoScript/uBlock Origin) due to restrictions

### ✅ Problem

Firefox add-on installation fails or is blocked.

### 💡 Cause

* Restricted environment
* Policy-managed browser
* Network restrictions to Mozilla add-on store
* Missing GUI access in some environments

### ✅ Resolution

* Confirm Firefox has internet access.
* Try accessing add-ons store from a different network.
* If enterprise-managed, add-ons may require administrator policy approval.
* Document the intended configuration if add-ons cannot be installed in the lab environment.

---

## 6) NoScript breaks websites (pages don’t load properly)

### ✅ Problem

Sites appear broken: buttons don’t work, pages don’t render correctly.

### 💡 Cause

Many modern websites require JavaScript.

### ✅ Resolution

* Allow scripts only for trusted domains.
* Use a minimal allowlist approach:

  * allow the main site domain
  * keep third-party scripts blocked unless required
* Consider “temporarily allow” first to test impact before permanent allowing.

---

## 7) uBlock Origin blocks content needed for a site

### ✅ Problem

A site feature doesn’t work after enabling uBlock Origin.

### 💡 Cause

Some sites rely on third-party requests that uBlock blocks.

### ✅ Resolution

* Use uBlock logger to identify what is blocked.
* Allow only the specific domain needed rather than disabling the extension entirely.
* Keep the rest of the blocking active for safety.

---

## 8) “Strict” tracking protection breaks site logins or embedded content

### ✅ Problem

Embedded content (videos, logins, widgets) fails after setting Strict mode.

### 💡 Cause

Strict mode blocks more third-party tracking resources, which some sites depend on.

### ✅ Resolution

* Add an exception for that site if required.
* Use site-specific settings rather than lowering global protections.
* Keep Deceptive Content protection enabled at all times.

---

## 9) Fingerprinting protection impacts site compatibility

### ✅ Problem

Some websites behave unexpectedly with fingerprinting protection enabled.

### 💡 Cause

Fingerprinting defenses can change or limit exposed browser characteristics.

### ✅ Resolution

* Keep protection enabled globally.
* Add exceptions only for sites that must work and are trusted.
* Re-test after browser updates (compatibility can improve).

---

## 10) “Phishing-like test email” not safe to use

### ✅ Problem

Uncertainty about how to safely test phishing filters.

### 💡 Cause

Real phishing emails may contain malicious content.

### ✅ Resolution

Use harmless simulations:

* a plain text email with suspicious-looking phrasing
* a fake login link pointing to a non-malicious test domain
* no attachments, no macros, no executables
  Document the result (flagged/not flagged) and your training action (mark as Junk).

---

## ✅ Final Tip: Keep Security Practical

The goal is to reduce risk without disabling usability:

* block scripts by default
* allow only trusted domains
* keep tracking protection strict where possible
* document settings so a secure baseline can be reproduced across endpoints

---
