# EICAR Test Procedure — Lab 26 (Wazuh)

## Purpose
Use the EICAR test string to safely validate endpoint monitoring and alerting.
EICAR is a benign standardized test pattern and does not contain real malware.

## Steps Performed
1) Create a test directory:
   - `mkdir -p ~/Lab_EndpointSecurity_Test && cd ~/Lab_EndpointSecurity_Test`

2) Create the EICAR file:
   - `nano eicar.com`
   - Paste the exact EICAR test string.

3) Verify file exists and trigger access:
   - `ls -l`
   - `cat eicar.com`

4) Confirm alert generation in Wazuh logs:
   - `sudo tail -n 30 /var/ossec/logs/alerts/alerts.json | head -n 20`

5) Confirm alert visibility in Wazuh Dashboard:
   - Search/filter for `eicar` or `Lab_EndpointSecurity_Test`

## Expected Result
- Wazuh generates an alert referencing:
  - file path: `.../Lab_EndpointSecurity_Test/eicar.com`
  - rule level: low/medium severity (example: level 5)
  - agent: local agent (`id 000`)
