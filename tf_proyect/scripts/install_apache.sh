#! /bin/bash

apt-get update
apt-get install -y apache2
apt-get install php libapache2-mod-php php-mcrypt php-mysql -y

echo "<IfModule mod_dir.c>
    DirectoryIndex index.php index.cgi index.pl index.html index.xhtml index.htm
</IfModule>" > /etc/apache2/mods-enabled/dir.conf

systemctl restart apache2
systemctl enable apache2
echo "<h1>Deployed via Terraform</h1>" | sudo tee /var/www/html/index.html