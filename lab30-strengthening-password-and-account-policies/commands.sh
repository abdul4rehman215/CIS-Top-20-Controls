#!/bin/bash
# Lab 30 — Strengthening Password & Account Policies (Ubuntu)
# Commands Executed During Lab (sequential, no explanations)

sudo chage -l toor
sudo sed -n '1,120p' /etc/pam.d/common-password

sudo cp /etc/security/pwquality.conf /etc/security/pwquality.conf.bak
sudo nano /etc/security/pwquality.conf
sudo egrep -n "^(minlen|dcredit|ucredit|lcredit|ocredit)" /etc/security/pwquality.conf

sudo chage -M 90 -m 7 -W 7 toor
sudo chage -l toor

sudo adduser testuser

sudo passwd testuser
sudo passwd testuser

sudo chage -l testuser
sudo chage -M 90 -m 7 -W 7 testuser
sudo chage -l testuser
