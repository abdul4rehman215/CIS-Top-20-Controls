#!/bin/bash
# Lab 13: Data Protection Basics (CIS Controls)
# Commands Executed During Lab (Windows + Linux)
# Note: Windows steps are documented; run them on Windows system.

# -----------------------------
# Task 1 (Windows): Encrypt a Test File/Folder
# -----------------------------

# (GUI steps - 7-Zip AES-256)
# - Create: C:\Users\Student\Documents\testfile.txt
# - Right-click testfile.txt -> 7-Zip -> Add to archive...
# - Archive format: 7z
# - Encryption method: AES-256
# - Set strong password -> OK
# Output: C:\Users\Student\Documents\testfile_encrypted.7z

# (GUI steps - VeraCrypt AES container)
# - Create Volume -> Create encrypted file container -> Standard volume
# - Container: C:\Users\Student\Documents\SecureContainer.hc
# - Encryption: AES
# - Size: 100 MB
# - Set strong password -> format -> finish
# - Mount container as drive (example X:) -> password

# -----------------------------
# Task 2.1 (Linux): Enable HTTPS on Apache (self-signed cert)
# -----------------------------

sudo apt-get update
sudo apt-get install apache2 openssl -y

systemctl status apache2 --no-pager | head -n 10

mkdir -p ~/Lab13_Data_Protection/https
cd ~/Lab13_Data_Protection/https

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout server.key -out server.crt
ls -l

sudo a2enmod ssl

sudo nano /etc/apache2/sites-available/lab-ssl.conf
sudo a2ensite lab-ssl.conf

sudo systemctl restart apache2
sudo ss -tuln | grep ":443" || echo "Port 443 not listening"

# -----------------------------
# Task 2.2 (Linux): Enable SSH instead of Telnet
# -----------------------------

sudo apt-get install openssh-server -y

sudo systemctl stop telnet
sudo systemctl disable telnet

sudo systemctl enable ssh
sudo systemctl start ssh
sudo ss -tuln | grep ":22"

# -----------------------------
# Task 3 (Linux): Validate encryption (HTTPS/TLS)
# -----------------------------

curl -kI https://localhost

echo | openssl s_client -connect localhost:443 -servername example.com 2>/dev/null | head -n 20

# -----------------------------
# Task 3 (Windows): Validate encrypted file/container (GUI)
# -----------------------------

# 7-Zip:
# - Attempt open testfile_encrypted.7z -> enter wrong password -> should fail
# VeraCrypt:
# - Attempt mount SecureContainer.hc -> enter wrong password -> should fail
