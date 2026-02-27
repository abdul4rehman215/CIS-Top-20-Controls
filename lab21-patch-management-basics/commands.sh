#!/bin/bash
# Lab 21 — Patch Management Basics (Windows + Ubuntu + CentOS)
# Commands Executed During Lab (sequential, no explanations)

# -------------------------------
# Ubuntu (apt-based)
# -------------------------------

sudo apt update
apt list --upgradable
sudo apt upgrade -y
apt list --upgradable | tee updates_applied.log
ls -l updates_applied.log
if [ -f /var/run/reboot-required ]; then echo "Reboot is required"; else echo "Reboot not required"; fi
sudo reboot
dmesg | grep -i "error" | head -n 12
bash --version | head -n 2
openssh -V 2>&1

# -------------------------------
# CentOS 7 (yum-based)
# -------------------------------

sudo yum check-update
sudo yum update -y
sudo yum list updates >> updates_applied.log
ls -l updates_applied.log
dmesg | grep -i "error" | head -n 10
bash --version | head -n 2
openssl version
