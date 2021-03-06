# battalion-docker
Dockerized Self-Updating Battalion 1944 Community Dedicated Server.

[![Docker Build Status](https://img.shields.io/docker/build/dmcallejo/battalion-docker.svg)](https://hub.docker.com/r/dmcallejo/battalion-docker/builds/) [![Docker Pulls](https://img.shields.io/docker/pulls/dmcallejo/battalion-docker.svg)](https://hub.docker.com/r/dmcallejo/battalion-docker/) [![Docker Automated build](https://img.shields.io/docker/automated/dmcallejo/battalion-docker.svg)](https://hub.docker.com/r/dmcallejo/battalion-docker/builds/) [![Docker Stars](https://img.shields.io/docker/stars/dmcallejo/battalion-docker.svg)](https://hub.docker.com/r/dmcallejo/battalion-docker/)

## Running the image
This will spawn a Battalion 1944 community server with the default options.
```
docker run -d --name battalion --restart=unless-stopped --publish 7777-7780 dmcallejo/battalion-docker
```

You won't have admin rights, so you might look into the next section too.

## Customizing the server
If you want to customize your settings, map the volume ```/config``` to your local filesystem and tune the ```DefaultGame.ini``` to your liking. If the file doesn't exist the image will create a default one.

```
docker run -d --name battalion --restart=unless-stopped --publish 7777-7780 -v /your/local/directory:/config dmcallejo/battalion-docker
```

## Self-updater
Container will check for server updates and act accordingly each time it boots. This function is rather rudimentary at this point so it may fail in the future.
