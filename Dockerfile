FROM linuxserver/baseimage
MAINTAINER sparklyballs <sparklyballs@linuxserver.io>
ENV BASE_APTLIST="libxslt1-dev git-core libffi-dev libffi6 libpython-dev libssl-dev python2.7 python-cherrypy python2.7-dev python-lxml python-pip unrar unzip wget"

#ENV PYTHONIOENCODING="UTF-8" 
ADD 21_pip_update.sh /etc/my_init.d/21_pip_update.sh

# install main packages
RUN add-apt-repository ppa:fkrull/deadsnakes-python2.7 && \

apt-get update -q && \
apt-get install $BASE_APTLIST -qy && \


#install pip packages
pip install pip-review && \
#Update any packages now
pip-review --local --auto && \
# cleanup 
apt-get clean -y && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

