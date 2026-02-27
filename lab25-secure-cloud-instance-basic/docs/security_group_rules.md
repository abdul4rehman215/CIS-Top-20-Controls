# Lab 25 - Secure Cloud Instance (Basic)

## Instance Details
- Cloud: OpenStack (Horizon + CLI)
- Instance Name: secure-lab25-ubuntu
- Image: Ubuntu 24.04 LTS
- Flavor: m1.small
- Network: private-net
- Private IP: 10.0.0.25
- Security Group: sg-secure-lab25

## Inbound Security Group Rules (Ingress)
| Protocol | Port Range | Source      | Description     |
|----------|------------|-------------|-----------------|
| TCP      | 22         | 0.0.0.0/0   | SSH Access      |
| TCP      | 80         | 0.0.0.0/0   | HTTP Access     |
| TCP      | 443        | 0.0.0.0/0   | HTTPS Access    |

## Notes
- Removed overly permissive rule (TCP 1-65535) to reduce attack surface.
- MFA enabled for cloud console account login.
- Egress kept default (allow outbound); can be restricted based on org policy.
