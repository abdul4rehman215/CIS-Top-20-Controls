# LUKS Notes — Lab 27 (Ubuntu 24.04.1)

## Disk/Partition Used
- Spare disk: `/dev/nvme1n1` (10G, unmounted)
- Test partition created: `/dev/nvme1n1p1`

## Steps Performed
1) Installed cryptsetup:
   - `sudo apt-get install cryptsetup -y`

2) Identified block devices:
   - `lsblk`

3) Created partition on spare disk:
   - `sudo fdisk /dev/nvme1n1`

4) Initialized LUKS encryption:
   - `sudo cryptsetup luksFormat /dev/nvme1n1p1`
   - Confirmed with uppercase `YES`

## Key Management Practice (Safe Documentation)
- LUKS passphrase: strong passphrase created and stored securely (not logged)
- Recovery approach: can add a secondary keyslot if needed:
  - `sudo cryptsetup luksAddKey /dev/nvme1n1p1`

5) Opened encrypted container:
   - `sudo cryptsetup open /dev/nvme1n1p1 my_encrypted_partition`

6) Created filesystem and mounted:
   - `sudo mkfs.ext4 /dev/mapper/my_encrypted_partition`
   - `sudo mount /dev/mapper/my_encrypted_partition /mnt`

7) Wrote test file while unlocked:
   - `/mnt/secret.txt`

8) Verified locked state:
   - unmounted and closed mapping
   - rebooted
   - confirmed `/mnt` empty until unlocked and mounted again

## Verification Result
Data persisted on disk and was readable only after:
- unlocking the LUKS container
- mounting the filesystem
