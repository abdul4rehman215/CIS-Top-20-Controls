# 🧠 Interview Q&A — Lab 14: Controlled Access Based on Need-to-Know (CIS Controls)

> This Q&A covers least privilege, Linux users/groups, directory permissions, and validating access control.

---

## 1) What does “need-to-know” mean in access control?
It means users should only access information required for their role. Even if someone is inside the system, they should not automatically access sensitive data.

---

## 2) How does “least privilege” relate to need-to-know?
Least privilege ensures users have the minimum permissions required to do their job. Need-to-know is about limiting information exposure—both work together to reduce risk.

---

## 3) What Linux features were used to implement controlled access in this lab?
- Users (`useradd`)
- Groups (`groupadd`, `usermod -aG`)
- Ownership (`chown`)
- Permissions (`chmod`)
- Access testing (`su`, `cd`, `ls`)

---

## 4) What does `chmod 770 Finance` do?
It sets permissions so:
- Owner: read/write/execute
- Group: read/write/execute
- Others: no permissions  
This prevents non-authorized users from accessing the folder.

---

## 5) Why is execute permission required on a directory?
Execute on directories allows entering/traversing the directory (`cd`) and accessing files within it (subject to file permissions).

---

## 6) What was the role of the `finance_group`?
It represents the set of authorized users allowed to access the Finance folder. Group-based access scales better than managing permissions per individual user.

---

## 7) Why was `chown :finance_group Finance` used instead of changing the owner?
It changed the **group ownership** of the directory while keeping the directory owner (`toor`) the same. This allows group-based access without transferring ownership.

---

## 8) How did the lab verify unauthorized access was blocked?
By switching to `demo_user` and attempting:
- `cd /home/toor/Finance`
- `ls /home/toor/Finance`  
Both returned “Permission denied”.

---

## 9) How did the lab verify authorized access worked?
By switching to `finance_user` (member of `finance_group`) and successfully:
- entering the Finance directory
- listing contents
- creating a file (`budget_q1.txt`)

---

## 10) Why did `budget_q1.txt` show group `finance_user` instead of `finance_group`?
Default group ownership depends on the user’s primary group and directory settings. The directory permissions still restricted access, but group behavior can be improved using setgid on the directory.

---

## 11) How can you ensure new files inherit the directory’s group?
Set the setgid bit on the directory:
```bash
sudo chmod 2770 Finance
````

This makes new files inherit the directory group (`finance_group`).

---

## 12) What’s the difference between file permissions and directory permissions?

* File permissions control reading/writing/executing the file.
* Directory permissions control listing, entering, and creating/removing files inside.

---

## 13) What risks does this lab help reduce in real organizations?

* accidental exposure of sensitive finance/HR/security documents
* insider threat impact
* misconfiguration leading to data leakage
* over-permissioned users accessing restricted information

---

## 14) What is a scalable improvement beyond basic chmod/chown?

Use:

* setgid directories for consistent group inheritance
* Access Control Lists (ACLs) for more granular permissions
* centralized IAM/SSO controls where applicable

---

## 15) Why is it important to test access with real user accounts?

Because permission setups can look correct but behave differently in practice. Testing confirms the control works for both authorized and unauthorized scenarios.

---
