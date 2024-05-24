#!/bin/bash

echo 'run application_start.sh: ' >> /cron-telebot2/deploy.log
# nodejs-app is the same name as stored in pm2 process
echo 'gunicorn main:app -k uvicorn.workers.UvicornWorker --timeout 60' >> /cron-telebot2/deploy.log
gunicorn main:app -k uvicorn.workers.UvicornWorker --timeout 60 >> /cron-telebot2/deploy.log