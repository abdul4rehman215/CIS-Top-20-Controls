#!/bin/bash
# Lab 14: Controlled Access Based on Need-to-Know (CIS Controls)
# Commands Executed During Lab (Sequential)

# -----------------------------
# Task 1: Create Finance folder
# -----------------------------

cd ~
mkdir Finance
ls -ld Finance

# -----------------------------
# Task 2: Create user/group and assign permissions
# -----------------------------

cut -d: -f1 /etc/passwd | head -n 25

sudo useradd finance_user
id finance_user

sudo groupadd finance_group
getent group finance_group

sudo usermod -aG finance_group finance_user
id finance_user

sudo chown :finance_group Finance
ls -ld Finance

sudo chmod 770 Finance
ls -ld Finance

# -----------------------------
# Task 3: Unauthorized access test (demo_user)
# -----------------------------

sudo useradd -m demo_user
id demo_user

su - demo_user
cd /home/toor/Finance
ls /home/toor/Finance
exit

# -----------------------------
# Task 4: Authorized access test (finance_user)
# -----------------------------

getent passwd finance_user

sudo mkdir -p /home/finance_user
sudo chown -R finance_user:finance_user /home/finance_user

su - finance_user
cd /home/toor/Finance
ls

nano budget_q1.txt
ls -l
exit
