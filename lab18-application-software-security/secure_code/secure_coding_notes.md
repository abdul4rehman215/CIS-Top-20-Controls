# Secure Coding Notes (Lab 18)

## SQL Injection Mitigation
- Avoid dynamic SQL string concatenation with user input.
- Use prepared statements / parameterized queries.
- Enforce least privilege for DB accounts.

## XSS Protection
- Avoid inserting user input using `innerHTML`.
- Prefer `textContent` when rendering untrusted input.
- Sanitize if HTML is required (e.g., DOMPurify).
- Encode output for the correct context (HTML, attribute, JS, URL).

## Configuration / Hygiene
- Keep libraries updated (npm audit, dependabot, etc.)
- Lint + security plugin rules to catch dangerous patterns early.
- Use code reviews + testing (DAST/SAST where possible.)
