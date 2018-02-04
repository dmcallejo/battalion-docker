# battalion-docker
Dockerized Self-updating Battalion 1944 community dedicated server.
[![Docker Build Status](https://img.shields.io/docker/build/dmcallejo/battalion-docker.svg)]()[![Docker Pulls](https://img.shields.io/docker/pulls/dmcallejo/battalion-docker.svg)]() [![Docker Automated build](https://img.shields.io/docker/automated/dmcallejo/battalion-docker.svg)]() [![Docker Stars](https://img.shields.io/docker/stars/dmcallejo/batallion-docker.svg)]()

## Running the image
This will spawn a Battalion 1944 community server with the default options.
```docker run -d --name battalion --restart=unless-stopped --publish 7777-7780 dmcallejo/battalion-docker```

You won't have admin rights, so you might look into the next section too.

## Customizing the server
If you want to customize your settings, map the volume ```/config``` to your local filesystem and tune the ```DefaultGame.ini``` to your liking. If the file doesn't exist the image will create a default one.

```docker run -d --name battalion --restart=unless-stopped --publish 7777-7780 -v /your/local/directory:/config dmcallejo/battalion-docker```

## Self-updater
Container will check for server updates and act accordingly each time it boots. This function is rather rudimentary at this point so it may fail in the future.