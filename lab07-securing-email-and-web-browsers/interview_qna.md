# 🧠 Interview Q&A — Lab 07: Securing Email & Web Browsers (CIS Controls)

> This Q&A covers phishing defenses in email clients and practical browser hardening using add-ons and secure settings.

---

## 1) Why are email clients a common attack vector?
Email is frequently used for phishing, malicious links, and weaponized attachments. Attackers target users to steal credentials, deliver malware, or trigger financial fraud.

---

## 2) What is the purpose of phishing/junk filtering in an email client?
It reduces user exposure to suspicious messages by flagging, warning, or isolating potentially malicious emails before users interact with them.

---

## 3) What does “adaptive junk mail controls” mean in Thunderbird?
It means Thunderbird learns from user actions (marking junk/not junk) to improve detection over time and adapt to new spam/phishing patterns.

---

## 4) Why enable “Trust junk mail headers set by” in Thunderbird?
Some mail systems add spam/junk headers upstream. Trusting those headers can improve filtering accuracy when the mail provider performs filtering.

---

## 5) Why should phishing testing be done safely?
Because real phishing content can be harmful. Safe simulations ensure no malware runs and no sensitive data is exposed while still validating filtering behavior.

---

## 6) Why are browsers high-risk applications in endpoint security?
Browsers execute untrusted web content, making them a target for:
- malicious scripts
- drive-by downloads
- malvertising
- exploit kits
- credential theft via phishing pages

---

## 7) What does NoScript protect against?
NoScript blocks JavaScript and other active content by default, reducing risk from malicious scripts, drive-by attacks, and some exploit chains that rely on active scripting.

---

## 8) What does uBlock Origin protect against?
uBlock Origin blocks ads, trackers, and many pop-ups. This reduces exposure to malvertising and improves privacy by limiting tracking scripts and third-party requests.

---

## 9) Why is blocking pop-ups still important?
Pop-ups can be used for:
- scam pages
- fake alerts / social engineering
- forced redirects
- malicious downloads  
Blocking them reduces user manipulation and drive-by behavior.

---

## 10) What is “Enhanced Tracking Protection: Strict” in Firefox?
It is a stronger privacy/security mode that blocks more trackers and cross-site tracking resources than the default “Standard” mode.

---

## 11) What is “Deceptive Content and Dangerous Software Protection”?
It is a browser protection feature that warns users about known phishing sites and malicious downloads based on reputation lists and threat intelligence sources.

---

## 12) What does “Block Fingerprinting” do?
It reduces tracking based on browser/device characteristics (screen size, fonts, installed plugins, etc.), making it harder for trackers to identify users uniquely.

---

## 13) How can you verify that blockers are working?
Indicators include:
- uBlock Origin showing blocked request counts increasing
- NoScript showing blocked scripts and requiring explicit allow rules
- fewer ads/pop-ups and fewer third-party requests during browsing

---

## 14) What is a balanced approach to NoScript usage?
NoScript is strong but can break websites. A practical approach is to:
- block by default
- allow scripts only for trusted domains
- keep minimal allowlists

---

## 15) Why is documenting browser/email security settings useful in organizations?
Documentation supports:
- standard baseline configurations
- audits and compliance
- repeatability across endpoints
- faster troubleshooting and consistent security posture
