FROM ubuntu:16.04

RUN apt-get update && apt-get install -y curl wget perl pwgen --no-install-recommends vim-gnome git cscope curl wget perl pwgen --no-install-recommends software-properties-common python3-software-properties gdebi-core realpath build-essential iputils-ping netcat

RUN \
        echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
        add-apt-repository -y ppa:webupd8team/java && \
        apt-get update && \
        apt-get install -y oracle-java8-installer maven

RUN apt-get update && apt-get install -y inetutils-traceroute
COPY ./sources.list /etc/apt/sources.list
RUN apt-get update && apt-get build-dep -y shotwell

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
WORKDIR /root
COPY ./entrypoint.sh /entrypoint.sh

CMD ["/entrypoint.sh"]
