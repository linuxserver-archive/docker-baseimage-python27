FROM linuxserver/baseimage
MAINTAINER sparklyballs <sparklyballs@linuxserver.io>
ENV BASE_APTLIST="git-core libffi-dev libiffi6 libpython-dev libssl-dev python2.7 python-cherrypy python2.7-dev python-lxml python-pip unrar unzip wget"
#ENV PYTHONIOENCODING="UTF-8" 

# install main packages
RUN apt-get update -q && \
add-apt-repository ppa:fkrull/deadsnakes-python2.7 && \
apt-get install $BASE_APTLIST -qy && \


#install pip packages
pip install -U pip && \
pip install -U virtualenv && \
pip install -U pyopenssl && \
pip install -U ndg-httpsclient && \

# cleanup 
apt-get clean -y && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

