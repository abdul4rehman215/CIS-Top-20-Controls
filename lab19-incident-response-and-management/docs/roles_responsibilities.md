# Incident Response Roles & Responsibilities (Lab 19)

## Incident Lead
**Primary mission:** Coordinate response efforts and ensure incident is handled end-to-end.

### Responsibilities
- Declare incident severity and start the incident bridge/channel
- Assign tasks and track progress
- Approve containment actions that impact business operations
- Ensure evidence is preserved (logs, disk images if required)
- Decide when to move from containment → eradication → recovery
- Run incident post-mortem and produce final incident report

---

## Communication Lead
**Primary mission:** Maintain clear communication internally and externally.

### Responsibilities
- Provide regular updates to stakeholders (technical + non-technical)
- Draft incident status reports (what happened, impact, next steps)
- Coordinate with external parties if needed (vendors, law enforcement, clients)
- Ensure messaging is consistent and avoids speculation
- Maintain record of decisions + timelines for post-incident documentation

---

## Supporting Roles (Optional)
### SOC Analyst / Detection Engineer
- Validate alerts, triage suspicious activity, enrich with threat intel

### System Administrator
- Apply containment actions (isolation, firewall rules), restore services

### Forensics / Malware Analyst
- Analyze malware behavior, persistence, indicators of compromise (IOCs)
