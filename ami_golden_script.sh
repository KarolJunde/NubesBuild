#!/bin/bash
    sudo yum update -y
    sudo yum install php wget -y
    sudo yum install python-pip -y
    sudo yum install ruby httpd -y
    sudo yum install stress -y
    cd /home/ec2-user
    sudo wget https://aws-codedeploy-eu-west-1.s3.amazonaws.com/latest/install
    sudo chmod +x ./install
    sudo ./install auto
    #pip install --upgrade --user awscli
    sudo service httpd start
    sudo chmod a+wx /var/www/html
    cd /var/www/html
    sudo echo "It's healthy!!!" > healthy.html
    sudo wget https://s3.eu-central-1.amazonaws.com/s3-terraform-shared/index.html
    sudo wget https://s3.eu-central-1.amazonaws.com/s3-terraform-shared/stats.php
    sudo service codedeploy-agent start
    sudo service codedeploy-agent status > /var/www/html/agentstatus.html
    sudo chkconfig httpd on

