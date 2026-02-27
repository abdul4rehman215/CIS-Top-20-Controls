# Test Events — Lab 24 (Log Generation)

These are the events generated on the test host to validate SIEM ingestion and alerting.

## Marker Prefix
All test events include a unique marker:
- `LAB24_TEST`

## Single event (authpriv.warning)
- `LAB24_TEST: simulated failed login attempt for user 'admin' from 10.10.10.50`

## Burst events (threshold testing)
- `LAB24_TEST: failed login #1 for user 'admin' from 10.10.10.50`
- `LAB24_TEST: failed login #2 for user 'admin' from 10.10.10.50`
- `LAB24_TEST: failed login #3 for user 'admin' from 10.10.10.50`
- `LAB24_TEST: failed login #4 for user 'admin' from 10.10.10.50`
- `LAB24_TEST: failed login #5 for user 'admin' from 10.10.10.50`
- `LAB24_TEST: failed login #6 for user 'admin' from 10.10.10.50`

## Alert trigger burst
- `LAB24_TEST: failed login burst #1 for user 'admin' from 10.10.10.50`
- `LAB24_TEST: failed login burst #2 for user 'admin' from 10.10.10.50`
- `LAB24_TEST: failed login burst #3 for user 'admin' from 10.10.10.50`
- `LAB24_TEST: failed login burst #4 for user 'admin' from 10.10.10.50`
- `LAB24_TEST: failed login burst #5 for user 'admin' from 10.10.10.50`
