# 🛠️ Troubleshooting Guide — Lab 04: Controlled Use of Administrative Privileges (CIS Controls)

> This guide covers common problems when auditing and modifying administrative privileges on Linux systems.

---

## 1) `cat /etc/group | grep sudo` returns nothing

### ✅ Problem
Running:
```bash
cat /etc/group | grep sudo
````

returns no output.

### 💡 Cause

* The system may not use a `sudo` group (some distros use `wheel`).
* The sudo group exists but has no members.

### ✅ Resolution

Check if `wheel` is used:

```bash id="2icb7v"
cat /etc/group | grep wheel
```

Also confirm the group exists:

```bash id="zpnxep"
getent group sudo
getent group wheel
```

---

## 2) `wheel` group not present (expected on Ubuntu)

### ✅ Problem

Running:

```bash
cat /etc/group | grep wheel
```

returns nothing.

### 💡 Cause

Ubuntu commonly uses the `sudo` group rather than `wheel`. This is normal.

### ✅ Resolution

Continue using the `sudo` group + sudoers configuration for privilege auditing.

---

## 3) `visudo` opens an editor you don't know how to use

### ✅ Problem

`sudo visudo` opens an editor (often `nano` or `vi`) and you're unsure how to exit.

### 💡 Cause

The default editor is configured for the system.

### ✅ Resolution

* If it opens **nano**:

  * Save: `CTRL + O`, Enter
  * Exit: `CTRL + X`
* If it opens **vim/vi**:

  * Exit without saving: `:q!` then Enter
  * Save and exit: `:wq` then Enter

You can set the editor temporarily:

```bash id="wnjuh1"
sudo EDITOR=nano visudo
```

---

## 4) After removing a user from sudo, they still seem to have sudo access

### ✅ Problem

A user removed from the sudo group still can run sudo.

### 💡 Cause

Possible reasons:

* User session not refreshed (group membership cached)
* User has direct sudoers entry in `/etc/sudoers` or `/etc/sudoers.d/`
* User belongs to another privileged group (wheel/admin)

### ✅ Resolution

* Ask user to log out and log back in.
* Check sudoers and sudoers.d entries:

```bash id="p9dorm"
sudo visudo
sudo ls -l /etc/sudoers.d/
sudo cat /etc/sudoers.d/* 2>/dev/null
```

* Confirm groups:

```bash id="na3q9v"
id <username>
```

---

## 5) Removing the wrong account from sudo breaks admin access

### ✅ Problem

You accidentally removed sudo privileges from the only admin account.

### 💡 Cause

Privilege changes were applied without verifying at least one recovery/admin path.

### ✅ Resolution

**Prevention is the key:**

* Always keep at least one admin account verified
* Keep an open root/admin session until access is confirmed

**Recovery options (if available):**

* Use cloud console / recovery shell
* Boot into single-user mode (if permitted)
* If another admin still exists, re-add user to sudo:

```bash id="jq22wt"
sudo usermod -aG sudo <username>
```

---

## 6) `userdel` fails with "user is currently logged in" or "has running processes"

### ✅ Problem

Deleting an account fails.

### 💡 Cause

The user may have active processes or sessions.

### ✅ Resolution

* Check processes:

```bash id="1s9i5a"
ps -u <username>
```

* Kill processes (if appropriate):

```bash id="z96r8x"
sudo pkill -u <username>
```

* Then retry:

```bash id="2bog6c"
sudo userdel <username>
```

> ⚠️ In production, confirm with policy before killing processes or deleting accounts.

---

## 7) Deleting a user does not remove their home directory

### ✅ Problem

After `userdel`, files remain under `/home/<user>`.

### 💡 Cause

`userdel` does not remove the home directory unless `-r` is used.

### ✅ Resolution

If policy allows and you want to remove home directory too:

```bash id="g46k2c"
sudo userdel -r <username>
```

---

## 8) `sudo tail /var/log/auth.log` shows no entries

### ✅ Problem

Auth log appears empty or missing.

### 💡 Cause

* Logging configuration may differ
* Some systems use `journalctl` instead of classic log files
* `/var/log/auth.log` might require rsyslog configuration

### ✅ Resolution

Try system journal:

```bash id="3p0w8w"
sudo journalctl -u sudo --no-pager | tail -n 50
sudo journalctl --no-pager | grep sudo | tail -n 50
```

---

## ✅ Final Tip: Keep Privilege Changes Auditable

In real environments:

* log every change
* reference ticket IDs (change requests)
* validate access before ending sessions
* review logs after modifications to confirm expected behavior

---
