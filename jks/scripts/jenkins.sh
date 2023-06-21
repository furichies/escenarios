#!/bin/bash

# Actualizar los repositorios e instalar dependencias
sudo apt update
sudo apt install -y openjdk-11-jdk

# Importar la clave GPG de Jenkins
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -

# Añadir el repositorio de Jenkins al sistema
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

# Actualizar los repositorios nuevamente para incluir el repositorio de Jenkins
sudo apt update

# Instalar Jenkins
sudo apt install -y jenkins

# Iniciar el servicio de Jenkins
sudo systemctl start jenkins

# Habilitar Jenkins para que se inicie automáticamente en el arranque del sistema
sudo systemctl enable jenkins
