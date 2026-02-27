#!/bin/bash
# Lab 06: Monitoring & Analysis of Audit Logs (CIS Control 6)
# Commands Executed During Lab (Windows + Linux)
# Note: Windows actions are listed for documentation; run them on Windows.

# -----------------------------
# Task 1: Enable Verbose Logging
# -----------------------------

# Windows (Run dialogs / GUI tools)
eventvwr
secpol.msc

# Linux: Create lab working directory
mkdir -p Lab_Audit_Log_Monitoring
cd Lab_Audit_Log_Monitoring

# Linux: Edit rsyslog configuration (ensure auth logging line exists)
sudo nano /etc/rsyslog.conf

# Verify auth logging line exists
sudo grep -n "auth\.\*" /etc/rsyslog.conf

# Restart syslog service
sudo systemctl restart rsyslog

# Confirm rsyslog is running
systemctl status rsyslog --no-pager | head -n 12

# -----------------------------
# Task 2: Collect Logs (Centralize)
# -----------------------------

mkdir ~/log_analysis
cp /var/log/auth.log ~/log_analysis/
ls -lh ~/log_analysis

# Windows (Event Viewer Export - manual GUI step)
# Event Viewer > Windows Logs > Security > Action > Save All Events As... -> Security.evtx

# -----------------------------
# Task 3: Analyze Logs for Suspicious Entries
# -----------------------------

cd ~/log_analysis

# Filter for suspicious failed logins
grep 'Failed' auth.log

# Count repeated failed attempts by IP (brute-force indicator)
grep "Failed password" auth.log | awk '{print $(NF-3)}' | sort | uniq -c | sort -nr | head

# Check for successful logins (Accepted)
grep "Accepted" auth.log | tail -n 10

# Windows (Event Viewer Filter - manual GUI step)
# Open Security.evtx and filter for "Logon Failure"
