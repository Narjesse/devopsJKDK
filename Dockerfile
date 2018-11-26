# use a node base image
FROM centos:7
MAINTAINER SaltStack, Inc.


RUN yum clean all && \
       yum install -y yum install epel-release && \
       yum install -y https://repo.saltstack.com/yum/redhat/salt-repo-latest-2.el7.noarch.rpm && \
       yum update -y && \
       yum install -y sudo git tmux vim salt-master salt-minion && \
       yum install -y wget && \
       rm -rf /var/cache/yum && \
       yum clean all
RUN wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo && \
    sed -i s/\$releasever/6/g /etc/yum.repos.d/epel-apache-maven.repo && \
    yum install -y apache-maven


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
