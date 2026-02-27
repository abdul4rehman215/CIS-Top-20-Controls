#!/bin/bash
# Lab 01: Hardware Asset Inventory (CIS Control 1)
# Commands Executed During Lab (Sequential)

# -----------------------------
# Task 1: Create Inventory Files
# -----------------------------

mkdir -p Hardware_Asset_Inventory
cd Hardware_Asset_Inventory
pwd

# Create inventory table
nano hardware_inventory.txt

# Verify inventory file
ls -l
head -n 15 hardware_inventory.txt

# -----------------------------
# Task 2: Install + Use nmap
# -----------------------------

# Check if nmap exists
nmap --version

# Install nmap (as required)
sudo apt update
sudo apt install nmap -y

# Identify subnet / IP
ip a show ens5

# Ping sweep scan (lab uses -sP)
nmap -sP 172.31.10.0/24

# Create validation notes file
nano scan_validation_notes.txt

# Verify created files
ls -l
