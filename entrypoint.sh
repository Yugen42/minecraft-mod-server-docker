#!/bin/bash

RUN apt-get update
RUN apt-get -y full-upgrade

if [[ -z "${MODPACK_ID}" ]]; then
  MODPACK_ID="80"
fi

if [[ -z "${MODPACK_VERSION}" ]]; then
  MODPACK_VERSION=$(curl https://api.modpacks.ch/public/modpack/80 | jq '.versions | max_by(.id) | .id')
fi

curl https://api.modpacks.ch/public/modpack/${MODPACK_ID}/${MODPACK_VERSION}/server/linux > /opt/installer
chmod +x /opt/installer

mkdir /opt/server
echo "eula=true" > /opt/server/eula.txt

/opt/installer ${MODPACK_ID} --auto --path /opt/server
cd /opt/server
/opt/server/start.sh
