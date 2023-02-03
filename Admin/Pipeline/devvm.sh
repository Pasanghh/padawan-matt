#!/bin/bash 


# Script to configure devvm to use proxy
gcloud config set project proud-breaker-324113

gcloud compute ssh test --tunnel-through-iap \
--command='
sudo -s

echo "export http_proxy=\"http://10.1.30.2:3128\"" >> /etc/profile.d/proxy.sh

echo "export https_proxy=\"http://10.1.30.2:3128\"" >> /etc/profile.d/proxy.sh

echo "export ftp_proxy=\"http://10.1.30.2:3128\"" >> /etc/profile.d/proxy.sh

echo "export no_proxy=169.254.169.254,metadata,metadata.google.internal" >> /etc/profile.d/proxy.sh

cp /etc/sudoers /tmp/sudoers.new                                   

chmod 640 /tmp/sudoers.new

echo "Defaults env_keep += \"ftp_proxy http_proxy https_proxy no_proxy"\" >>/tmp/sudoers.new

chmod 440 /tmp/sudoers.new

visudo -c -f /tmp/sudoers.new && cp /tmp/sudoers.new /etc/sudoers

exit

source ~/.profile

sudo apt-get update
'
# change http_access allow localnet position