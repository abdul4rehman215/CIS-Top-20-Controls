# 🧪 Lab 18: Application Software Security (CIS Controls)

**Environment:** Ubuntu 24.04.1 LTS (Cloud Lab Environment)  
**User:** `toor`  
**Focus Area:** CIS Control — Application Software Security

---

## 🎯 Objectives

In this lab, I worked through practical application security fundamentals by:

- Understanding common application vulnerabilities such as **SQL Injection (SQLi)** and **Cross-Site Scripting (XSS)**
- Identifying these vulnerabilities using a deliberately vulnerable web application (**DVWA**)
- Using static analysis tooling (**ESLint**) to detect risky JavaScript patterns
- Documenting secure coding practices and creating safer example code for mitigation

---

## ✅ Prerequisites

- Basic understanding of web applications and security concepts
- Familiarity with HTML, JavaScript, and SQL basics
- Terminal + code editor access
- Admin privileges (sudo) for installing packages/tools
- Docker available for running DVWA container
- Node.js + npm available for ESLint tooling

---

## 🧩 Lab Tasks Overview

### ✅ Task 1: Identification of Vulnerabilities (DVWA)
- Verified Docker was installed and Docker service was running
- Pulled and launched **DVWA** via Docker
- Performed web-based testing/observation:
  - **SQL Injection**: Payload `1' OR '1'='1` returned multiple user records
  - **Reflected XSS**: Payload `<script>alert('XSS Vulnerability!')</script>` triggered browser alert popup

> These steps demonstrate how unsanitized input and insecure query logic can be exploited.

---

### ✅ Task 2: Use Static Analysis Tools (ESLint)
- Verified Node.js and npm versions were present
- Installed ESLint globally
- Created an intentionally insecure JavaScript file (`vulnerableScript.js`) to demonstrate linting detection
- Encountered ESLint v9 configuration change (flat config requirement)
- Initialized a local npm project and installed:
  - `eslint`
  - `eslint-plugin-security`
- Created a valid `eslint.config.js` (ESLint v9 flat config)
- Re-ran ESLint successfully and reviewed warnings (e.g., `eval` usage, unused variables)

---

### ✅ Task 3: Secure Code Practices (Mitigation Documentation)
- Documented secure coding patterns for:
  - **SQLi mitigation** using parameterized queries
  - **XSS mitigation** using safer rendering and sanitization approach
- Created safer example code in `secure_examples.js`
- Created a written mitigation guide in `secure_coding_notes.md`

---

## 📁 Repository Structure

```

lab18-application-software-security/
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
├── troubleshooting.md
├── dvwa_notes/
│   └── (optional notes / observations if added later)
├── static_analysis/
│   ├── vulnerableScript.js
│   ├── package.json
│   ├── package-lock.json
│   └── eslint.config.js
└── secure_code/
├── secure_examples.js
└── secure_coding_notes.md

```

> Note: `dvwa_notes/` was created as a workspace folder. No files were recorded inside it during this run.

---

## ✅ Verification & Validation

This lab’s success was validated through:

- **Docker verification**
  - Docker version confirmed
  - Docker service status confirmed as active/running
- **DVWA deployment verification**
  - Image pulled successfully
  - Container started and visible via `docker ps`
- **Vulnerability confirmation (observed behavior)**
  - SQLi payload returned multiple records (logic bypass)
  - Reflected XSS payload triggered a JavaScript alert
- **Static analysis validation**
  - ESLint installed and version confirmed
  - Flat config created (`eslint.config.js`)
  - ESLint produced warnings aligned to unsafe patterns (`eval`, unused vars)
- **Secure coding deliverables**
  - Secure example code file created
  - Secure coding notes created
  - All files verified using `find`

---

## 🧠 What I Learned

- **SQL Injection** often happens when applications build SQL queries using unsanitized input (string concatenation)
- **Reflected XSS** occurs when untrusted input is reflected into HTML without encoding/sanitization
- Static analysis (SAST-style) helps catch dangerous patterns early, but:
  - tool configuration matters (ESLint v9 “flat config” requirement)
  - security plugins improve signal (linting alone is not enough)
- Secure practices include:
  - parameterized queries for SQL
  - using safer DOM APIs (`textContent`) and sanitization when HTML is required
  - keeping libraries updated and using audits, lint rules, and code review

---

## 🌍 Why This Matters

Application-layer vulnerabilities remain a top cause of breaches. Even simple issues like:

- query injection
- unsafe DOM rendering
- insecure use of `eval`

can lead to credential theft, data exposure, and malware delivery. Learning both the **attack behavior** and **defensive coding patterns** helps build safer software and better security reviews.

---

## 🧰 Real-World Applications

- Secure code review and AppSec checklists during development
- Web application penetration testing and vulnerability validation
- Building secure coding baselines for teams (training + lint rules)
- Integrating static analysis into CI pipelines
- Improving secure defaults (encoding, sanitization, parameterization)

---

## ✅ Result

- DVWA was deployed successfully via Docker for vulnerability exploration
- SQLi and reflected XSS were observed with controlled test payloads
- ESLint + security plugin were configured successfully under ESLint v9 flat config
- Unsafe patterns were flagged via static analysis
- Secure coding mitigation examples and documentation were created and stored in repo-ready format

---

## 🏁 Conclusion

This lab provided practical experience with identifying **SQL Injection** and **XSS** behaviors, running static analysis to detect risky code patterns, and documenting secure coding mitigations.

✅ Lab completed successfully using DVWA + ESLint static analysis + secure coding documentation.

---
