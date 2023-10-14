sudo apt-get update
sudo apt-get install -y nginx
echo "hello Siddhant, terraform here" > /var/www/html/index.nginx-debian.html
sudo service nginx start