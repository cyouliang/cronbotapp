#!/bin/bash

echo 'run application_start.sh: '

set -e

cd /home/ec2-user/cronbotapp

# Check if Gunicorn is installed
if pip3 list | grep -q 'gunicorn'; then
    echo "Gunicorn is installed."
else
    echo "Gunicorn is not installed. Installing..."
    pip3 install gunicorn
fi

if pip3 list | grep -q 'uvicorn'; then
    echo "Uvicorn is installed."
else
    echo "Uvicorn is not installed. Installing..."
    pip3 install uvicorn

# nodejs-app is the same name as stored in pm2 process
echo 'gunicorn main:app -k uvicorn.workers.UvicornWorker --timeout 60'
gunicorn main:app -k uvicorn.workers.UvicornWorker --timeout 60