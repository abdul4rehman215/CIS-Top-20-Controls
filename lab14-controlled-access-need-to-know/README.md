# 🔐📁 Lab 14: Controlled Access Based on Need-to-Know (CIS Controls)

> **Environment:** Ubuntu 24.04.1 LTS (Cloud Lab Environment)  
> **User:** toor  
> **Category:** CIS Top 20 Controls (Lab 14 of 15)

---

## 🎯 Objectives

By the end of this lab, I was able to:

- Understand the principle of **controlled access / need-to-know**.
- Assign file/directory permissions to a specific **user** and **group**.
- Verify access controls by testing with:
  - authorized users
  - unauthorized users

---

## ✅ Prerequisites

- Basic understanding of Linux file permissions and ownership.
- Familiarity with the CLI.
- Ability to create users/groups and modify permissions (`useradd`, `groupadd`, `chmod`, `chown`).

---

## 🧪 Lab Environment

| Component | Details |
|---|---|
| OS | Ubuntu 24.04.1 LTS |
| Environment | Cloud Lab Environment |
| Primary User | toor |
| Authorized User | finance_user |
| Unauthorized User | demo_user |
| Authorized Group | finance_group |
| Protected Folder | `/home/toor/Finance` |
| Permission Model | POSIX permissions (owner/group/others) |

---

## 🗂️ Repository Structure (Lab Folder)

```text id="v3q5d4"
lab14-controlled-access-need-to-know/
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
├── troubleshooting.md
└── artifacts/
    ├── budget_q1.txt
    └── access_control_notes.md
```

> ✅ Notes:
>
> * The protected directory was created at `/home/toor/Finance`.
> * For repo artifacts, the test finance file `budget_q1.txt` is included.
> * A notes file documents user/group design and the access outcome.

---

## ✅ Tasks Overview (What I Did)

### ✅ Task 1: Create a “Finance” Folder

* Created a directory intended for sensitive finance data:

  * `~/Finance`
* Verified it exists using `ls -ld`.

---

### ✅ Task 2: Assign Read/Write Permissions to a Specific User/Group

* Created a dedicated finance user:

  * `finance_user`
* Created a dedicated finance group:

  * `finance_group`
* Added `finance_user` to `finance_group`.
* Updated directory ownership so the group is `finance_group`:

  * `chown :finance_group Finance`
* Set permissions to allow only owner + group access:

  * `chmod 770 Finance`

✅ Meaning of `770` on the Finance directory:

* **Owner (toor):** read/write/execute
* **Group (finance_group):** read/write/execute
* **Others:** no access

---

### ✅ Task 3: Attempt Access With an Unauthorized Account

* Created an unauthorized test user:

  * `demo_user`
* Switched to `demo_user` and attempted to:

  * `cd /home/toor/Finance`
  * `ls /home/toor/Finance`
* Confirmed access is denied (permission denied).

---

### ✅ Task 4: Confirm Authorized Access Works

* Switched to `finance_user` (authorized user in finance_group).
* Verified access to Finance directory succeeded:

  * `cd /home/toor/Finance`
* Verified write access by creating a test file:

  * `budget_q1.txt`

---

## ✅ Verification & Validation

* Directory exists:

  * `ls -ld Finance`
* User and group exist:

  * `id finance_user`
  * `getent group finance_group`
* User membership confirmed:

  * `id finance_user` shows `finance_group`
* Permissions correct:

  * `drwxrwx---` on Finance directory
* Unauthorized user blocked:

  * `Permission denied`
* Authorized user allowed:

  * successful `cd` and file creation inside Finance

---

## 🧠 What I Learned

* Need-to-know access reduces the risk of data exposure.
* POSIX permissions (`chmod`, `chown`) are fast and effective for basic access control.
* Verification requires testing with real users:

  * not just reading permissions
* Group-based access scales better than per-user permissions for teams.

---

## 🎯 Why This Matters

Controlled access protects sensitive data by ensuring only the right users can view or modify it, reducing:

* insider risk exposure
* accidental access by unrelated users
* data leaks from misconfigured permissions

This is critical for finance, HR, legal, and security-sensitive workflows.

---

## 🌍 Real-World Applications

* Finance or payroll file storage restrictions
* Segregation of duties (SoD)
* Shared team directories with controlled group membership
* Compliance requirements (least privilege + access control audits)

---

## ✅ Result

* ✅ Finance directory created.
* ✅ finance_user and finance_group created and configured.
* ✅ Directory locked down with `chmod 770`.
* ✅ Unauthorized user denied access.
* ✅ Authorized user able to read/write and create a finance document.

---

## 🧾 Conclusion

This lab implemented real need-to-know access controls using Linux users, groups, and directory permissions — and validated the controls through real access tests.

✅ Lab completed successfully on a cloud lab environment.

---
