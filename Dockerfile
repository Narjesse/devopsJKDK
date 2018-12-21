# use a node base image
FROM centos:7
MAINTAINER SaltStack, Inc.
COPY . .
RUN  chmod +x required-packages-dock.sh
RUN  ./required-packages-dock.sh
COPY . /etc/salt/srv
EXPOSE 8000
