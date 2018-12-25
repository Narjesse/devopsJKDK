# use a node base image
FROM centos:7
MAINTAINER SaltStack, Inc.
COPY . .
RUN  chmod +x required-packages-dock.sh
RUN  ./required-packages-dock.sh
COPY . /etc/salt/srv
RUN echo "master: localhost" > /etc/salt/minion
RUN echo "file_roots:" > /etc/salt/master
RUN echo "  base:" >> /etc/salt/master
RUN echo "    - /srv/salt" >> /etc/salt/master
RUN useradd appserv
RUN touch /root/test123
EXPOSE 8000
