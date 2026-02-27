#!/bin/bash
# Lab 09: Limiting Network Ports, Protocols, & Services (CIS Control 9)
# Commands Executed During Lab (Sequential)

# -----------------------------
# Task 1: Check Open Ports
# -----------------------------

mkdir -p Lab_Limiting_Ports_Protocols_Services
cd Lab_Limiting_Ports_Protocols_Services

sudo netstat -tuln

sudo apt update
sudo apt install net-tools -y

sudo netstat -tuln
sudo ss -tuln

# -----------------------------
# Task 2: Block Unused Ports/Services via Firewall
# -----------------------------

sudo ufw status
sudo ufw enable
sudo ufw allow 22/tcp
sudo ufw deny 23
sudo ufw reload
sudo ufw status verbose

sudo iptables -A INPUT -p tcp --dport 23 -j DROP
sudo iptables -L INPUT -n --line-numbers | head -n 20

sudo mkdir -p /etc/iptables
sudo iptables-save > /etc/iptables/rules.v4
sudo head -n 15 /etc/iptables/rules.v4

# -----------------------------
# Task 3: Verification
# -----------------------------

sudo netstat -tuln
sudo ss -tuln
sudo ss -tuln | grep ":23" || echo "Port 23 is not listening"
