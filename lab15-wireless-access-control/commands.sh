#!/bin/bash
# Lab 15: Wireless Access Control (CIS Controls)
# Commands Executed During Lab (Windows + Linux)
# Note: Router configuration steps were performed via web GUI and are documented as comments.

# -----------------------------
# Task 1: Identify Router IP / Default Gateway (Windows)
# -----------------------------

# Windows Command Prompt (Administrator or normal)
ipconfig

# -----------------------------
# Task 1 (GUI): Access Router Admin Page
# -----------------------------

# Browser steps (manual):
# - Navigate to: http://192.168.1.1
# - Login with router admin credentials (sticker/manual/lab-provided)

# -----------------------------
# Task 2 (GUI): Enable WPA2/WPA3 Encryption
# -----------------------------

# Router GUI steps (manual):
# - Wireless / Wi-Fi Settings -> Security Mode
# - Select: WPA2-PSK (AES) (WPA3 not supported on this router model in lab)
# - Set strong passphrase (12+ chars, complex)
# - Save / Apply (Wi-Fi restarts)

# -----------------------------
# Task 3 (GUI): Disable WPS
# -----------------------------

# Router GUI steps (manual):
# - Wireless / Advanced Wireless Settings -> WPS
# - Set: Disabled
# - Save / Apply

# -----------------------------
# Task 4 (Client validation): Unauthorized vs Authorized connection test
# -----------------------------

# Manual client steps:
# - Unauthorized device: attempt join SSID with wrong password -> should fail
# - Authorized device: reconnect using correct passphrase -> should succeed

# -----------------------------
# Documentation artifact (Linux host)
# -----------------------------

mkdir -p Lab15_Wireless_Access_Control
nano Lab15_Wireless_Access_Control/wireless_security_checklist.md
ls -l Lab15_Wireless_Access_Control/
