#cloud-boothook
#!/bin/bash
sudo yum update -y
sudo yum install httpd php -y

sudo mkdir /var/www/html/routes


sudo tee -a /var/www/html/routes/index.php <EOF
<?php
echo \$_SERVER['REMOTE_ADDR']
?>
EOF


sudo tee -a /etc/httpd/conf.d/routes.conf <EOF
<Directory "/var/www/html/routes">
  DirectoryIndex index.php
</Directory>
EOF

sudo systemctl start httpd
sudo systemctl enable httpd