# 🛠️ Troubleshooting Guide — Lab 28: Data in Transit Encryption (Nginx HTTPS)

> This guide covers common issues when installing Nginx, generating TLS certificates, enabling HTTPS, and enforcing HTTP→HTTPS redirects.

---

## 1) Nginx installation fails
### Symptoms
- apt errors
- package not found

### Fix
- Update package lists:
  - `sudo apt-get update`
- Retry install:
  - `sudo apt-get install nginx -y`
- Check connectivity to repos:
  - `ping -c 2 archive.ubuntu.com`

---

## 2) `nginx -t` fails (configuration syntax errors)
### Symptoms
- “emerg” errors
- invalid directive or missing braces

### Fix
- Read the error line number in output (very important)
- Validate braces `{}` and semicolons `;`
- Ensure both server blocks are properly closed
- Re-run:
  - `sudo nginx -t`

---

## 3) Site enabled but not loading
### Causes
- site not symlinked into `sites-enabled`
- conflicting default site
- DNS/hosts mapping not set for `yourdomain.com`

### Fix
- Confirm symlink exists:
  - `ls -l /etc/nginx/sites-enabled/yourdomain.com`
- If needed, remove/disable default site (carefully):
  - `sudo rm /etc/nginx/sites-enabled/default`
  - then `sudo nginx -t && sudo systemctl reload nginx`
- Ensure your lab host resolves the domain (hosts file / local mapping)

---

## 4) Certificate/key file not found or wrong path
### Symptoms
- Nginx fails to start, logs mention missing cert/key

### Fix
- Verify files exist:
  - `sudo ls -l /etc/ssl/private/server.key /etc/ssl/certs/server.crt`
- Ensure Nginx config paths match those locations

---

## 5) Permission denied reading private key
### Symptoms
- Nginx fails to start due to key permission issues

### Fix
- Ensure key permissions are restrictive but readable by root (normal):
  - `/etc/ssl/private/server.key` should typically be `rw-------` root:root
- Confirm Nginx master runs as root (standard on Ubuntu)

---

## 6) `curl https://yourdomain.com` fails due to self-signed cert
### Symptoms
- certificate verify failed

### Fix (lab/testing)
- Use:
  - `curl -k -I https://yourdomain.com`

### Production note
Do not use `-k` in production validation; install trusted CA certs instead.

---

## 7) HTTP redirect not working
### Causes
- redirect block missing
- wrong `server_name`
- config not reloaded after edit

### Fix
- Confirm redirect server block exists:
  - `listen 80;`
  - `return 301 https://$server_name$request_uri;`
- Test config + reload:
  - `sudo nginx -t`
  - `sudo systemctl reload nginx`
- Verify redirect:
  - `curl -I http://yourdomain.com`

---

## 8) Port 80 or 443 not listening
### Symptoms
- connection refused
- ss/netstat shows no listeners

### Fix
- Confirm Nginx is running:
  - `sudo systemctl status nginx --no-pager`
- Check listeners:
  - `sudo ss -tulpen | grep -E ':80|:443'`
- If another service occupies the port, stop it or change ports.

---

## 9) Firewall/security group blocks access
### Symptoms
- service running locally but unreachable externally

### Fix
- Allow ports in cloud security group/firewall:
  - 80/tcp (redirect)
  - 443/tcp (HTTPS)
- Validate locally first with curl

---

## 10) Best practices for production hardening (beyond lab)
- Use CA-signed certs (Let’s Encrypt)
- Enable HSTS
- Disable weak ciphers/old TLS
- Automate renewal and monitor certificate expiry
