#!/bin/bash
# Lab 07: Securing Email & Web Browsers (CIS Control 7)
# Commands Executed During Lab (Sequential)

# -----------------------------
# Task 1: Email Client Security (Thunderbird)
# -----------------------------

sudo apt-get install thunderbird -y
thunderbird --version

# Thunderbird GUI steps (documented):
# - Tools > Account Settings > Junk Settings
# - Enable adaptive junk mail controls
# - Enable "Trust junk mail headers set by"
# - Test using a safe phishing-like sample email

# -----------------------------
# Task 2: Browser Security Plugins (Firefox)
# -----------------------------

sudo apt-get install firefox -y
firefox --version

# Firefox GUI steps (documented):
# - Menu (☰) > Add-ons and themes
# - Install: NoScript
# - Install: uBlock Origin
# - Test on a high-ad page to confirm scripts/ads/pop-ups blocked

# -----------------------------
# Task 3: Document Unsafe Default Settings Changed
# -----------------------------

mkdir -p Lab7_Email_Browser_Security
cd Lab7_Email_Browser_Security
nano browser_email_security_checklist.md

ls -l
