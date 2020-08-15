#!/bin/bash

VERSION=1.21.2

echo "++ Descarga docker-compose ++"
sudo curl -sL "https://github.com/docker/compose/releases/download/$VERSION/docker-compose-`uname -s`-`uname -m`" -o /usr/local/bin/docker-compose

echo "++ Configura los permisos de ejecución ++"
sudo chmod +x /usr/local/bin/docker-compose