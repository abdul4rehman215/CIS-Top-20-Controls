#!/bin/bash
# Lab 16 — Account Monitoring & Control
# Commands Executed During Lab (sequential, no explanations)

# -------------------------------
# Task 1: List All User Accounts
# -------------------------------

cat /etc/passwd
awk -F: '$3 < 1000 {print $1}' /etc/passwd

# ------------------------------------------
# Task 2: Disable or Remove Unnecessary Accounts
# ------------------------------------------

cut -d: -f1,3 /etc/passwd | tail -n 5

sudo adduser username
sudo usermod -L username
sudo passwd -S username

sudo userdel username
getent passwd username

# ------------------------------------------
# Task 3: Implement Session Timeout / Lockout Policy
# ------------------------------------------

echo "export TMOUT=300" | sudo tee -a /etc/profile
source /etc/profile
echo $TMOUT

sudo nano /etc/pam.d/common-auth
grep -n "pam_tally2" /etc/pam.d/common-auth
