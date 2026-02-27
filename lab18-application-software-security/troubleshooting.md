# 🛠️ Troubleshooting Guide — Lab 18: Application Software Security

> This guide covers common issues encountered while deploying DVWA with Docker, running static analysis with ESLint (v9), and producing secure coding artifacts.

---

## 1) Docker service not running
### Symptoms
- `Cannot connect to the Docker daemon`
- `docker ps` fails
- `systemctl status docker` shows inactive

### Fix
- Start Docker:
  - `sudo systemctl start docker`
- Enable at boot:
  - `sudo systemctl enable docker`
- Verify:
  - `sudo systemctl status docker --no-pager | head -n 12`

---

## 2) Port 80 already in use
### Symptoms
- `docker run -p 80:80 ...` fails with bind error
- Error like: `address already in use`

### Fix
Use a different host port (e.g., 8080):
- `docker run -d -p 8080:80 vulnerables/web-dvwa`

Then access via:
- `http://localhost:8080`

---

## 3) DVWA not reachable in a cloud lab environment
### Symptoms
- `http://localhost` works only on the instance itself
- You can’t open DVWA from your local browser

### Cause
In cloud labs, “localhost” refers to the VM/instance. Remote access requires network exposure.

### Fix options (depending on platform rules)
- Use the instance public IP:
  - `http://<PUBLIC_IP>:80`
- Ensure security group/firewall allows inbound port 80
- Use SSH port forwarding:
  - `ssh -L 8080:localhost:80 user@<PUBLIC_IP>`
  - then open `http://localhost:8080`

---

## 4) DVWA container starts but `docker ps` shows it exiting
### Symptoms
- Container not listed as running
- Status shows Exited

### Fix
- View logs:
  - `docker logs <container_id>`
- Re-run container:
  - `docker run -d -p 80:80 vulnerables/web-dvwa`
- Ensure system resources are sufficient.

---

## 5) ESLint fails: “couldn't find eslint.config.(js|mjs|cjs)”
### Symptoms
- ESLint error mentions missing `eslint.config.js`
- Happens in ESLint v9+

### Cause
ESLint v9 defaults to **flat config** format.

### Fix
- Create `eslint.config.js` (flat config), then re-run:
  - `eslint vulnerableScript.js`

---

## 6) ESLint config uses `import` but Node complains about modules
### Symptoms
- Errors around `import` / ESM modules
- Node treats the config as CommonJS

### Fix options
Option A (use `.mjs`):
- Rename config to `eslint.config.mjs`

Option B (set module type):
- Add to `package.json`:
  - `"type": "module"`

Option C (use CommonJS config style if needed):
- Use `require()` and `.cjs` (depends on ESLint flat config expectations)

---

## 7) `eslint-plugin-security` rule doesn’t trigger on your example
### Explanation
Some security plugin rules detect specific patterns (e.g., timing attacks) and may not always warn in simple demo scripts.

### Fix / Improvement
- Keep the plugin installed for baseline checks
- Add additional rules or use complementary tools
- Focus on `no-eval` and safe DOM usage patterns for practical impact

---

## 8) npm global install permission issues
### Symptoms
- `EACCES: permission denied` when installing globally

### Fix
- Use sudo (as done in lab):
  - `sudo npm install -g eslint`

Or adopt a safer approach:
- Use `npx eslint` locally in project scope
- Configure npm global prefix for your user (advanced)

---

## 9) Lint output only shows warnings, not security vulnerabilities
### Explanation
ESLint is primarily a linting tool (quality + style). Security plugins improve detection but do not replace full SAST/DAST.

### Recommendation
For real AppSec workflows, combine:
- ESLint + security plugins
- dependency scans (`npm audit`)
- SAST tools (Semgrep, CodeQL)
- DAST tools (ZAP, Burp testing)
- secure code reviews

---

## 10) Keeping DVWA usage safe
### Risk
DVWA is intentionally vulnerable. Exposing it publicly is dangerous.

### Safe practice
- Run DVWA only in isolated lab environments
- Avoid exposing it directly to the internet
- Stop and remove container after lab:
  - `docker stop <container_id>`
  - `docker rm <container_id>`
