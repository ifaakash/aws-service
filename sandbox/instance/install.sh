#!/bin/bash
apt-get update
apt-get install -y nginx
systemctl start nginx
systemctl enable nginx
echo "Hello World" > /var/www/html/index.html
mkdir startup_script_logs
systemctl status nginx > startup_script_logs/startup.log
