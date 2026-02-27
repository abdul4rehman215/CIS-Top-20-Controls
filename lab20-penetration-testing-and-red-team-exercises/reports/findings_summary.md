# Findings Summary — Lab 20: Penetration Testing & Red Team Exercises

**Target VM (authorized lab):** 192.168.56.101  
**Environment:** Ubuntu 24.04.1 LTS (Cloud Lab Environment)  
**Note:** Outputs referenced are sample/simulated from an authorized test VM (host-only network).

---

## 1) Discovery & Enumeration Results

### Open Ports / Services (Nmap -sV)
- **21/tcp (FTP)** — vsftpd 2.3.4 (banner)
- **22/tcp (SSH)** — OpenSSH (remote administration)
- **80/tcp (HTTP)** — Apache httpd
- **139/tcp (SMB)** — netbios-ssn (Samba)
- **445/tcp (SMB)** — microsoft-ds (Samba)

---

## 2) Risk Observations

### FTP (21/tcp)
- FTP increases exposure due to:
  - potential weak credentials
  - legacy configurations
  - plaintext authentication risks (depending on setup)
- Banner indicates vsftpd 2.3.4 which is historically associated with a backdoor in compromised builds (banner alone is not proof).

### SSH (22/tcp)
- SSH is commonly required but should be hardened:
  - enforce keys over passwords
  - restrict access by IP/subnet
  - implement rate limiting / fail2ban

### HTTP (80/tcp)
- Web services should be hardened:
  - patch regularly
  - reduce modules/attack surface
  - apply secure headers
  - use TLS where applicable

### SMB (139/445)
- SMB exposure expands attack surface:
  - shares, auth policies, guest/anonymous access
  - brute force, misconfigured permissions
- Version info helps assess baseline but does not confirm vulnerability by itself.

---

## 3) Metasploit Enumeration (SMB Version Scan)

### Module Used
- `auxiliary/scanner/smb/smb_version`

### Result (observed)
- SMB detected and reachable
- Samba identified as:
  - `Samba smbd 4.15.13 (Ubuntu)`
- SMB dialect observed:
  - preferred `SMB 3.1.1`

---

## 4) Benign Exploit Attempt (Safe Verification)

### Module Attempted
- `exploit/unix/ftp/vsftpd_234_backdoor`

### Outcome
- Exploit failed safely:
  - **No session created**
  - Indicates target is not showing backdoor behavior

### Key takeaway
- A banner string is not proof of exploitability.
- Proper validation requires controlled testing plus configuration/log evidence.

---

## 5) Recommended Improvements

### Reduce Attack Surface
- Disable FTP if not required; prefer SFTP/SSH
- Restrict SMB exposure to internal networks only

### Authentication & Access Hardening
- Disable default credentials and anonymous access
- Enforce strong authentication policies
- Use SSH keys, disable password auth where feasible
- Apply account lockout / rate limiting

### Patch & Configuration Management
- Patch services regularly and validate real versions
- Perform config reviews for:
  - SMB shares and permissions
  - FTP anonymous access
  - Apache modules and directory permissions

### Network Controls
- Firewall: allow only necessary ports from trusted sources
- Monitor for scanning behavior and repeated auth failures

---

## 6) Conclusion

This lab demonstrated a simple but realistic penetration testing workflow:

**Enumerate services → validate exposure → attempt safe verification → document risk → propose remediation**

The key lesson is that good security testing includes **both technical proof and clear reporting** to drive improvements.
