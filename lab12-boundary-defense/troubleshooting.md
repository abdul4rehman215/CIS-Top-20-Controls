# 🛠️ Troubleshooting Guide — Lab 12: Boundary Defense (CIS Controls)

> This guide covers common issues when verifying firewall rules, denying ports, and testing boundary enforcement using netcat.

---

## 1) `sudo ufw status` shows "inactive"

### ✅ Problem
UFW is not enabled, so rules are not enforced.

### 💡 Cause
UFW may be installed but not activated by default on some systems/images.

### ✅ Resolution
Enable UFW carefully (especially on remote systems):
```bash
sudo ufw allow 22/tcp
sudo ufw enable
````

Then verify:

```bash id="y3kq1q"
sudo ufw status verbose
```

---

## 2) Enabling UFW disconnects SSH

### ✅ Problem

After enabling firewall, remote SSH access is lost.

### 💡 Cause

SSH port was not allowed before enabling, or rules were restrictive.

### ✅ Resolution

Best practice order:

```bash
sudo ufw allow 22/tcp
sudo ufw enable
```

If already locked out, recovery may require console access via your cloud provider or VM console.

---

## 3) `sudo ufw deny 8080` added rule but test still behaves differently than expected

### ✅ Problem

You deny port 8080 but connection test output seems inconsistent.

### 💡 Cause

Different outcomes mean different things:

* **timeout** → packets likely dropped/filtered by firewall
* **refused** → host reachable but nothing is listening (or actively rejecting)
* **succeeded** → port reachable and allowed, and service may be listening

### ✅ Resolution

Check both:

1. Firewall rules:

```bash id="w3wq0y"
sudo ufw status
```

2. Listening services:

```bash id="uhh2xk"
sudo ss -tuln | grep ":8080" || echo "8080 not listening"
```

---

## 4) `nc` is not installed

### ✅ Problem

`nc` command not found.

### 💡 Cause

Netcat may not be installed on minimal images.

### ✅ Resolution

Install netcat (OpenBSD variant common on Ubuntu):

```bash
sudo apt update
sudo apt install netcat-openbsd -y
```

Verify:

```bash id="nt1j0m"
nc -h 2>&1 | head -n 2
```

---

## 5) Can't determine correct IP address to test

### ✅ Problem

Unsure which IP is reachable for boundary testing.

### 💡 Cause

Cloud environments often have internal-only IPs. “External IP” may not be directly assigned to the VM.

### ✅ Resolution

Identify interface IP:

```bash
ip -4 a show ens5 | grep inet
```

In real environments, use:

* router public IP
* firewall public IP
* or a test host on a different network segment

---

## 6) Blocked port test shows "Connection refused" instead of "timed out"

### ✅ Problem

`nc -vz <ip> 8080` returns "refused".

### 💡 Cause

This usually means:

* no service is listening on the port
* firewall is not dropping packets (or is not applied to that path)

### ✅ Resolution

Confirm firewall is active:

```bash id="4m6k0v"
sudo ufw status verbose
```

Confirm port is not listening:

```bash id="8y3vvv"
sudo ss -tuln | grep ":8080" || echo "8080 not listening"
```

A refusal is still “not accessible,” but timeout better indicates firewall filtering.

---

## 7) Confusion between “blocked” vs “not listening”

### ✅ Problem

Port doesn’t show in `ss`, so you assume it’s blocked.

### 💡 Cause

`ss` shows listening services, not firewall rules.

### ✅ Resolution

Use:

* `ufw status` for firewall rules
* `ss -tuln` for listening services
  Both are needed to confirm boundary posture.

---

## 8) After changes, SSH stops working

### ✅ Problem

SSH becomes unreachable.

### 💡 Cause

SSH rule removed, replaced, or default deny blocks it.

### ✅ Resolution

Restore SSH allow rule:

```bash
sudo ufw allow 22/tcp
sudo ufw reload
```

Verify:

```bash id="5c7f5m"
sudo ufw status
```

---

## ✅ Final Tip: Validate Boundary Controls in Layers

For reliable boundary defense validation:

* verify firewall status + rules
* verify which services are listening
* test blocked ports (expect timeout/filtered)
* test allowed ports (expect success)
* document everything (diagram + notes)

---
