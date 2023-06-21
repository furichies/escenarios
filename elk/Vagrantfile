Vagrant.configure("2") do |config|

  # Configuración y aprovisionamiento de la máquina virtual "elk"
  config.vm.define "elk" do |elk|
    elk.vm.box = "ubuntu/jammy64"
    elk.vm.hostname = "elk"
    elk.vm.network "private_network", ip: "192.168.53.110"
    elk.vm.provider "virtualbox" do |vb|
      vb.name = "elk"
      vb.memory = "4096"
      vb.cpus = "3"
    end

    elk.vm.provision "shell", inline: <<-SHELL
      # Instalar Elasticsearch
      wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
      sudo apt-get install apt-transport-https
      echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-7.x.list
      sudo apt-get update
      sudo apt-get install -y elasticsearch

      # Instalar Logstash
      wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
      sudo apt-get install apt-transport-https
      echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-7.x.list
      sudo apt-get update
      sudo apt-get install -y logstash

      # Instalar Kibana
      wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
      sudo apt-get install apt-transport-https
      echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-7.x.list
      sudo apt-get update
      sudo apt-get install -y kibana
    SHELL
  end

  # Configuración de la máquina virtual "client"
  config.vm.define "client" do |client|
    client.vm.box = "ubuntu/jammy64"
    client.vm.hostname = "client"
    client.vm.network "private_network", ip: "192.168.53.111"
    client.vm.provider "virtualbox" do |v|
      v.name = "cliente"
      v.memory = 2048
      v.cpus = 2
    end
  end
end
