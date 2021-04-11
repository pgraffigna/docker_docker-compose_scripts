#!/bin/bash

#Colores
greenColor="\e[0;32m\033[1m"
redColor="\e[0;31m\033[1m"
yellowColor="\e[0;33m\033[1m"
endColor="\033[0m\e[0m"

VERSION="1.21.2"

trap ctrl_c INT
function ctrl_c(){
        echo -e "\n${redColor}Programa Terminado ${endColor}"
        exit 0
}

echo -e "${yellowColor}Descarga docker-compose ${endColor}"
sudo curl -sL "https://github.com/docker/compose/releases/download/$VERSION/docker-compose-`uname -s`-`uname -m`" -o /usr/local/bin/docker-compose

echo -e "${yellowColor}Configura los permisos de ejecución ${endColor}"
sudo chmod +x /usr/local/bin/docker-compose

echo -e "${greenColor}Todos los procesos terminaron correctamente!!! ${endColor}"
