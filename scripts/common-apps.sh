#! /bin/bash

#Install common applications
yum update -y && \
yum upgrade -y

yum install -y \
    wget \
    unzip \
    vim \
    curl \
    python3 \
    python3-pip \
    git

# Install GNOME Desktop
yum groupinstall -y "Server with GUI"
systemctl set-default graphical.target
systemctl start graphical.target

# Install RDP server
yum install -y epel-release
yum install -y xrdp
systemctl enable xrdp
systemctl start xrdp

# Install firewalld if not installed
# if ! command -v firewall-cmd &> /dev/null
# then
#     sudo yum install -y firewalld
#     sudo systemctl start firewalld
#     sudo systemctl enable firewalld
# fi

# Enable firewall port for RDP
firewall-cmd --permanent --add-port=3389/tcp
firewall-cmd --reload

firewall-cmd --list-ports

iptables -A INPUT -p tcp --dport 3389 -j ACCEPT 
iptables-save
systemctl restart xrdp