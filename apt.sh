#!/bin/bash

ESSENTIAL="git vim bash-completion"
MONITORING="glances htop iotop iftop"
DEVELOPMENT="build-essential python3 gcc g++ binutils"
UTILS="bc tree screen nnn"

if [[ $EUID -ne 0 ]]; then
   echo "run as root" 
   exit 1
fi

apt update && apt upgrade -y
apt install ${ESSENTIAL} ${MONITORING} ${DEVELOPMENT} ${UTILS} -y
