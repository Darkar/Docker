#!/bin/bash

docker rmi octoprint -f

docker build . -t jmagnan/octoprint