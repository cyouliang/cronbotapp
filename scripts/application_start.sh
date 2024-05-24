#!/bin/bash

echo 'run application_start.sh: ' >> /home/ec2-user/cronbotapp/deploy.log
# nodejs-app is the same name as stored in pm2 process
echo 'gunicorn main:app -k uvicorn.workers.UvicornWorker --timeout 60' >> /home/ec2-user/cronbotapp/deploy.log
gunicorn main:app -k uvicorn.workers.UvicornWorker --timeout 60 >> /home/ec2-user/cronbotapp/deploy.log