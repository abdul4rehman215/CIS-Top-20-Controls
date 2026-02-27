#!/bin/bash
# Lab 11: Secure Configuration for Network Devices (CIS Control 11)
# Commands Executed During Lab (Sequential)
# Note: Device CLI commands are included for documentation; run them on the network device console/SSH session.

# -----------------------------
# Task 1: Access Management Interface
# -----------------------------

# Windows (Gateway discovery)
ipconfig

# Linux (Gateway discovery)
ip route | head

# Web UI access (manual browser step)
# http://192.168.1.1
# Login attempted with default credentials (admin/admin)

# -----------------------------
# Device CLI: Enable SSH (Cisco-like IOS simulation)
# -----------------------------

# Router> enable
# Router# configure terminal
# ip ssh version 2
# line vty 0 4
# transport input ssh
# exit
# exit

# Linux host SSH into device
ssh admin@192.168.1.1

# Console access (PuTTY example - manual step)
# Serial COM3 @ 9600 baud

# -----------------------------
# Task 2: Change Default Credentials + Disable Unnecessary Services
# -----------------------------

# Device CLI: Create new user and save config
# Router> enable
# Router# configure terminal
# username newuser password newpassword
# exit
# write memory

# Device CLI: Review services
# show services

# Device CLI: Disable HTTP while keeping HTTPS
# configure terminal
# no ip http server
# exit
# copy running-config startup-config

# Verify services again
# show services

# Export running config (for documentation)
# show running-config

# -----------------------------
# Task 3: Document Final Configuration
# -----------------------------

mkdir -p Lab11_Secure_Network_Device_Config
cd Lab11_Secure_Network_Device_Config
nano final_device_config.txt
ls -l
