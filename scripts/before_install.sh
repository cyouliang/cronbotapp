#!/bin/bash
echo 'run before_install.sh: ' >>/cron-telebot2/deploy.log

echo 'sudo yum install python-pip' >> /cron-telebot2/deploy.log 
sudo yum install python-pip