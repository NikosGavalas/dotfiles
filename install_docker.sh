#!/bin/bash

apt-get update

apt-get install apt-transport-https ca-certificates curl  gnupg2 software-properties-common software-properties-common

curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
    $(lsb_release -cs) \
    stable"

apt-get update

sudo apt-get install docker-ce -y

sudo docker run --rm hello-world

sudo systemctl enable docker

# docker --version
