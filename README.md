# Docker

## KaliBrowser 

Permet d'utiliser KaliLinux en mode graphique dans le navigateur Web ([Source](https://hub.docker.com/r/jgamblin/kalibrowser/))

## BlackBox

- ArchLinux
- Configuration des options de build
- BlackArch
- Accès en console / SSH
- Accès en web via VNC

DockerHub: [jmagnan/blackbox](https://hub.docker.com/r/jmagnan/blackbox)

## OctoPrint

Interface Web de gestion d'impression 3D

```
docker run -d -v octoprint_config:/home/octoprint/.octoprint --device /dev/ttyACM0:/dev/ttyACM0 --restart=always --name OctoPrint jmagnan/octoprint
```

DockerHub: [jmagnan/octoprint](https://hub.docker.com/r/jmagnan/octoprint)