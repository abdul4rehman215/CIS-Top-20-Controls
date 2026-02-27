# 🧪 Lab 17: Security Awareness Training (CIS Controls)

**Environment:** Ubuntu 24.04.1 LTS (Cloud Lab Environment)  
**User:** `toor`  
**Chosen Topic:** 🎣 **Phishing Awareness**  
**Focus Area:** CIS Control — Security Awareness & Skills Training (Accountable user behavior + risk reduction)

---

## 🎯 Objectives

In this lab, I created a structured **security awareness mini-training package** focused on phishing.

By the end of the lab, I was able to:

- Explain the fundamentals of workplace security awareness
- Recognize common security threats (phishing + social engineering patterns)
- Teach password & identity hygiene concepts indirectly tied to phishing defense
- Create and structure a training deck (as GitHub-friendly markdown content)
- Build a quiz to identify knowledge gaps (scenarios + mixed question types)
- Prepare a feedback form and analyze results to identify weak areas for retraining

---

## ✅ Prerequisites

- Basic understanding of online threats and workplace risk
- Familiarity with standard workplace communication tools
- Access to a presentation tool (LibreOffice Impress / Google Slides)

> **Note:** In this cloud lab environment, deliverables were prepared as markdown/text artifacts suitable for GitHub and later conversion into slide tools.

---

## 🧩 Lab Tasks Overview

### ✅ Task 1: Create a Security Threat Presentation (Phishing)
- Chose **Phishing** as the awareness topic
- Created a slide-style outline in markdown with:
  - introduction
  - attack flow
  - common tactics
  - red flags
  - best practices
  - what to do if clicked
  - summary
- Verified the file integrity with line count and content preview

### ✅ Task 2: Conduct a Mini Quiz / Scenario-Based Test
- Designed a 10-question quiz:
  - True/False
  - Multiple Choice
  - Short Answer scenarios
- Prepared a “quiz invite message” that could be used for real/hypothetical distribution to a team

### ✅ Task 3: Collect Feedback + Identify Knowledge Gaps
- Created feedback questions for participants
- Wrote a realistic “knowledge gap analysis” document:
  - common mistakes
  - mapping gaps to quiz questions
  - recommendations for next training round
  - next topics to cover
- Verified all deliverables exist using `find`

---

## 📁 Repository Structure

```

lab17-security-awareness-training/
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
├── troubleshooting.md
├── slides/
│   └── phishing_presentation.md
├── quiz/
│   ├── phishing_quiz.md
│   └── quiz_invite_message.txt
├── feedback/
│   └── feedback_questions.md
└── notes/
└── knowledge_gaps_analysis.md

```

---

## ✅ Deliverables Produced

### 📌 Training Content
- `slides/phishing_presentation.md`  
  A slide-by-slide training deck outline ready to paste into slides.

### 🧪 Quiz Package
- `quiz/phishing_quiz.md`  
  A 10-question mixed-format phishing quiz (TF/MCQ/Scenario).
- `quiz/quiz_invite_message.txt`  
  A realistic distribution message for teams.

### 📝 Feedback & Improvement Artifacts
- `feedback/feedback_questions.md`  
  Feedback questions to evaluate clarity and confidence gains.
- `notes/knowledge_gaps_analysis.md`  
  Sample gap analysis with future improvement actions.

---

## 🧠 What I Learned

- Security awareness is not “just theory” — it becomes effective when packaged into:
  - engaging training content
  - quizzes/tests that expose weak points
  - feedback loops for continuous improvement
- Phishing relies heavily on psychology (urgency, authority, reward) more than technical exploits
- A good awareness program is iterative: **train → test → analyze → improve → repeat**

---

## 🌍 Why This Matters

Phishing remains one of the most common initial access techniques because it targets **human behavior**.

Even with strong technical controls (MFA, EDR, filtering), users still need:
- the ability to recognize attacks
- confidence to report suspicious activity
- clear steps to respond after mistakes (clicks happen)

---

## 🧰 Real-World Applications

- Onboarding training for new employees
- Quarterly phishing refresher sessions
- Tabletop exercises for incident response readiness
- Building security culture through short, repeated micro-trainings
- Measuring improvement over time using repeat quizzes

---

## ✅ Result

- A complete phishing awareness training package was prepared:
  - slide deck content
  - quiz + invite message
  - feedback form
  - knowledge gap analysis report
- All deliverables were validated as present in the workspace using `find`.

---

## 🏁 Conclusion

This lab demonstrates how to build a simple but effective security awareness workflow that can be repeated inside an organization:

**Create training → test learners → collect feedback → identify gaps → improve future training.**

✅ Lab completed successfully (deliverables prepared for presentation + quiz + feedback + gap analysis).

---
