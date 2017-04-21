#!/bin/sh

echo "### System update "
sudo apt update ; apt upgrade -y

echo "### Install default programs "
apt install ssh rsync dstat git vim nmap curl linux-image-extra-$(uname -r) linux-image-extra-virtual -y

echo "### Install docker"
curl -sSL https://agent.digitalocean.com/install.sh | sh
apt-get install linux-image-extra-$(uname -r) linux-image-extra-virtual -y
apt-get install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update ; apt-get install docker-ce

echo "### Install docker-compose"
apt install -y python-pip ; pip install docker-compose
pip install --upgrade pip
pip install docker-compose


echo "### SERVER DO's"

echo "### Config SWAP"
touch /var/swap.img
chmod 600 /var/swap.img
dd if=/dev/zero of=/var/swap.img bs=1024k count=2000
mkswap /var/swap.img
swapon /var/swap.img
