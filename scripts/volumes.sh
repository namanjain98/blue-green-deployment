#!/bin/bash
yum -y install httpd
echo "<em style='color:blue;'>the pages are serverd from:`hostname -f`</em>">> /var/www/html/index.html
service httpd start