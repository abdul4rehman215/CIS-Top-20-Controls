# 🎤 Interview Q&A — Lab 25: Secure Cloud Instance (Basic) — OpenStack

> Below are interview-style questions and answers based on launching a secure VM in OpenStack, locking down inbound access with security groups, enabling MFA, and documenting configurations.

---

## 1) What is the purpose of launching a “secure cloud instance”?
The goal is to provision a VM with secure defaults by minimizing exposure from the start. This includes using key-based access, restricting inbound ports, enabling MFA for console login, and documenting the security posture.

---

## 2) Why did you choose a small instance type (flavor) like `m1.small`?
Small flavors reduce cost and resource consumption in labs and are sufficient for learning security configuration basics. Minimizing resources also aligns with “least privilege” thinking at the infrastructure level.

---

## 3) What is an OpenStack security group?
A security group is a set of firewall rules applied to instance network ports. It controls inbound and outbound traffic using protocol/port/source definitions, similar to cloud firewalls in AWS/Azure/GCP.

---

## 4) Why is restricting inbound ports important?
Exposing fewer ports reduces attack surface. Many cloud breaches begin with services accidentally exposed to the internet. Limiting inbound rules to only what is needed reduces scanning exposure and exploitation risk.

---

## 5) Which ports did you allow and why?
- **22/tcp (SSH)** for administration
- **80/tcp (HTTP)** for web traffic (if hosting a web service)
- **443/tcp (HTTPS)** for encrypted web traffic

Everything else was blocked by default.

---

## 6) What is dangerous about an ingress rule like `1:65535` from `0.0.0.0/0`?
It effectively allows inbound access to *all TCP ports from anywhere*. This is overly permissive and dramatically increases attack surface, making it easier for attackers to find and exploit services.

---

## 7) How did you remove the overly permissive rule?
Using OpenStack CLI:
- `openstack security group rule delete <rule-id>`

Then verified the security group rule set again.

---

## 8) How did you verify the instance was successfully launched and active?
Using the CLI command:
- `openstack server list`

This showed:
- instance status = `ACTIVE`
- network assignment = `private-net=10.0.0.25`

---

## 9) Why did you keep egress “allow all” in this basic lab?
Many environments allow outbound traffic by default to support updates and normal connectivity. For stricter environments, egress can be restricted to only required destinations (e.g., package repos, logging endpoints).

---

## 10) Why is MFA important for cloud console access?
MFA protects against password compromise. Even if credentials leak or are phished, an attacker still needs the one-time OTP code. Console access is highly privileged, so MFA is a major risk reducer.

---

## 11) What additional security controls would you recommend beyond this lab?
- Restrict SSH (22) to a trusted IP range instead of `0.0.0.0/0`
- Use bastion hosts or VPN-only access
- Apply OS hardening (disable root SSH, key-only auth)
- Enable monitoring/logging (SIEM shipping)
- Use image hardening and patch automation
- Apply principle of least privilege for cloud roles/users

---

## 12) What did you document for auditability?
I documented:
- instance metadata (name, image, flavor, network, IP)
- security group name
- inbound rules (protocol, port, source, purpose)
- note about removing overly permissive rules
- MFA enabled status and test login confirmation

---

## 13) Why is documentation a security control?
Documentation supports:
- audit and compliance requirements
- reproducibility (repeat secure setup consistently)
- faster incident response (knowing what was exposed)
- reduced configuration drift (baseline reference)

---

## 14) What is the key security takeaway from this lab?
Cloud security starts at provisioning time:
**limit exposure, enforce strong authentication (MFA), and document configurations**. These simple steps significantly improve baseline cloud posture.
