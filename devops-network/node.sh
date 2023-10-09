#!/bin/bash
sudo curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin
sudo apt install default-jre -y 
sudo apt install maven -y
sudo apt install git -y 
sudo apt install wget -y