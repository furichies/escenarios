# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # Configuración de la máquina virtual master con Ansible instalado
  config.vm.define "master" do |master|
    master.vm.box = "ubuntu/jammy64"
    master.vm.hostname = "master"
    master.vm.network "private_network", ip: "192.168.57.10"
    master.vm.provider "virtualbox" do |vb|
      vb.name = "master"
      vb.memory = 2048  # Asigna 2 GB de memoria RAM
      vb.customize ["storageattach", :id, "--storagectl", "IDE", "--port", "1", "--device", "0", "--type", "dvddrive", "--medium", "/usr/share/virtualbox/VBoxGuestAdditions.iso"]
# agrega el cd de las guest additions. en windows sería algo como "C:\Archivos de programa\Oracle\VirtualBox\VBoxGuestAdditions.iso". #Hay que verificarlo. En caso de problemas se comenta curstomize

    end
    master.vm.provision "shell", path: "master.sh"

  end

  # Configuración de la máquina virtual docker con Docker instalado
  config.vm.define "docker" do |docker|
    docker.vm.box = "ubuntu/jammy64"
    docker.vm.hostname = "docker"
    docker.vm.network "private_network", ip: "192.168.57.20"
    docker.vm.provider "virtualbox" do |vb|
      vb.name = "docker"
      vb.memory = 2048  # Asigna 2 GB de memoria RAM
      vb.customize ["storageattach", :id, "--storagectl", "IDE", "--port", "1", "--device", "0", "--type", "dvddrive", "--medium", "/usr/share/virtualbox/VBoxGuestAdditions.iso"]

    end
    docker.vm.provision "shell", path: "docker.sh"

  end

  # Configuración de dos máquinas virtuales objetivo
  (1..3).each do |i|
    config.vm.define "objetivo#{i}" do |objetivo|
      objetivo.vm.box = "ubuntu/jammy64"
      objetivo.vm.hostname = "objetivo#{i}"
      objetivo.vm.network "private_network", ip: "192.168.57.#{i+20}"
      objetivo.vm.provider "virtualbox" do |vb|
        vb.name = "objetivo#{i}"
        vb.memory = 1024  # Asigna 1 GB de memoria RAM
        vb.customize ["storageattach", :id, "--storagectl", "IDE", "--port", "1", "--device", "0", "--type", "dvddrive", "--medium", "/usr/share/virtualbox/VBoxGuestAdditions.iso"]

      end
      objetivo.vm.provision "shell", path: "objetivo.sh"
    end
  end

end
