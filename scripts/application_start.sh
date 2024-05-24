#!/bin/bash

echo 'run application_start.sh: '

set -e

# Set environment variable
export env=prod

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
fi

if pip3 list | grep -q 'fastapi'; then
    echo "FastApi is installed."
else
    echo "FastApi is not installed. Installing..."
    pip3 install fastapi
fi

if pip3 list | grep -q 'telegram'; then
    echo "Telegram is installed."
else
    echo "Telegram is not installed. Installing..."
    pip3 install telegram
fi

if pip3 list | grep -q 'typing_extensions'; then
    echo "Typing_extensions is installed."
    pip3 install typing_extensions --upgrade
else
    echo "Typing_extensions is not installed. Installing..."
    pip3 install typing_extensions --upgrade
fi

# nodejs-app is the same name as stored in pm2 process
echo 'gunicorn main:app -k uvicorn.workers.UvicornWorker --timeout 60'
gunicorn main:app -k uvicorn.workers.UvicornWorker --timeout 60