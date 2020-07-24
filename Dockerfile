FROM ubuntu:18.04

RUN apt-get update
RUN apt-get -y upgrade

# Tools and Python 3
####################
RUN apt-get -y install git curl
RUN apt-get -y install python3 python3-dev python3-pip
RUN echo 'alias python="/usr/bin/python3"' >> /root/.bashrc && \
    echo 'alias pip="/usr/bin/pip3"' >> /root/.bashrc

# Ansible
#########
RUN apt-get -y install software-properties-common
RUN apt-add-repository --yes --update ppa:ansible/ansible
RUN apt-get -y install ansible

# Install the application
RUN mkdir -p /usr/local/ignw
WORKDIR /usr/local/ignw
ADD * ./