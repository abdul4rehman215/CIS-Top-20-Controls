# 🎤 Interview Q&A — Lab 28: Data in Transit Encryption (Nginx HTTPS)

> Below are interview-style questions and answers based on installing Nginx, generating a self-signed TLS certificate, enabling HTTPS, and enforcing HTTP→HTTPS redirect.

---

## 1) What does “data in transit encryption” mean?
It means encrypting data while it travels across a network (client ↔ server) so attackers cannot read or modify it in transit. HTTPS (TLS) provides confidentiality and integrity protection.

---

## 2) Why is HTTPS necessary even on internal networks?
Internal traffic can still be intercepted through:
- compromised internal hosts
- malicious insiders
- misconfigured networks or shared infrastructure
- ARP spoofing / MITM risks
HTTPS reduces exposure even inside “trusted” networks.

---

## 3) What technology provides HTTPS encryption?
HTTPS is provided by **TLS (Transport Layer Security)**. TLS encrypts the connection and authenticates the server (or both sides in mutual TLS).

---

## 4) What web server did you use and why?
I used **Nginx** because it’s lightweight, widely used, and supports TLS configuration easily. It’s commonly deployed for reverse proxy and web serving.

---

## 5) How did you generate the TLS certificate for this lab?
Using OpenSSL to generate a **self-signed** certificate:
- private key: `/etc/ssl/private/server.key`
- certificate: `/etc/ssl/certs/server.crt`

Self-signed is suitable for labs/testing but not ideal for production trust.

---

## 6) What is the role of the “Common Name (CN)” in the certificate?
The CN represents the hostname/domain the certificate is intended for (e.g., `yourdomain.com`). Clients compare the requested hostname to the certificate identity when validating TLS.

---

## 7) Why did you restrict private key permissions?
Private keys must be protected because anyone with the key can impersonate the server. The key was stored with restricted permissions (e.g., `rw-------`) to reduce exposure to non-root users.

---

## 8) How did you validate the Nginx configuration before restarting?
Using:
- `sudo nginx -t`

This checks syntax and prevents restarting into a broken configuration that could take the web server offline.

---

## 9) How did you verify HTTPS was working?
Using curl:
- `curl -k -I https://yourdomain.com`

The `-k` flag allows testing with self-signed certificates. A `200 OK` response confirms HTTPS content delivery.

---

## 10) Did you fully disable HTTP (port 80)?
In this lab, I didn’t drop port 80 completely. Instead, I enforced **HTTP → HTTPS redirect**, which is a common best practice:
- port 80 listens only to redirect
- all content is served over port 443

---

## 11) Why is redirecting HTTP to HTTPS considered a best practice?
Users may accidentally access the HTTP URL. Redirect ensures:
- plaintext sessions are not used
- clients are guided to encrypted endpoints
This reduces risk of users transmitting credentials or cookies unencrypted.

---

## 12) How did you confirm the HTTP redirect works?
Using:
- `curl -I http://yourdomain.com`

The output returned:
- `301 Moved Permanently`
- `Location: https://yourdomain.com/`

---

## 13) How did you confirm which ports Nginx was listening on?
Using:
- `sudo ss -tulpen | grep -E ':80|:443'`

This confirmed port 80 (redirect) and port 443 (TLS content) were active.

---

## 14) What would you do differently for production TLS?
For production, I would:
- use a CA-signed certificate (e.g., Let’s Encrypt)
- enforce modern TLS versions/ciphers
- enable HSTS
- use proper certificate renewal automation
- validate the certificate chain and hostname verification without `-k`

---

## 15) What is the biggest security takeaway from this lab?
Encrypting traffic in transit is foundational. HTTPS prevents interception and tampering, and redirecting HTTP to HTTPS ensures users don’t accidentally fall back to insecure plaintext access.
