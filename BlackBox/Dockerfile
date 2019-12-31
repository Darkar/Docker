FROM archlinux

#Installation de BlackArch
RUN curl -s https://blackarch.org/strap.sh | bash

#Installation du Français
RUN ln -s /usr/share/zoneinfo/Europe/Paris /etc/localtime
RUN sed -i 's/#fr_FR.UTF-8 UTF-8/fr_FR.UTF-8 UTF-8/g' /etc/locale.gen
RUN echo 'KEYMAP=fr-pc' > /etc/vconsole.conf
RUN echo 'LANG=fr_FR.UTF-8' > /etc/locale.conf
RUN locale-gen

#Mise à jours et installation
ADD files/mirrorlist /etc/pacman.d/mirrorlist
RUN pacman -Syyu --noconfirm zsh openssh vim git

#Configuration générale
RUN chsh --shell /bin/zsh
ADD files/zshrc /root/.zshrc

#Active la connexion SSH pour root
RUN sed -i 's/#\(PermitRootLogin \).\+/\1yes/' /etc/ssh/sshd_config

#Création de l'utilisateur "jeremy"
RUN useradd -m -p blackbox -g users -G "adm,audio,floppy,log,network,rfkill,scanner,storage,optical,power,wheel" -s /usr/bin/zsh jeremy
ADD files/zshrc /home/jeremy/.zshrc

ENTRYPOINT [ "/usr/bin/zsh" ]
