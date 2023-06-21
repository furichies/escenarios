#!/bin/bash
# Actualizar la lista de paquetes disponibles
apt-get update

# Instalar paquetes para permitir que APT utilice un repositorio HTTPS
apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release 

# Añadir la clave GPG oficial de Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Añadir el repositorio de Docker a la lista de fuentes de APT
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" |  tee /etc/apt/sources.list.d/docker.list > /dev/null

# Actualizar la lista de paquetes disponibles con los nuevos paquetes de Docker
apt-get update

# Instalar la última versión de Docker
apt-get install -y docker-ce docker-ce-cli containerd.io

# Agregar usuario vagrant a grupo docker correctamente

usermod -aG docker vagrant
#Creación de usuario curso

      useradd -m -s /bin/bash -p $(openssl passwd -1 'qwerty') -G sudo curso
      
      cat << EOF >> /home/vagrant/.ssh/authorized_keys
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDScVdrQPmOKEuyG1JLqHBo06CkkLuz7LvNRhf19iV5dyJycVL37F3mxSKFbGp+laO/GnJQ3vESRmCD/fQi9GauBkgDD3QkboMfzWBYhz4jpnHcxM5QEJreg0tlzv6o4fQWeddjU7FPUdtz12OWnBbdF2xcJVIn2vIcQ7+4j+CTndCx9si8AspGgzGtQyEpuJGtx8Osd1aHe16JyZV/yW42nTp+wNbJLdQscQEjlRpOCfFo9AR7fdYFdZab4mJ2OFZLTY+RYphVFOSvExFIzm4SOosZq+cDI2Bb23rK4jsyo9hyzmfA09T5wkGMKR8r9LEPg6AnLrgwKzdpNTkfX7jJ vagrant@master
EOF
#entradas al fichero host
echo "192.168.57.10 master" >> /etc/hosts
echo "192.168.57.20 docker" >> /etc/hosts
echo "192.168.57.21 objetivo1" >> /etc/hosts
echo "192.168.57.22 objetivo2" >> /etc/hosts
echo "192.168.57.23 objetivo3" >> /etc/hosts

echo "APROVISIONAMIENTO EJECUTADO"
