#!/bin/bash
sudo su
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "<h1>Sou o SERVIDOR XX</h1>" > /var/www/html/index.html