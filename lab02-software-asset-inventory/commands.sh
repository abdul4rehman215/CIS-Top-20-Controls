#!/bin/bash
# Lab 02: Software Asset Inventory (CIS Control 2)
# Commands Executed During Lab (Windows + Linux)
# Note: Windows commands are listed for documentation; run them in an elevated Command Prompt.

# -----------------------------
# Task 1: Windows Software Inventory (Admin CMD)
# -----------------------------

# List installed software (MSI-registered)
wmic product get name,version,vendor

# Export installed software list to CSV
wmic product get name,version,vendor /format:csv > installed_software.csv

# Verify exported file exists
dir installed_software.csv

# -----------------------------
# Task 2: Linux Software Inventory (Ubuntu)
# -----------------------------

# Print installed packages in CSV-friendly format (prints a LOT)
dpkg-query -W -f='${binary:Package},${Version},${Maintainer}\n'

# Check if rpm exists on Ubuntu (RPM-based distros use rpm)
rpm -qa --queryformat '%{NAME},%{VERSION},%{PACKAGER}\n'

# Create working directory for Linux inventory outputs
mkdir -p Software_Asset_Inventory
cd Software_Asset_Inventory

# Export installed packages to CSV
dpkg-query -W -f='${binary:Package},${Version},${Maintainer}\n' > installed_software.csv

# Validate file size and preview
ls -lh installed_software.csv
head -n 15 installed_software.csv

# -----------------------------
# Task 3: Quick EOL / Unknown Pre-Checks (Linux)
# -----------------------------

# Look for missing maintainer/packager fields (rare but possible)
awk -F',' 'NF<3 || $3=="" {print NR ":" $0}' installed_software.csv | head

# Check versions of commonly security-critical packages
dpkg -l | egrep 'openssh|openssl|python3|sudo|curl|nmap' | head -n 20

# Create notes file for spreadsheet flagging workflow
nano eol_unknown_flagging_notes.txt

# Verify generated files exist
ls -l
