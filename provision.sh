#!/bin/bash

cd /root
wget -q https://storage.googleapis.com/golang/go1.5.1.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.5.1.linux-amd64.tar.gz
rm go1.5.1.linux-amd64.tar.gz

apt-get update
apt-get upgrade -y
apt-get install -y mc



