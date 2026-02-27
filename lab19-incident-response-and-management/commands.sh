#!/bin/bash
# Lab 19 — Incident Response & Management (CentOS 7)
# Commands Executed During Lab (sequential, no explanations)

mkdir -p Lab19_IR/{docs,logs,notes}
cd Lab19_IR
pwd

nano docs/roles_responsibilities.md

suricata -V
sudo yum install -y epel-release
sudo yum install -y suricata
suricata -V

sudo suricata -c /etc/suricata/suricata.yaml -i eth0

ip a show eth0 | sed -n '1,20p'
sudo iptables -A INPUT -s 203.0.113.55 -j DROP
sudo iptables -L INPUT -n --line-numbers | head -n 15

clamscan -V
sudo yum install -y clamav clamav-update
sudo freshclam
sudo clamscan --remove --recursive /

sudo suricata -c /etc/suricata/suricata.yaml -i eth0

sudo iptables -A INPUT -s 172.31.22.120 -j DROP
sudo iptables -L INPUT -n --line-numbers | head -n 20

sudo freshclam
sudo clamscan --remove --recursive /

sudo yum update -y
uptime
free -m
