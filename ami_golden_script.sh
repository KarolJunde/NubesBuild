#!/bin/bash
    sudo su
    yum update -y
    yum install php wget -y
    yum install python-pip -y
    yum install ruby httpd -y
    yum install stress -y
    cd /home/ec2-user
    wget https://aws-codedeploy-eu-west-1.s3.amazonaws.com/latest/install
    chmod +x ./install
    sudo ./install auto
    #pip install --upgrade --user awscli
    service httpd start
    cd /var/www/html
    echo "healthy!!!" > healthy.html
    wget https://s3.eu-central-1.amazonaws.com/s3-terraform-shared/index.html
    wget https://s3.eu-central-1.amazonaws.com/s3-terraform-shared/stats.php
    service codedeploy-agent start
    service codedeploy-agent status > /var/www/html/agentstatus.html
    chkconfig httpd on

