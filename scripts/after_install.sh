#!/bin/bash
echo 'run after_install.sh: ' >> /home/ec2-user/cronbot_app/deploy.log

echo 'cd /cron-telebot 2' >> /home/ec2-user/cronbot_app/deploy.log
cd 'cron-telebot 2' >> /home/ec2-user/cronbot_app/deploy.log

echo 'pip install -r requirements.txt' >> /home/ec2-user/cronbot_app/deploy.log 
pip install -r requirements.txt >> /home/ec2-user/cronbot_app/deploy.log
