# 🔐📦 Lab 13: Data Protection Basics (CIS Controls)

> **Environment(s):**
> - **Windows:** 7-Zip + VeraCrypt (file/folder encryption)
> - **Linux:** Ubuntu 24.04.1 LTS (Cloud Lab Environment) (HTTPS + SSH configuration)  
>
> **Linux User:** toor  
> **Category:** CIS Top 20 Controls (Lab 13 of 15)

---

## 🎯 Objectives

By the end of this lab, I was able to:

- Understand why data protection matters (confidentiality + integrity + secure transport).
- Encrypt files/folders using **AES-based encryption** tools (7-Zip, VeraCrypt).
- Configure secure communications using:
  - **HTTPS (TLS)** for web traffic
  - **SSH** for remote administration (instead of Telnet)
- Validate encryption effectiveness using practical tests:
  - wrong password fails to open encrypted archives/containers
  - HTTPS confirmed via TLS handshake/cipher details

---

## ✅ Prerequisites

- CLI familiarity (Linux).
- Basic networking knowledge (ports, TLS/SSH).
- File management understanding.
- Tools:
  - Windows: 7-Zip, VeraCrypt
  - Linux: Apache, OpenSSL, OpenSSH server
  - Optional: Wireshark (traffic inspection)

---

## 🧪 Lab Environment

### 🪟 Windows
| Tool | Use |
|---|---|
| 7-Zip | AES-256 encrypted archive |
| VeraCrypt | AES encrypted container volume |

### 🐧 Linux (Ubuntu 24.04.1 LTS)
| Tool | Use |
|---|---|
| Apache2 | local web server |
| OpenSSL | self-signed TLS certificate + validation |
| OpenSSH Server | secure remote access |
| curl | HTTPS test |
| ss | verify listening ports |

---

## 🗂️ Repository Structure (Lab Folder)

```text id="l3m0b8"
lab13-data-protection-basics/
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
├── troubleshooting.md
└── artifacts/
    ├── linux/
    │   ├── https/
    │   │   ├── server.crt
    │   │   ├── server.key
    │   │   └── lab-ssl.conf
    │   └── validation/
    │       ├── curl_https_headers.txt
    │       └── openssl_sclient_excerpt.txt
    └── windows/
        ├── testfile_encrypted.7z
        └── SecureContainer.hc
```

---

## 🔒 Important Security Note (Repo Hygiene)

This lab generates a **private key**:

* `server.key`

In real projects, **private keys should not be committed to public repos**.
For portfolio evidence, you have two safe options:

1. **Keep `server.key` in repo only if the repo is private**, OR
2. **Add it to `.gitignore` and commit only the certificate + config** (recommended for public repos).

✅ Recommended `.gitignore` entry:

```gitignore
# Private keys (do not commit)
**/*.key
**/server.key
```

---

## ✅ Tasks Overview (What I Did)

### ✅ Task 1: Encrypt a Test File or Folder

#### 🪟 7-Zip (AES-256 Archive Encryption)

* Created a test file and encrypted it into:

  * `testfile_encrypted.7z`
* Confirmed that opening the archive requires the correct password (wrong password fails).

#### 🪟 VeraCrypt (AES Encrypted Container)

* Created a 100MB encrypted container:

  * `SecureContainer.hc`
* Mounted it as drive `X:` using a password.
* Confirmed wrong password prevents mount.

---

### ✅ Task 2: Configure Secure Communications

#### 🐧 Enable HTTPS on Apache (Self-Signed TLS)

* Verified Apache + OpenSSL installed.
* Generated a self-signed certificate:

  * `server.crt`
  * `server.key`
* Enabled Apache SSL module:

  * `a2enmod ssl`
* Created an SSL virtual host configuration:

  * `/etc/apache2/sites-available/lab-ssl.conf`
* Enabled site and restarted Apache.
* Verified Apache listens on **443/tcp**.

#### 🐧 Enable SSH (Instead of Telnet)

* Verified OpenSSH server installed.
* Attempted to stop/disable telnet service (not installed, which is good).
* Enabled and started SSH service.
* Verified SSH listens on **22/tcp**.

---

### ✅ Task 3: Validate Data Encryption

#### 🐧 Validate HTTPS Encryption

* Tested HTTPS response via curl:

  * `curl -kI https://localhost`
* Validated TLS handshake and cipher using:

  * `openssl s_client -connect localhost:443 ...`
* Confirmed TLS 1.3 negotiated with strong cipher suite.

#### 🪟 Validate Encrypted File/Container

* 7-Zip archive:

  * wrong password → cannot open archive
* VeraCrypt volume:

  * wrong password → mount failed

---

## ✅ Verification & Validation

* Apache running:

  * `systemctl status apache2`
* Port 443 listening:

  * `ss -tuln | grep :443`
* SSH installed + running:

  * `systemctl status ssh`
* Port 22 listening:

  * `ss -tuln | grep :22`
* HTTPS works:

  * `curl -kI https://localhost`
* TLS confirmed:

  * `openssl s_client -connect localhost:443 ...`

---

## 🧠 What I Learned

* Data protection is both **at rest** (encrypted files/containers) and **in transit** (TLS/SSH).
* Self-signed certificates still provide encryption; trust must be handled properly (CA-signed certs in production).
* SSH is the secure standard for remote admin; Telnet should be avoided/disabled.
* Practical validation matters (wrong password tests + TLS handshake output).

---

## 🎯 Why This Matters

Data protection reduces risk from:

* unauthorized access to sensitive files
* credential exposure over insecure protocols
* interception of web traffic without TLS
* operational compromise from weak management channels

---

## 🌍 Real-World Applications

* encrypting sensitive documents and backups
* secure remote server administration (SSH hardening)
* enforcing HTTPS for internal admin dashboards
* compliance controls for data confidentiality

---

## ✅ Result

* ✅ Encrypted a test file using 7-Zip AES-256 and validated access control.
* ✅ Created a VeraCrypt AES encrypted container and verified mount protection.
* ✅ Enabled HTTPS on Apache with a self-signed certificate and validated TLS encryption.
* ✅ Ensured SSH is enabled and Telnet is disabled/not present.

---

## 🧾 Conclusion

This lab demonstrated foundational data protection techniques:

Encrypt data at rest → Encrypt data in transit → Validate encryption effectiveness.

✅ Lab completed successfully on Windows + Ubuntu cloud lab environment.

---
