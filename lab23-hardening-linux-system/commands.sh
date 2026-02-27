#!/bin/bash
# Lab — Hardening a Linux System (Ubuntu 24.04.1)
# Commands Executed During Lab (sequential, no explanations)

sudo apt list --installed

dpkg -l | grep -E "^ii" | grep -i telnet
sudo apt remove telnet -y
sudo apt autoremove -y

sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak
sudo nano /etc/ssh/sshd_config
sudo grep -n "^PermitRootLogin" /etc/ssh/sshd_config
sudo systemctl restart ssh
sudo systemctl status ssh --no-pager | head -n 12

ssh-keygen -t rsa -b 4096
ssh-copy-id toor@192.168.56.50

mkdir -p Lab_Linux_Hardening/{cis,notes,lynis} && cd Lab_Linux_Hardening
nano notes/cis_baseline_notes.md

sudo apt install lynis -y
sudo lynis audit system
sudo tail -n 25 /var/log/lynis.log | tee lynis/lynis_summary_tail.log
