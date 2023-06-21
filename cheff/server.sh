# resolución de nombres
echo "192.168.33.10 chef-server" >> /etc/hosts
echo "192.168.33.11 agente1" >> /etc/hosts
echo "192.168.33.12 agente2" >> /etc/hosts

#Instalar core
dpkg -i /vagrant/chef-server-core_12.19.31-1_amd64.deb
#almacen de claves
mkdir -m 1777 /claves
#configuración del servidor
chef-server-ctl reconfigure

#es posible accer desde la consola pero para administrar ... siguiendo instrucciones de fabricante
chef-server-ctl install chef-manage
chef-server-ctl reconfigure
chef-manage-ctl reconfigure

# creamos un usuario e indicamos el fichero que tiene la clave privada 

chef-server-ctl user-create vagrant vagrant c1265 curso@es.es CaM1n0K0y0T3 -f /etc/opscode/vagrant.pem

#creamos la organización

chef-server-ctl org-create curso1265 cur1265 --association_user vagrant -f /etc/opscode/validation.pem

#lo copiamos para los nodos
cp /etc/opscode/va*.pem /vagrant


#instalamos workstation en la misma máquina

dpkg -i /vagrant/chef-workstation_0.4.2-1_amd64.deb
