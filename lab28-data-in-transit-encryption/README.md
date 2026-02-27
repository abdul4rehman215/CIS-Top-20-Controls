# 🧪 Lab 28: Data in Transit Encryption (HTTPS with Nginx) — CIS Controls

**Environment:** Ubuntu 24.04.1 LTS (Cloud Lab Environment)  
**User:** `toor`  
**Web Server (Lab):** Nginx (HTTPS + HTTP→HTTPS redirect)  
**Domain used (lab):** `yourdomain.com` *(mapped locally for testing)*  
**Note:** Outputs are **sample/simulated** from an authorized lab environment and formatted like a real GitHub lab run.

---

## 🎯 Objectives

In this lab, I learned how to protect data in transit by:

- Understanding why TLS/SSL is required for modern web security
- Installing and configuring Nginx for **HTTPS**
- Generating and installing a **self-signed certificate** with OpenSSL
- Verifying HTTPS functionality
- Enforcing encrypted traffic using **HTTP → HTTPS redirect**

---

## ✅ Prerequisites

- Basic understanding of web servers and networking
- Root/sudo access on an Ubuntu server
- Nginx installed (or ability to install it)
- OpenSSL available on system
- A test domain mapped locally (for lab purposes)

---

## 🧩 Lab Tasks Overview

### ✅ Task 1: Enable TLS/SSL on Nginx

#### 1.1 Install required packages
- Updated apt package lists
- Installed Nginx

#### 1.2 Generate a self-signed certificate
Used OpenSSL to generate:
- Private key: `/etc/ssl/private/server.key`
- Certificate: `/etc/ssl/certs/server.crt`

Key security practice:
- Private key permissions restricted (`rw-------`)

#### 1.3 Configure Nginx HTTPS site
- Created a site config file:
  - `/etc/nginx/sites-available/yourdomain.com`
- Added an HTTPS server block:
  - listens on 443 with `ssl_certificate` and `ssl_certificate_key`
  - serves content from `/var/www/html`

#### 1.4 Enable site and validate config
- Symlinked into `sites-enabled`
- Validated syntax with `nginx -t`
- Restarted Nginx and confirmed it is running via systemd

---

### ✅ Task 2: Verify HTTPS and Eliminate Plaintext Web Access

#### 2.1 Verify HTTPS response
- Used curl with `-k` to allow self-signed cert during testing:
  - confirmed HTTP `200 OK` over `https://yourdomain.com`

#### 2.2 Enforce HTTP → HTTPS redirect
Instead of dropping port 80 completely, configured a secure best practice:
- Port 80 stays open only to redirect all requests to HTTPS
- Confirmed redirect response:
  - HTTP `301 Moved Permanently` to `https://yourdomain.com/`

#### 2.3 Confirm listening ports
- Verified Nginx is listening on:
  - `:80` (redirect only)
  - `:443` (serves content securely)

---

## 📁 Repository Structure

```

lab28-data-in-transit-encryption/
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
├── troubleshooting.md
├── configs/
│   └── nginx-yourdomain.com.conf
└── certs/
├── server.crt.sample
└── server.key.permissions.txt

```

> This repo stores only a sample certificate (public) and permission notes for the private key.

---

## ✅ Verification & Validation

This lab was validated by:

- Nginx installed successfully and running:
  - `systemctl status nginx`
- Certificate and key created with correct permissions:
  - `ls -l /etc/ssl/private/server.key /etc/ssl/certs/server.crt`
- Nginx configuration validated:
  - `nginx -t` → success
- HTTPS confirmed:
  - `curl -k -I https://yourdomain.com` → `200 OK`
- HTTP redirect confirmed:
  - `curl -I http://yourdomain.com` → `301` redirect to HTTPS
- Listening ports verified:
  - `ss -tulpen | grep -E ':80|:443'`

---

## 🧠 What I Learned

- TLS protects data in transit from interception and tampering (MITM risk reduction)
- Self-signed certs are useful for labs/testing but not ideal for production trust
- Enforcing HTTPS is not only about enabling 443—it's also about preventing plaintext usage
- Redirecting HTTP to HTTPS is a practical baseline control to eliminate insecure browsing paths

---

## 🌍 Why This Matters

Without encryption in transit:
- credentials and session cookies can be intercepted
- traffic can be modified by attackers (MITM)
- users can be tricked into insecure HTTP access

HTTPS with strong TLS is foundational for secure web applications, compliance requirements, and user trust.

---

## ✅ Result

✅ Nginx installed and configured for HTTPS  
✅ Self-signed certificate generated using OpenSSL  
✅ HTTPS verified (`200 OK` on 443)  
✅ HTTP redirected to HTTPS (`301` redirect) 🚀

---

## 🏁 Conclusion

This lab demonstrated a simple and effective HTTPS baseline:

**Install Nginx → generate cert → configure TLS on 443 → redirect 80 → validate with curl and socket checks**

✅ Lab completed successfully with verified encrypted transport.

---
