#!/bin/bash
echo 'run before_install.sh: ' >>/cron-telebot2/deploy.log

echo 'sudo apt-get install python-pip' >> /cron-telebot2/deploy.log 
sudo apt-get install python-pip