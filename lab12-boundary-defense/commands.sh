#!/bin/bash
# Lab 12: Boundary Defense (CIS Control 12)
# Commands Executed During Lab (Sequential)

# -----------------------------
# Task 2: Verify Firewall Rules
# -----------------------------

mkdir -p Lab12_Boundary_Defense
cd Lab12_Boundary_Defense

sudo ufw status verbose

# Identify listening ports before blocking anything
sudo ss -tuln

# Block unused inbound port (example: 8080)
sudo ufw deny 8080

# Verify rule added
sudo ufw status

# -----------------------------
# Task 3: Test the Boundary (Netcat)
# -----------------------------

# Confirm netcat exists
nc -h 2>&1 | head -n 2

# Identify IP for test interface
ip -4 a show ens5 | grep inet

# Attempt to connect to blocked port (expected blocked/timeout)
nc -vz 172.31.10.207 8080

# Confirm allowed port still works (SSH)
nc -vz 172.31.10.207 22

# -----------------------------
# Optional: Local documentation notes
# -----------------------------

nano boundary_defense_notes.txt
