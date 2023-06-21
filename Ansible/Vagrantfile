# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # Configuración de la máquina virtual master con Ansible instalado
  config.vm.define "ansible" do |ansible|
    ansible.vm.box = "ubuntu/jammy64"
    ansible.vm.hostname = "ansible"
    ansible.vm.network "private_network", ip: "192.168.33.10"
    ansible.vm.provider "virtualbox" do |vb|
      vb.name = "ansible"
      vb.memory = 2048  # Asigna 2 GB de memoria RAM

    end
    ansible.vm.provision "shell", path: "ansible.sh"

  end

  # Configuración de la máquina virtual docker con Docker instalado
  config.vm.define "central" do |central|
    central.vm.box = "ubuntu/jammy64"
    central.vm.hostname = "central"
    central.vm.network "private_network", ip: "192.168.33.20"
    central.vm.provider "virtualbox" do |vb|
      vb.name = "central"
      vb.memory = 2048  # Asigna 2 GB de memoria RAM

    end
    central.vm.provision "shell", path: "central.sh"

  end

  # Configuración de dos máquinas virtuales objetivo
  (1..3).each do |i|
    config.vm.define "esclavo#{i}" do |esclavo|
      esclavo.vm.box = "ubuntu/jammy64"
      esclavo.vm.hostname = "esclavo#{i}"
      esclavo.vm.network "private_network", ip: "192.168.33.#{i+20}"
      esclavo.vm.provider "virtualbox" do |vb|
        vb.name = "esclavo#{i}"
        vb.memory = 2048  # Asigna 1 GB de memoria RAM

      end
      esclavo.vm.provision "shell", path: "esclavo.sh"
    end
  end

end
