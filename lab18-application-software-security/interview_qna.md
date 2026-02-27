# 🎤 Interview Q&A — Lab 18: Application Software Security

> Below are interview-style questions and answers based on the DVWA vulnerability exploration, static analysis setup, and secure coding documentation completed in this lab.

---

## 1) What application vulnerabilities did you focus on in this lab?
The lab focused on:
- **SQL Injection (SQLi)** — manipulating backend SQL queries using untrusted input.
- **Cross-Site Scripting (XSS)** — injecting client-side scripts into a web page due to unsafe output handling.

---

## 2) Why did you use DVWA for this lab?
DVWA (Damn Vulnerable Web Application) is intentionally insecure and provides controlled examples of common web vulnerabilities. It is useful for learning how vulnerabilities behave and how to validate them safely without harming real systems.

---

## 3) How did you deploy DVWA in your environment?
DVWA was deployed using Docker:
- Pulled image: `vulnerables/web-dvwa`
- Ran container: `docker run -d -p 80:80 vulnerables/web-dvwa`
- Verified running container with `docker ps`

---

## 4) What SQL injection payload did you test and what happened?
Payload tested:
- `1' OR '1'='1`

Observed result:
- The page returned **multiple user records** instead of a single ID lookup, indicating query logic was bypassed using an always-true condition.

---

## 5) What does the SQLi payload `OR '1'='1` achieve?
It modifies query logic by injecting a condition that evaluates to TRUE, potentially causing the query to return unintended rows. This demonstrates why building SQL queries via string concatenation is dangerous.

---

## 6) What XSS payload did you test and what was the result?
Payload:
- `<script>alert('XSS Vulnerability!')</script>`

Result:
- A JavaScript alert popup appeared in the browser, showing that user input was reflected into the page without encoding/sanitization.

---

## 7) What is reflected XSS?
Reflected XSS occurs when user-supplied input is immediately reflected back in an HTTP response (e.g., displayed on the page) without proper output encoding or sanitization, allowing script execution in the victim’s browser.

---

## 8) Why did you use ESLint in an application security lab?
ESLint is a static analysis tool for JavaScript that can detect:
- unsafe patterns (e.g., `eval`)
- suspicious code constructs
- common bugs and insecure practices

With security plugins, it can provide stronger AppSec-oriented signals.

---

## 9) What issue did you encounter when running ESLint initially?
ESLint v9 requires a **flat config** file:
- `eslint.config.js`

Without it, ESLint fails and reports that it cannot find the required configuration format.

---

## 10) How did you fix the ESLint configuration problem?
I created a valid ESLint v9 flat config:
- Initialized npm project: `npm init -y`
- Installed plugin: `npm install --save-dev eslint eslint-plugin-security`
- Created `eslint.config.js` and re-ran ESLint successfully.

---

## 11) What did ESLint flag in your intentionally vulnerable script?
It flagged:
- `eval` usage (`no-eval` warning) — risky because it executes arbitrary code.
- an unused variable (`no-unused-vars` warning) — quality issue and potentially indicates leftover debug logic.

---

## 12) Does ESLint alone detect SQL injection and XSS reliably?
Not fully. ESLint can catch unsafe JavaScript patterns and enforce safer coding standards, but SQLi/XSS detection depends on context. For real AppSec, linting should be combined with:
- secure coding practices
- code review
- SAST/DAST tools
- testing and threat modeling

---

## 13) What are the recommended mitigations for SQL injection?
Key mitigations:
- Use **parameterized queries / prepared statements**
- Avoid dynamic SQL string concatenation with user input
- Use least-privilege DB accounts
- Validate input where appropriate (but parameterization is primary)

---

## 14) What are the recommended mitigations for XSS?
Key mitigations:
- Avoid injecting user input into HTML using `innerHTML`
- Prefer safe rendering methods like `textContent`
- If HTML is required, sanitize using a trusted library (e.g., DOMPurify)
- Apply output encoding for correct context (HTML, attributes, JS, URL)

---

## 15) What is the main outcome of this lab from a security perspective?
The lab built practical understanding of:
- how SQLi and XSS behave in a vulnerable app
- how to set up static analysis tooling (including handling tool version changes)
- how to document and implement secure coding patterns that reduce real-world risk
