#!/bin/bash
# Lab 17 — Security Awareness Training (Phishing)
# Commands Executed During Lab (sequential, no explanations)

mkdir -p Lab17_Security_Awareness/{slides,quiz,feedback,notes}
cd Lab17_Security_Awareness
ls -R

nano slides/phishing_presentation.md
wc -l slides/phishing_presentation.md
head -n 12 slides/phishing_presentation.md

nano quiz/phishing_quiz.md
nano quiz/quiz_invite_message.txt

nano feedback/feedback_questions.md
nano notes/knowledge_gaps_analysis.md

find . -type f -maxdepth 2 -print
