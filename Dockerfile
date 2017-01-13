FROM ubuntu:14.04

RUN apt-get update && apt-get install -y curl wget perl pwgen --no-install-recommends vim-gnome git cscope curl wget perl pwgen --no-install-recommends software-properties-common python3-software-properties gdebi-core realpath

RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer maven

RUN { \
echo mysql-community-server mysql-community-server/data-dir select ''; \
echo mysql-community-server mysql-community-server/root-pass password ''; \
echo mysql-community-server mysql-community-server/re-root-pass password ''; \
echo mysql-community-server mysql-community-server/remove-test-db select false; \
} | debconf-set-selections \
&& apt-get update && apt-get install -y mysql-server

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
WORKDIR /root
COPY ./entrypoint.sh /entrypoint.sh

CMD ["/entrypoint.sh"]
