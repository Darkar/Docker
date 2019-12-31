#!/bin/bash

export DISPLAY=:1
Xvfb :1 -screen 0 1600x900x16 &
sleep 5 & 
xfce4-session&
x11vnc -display :1 -nopw -listen localhost -xkb -ncache 10 -ncache_cr -forever &
cd /opt/noVNC && ln -s vnc.html index.html && ./utils/launch.sh --vnc localhost:5900 &