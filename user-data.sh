#!/bin/bash
dnf update -y
dnf install -y httpd

systemctl enable httpd
systemctl start httpd

echo "<h1>Terraform Two Tier App - DEV</h1>" > /var/www/html/index.html