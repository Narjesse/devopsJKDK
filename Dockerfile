# use a node base image
FROM centos:7
MAINTAINER SaltStack, Inc.
COPY . .
RUN  ls -l
RUN  cat required-packages-dock.sh
RUN echo "master: localhost" > /etc/salt/minion
COPY . /etc/salt/srv
#RUN echo "file_roots:" >> /etc/salt/master
#RUN echo "  base:" >> /etc/salt/master
#RUN echo "    - /srv/salt" >> /etc/salt/master
RUN salt-master -d
RUN salt-minion -d
RUN salt-key -A
RUN salt -t60 '*' ping.test
RUN salt -t60 '*' state.apply webserver

# set a health check
HEALTHCHECK --interval=5s \
            --timeout=5s \
            CMD curl -f http://127.0.0.1:8000 || exit 1

# tell docker what port to expose
EXPOSE 8000
#CMD yum install java
#CMD java --version
