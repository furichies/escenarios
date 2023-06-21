
# resolución de nombres
echo "192.168.33.10 puppetserver puppet" >> /etc/hosts
echo "192.168.33.11 puppetnode1" >> /etc/hosts

wget https://apt.puppetlabs.com/puppet7-release-focal.deb
sudo dpkg -i puppet7-release-focal.deb
sudo apt update
sudo apt install puppet-agent -y



cat <<EOF >> /etc/puppetlabs/puppet/puppet.conf
[main]
certname = puppetnode1
server = puppetserver
EOF

sudo systemctl start puppet
sudo systemctl enable puppet
/opt/puppetlabs/bin/puppet module install puppetlabs-mysql
/opt/puppetlabs/bin/puppet module install puppetlabs-apache
