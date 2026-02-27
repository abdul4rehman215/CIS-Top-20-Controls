#!/bin/bash
# Lab 25 — Secure Cloud Instance (Basic) on OpenStack
# Commands Executed During Lab (sequential, no explanations)

openstack server list

openstack security group list
openstack security group rule list 91b5f6d2-1e22-4cc3-8df0-4b9d0a8c7f33
openstack security group rule delete 3a5d1c0f-11aa-4f5a-9a11-5b2c9a00d201

openstack security group rule create --protocol tcp --dst-port 22:22 --remote-ip 0.0.0.0/0 91b5f6d2-1e22-4cc3-8df0-4b9d0a8c7f33
openstack security group rule create --protocol tcp --dst-port 80:80 --remote-ip 0.0.0.0/0 91b5f6d2-1e22-4cc3-8df0-4b9d0a8c7f33
openstack security group rule create --protocol tcp --dst-port 443:443 --remote-ip 0.0.0.0/0 91b5f6d2-1e22-4cc3-8df0-4b9d0a8c7f33

openstack security group rule list 91b5f6d2-1e22-4cc3-8df0-4b9d0a8c7f33

mkdir -p Lab25_Secure_Cloud_Instance
cd Lab25_Secure_Cloud_Instance
nano security_group_rules.md
