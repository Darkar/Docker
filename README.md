# Docker

## KaliBrowser 

Permet d'utiliser KaliLinux en mode graphique dans le navigateur Web ([Source](https://hub.docker.com/r/jgamblin/kalibrowser/))

## BlackBox

ArchLinux Custom :
- Configuration des options de build
- BlackArch
- Accès en console / SSH
- Accès en web via VNC

## OctoPrint

Interface Web de gestion d'impression 3D

```
docker run -d -v octoprint_config:/home/octoprint/.octoprint --restart=always --name OctoPrint octoprint
```