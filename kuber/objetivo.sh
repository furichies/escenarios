#!/bin/bash

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
