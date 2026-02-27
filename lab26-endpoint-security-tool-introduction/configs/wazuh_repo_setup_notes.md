# Wazuh Repository Setup Notes — Lab 26

## Repository Setup Script
Downloaded from:
- https://packages.wazuh.com/4.x/apt/setup_repo.sh

Executed with:
- `sudo bash setup_repo.sh`

## Observed Result (lab)
- Imported Wazuh GPG key
- Added Wazuh APT repository:
  - `/etc/apt/sources.list.d/wazuh.list`
- Updated package metadata successfully
