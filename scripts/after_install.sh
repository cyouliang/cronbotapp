#!/bin/bash
echo 'run after_install.sh: '

# echo 'cd /cron-telebot 2' >> /cron-telebot2/deploy.log
# cd 'cron-telebot\ 2' >> /cron-telebot2/deploy.log

cd /home/ec2-user/cronbotapp

virtualenv venv

source venv/bin/activate

echo 'pip install -r requirements.txt'

sudo pip3 freeze > requirements.txt
sudo pip3 install --upgrade --force-reinstall -r requirements.txt

echo "All dependencies are installed."