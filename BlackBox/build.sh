#!/bin/bash

if [ -f config.conf ]; then
    source config.conf
else 
    exit 0;
fi 

#Début de l'installation

echo "FROM archlinux" > Dockerfile

if [ $BLACKARCH == true ]; then
    echo -e "\n#Installation de BlackArch" >> Dockerfile
    echo "RUN curl -s https://blackarch.org/strap.sh | bash" >> Dockerfile
fi

if [ $LANG_FR == true ]; then
    echo -e "\n#Installation du Français" >> Dockerfile
    echo "RUN ln -s /usr/share/zoneinfo/Europe/Paris /etc/localtime" >> Dockerfile
    echo "RUN sed -i 's/#fr_FR.UTF-8 UTF-8/fr_FR.UTF-8 UTF-8/g' /etc/locale.gen" >> Dockerfile
    echo "RUN echo 'KEYMAP=fr-pc' > /etc/vconsole.conf" >> Dockerfile
    echo "RUN echo 'LANG=fr_FR.UTF-8' > /etc/locale.conf" >> Dockerfile
    echo "RUN locale-gen" >> Dockerfile
fi

echo -e "\n#Mise à jours et installation" >> Dockerfile
echo "ADD files/mirrorlist /etc/pacman.d/mirrorlist" >> Dockerfile
echo "RUN pacman -Syyu --noconfirm zsh openssh vim git" >> Dockerfile

echo -e "\n#Configuration générale" >> Dockerfile
echo "RUN chsh --shell /bin/zsh" >> Dockerfile
echo "ADD files/zshrc /root/.zshrc" >> Dockerfile

if [ $ROOT_LOGIN == true ]; then 
    echo -e "\n#Active la connexion SSH pour root" >> Dockerfile
    echo "RUN sed -i 's/#\(PermitRootLogin \).\+/\1yes/' /etc/ssh/sshd_config" >> Dockerfile
fi

if [ $WEB_MODE == true ]; then 
    echo -e "\n#Active l'accès en mode web via VNCsur le port 6080" >> Dockerfile
    echo "RUN pacman -Syyu --noconfirm $DE x11vnc xorg-server xorg-server-xvfb python python-numpy" >> Dockerfile
    echo "WORKDIR /opt" >> Dockerfile
    echo "RUN git clone https://github.com/kanaka/noVNC.git" >> Dockerfile
    echo "RUN export DISPLAY=:1" >> Dockerfile
    echo "RUN Xvfb :1 -screen 0 1600x900x16 &" >> Dockerfile
    echo "RUN xfce4-session&" >> Dockerfile
    echo "RUN x11vnc -display :1 -nopw -listen localhost -xkb -ncache 10 -ncache_cr -forever &" >> Dockerfile
    echo 'CMD [ "/opt/noVNC/utils/launch.sh", "--web", "/opt/noVNC/", "--vnc", "localhost:5900", ";" ]' >> Dockerfile
    echo "WORKDIR /" >> Dockerfile
fi

if [ $ADD_USER == true ]; then
    echo -e "\n#Création de l'utilisateur \"$USERNAME\"" >> Dockerfile
    echo "RUN useradd -m -p $PASSWORD -g users -G \"adm,audio,floppy,log,network,rfkill,scanner,storage,optical,power,wheel\" -s /usr/bin/zsh $USERNAME" >> Dockerfile
    echo "ADD files/zshrc /home/$USERNAME/.zshrc" >> Dockerfile
fi

echo -e '\nENTRYPOINT [ "/usr/bin/zsh" ]' >> Dockerfile

docker build . -t $NAME_IMG







