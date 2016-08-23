FROM mcapitanio/centos-java

MAINTAINER Matteo Capitanio <matteo.capitanio@gmail.com>

USER root

ENV HUE_VER 3.11.0
ENV HUE_HOME /opt/hue

ENV PATH $HUE_HOME/build/env/bin:$PATH

# Install needed packages
RUN yum clean all; yum update -y; yum clean all
RUN yum install -y gcc make python-devel maven python-pip gcc-c++ cyrus-sasl* sqlite-devel libxml2-devel krb5-devel libffi-devel asciidoc ant mysql mysql-devel openldap-devel sqlite-devel openssl-devel gmp-devel libxslt-devel rsynch snappy-devel libtidy-devel

WORKDIR /opt/docker

# Cloudera Hue
RUN wget https://github.com/cloudera/hue/archive/release-$HUE_VER.tar.gz
RUN tar -xvf release-$HUE_VER.tar.gz
RUN mv hue-release-$HUE_VER $HUE_HOME
RUN cd $HUE_HOME; \
    make apps

VOLUME [ "/opt/hue/conf", "/opt/hue/logs" ]

RUN useradd hue

RUN rm $HUE_HOME/desktop/conf/*.tmpl; \
    rm $HUE_HOME/desktop/conf/*.ini; \
    rm -rf $HUE_HOME/desktop/conf.dist

RUN ls $HUE_HOME/desktop/conf
COPY hue/desktop/conf/hue.ini $HUE_HOME/desktop/conf
RUN ls $HUE_HOME/desktop/conf
COPY docker-entrypoint.sh $HUE_HOME/build/env/bin
RUN chmod +x $HUE_HOME/build/env/bin/docker-entrypoint.sh


ENTRYPOINT ["docker-entrypoint.sh"]
