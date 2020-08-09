# Zimbra 9 OSS Zextras Version installation on CentOS 8

# MAKE SURE TO CREATE LARGE /opt/zimbra PARTITION IN CUSTOM PARTITIONING 
# CentOS by default assigns most of the hard drive space to /home

# Disable SELinux 
sudo setenforce 0
# Open /etc/selinux/config and modify file to include SELINUX=disabled

# Disable IPv6
sysctl -w net.ipv6.conf.all.disable_ipv6=1

# Set FQDN in /etc/hosts
dnf -y install nano
nano /etc/hosts

# NOW REBOOT

# Disable Firewall
service firewalld stop
systemctl disable firewalld
systemctl restart NetworkManager

# Install Perl prerequisite for Zimbra
dnf -y update && dnf install perl

# Download Zimbra from URL
dnf -y install wget

# Appent IP FQDN to /etc/hosts and restart network 
# echo "IP FQDN" > /etc/hosts
systemctl restart NetworkManager

# Redirect HTTP to HTTPS in Zimbra
zmprov ms `zmhostname` zimbraReverseProxyMailMode redirect

# Install Certbot
dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
dnf install certbot
wget https://github.com/YetOpen/certbot-zimbra/raw/master/certbot_zimbra.sh
chmod +x certbot_zimbra.sh
chown root: certbot_zimbra.sh
mv certbot_zimbra.sh /usr/local/bin/

