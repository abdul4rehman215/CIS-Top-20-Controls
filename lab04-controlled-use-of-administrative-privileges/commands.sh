#!/bin/bash
# Lab 04: Controlled Use of Administrative Privileges (CIS Control 4)
# Commands Executed During Lab (Sequential)

# -----------------------------
# Task 1: Identify Administrative Privileges
# -----------------------------

cat /etc/group | grep sudo
cat /etc/group | grep wheel

sudo visudo

# -----------------------------
# Task 2: Remove / Downgrade Unnecessary Admin Accounts
# -----------------------------

sudo deluser intern1 sudo
cat /etc/group | grep sudo

id intern1

id tempadmin
sudo userdel tempadmin
id tempadmin

cat /etc/group | grep sudo

# -----------------------------
# Task 3: Document Changes + Verify Stability
# -----------------------------

mkdir -p Lab4_Admin_Privilege_Control
cd Lab4_Admin_Privilege_Control

nano change_log.txt

sudo tail /var/log/auth.log

sudo -v
