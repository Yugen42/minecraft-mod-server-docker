# minecraft-mod-server-docker
Docker image for setting up and running up-to-date modded minecraft servers. Tested only with and defaults to the latest version of Feed the Beast Endeavour, but may (should?) work at least with other FTB modpacks. Let me know if you are successful. 

Fetches the latest version of a given modpack installer from modpacks.ch and installs it.

## Usage
```
docker build -t minecraft-mod-server-docker .
docker run -p 25565:25565 minecraft-mod-server-docker:latest
```
OR get it from Dockerhub:
```
docker pull yugen42/minecraft-mod-server-docker:latest
```

## Options
`MODPACK_ID`: The ID of the modpack to be installed. Defaults to 80 which is Feed the Beast Endeavour. You can get the modpack ID from the download URL on modpacks.ch: https://api.modpacks.ch/public/modpack/*80*/2053/server/linux

`MODPACK_VERSION`: The specific version you want to deploy. Defaults to automatically detecting the latest version. You can also find the version from the downlad URL on modpacks.ch: https://api.modpacks.ch/public/modpack/80/*2053*/server/linux

You may also want to map a directory to /opt/server (or one of its subdirectories, such as _world_) if you wish (partial) persistence and easy access to configuration files, for example using bind:
https://docs.docker.com/storage/bind-mounts/

Restarting the container will by default also update the server.
