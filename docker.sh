#!/bin/bash

#Colores
greenColor="\e[0;32m\033[1m"
redColor="\e[0;31m\033[1m"
yellowColor="\e[0;33m\033[1m"
blueColor="\e[0;34m\033[1m"
purpleColor="\e[0;35m\033[1m"
endColor="\033[0m\e[0m"

trap ctrl_c INT
function ctrl_c(){
        echo -e "\n${redColor}Programa Terminado ${endColor}"
        exit 0
}

LLAVE="https://download.docker.com/linux/ubuntu/gpg"
USUARIO="USUARIO"
URL="https://download.docker.com/linux/ubuntu"

echo -e "${yellowColor}Elimina otras versiones de Docker ${endColor}"
sudo apt remove docker docker.io containerd runc; sudo apt autoremove -y

echo -e "\n${yellowColor}Instalación de dependencias ${endColor}"
sudo apt update; sudo apt -y install apt-transport-https ca-certificates curl gnupg-agent  software-properties-common

echo -e "\n${yellowColor}Agrega la llave ${endColor}"
curl -fsSL "$LLAVE" | sudo apt-key add -

echo -e "\n${yellowColor}Agrega el repositorio ${endColor}"
sudo add-apt-repository \
   "deb [arch=amd64] $URL \
   $(lsb_release -cs) \
   stable"

echo -e "\n${yellowColor}Instala docker-ce ${endColor}"
sudo apt update; sudo apt install -y docker-ce=18.06.1~ce~3-0~ubuntu

echo -e "\n${yellowColor}Agrega el usuario al grupo docker ${endColor}"
sudo usermod -aG docker "$USUARIO" && sudo newgrp docker

echo -e "${greenColor}Todos los procesos terminaron correctamente !!! ${endColor}"
