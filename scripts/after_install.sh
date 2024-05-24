#!/bin/bash
echo 'run after_install.sh: '

# echo 'cd /cron-telebot 2' >> /cron-telebot2/deploy.log
# cd 'cron-telebot\ 2' >> /cron-telebot2/deploy.log

echo 'pip install -r requirements.txt'
pip3 install -r requirements.txt

echo "All dependencies are installed."