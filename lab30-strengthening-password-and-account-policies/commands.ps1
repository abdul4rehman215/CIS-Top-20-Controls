# Lab 30 — Strengthening Password & Account Policies
# Windows 11 Pro (GUI-driven) — Command log / validation notes

# NOTE: Password policy changes performed via GUI:
# Run (Win + R) → secpol.msc
# Account Policies → Password Policy
#
# Before (documented):
# - Minimum password length: 8
# - Password must meet complexity requirements: Disabled
# - Maximum password age: 0 (never expires) [example]
# - Enforce password history: 0
#
# After (applied):
# - Minimum password length: 12
# - Password must meet complexity requirements: Enabled
# - Maximum password age: 90 days
#
# Testing (GUI-driven):
# - Created a test user in Computer Management → Local Users and Groups → Users
# - Attempted weak password: Rejected
# - Attempted compliant password: Accepted
# - Test user login: Successful
