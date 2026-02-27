#!/bin/bash
# Lab 26 — Endpoint Security Tool Introduction (Wazuh Manager)
# Commands Executed During Lab (sequential, no explanations)

sudo apt-get update

curl -sO https://packages.wazuh.com/4.x/apt/setup_repo.sh
ls -l setup_repo.sh
sudo bash setup_repo.sh
sudo apt-get install wazuh-manager -y

sudo systemctl status wazuh-manager --no-pager | head -n 18

mkdir -p ~/Lab_EndpointSecurity_Test
cd ~/Lab_EndpointSecurity_Test
nano eicar.com

ls -l
cat eicar.com

sudo tail -n 30 /var/ossec/logs/alerts/alerts.json | head -n 20
