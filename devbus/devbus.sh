#!/bin/bash

# Actualizar los repositorios y paquetes existentes
sudo apt-get update -y

# Instalar las dependencias necesarias para Docker
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

# Agregar la clave GPG oficial de Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Agregar el repositorio estable de Docker
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu jammy stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Actualizar los repositorios nuevamente para incluir Docker
sudo apt-get update -y

# Instalar Docker
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# Agregar el usuario actual al grupo "docker" para ejecutar comandos de Docker sin sudo
sudo usermod -aG docker $USER

# Instalar Python 3 y pip
sudo apt-get install -y python3 python3-pip

# Instalar los módulos de Flask
sudo pip3 install flask flask_restful flask_sqlalchemy

# Clonar el repositorio de GitHub
git clone https://github.com/richifor/ventabus.git
