#!/bin/bash
echo 'run before_install.sh: ' >> /home/ec2-user/cronbotapp/deploy.log

echo 'sudo yum install python-pip' >> /home/ec2-user/cronbotapp/deploy.log 
sudo yum install python-pip