# Kibana Verification Notes — Lab 24: SIEM Integration for Logs

## Kibana Discover Validation
- Index pattern: `filebeat-*`
- Search query: `LAB24_TEST`
- Results observed: **7 events found** (initial test run)

## Fields visible in events (observed)
- `host.hostname`: ip-172-31-10-176
- `log.file.path`: /var/log/auth.log
- `message`: LAB24_TEST...
- `@timestamp`: (present)
- `event.dataset`: system.auth (common mapping)

## Result
Kibana Discover successfully displayed log events shipped from the test host and indexed via Filebeat.
