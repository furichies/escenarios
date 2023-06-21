# resolución de nombres
echo "192.168.33.10 chef-server" >> /etc/hosts
echo "192.168.33.11 agente1" >> /etc/hosts
echo "192.168.33.12 agente2" >> /etc/hosts

#Instalar cliente 
dpkg -i /vagrant/chef_14.15.6-1_amd64.deb

#idiomas para evitar problemas de ruby en realidad sudo no es necesario.
echo "en_US UTF-8" | sudo tee /etc/locale.gen
sudo dpkg-reconfigure --frontend=noninteractive locales
sudo update-locale LANG=en_US.UTF-8

mkdir /etc/chef
cp /vagrant/validation.pem /etc/chef/
if [[ $(hostname) == "agente1" ]] then
  cp /vagrant/cliente1.rb /etc/chef/cliente.rb
else
  cp /vagrant/cliente2.rb /etc/chef/cliente.rb
fi
#testing
cp /vagrant/agent*.pem /etc/chef/
