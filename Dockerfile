FROM ubuntu:16.04

RUN apt-get update && apt-get install --no-install-recommends -y \
        build-essential \
        cscope \
        curl \
        gdebi-core \
        git \
        inetutils-traceroute \
        iputils-ping \
        netcat \
        perl \
        pwgen  \
        pwgen \
        python3-software-properties \
        realpath \
        rsync \
        software-properties-common \
        ssh \
        vim-gnome \
        wget

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
WORKDIR /root
COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/sh", "-c", "/entrypoint.sh 2>&1 | tee /var/logs/containner.log"]
