
# resolución de nombres
echo "192.168.33.10 puppetserver puppet" >> /etc/hosts
echo "192.168.33.11 puppetnode1" >> /etc/hosts

#Instalar core
wget https://apt.puppetlabs.com/puppet7-release-focal.deb
sudo dpkg -i puppet7-release-focal.deb
sudo apt update
sudo apt install puppetserver -y
sudo systemctl start puppetserver
sudo systemctl enable puppetserver
/opt/puppetlabs/bin/puppetserver ca list --all
/opt/puppetlabs/bin/puppetserver ca sign --all
#/opt/puppetlabs/bin/puppet agent --test
  #agregamos módulo para mariadb. Los nodos ya deberían estar registrados.
/opt/puppetlabs/bin/puppet module install puppetlabs-mysql
/opt/puppetlabs/bin/puppet module install puppetlabs-apache
#instalamos wordpress en node 1 - el manifiesto está en /vagrant/wordpress.pp y genera un catálogo.
/opt/puppetlabs/bin/puppet apply /vagrant/wordpress.pp

