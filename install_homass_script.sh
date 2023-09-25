#!/bin/sh
nano /etc/sysctl.conf
#net.ipv6.conf.all.disable_ipv6 = 1
#net.ipv6.conf.default.disable_ipv6 = 1
#net.ipv6.conf.lo.disable_ipv6 = 1
#net.ipv6.conf.eth0.disable_ipv6 = 1
sysctl -p
apt update
apt upgrade -y
apt-get install -y jq wget lsb-release net-tools curl udisks2 apparmor-utils libglib2.0-bin network-manager dbus systemd-journal-remote unzip
systemctl start NetworkManager
systemctl enable NetworkManager
curl -fsSL get.docker.com | sh
gpasswd -a $USER docker
newgrp docker
wget https://github.com/home-assistant/os-agent/releases/download/1.5.1/os-agent_1.5.1_linux_x86_64.deb
dpkg -i os-agent_1.5.1_linux_x86_64.deb
wget https://github.com/home-assistant/supervised-installer/releases/download/1.4.3/homeassistant-supervised.deb
dpkg -i homeassistant-supervised.deb
wget -O - https://get.hacs.xyz | bash -
