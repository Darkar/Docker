# Docker

## OctoPrint

Interface Web de gestion d'impression 3D

```
docker run -d -v octoprint_config:/home/octoprint/.octoprint --device /dev/ttyUSB0:/dev/ttyACM0 --restart unless-stopped --name OctoPrint jmagnan/octoprint
```

DockerHub: [jmagnan/octoprint](https://hub.docker.com/r/jmagnan/octoprint)