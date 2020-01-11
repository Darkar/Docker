FROM alpine:latest

# Installation et mises à jour
RUN apk update
RUN apk add git python2 python2-dev py2-pip gcc musl-dev linux-headers 

# Installation d'Octoprint
WORKDIR /opt
RUN git clone https://github.com/foosel/OctoPrint.git
WORKDIR /opt/OctoPrint
RUN pip install .

#Création de l'utilisateur
RUN adduser octoprint -D

# Démarrage d'octoprint
USER octoprint
ENTRYPOINT ["./run"] 

