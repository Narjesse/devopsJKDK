# use a node base image
FROM narjess6/built-from-jenkins:latest
COPY . .
RUN  chmod +x required-packages-dock.sh
RUN  ./required-packages-dock.sh
