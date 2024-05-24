#!/bin/bash
echo 'run after_install.sh: ' >>/cron-telebot2/deploy.log

echo 'cd /cron-telebot 2' >> /cron-telebot2/deploy.log
cd 'cron-telebot 2' >> /cron-telebot2/deploy.log

echo 'pip install -r requirements.txt' >> /cron-telebot2/deploy.log 
pip install -r requirements.txt >> /cron-telebot2/deploy.log
