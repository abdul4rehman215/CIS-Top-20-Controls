# CIS Baseline Notes (Ubuntu) - Lab Hardening

## Baseline Approach
- Apply hardening controls that do not break required services.
- Start with audit tools (Lynis) and implement key CIS-aligned changes.

## Selected CIS-aligned controls implemented in this lab
1) Remove unused packages (reduce attack surface)
2) SSH hardening:
   - Disable root login: PermitRootLogin no
   - Prefer key-based authentication
3) Ensure patching discipline (apply updates regularly)
4) Review listening services and restrict as needed

## Additional recommended CIS items (not fully implemented here)
- Disable password authentication after verifying SSH keys
- Configure UFW firewall baseline and allow only required ports
- Ensure automatic security updates (unattended-upgrades)
- Audit users, file permissions, sudoers rules
- Enable and configure auditd for accountability
