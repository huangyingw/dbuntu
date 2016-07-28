FROM ubuntu:14.04

RUN apt-get update && apt-get install -y curl wget perl pwgen --no-install-recommends vim-gnome git cscope curl wget perl pwgen --no-install-recommends software-properties-common python3-software-properties gdebi-core

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
WORKDIR /root
COPY ./entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
