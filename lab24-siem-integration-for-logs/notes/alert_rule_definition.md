# Alert Rule Definition — Lab 24

## Rule Name
LAB24 - Failed Login Threshold

## Data Source
- Index: `filebeat-*`

## Query / Pattern
- `message:"LAB24_TEST: failed login"`

## Threshold Condition
- More than **5** matching events in **5 minutes**
- Window: **5 minutes**

## Actions (Lab Simulation)
- Log notification / Email notification (simulated)

## Observed Result
- Rule status: **TRIGGERED**
- Reason: **5+ matching events detected in 5m**
- Action: Notification generated (lab simulation)
