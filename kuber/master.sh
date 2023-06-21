#!/bin/bash
      apt-get update
      apt-get install -y ansible
      useradd -m -s /bin/bash -p $(openssl passwd -1 'qwerty') -G sudo curso
      cat << EOF > /home/vagrant/.ssh/id_rsa.pub
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDScVdrQPmOKEuyG1JLqHBo06CkkLuz7LvNRhf19iV5dyJycVL37F3mxSKFbGp+laO/GnJQ3vESRmCD/fQi9GauBkgDD3QkboMfzWBYhz4jpnHcxM5QEJreg0tlzv6o4fQWeddjU7FPUdtz12OWnBbdF2xcJVIn2vIcQ7+4j+CTndCx9si8AspGgzGtQyEpuJGtx8Osd1aHe16JyZV/yW42nTp+wNbJLdQscQEjlRpOCfFo9AR7fdYFdZab4mJ2OFZLTY+RYphVFOSvExFIzm4SOosZq+cDI2Bb23rK4jsyo9hyzmfA09T5wkGMKR8r9LEPg6AnLrgwKzdpNTkfX7jJ vagrant@master
EOF
cat << EOF > .ssh/id_rsa
-----BEGIN OPENSSH PRIVATE KEY-----
b3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAABFwAAAAdzc2gtcn
NhAAAAAwEAAQAAAQEA0nFXa0D5jihLshtSS6hwaNOgpJC7s+y7zUYX9fYleXcicnFS9+xd
5sUihWxqfpWjvxpyUN7xEkZgg/30IvRmrgZIAw90JG6DH81gWIc+I6Zx3MTOUBCa3oNLZc
7+qOH0FnnXY1OxT1Hbc9djlpwW3RdsXCVSJ9ryHEO/uI/gk53QsfbIvALKRoMxrUMhKbiR
rcfDrHdWh3teicmVf8luNp06fsDWyS3ULHEBI5UaTgnxaPQEe33WBXWWm+JidjhWS02PkW
KYVRTkrxMRSM5uEjqLGavnAyNgW9t6yuI7MqPYcs5nwNPU+cJBjCkfK/SxD4OgJy64MCs3
aTU5H1+4yQAAA8iwe98XsHvfFwAAAAdzc2gtcnNhAAABAQDScVdrQPmOKEuyG1JLqHBo06
CkkLuz7LvNRhf19iV5dyJycVL37F3mxSKFbGp+laO/GnJQ3vESRmCD/fQi9GauBkgDD3Qk
boMfzWBYhz4jpnHcxM5QEJreg0tlzv6o4fQWeddjU7FPUdtz12OWnBbdF2xcJVIn2vIcQ7
+4j+CTndCx9si8AspGgzGtQyEpuJGtx8Osd1aHe16JyZV/yW42nTp+wNbJLdQscQEjlRpO
CfFo9AR7fdYFdZab4mJ2OFZLTY+RYphVFOSvExFIzm4SOosZq+cDI2Bb23rK4jsyo9hyzm
fA09T5wkGMKR8r9LEPg6AnLrgwKzdpNTkfX7jJAAAAAwEAAQAAAQBliWRZjpcaXRzwybfy
Y0ohegKnhGHclVuj1q8W8PXx3maTe1RB5R0FjJZ0c/QKMZ85RMRlerwsSiKlbPHPr8afLs
6uE1XBgkToIkrbTB3SS6vijl7RSMHAnO7TJ4W97I++DHm9JhOGJwPQp9sYPyXU9UlGSIeU
TVLGCnZF0b3U2s9Pl6QoddAhQo5fzfZteiYTZMokurgMISgRXN7GbKO7vl5tgFxF+qDl8z
Yv3YrQRa6E6U5FAPkYmjXw0T+rgAQmKR4X9OwM4HrBeDF4Xpj8pjvJCHto6ZBA6bzkApyZ
I5C2AUkMbnPv/NFCBR4xSp96UKGZk0z69DqBy8p0LR7VAAAAgCPAJM1Oj+POB3UWdOKsIR
wQSrM+N6VavU+7UasnF7pHeMovcWj/7MlcT9zxeKKyEIrpx6hXajJ6wUvv/mdfv056PqWk
x5MT7CXN3ZUsV5q4dc8WNUYO96wgGqyiYh9PFw7qsjepP//18YDdmVOKkOtRYF9UStp74/
cuo9LQub0UAAAAgQDvog6Mjl3ynCHCRobR/UiA35BuIuvzeZ+OACOqLPf7Dft2VvxbF3cx
JzYm0prskFCeM7V06BNm7vZeJz//hb8NZHVbK7QosSt/KCNLlMDSOqjNeedapdW1yTu48K
HHTJxDc73jIZbI1nE9bo0TIo+/TDQawjVWMghZ/gnHkmu9ywAAAIEA4NDls/0NehvhHks3
BlsKhcdRzabYN/w5Yp+tcoGXw++1enOSLVsMOj0hj2V4WwwUenGmMd8eUMvoNjBDVjsYmT
QRrOEq9XeGmO2kNK1beNuVRFqJpatEWLpC9rqTm9ZrX4S2IIbbkekqa8bVtli2ESjGhe9o
ELMqpkDJC0zBkTsAAAAOdmFncmFudEBtYXN0ZXIBAgMEBQ==
-----END OPENSSH PRIVATE KEY-----
EOF
chown vagrant /home/vagrant/.ssh/id_rsa
chown vagrant /home/vagrant/.ssh/id_rsa.pub
chmod 400 /home/vagrant/.ssh/id_rsa

#entradas al fichero host
echo "192.168.57.10 master" >> /etc/hosts
echo "192.168.57.20 docker" >> /etc/hosts
echo "192.168.57.21 objetivo1" >> /etc/hosts
echo "192.168.57.22 objetivo2" >> /etc/hosts
echo "192.168.57.23 objetivo3" >> /etc/hosts

echo "APROVISIONAMIENTO EJECUTADO"
