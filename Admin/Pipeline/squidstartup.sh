#!/bin/bash

gcloud config set project proud-breaker-324113

gcloud compute project-info add-metadata \
    --metadata enable-oslogin=TRUE


gcloud config set project host-project-323315

gcloud compute ssh root@squid-ubuntu-2004-2-vm --tunnel-through-iap \
--command='
echo "Starting update"
sleep 2
sudo apt-get update -y


echo "Starting upgrade"
sleep 2
sudo apt-get upgrade -y


echo "Installing squid"
sleep 2
sudo apt-get install squid -y


echo "Starting squid"
sleep 2
sudo systemctl start squid


echo "Enabling squid"
sleep 2
sudo systemctl enable squid

echo "Installing net-tools"
sleep 2
sudo apt install net-tools
'

gcloud compute ssh root@squid-ubuntu-2004-2-vm --tunnel-through-iap \
--command='

sudo sed -i "s:#\(http_access allow localnet\):\1:" /etc/squid/squid.conf

sudo sed -i "s:#\(http_access deny to_localhost\):\1:" /etc/squid/squid.conf

sudo sed -i "s:#\(acl localnet src 10.0.0.0/8.*\):\1:" /etc/squid/squid.conf

sudo sed -i "s:#\(acl localnet src 172.16.0.0/12.*\):\1:" /etc/squid/squid.conf

sudo sed -i "s:#\(acl localnet src 192.168.0.0/16.*\):\1:" /etc/squid/squid.conf

sudo sed -i "s:#\(acl localnet src fc00\:\:/7.*\):\1:" /etc/squid/squid.conf

sudo sed -i "s:#\(acl localnet src fe80\:\:/10.*\):\1:" /etc/squid/squid.conf

sudo tee -a /etc/squid/squid.conf <<"EOF"
acl to_metadata dst 169.254.169.254
http_access deny to_metadata
EOF

sudo service squid start

sudo systemctl restart squid.service
'