#!/bin/bash
# Lab 27 — Data at Rest Encryption (Linux LUKS/cryptsetup)
# Commands Executed During Lab (sequential, no explanations)

sudo apt-get update
sudo apt-get install cryptsetup -y

lsblk

sudo fdisk /dev/nvme1n1
lsblk /dev/nvme1n1

sudo cryptsetup luksFormat /dev/nvme1n1p1
sudo cryptsetup open /dev/nvme1n1p1 my_encrypted_partition

lsblk

sudo mkfs.ext4 /dev/mapper/my_encrypted_partition
sudo mount /dev/mapper/my_encrypted_partition /mnt

echo "Lab27 test file - encrypted volume" | sudo tee /mnt/secret.txt
sudo ls -l /mnt

sudo umount /mnt
sudo cryptsetup close my_encrypted_partition
lsblk /dev/nvme1n1

sudo reboot

# Post-reboot verification (new session)
sudo ls -l /mnt

sudo cryptsetup open /dev/nvme1n1p1 my_encrypted_partition
sudo mount /dev/mapper/my_encrypted_partition /mnt
sudo cat /mnt/secret.txt
