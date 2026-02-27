#!/bin/bash
# Lab 24 — SIEM Integration for Logs (ELK + Filebeat)
# Commands Executed During Lab (sequential, no explanations)

mkdir -p Lab24_SIEM/{packages,configs,tests,notes}
cd Lab24_SIEM/packages

curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-8.12.2-amd64.deb
ls -lh

sudo dpkg -i filebeat-8.12.2-amd64.deb
filebeat version

sudo cp /etc/filebeat/filebeat.yml /etc/filebeat/filebeat.yml.bak
sudo nano /etc/filebeat/filebeat.yml

sudo filebeat test config
sudo filebeat test output

sudo service filebeat start
sudo service filebeat status

logger -p authpriv.warning "LAB24_TEST: simulated failed login attempt for user 'admin' from 10.10.10.50"
for i in {1..6}; do logger -p authpriv.warning "LAB24_TEST: failed login #$i for user 'admin' from 10.10.10.50"; done
sudo grep "LAB24_TEST" /var/log/auth.log | tail -n 8

curl -s http://localhost:9200/_cat/indices?v | head -n 15
curl -s "http://localhost:9200/filebeat-*/_search?q=message:LAB24_TEST&size=3" | head -n 40

for i in {1..5}; do logger -p authpriv.warning "LAB24_TEST: failed login burst #$i for user 'admin' from 10.10.10.50"; done
curl -s "http://localhost:9200/filebeat-*/_count?q=message:%22LAB24_TEST:%20failed%20login%20burst%22"
