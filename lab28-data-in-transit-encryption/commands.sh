#!/bin/bash
# Lab 28 — Data in Transit Encryption (Nginx HTTPS + HTTP→HTTPS Redirect)
# Commands Executed During Lab (sequential, no explanations)

sudo apt-get update
sudo apt-get install nginx -y

sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout /etc/ssl/private/server.key -out /etc/ssl/certs/server.crt

sudo ls -l /etc/ssl/private/server.key /etc/ssl/certs/server.crt

sudo nano /etc/nginx/sites-available/yourdomain.com

sudo ln -s /etc/nginx/sites-available/yourdomain.com /etc/nginx/sites-enabled/yourdomain.com

sudo nginx -t
sudo systemctl restart nginx
sudo systemctl status nginx --no-pager | head -n 14

curl -k -I https://yourdomain.com

sudo nano /etc/nginx/sites-available/yourdomain.com
sudo nginx -t
sudo systemctl reload nginx

curl -I http://yourdomain.com

sudo ss -tulpen | grep -E ':80|:443'
