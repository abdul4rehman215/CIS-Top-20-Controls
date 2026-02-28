# 🛠️ Troubleshooting Guide — Lab 17: Security Awareness Training (Phishing)

> This guide covers common issues that may occur while creating the training artifacts slides, quiz, feedback, and analysis notes) in a Linux cloud lab environment.

---

## 1) `mkdir: cannot create directory ... Permission denied`
### Cause
You may be trying to create folders in a directory where your user does not have write permissions.

### Fix
- Run the command from your home directory:
  - `cd ~`
- Or choose a writable path like:
  - `mkdir -p ~/Lab17_Security_Awareness/...`

---

## 2) Curly brace expansion didn’t create subfolders
### Symptoms
- Only the top folder exists
- Subfolders like `slides`, `quiz`, etc. are missing

### Cause
Brace expansion requires a compatible shell (bash). If you run it in a restricted shell, it may not expand.

### Fix
- Ensure you’re using bash:
  - `echo $SHELL`
- Re-run with bash explicitly:
  - `bash -c 'mkdir -p Lab17_Security_Awareness/{slides,quiz,feedback,notes}'`

---

## 3) `nano: command not found`
### Cause
Some minimal environments may not have nano installed.

### Fix
- Install nano (Ubuntu):
  - `sudo apt update && sudo apt install -y nano`
- Or use an alternative editor:
  - `vi slides/phishing_presentation.md`

---

## 4) Files look “empty” after saving
### Symptoms
- `head` shows nothing
- `wc -l` returns `0`

### Causes
- File saved to a different path
- The editor session was closed without saving

### Fix
- Confirm correct working directory:
  - `pwd`
- Confirm the file exists:
  - `ls -l slides/`
- Re-open and check file contents:
  - `cat slides/phishing_presentation.md`

---

## 5) `wc -l` line count differs from expectation
### Explanation
Line counts can differ slightly depending on:
- blank lines
- extra separators (`---`)
- trailing newline behavior

### Fix
This is not an error. The important part is that the file content is complete and readable.

---

## 6) `find` output missing files
### Cause
- Files were created in a different directory
- Incorrect max depth used
- You’re running `find` from the wrong location

### Fix
- Verify you are inside the workspace:
  - `pwd`
- List recursively:
  - `ls -R`
- Run find without max depth limitation:
  - `find . -type f -print`

---

## 7) Markdown formatting looks wrong on GitHub
### Symptoms
- Headings not rendering
- Lists not aligned
- Code blocks broken

### Fix
- Ensure file extension is `.md` for markdown files.
- Ensure headings begin with `#` and there is a space after it:
  - `# Title`
- Ensure lists use `- ` or `1) ` formats consistently.
- Preview locally:
  - `cat file.md`
  - or open on GitHub after commit

---

## 8) How to turn `slides/phishing_presentation.md` into real slides
### Recommendation
- Copy sections into:
  - LibreOffice Impress
  - Google Slides
- Use one “Slide X” section per slide
- Add visuals:
  - phishing email examples (screenshots)
  - “attack flow” diagram (simple arrows)
  - red flags icons

This lab stores content in markdown for GitHub portability.

---

## 9) Quiz distribution is “hypothetical” — how to make it real?
### Option A (Simple)
Paste quiz questions into Google Forms and share the link internally.

### Option B (Offline)
Print or email the `quiz/phishing_quiz.md` content and collect responses manually.

### Option C (Repeatable improvement cycle)
- Run the quiz now (baseline)
- Improve training based on gaps
- Re-run in 2 weeks and compare scores

---

## 10) Keeping this lab realistic in a portfolio
### Best practice
- Keep artifacts as they are (slides, quiz, feedback, gap analysis)
- Avoid claiming real team results unless you actually conducted it
- Keep “hypothetical results” clearly labeled (as done in `knowledge_gaps_analysis.md`)
