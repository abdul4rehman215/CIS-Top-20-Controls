#!/bin/bash
# Lab 18 — Application Software Security
# Commands Executed During Lab (sequential, no explanations)

docker --version
sudo systemctl status docker --no-pager | head -n 12

docker pull vulnerables/web-dvwa
docker run -d -p 80:80 vulnerables/web-dvwa
docker ps

node -v
npm -v

sudo npm install -g eslint
eslint -v

mkdir -p Lab18_AppSec/{dvwa_notes,static_analysis,secure_code}
cd Lab18_AppSec/static_analysis
nano vulnerableScript.js

eslint vulnerableScript.js

npm init -y
npm install --save-dev eslint eslint-plugin-security
nano eslint.config.js

eslint vulnerableScript.js

cd ../secure_code
nano secure_examples.js
nano secure_coding_notes.md

cd ~/Lab18_AppSec && find . -type f -maxdepth 2 -print
