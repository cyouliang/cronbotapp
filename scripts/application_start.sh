#!/bin/bash

echo 'run application_start.sh: '

set -e

cd /home/ec2-user/cronbotapp

# nodejs-app is the same name as stored in pm2 process
echo 'gunicorn main:app -k uvicorn.workers.UvicornWorker --timeout 60'
gunicorn main:app -k uvicorn.workers.UvicornWorker --timeout 60