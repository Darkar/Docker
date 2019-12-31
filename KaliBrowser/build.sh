#!/bin/bash

docker rmi kalibrowser -f

docker build . -t kalibrowser