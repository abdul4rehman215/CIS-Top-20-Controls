# 🧠 Interview Q&A — Lab 13: Data Protection Basics (CIS Controls)

> This Q&A covers data protection principles, encryption at rest and in transit, and validation of HTTPS/SSH security.

---

## 1) What are the core principles of data protection?
Confidentiality, integrity, and availability (CIA). Data protection focuses heavily on confidentiality (encryption) and integrity (preventing tampering).

---

## 2) What is the difference between encryption “at rest” and “in transit”?
- **At rest:** protecting stored data (files, archives, disks, containers).
- **In transit:** protecting data moving across networks (TLS/HTTPS, SSH).

---

## 3) Why was AES-256 used in 7-Zip encryption?
AES-256 is a strong symmetric encryption standard widely trusted for protecting sensitive data, making archives unreadable without the password.

---

## 4) What security benefit does a 7-Zip encrypted archive provide?
It prevents unauthorized access to the file contents. Even if the archive is stolen or copied, it cannot be opened without the correct password.

---

## 5) How is VeraCrypt different from 7-Zip encryption?
- **7-Zip:** encrypts files/folders inside an archive.
- **VeraCrypt:** creates an encrypted container/volume that behaves like a mounted drive, protecting all data stored inside it.

---

## 6) Why are strong passwords essential for encrypted archives/containers?
Because password strength is the key to encryption security. Weak passwords can be brute-forced even with strong algorithms.

---

## 7) What is a self-signed certificate and where is it used?
A self-signed certificate is signed by itself (not a trusted CA). It provides encryption but not trusted identity by default. It is common in labs, internal testing, and development environments.

---

## 8) Why does `openssl s_client` show “Verification error: self-signed certificate”?
Because the certificate is not signed by a trusted certificate authority. This is expected for self-signed certs unless the CA/cert is trusted locally.

---

## 9) How did the lab confirm HTTPS is actually using encryption?
By verifying:
- Apache is listening on port 443
- TLS handshake output from `openssl s_client`
- negotiated protocol/cipher (e.g., TLSv1.3 and TLS_AES_256_GCM_SHA384)

---

## 10) What does `curl -kI https://localhost` do?
It performs an HTTPS request and prints headers:
- `-I` headers only
- `-k` skips certificate verification (useful for self-signed cert testing)

---

## 11) Why is SSH preferred over Telnet?
SSH encrypts authentication and session traffic. Telnet is plaintext and can expose credentials and commands to anyone who can sniff network traffic.

---

## 12) Why did stopping/disabling Telnet fail in the lab?
Because the telnet service was not installed or running, which is a good secure default. The commands demonstrate verification and hardening steps.

---

## 13) What is the primary purpose of enabling Apache SSL module (`a2enmod ssl`)?
It enables TLS/SSL support within Apache so the server can accept HTTPS connections on port 443.

---

## 14) What is a practical validation test for “encryption at rest”?
Try accessing the encrypted archive/container with an incorrect password:
- access should fail without correct credentials
This confirms the protection works.

---

## 15) What is a realistic production improvement beyond this lab?
- Use CA-signed certificates (Let’s Encrypt or internal CA)
- Enforce strong TLS configurations (disable weak ciphers/protocols)
- Restrict SSH (keys-only, no root login, allowlist admin IPs)
- Store private keys securely and avoid committing them to repos
