# Ubuntu 16.04 initial server configuration

# https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-16-04

adduser alex
usermode -aG sudo alex

ssh-keygen

# on local 
# brew install ssh-copy-id
# ssh-copy-id alex@server-ip

# Disable Password Auth
sudo nano /etc/ssh/sshd_config
# PasswordAuthentication no
# PubkeyAuthentication yes
# ChallengeResponseAuthentication no

# reload daemon
sudo systemctl reload sshd

# firewall

sudo ufw app list

sudo ufw allow OpenSSh
sudo ufw allow ssh
ufw enable
ufw status
# allow http & https
sudo ufw allow proto tcp from any to any port 80,443

# https://www.digitalocean.com/community/tutorials/ufw-essentials-common-firewall-rules-and-commands

curl -sL https://deb.nodesource.com/setup_6.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh

sudo apt-get install nodejs
sudo apt-get install build-essential

sudo npm install -g pm2

sudo apt-get install letsencrypt

# Mongo Repo
# https://www.digitalocean.com/community/tutorials/how-to-install-mongodb-on-ubuntu-16-04
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927

echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list

sudo apt-get update
sudo apt-get install -y mongodb-org
sudo systemctl enable mongodb

# $ sudo nano /etc/systemd/system/mongodb.service

# [Unit]
# Description=High-performance, schema-free document-oriented database
# After=network.target

# [Service]
# User=mongodb
# ExecStart=/usr/bin/mongod --quiet --config /etc/mongod.conf

# [Install]
# WantedBy=multi-user.target

# $ systemctl status
# $ systemctl status mongodb

## Added Node.js Service to be managed by pm2

chmod +x www.js
/var/www/reddit.com/server/bin $ pm2 start www

# edited /etc/nginx/sites-enabled/default

server {
    listen 80;

    server_name example.com;

    location / {
        proxy_pass http://localhost:8080;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}

# check for errors in file
sudo nginx -t
sudo systemctl start nginx

## Allow traffic through firewall
sudo ufw allow 'Nginx Full'
pm2 restart www

# How do you package everything so its compiled runs everthing in a folder?
# looks like i just gotta npm install on the server 