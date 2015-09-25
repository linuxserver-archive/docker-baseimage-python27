FROM linuxserver/baseimage
MAINTAINER sparklyballs <sparklyballs@linuxserver.io>

ENV BASE_APTLIST="git-core libffi-dev libssl-dev python python-cherrypy python-dev python-lxml python-pip unrar unzip wget"

# install main packages
RUN apt-get update -q && \
apt-get install $BASE_APTLIST -qy && \

#install pip packages
pip install -U pip && \
pip install -U virtualenv && \
pip install -U pyopenssl && \
pip install -U ndg-httpsclient && \

# cleanup 
apt-get clean -y && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

