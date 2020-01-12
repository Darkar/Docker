FROM alpine:latest

# Installation et mises à jour
RUN apk update
RUN apk add git python2 python2-dev py2-pip gcc musl-dev linux-headers 

# Installation d'Octoprint
WORKDIR /opt
RUN git clone https://github.com/foosel/OctoPrint.git
WORKDIR /opt/OctoPrint
RUN pip install .

# Installation des plugins
WORKDIR /opt/OctoPrint/plugins
RUN pip install "https://github.com/StefanCohen/OctoPrint-Dashboard/archive/master.zip"
RUN pip install "https://github.com/OctoPrint/OctoPrint-FirmwareUpdater/archive/master.zip"
RUN pip install "https://github.com/malnvenshorn/OctoPrint-FilamentManager/archive/master.zip"
RUN pip install "https://github.com/malnvenshorn/OctoPrint-CostEstimation/archive/master.zip"
RUN pip install "https://github.com/kantlivelong/OctoPrint-GCodeSystemCommands/archive/master.zip"
RUN pip install "https://github.com/MoonshineSG/OctoPrint-Filament/archive/master.zip"
RUN pip install "https://github.com/OllisGit/OctoPrint-DisplayLayerProgress/releases/latest/download/master.zip"


#Création de l'utilisateur
RUN adduser octoprint -D

# Démarrage d'octoprint
USER octoprint
WORKDIR /opt/OctoPrint
ENTRYPOINT ["octoprint", "serve"] 

