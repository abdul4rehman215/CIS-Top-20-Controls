# 🛠️ Troubleshooting Guide — Lab 13: Data Protection Basics (CIS Controls)

> This guide covers common issues when encrypting files (Windows), configuring HTTPS (Apache), enabling SSH, and validating TLS encryption.

---

## 1) 7-Zip encryption option not visible in right-click menu

### ✅ Problem
7-Zip context menu options don’t appear.

### 💡 Cause
- 7-Zip not installed correctly
- context menu integration disabled
- using limited permissions

### ✅ Resolution
- Reinstall 7-Zip and ensure context menu integration is enabled.
- Open 7-Zip File Manager directly and create archive from inside the app.

---

## 2) Encrypted archive opens without password

### ✅ Problem
Archive opens without prompting for password.

### 💡 Cause
Encryption was not enabled during archive creation, or only file names were encrypted (depending on format/settings).

### ✅ Resolution
Recreate archive and ensure:
- AES-256 selected
- password set and confirmed
- (for 7z) enable “Encrypt file names” if required for your use case

---

## 3) VeraCrypt container won’t mount

### ✅ Problem
Mount fails with “Incorrect password or not a VeraCrypt volume”.

### 💡 Cause
- wrong password
- wrong container file selected
- container corrupted or not created as VeraCrypt volume

### ✅ Resolution
- Ensure correct `.hc` file is selected.
- Confirm correct password and keyboard layout.
- If needed, recreate a small container for testing and repeat mount.

---

## 4) Apache SSL not listening on port 443

### ✅ Problem
`ss -tuln | grep :443` returns nothing.

### 💡 Cause
- SSL module not enabled
- SSL site config not enabled
- Apache failed to restart due to config error
- firewall blocking local test (less common for localhost)

### ✅ Resolution
1) Enable SSL module:
```bash
sudo a2enmod ssl
````

2. Enable the SSL site:

```bash id="c8vrax"
sudo a2ensite lab-ssl.conf
```

3. Check Apache config syntax:

```bash id="j5ylux"
sudo apache2ctl configtest
```

4. Restart Apache:

```bash id="oacqq0"
sudo systemctl restart apache2
```

5. Recheck port:

```bash id="yqm8ow"
sudo ss -tuln | grep ":443" || echo "Port 443 not listening"
```

---

## 5) Apache fails to restart after SSL config change

### ✅ Problem

`systemctl restart apache2` fails.

### 💡 Cause

* Syntax error in `/etc/apache2/sites-available/lab-ssl.conf`
* Wrong certificate/key paths
* Permission issue on key file

### ✅ Resolution

* Run config test:

```bash id="ydsg7q"
sudo apache2ctl configtest
```

* Check logs:

```bash id="m9f9lm"
sudo journalctl -u apache2 --no-pager | tail -n 50
```

* Ensure cert/key paths exist and are readable by Apache:

```bash id="l4cx4g"
ls -l /home/toor/Lab13_Data_Protection/https/server.crt
ls -l /home/toor/Lab13_Data_Protection/https/server.key
```

---

## 6) `curl https://localhost` fails due to certificate verification

### ✅ Problem

curl errors because certificate is self-signed.

### 💡 Cause

Self-signed certificates are not trusted by default.

### ✅ Resolution

Use `-k` for lab testing only:

```bash
curl -kI https://localhost
```

For production:

* use a CA-signed certificate
* or add your internal CA cert to trust store

---

## 7) `openssl s_client` shows verification error

### ✅ Problem

`Verification error: self-signed certificate`

### 💡 Cause

Expected when using self-signed certs.

### ✅ Resolution

This is normal for labs. Confirm encryption by checking:

* protocol version (e.g., TLSv1.3)
* cipher suite (e.g., TLS_AES_256_GCM_SHA384)

---

## 8) Telnet service stop/disable fails

### ✅ Problem

Commands fail with:

* “Unit telnet.service not loaded”
* “Unit file telnet.service does not exist”

### 💡 Cause

Telnet service is not installed or running (secure default).

### ✅ Resolution

This is acceptable. Document that Telnet is not present and SSH is used instead.

---

## 9) SSH not listening on port 22

### ✅ Problem

`ss -tuln | grep :22` shows nothing.

### 💡 Cause

* openssh-server not installed
* ssh service not started
* service name mismatch (rare)

### ✅ Resolution

Install and start SSH:

```bash id="1dsvr8"
sudo apt-get install openssh-server -y
sudo systemctl enable ssh
sudo systemctl start ssh
sudo ss -tuln | grep ":22"
```

---

## 10) Private key accidentally committed to GitHub

### ✅ Problem

`server.key` was committed to a repo.

### 💡 Cause

Key was generated in a project folder and not ignored.

### ✅ Resolution

* Remove from git history if repo is public and rotate the key/cert.
* Add ignore rule:

```gitignore
**/*.key
**/server.key
```

---

## ✅ Final Tip: Secure by Design

For production-ready data protection:

* use CA-signed TLS certificates
* restrict SSH (keys-only, no root login, allowlisted admin IPs)
* store private keys securely (not in repos)
* encrypt sensitive data at rest (archives/containers) with strong passphrases

---
