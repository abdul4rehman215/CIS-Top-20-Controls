# 🛠️ Troubleshooting — Lab 14: Controlled Access Based on Need-to-Know (CIS Controls)

> This guide covers common issues when creating users/groups, applying permissions, and validating authorized vs unauthorized access.

---

## 1) `mkdir Finance` fails with “File exists”

### ✅ Problem
The Finance folder already exists.

### 💡 Cause
The directory was already created previously.

### ✅ Resolution
Verify it:
```bash
ls -ld Finance
````

If you want a clean lab run:

```bash id="tlqv8d"
rm -rf Finance
mkdir Finance
```

---

## 2) `useradd finance_user` created user but login fails

### ✅ Problem

`su - finance_user` fails or home directory doesn’t exist.

### 💡 Cause

Depending on options, `useradd` may create a user without creating the home directory.

### ✅ Resolution

Create home directory and set ownership:

```bash id="igv4c3"
sudo mkdir -p /home/finance_user
sudo chown -R finance_user:finance_user /home/finance_user
```

Or create users with home directory initially:

```bash id="ap4b6a"
sudo useradd -m finance_user
```

---

## 3) `groupadd finance_group` fails with “already exists”

### ✅ Problem

Group is already present.

### 💡 Cause

Group name already created previously.

### ✅ Resolution

Verify:

```bash
getent group finance_group
```

If you need a different name, choose a unique one:

```bash id="22c9sx"
sudo groupadd finance_team
```

---

## 4) `usermod -aG finance_group finance_user` didn’t take effect

### ✅ Problem

`id finance_user` doesn’t show group membership.

### 💡 Cause

Membership changes apply to new sessions; existing sessions won’t reflect until re-login.

### ✅ Resolution

Re-check:

```bash id="5w6q2b"
id finance_user
```

If logged in as the user, exit and re-login:

```bash
exit
su - finance_user
```

---

## 5) Unauthorized user can still access Finance folder

### ✅ Problem

`demo_user` can enter or list the Finance directory.

### 💡 Cause

Permissions are too permissive (e.g., 755) or home directory parent permissions allow access.

### ✅ Resolution

Ensure permissions are locked down:

```bash id="r9u2o9"
ls -ld /home/toor/Finance
sudo chmod 770 /home/toor/Finance
sudo chown :finance_group /home/toor/Finance
ls -ld /home/toor/Finance
```

Also confirm unauthorized user is not in the group:

```bash id="y2ml6q"
id demo_user
```

---

## 6) Authorized user cannot access Finance folder

### ✅ Problem

`finance_user` gets “Permission denied”.

### 💡 Cause

* user not actually in `finance_group`
* group ownership not set correctly on directory
* permissions not set to allow group access

### ✅ Resolution

1. Confirm membership:

```bash id="rpf1r3"
id finance_user
```

2. Confirm directory group:

```bash id="j9hnbt"
ls -ld /home/toor/Finance
```

3. Fix ownership/permissions:

```bash id="z43m98"
sudo chown :finance_group /home/toor/Finance
sudo chmod 770 /home/toor/Finance
```

---

## 7) Files created inside Finance don’t inherit the finance_group

### ✅ Problem

New files show group `finance_user` instead of `finance_group`.

### 💡 Cause

Default group ownership follows user’s primary group unless the directory has the setgid bit enabled.

### ✅ Resolution

Enable setgid on the directory so files inherit group:

```bash id="k2g1q7"
sudo chmod 2770 /home/toor/Finance
ls -ld /home/toor/Finance
```

Now new files created in Finance will inherit `finance_group`.

---

## 8) Using `su - demo_user` or `su - finance_user` prompts for password

### ✅ Problem

Switching users requires password you didn’t set.

### 💡 Cause

User accounts created without password might not allow login in some environments.

### ✅ Resolution

Set a password if required:

```bash id="yrv4ym"
sudo passwd finance_user
sudo passwd demo_user
```

In many lab environments, root/admin can still `su` without passwords depending on settings.

---

## ✅ Final Tip: Prefer Groups for Team Access

For real environments:

* create a group representing the role/team (finance)
* add/remove users from the group as staff changes
* keep directory permissions consistent (770/2770)
* validate access regularly with test accounts

---
