# Zimbra 9 OSS Zextras Version installation on CentOS 8

# MAKE SURE TO CREATE LARGE /opt/zimbra PARTITION IN CUSTOM PARTITIONING 
# CentOS by default assigns most of the hard drive space to /home

# Disable SELinux 
sudo setenforce 0
# Open /etc/selinux/config and modify file to include SELINUX=disabled

# NOW REBOOT

# Disable Firewall
service firewalld stop
systemctl disable firewalld
systemctl restart NetworkManager

# Install Perl prerequisite for Zimbra
dnf -y update && dnf install perl


