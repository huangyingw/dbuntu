FROM ubuntu

RUN apt-get update && apt-get install -y vim-gnome git cscope
# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
