#!/bin/bash


sudo apt-get -y update
sudo apt-get -y upgrade

apt install -y jq
apt install -y build-essential libssl-dev libffi-dev python-dev
apt install -y python3-pip 

git clone https://github.com/Voorivex/OOB-Server.git

cd OOB-Server

echo -e "Enter Your domain" ;
read domain ;

echo -e "Enter Your ip" ;
read ip ;

./setup $domain $pip

cd

echo "installing xui...."
echo "Enter panel username"
echo "Enter panel password"
echo "Enter panel port"

bash <(curl -Ls https://raw.githubusercontent.com/vaxilu/x-ui/master/install.sh)


echo "installing nginx"

sudo apt install nginx

sudo apt install shadowsocks-libev nginx

pip install certbot-nginx

echo -e "Enter Your email to enumerate subdomains:- " ;
read email ;

sudo certbot --rsa-key-size 4096 --nginx  --agree-tos  -m $email --no-eff-email


sudo systemctl restart nginx

systemctl status nginx.service  
