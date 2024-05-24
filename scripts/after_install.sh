#!/bin/bash
echo 'run after_install.sh: ' >> /home/ec2-user/cronbotapp/deploy.log

# echo 'cd /cron-telebot 2' >> /cron-telebot2/deploy.log
# cd 'cron-telebot\ 2' >> /cron-telebot2/deploy.log

echo 'pip install -r requirements.txt' >> /home/ec2-user/cronbotapp/deploy.log 
python -m pip install -r requirements.txt >> /home/ec2-user/cronbotapp/deploy.log
