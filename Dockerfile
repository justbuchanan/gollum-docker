# Docker image for gollum wiki
# Based loosely on https://github.com/suttang/docker-gollum/blob/master/Dockerfile
FROM justbuchanan/docker-archlinux
MAINTAINER Justin Buchanan <justbuchanan@gmail.com>

RUN pacman -S --noconfirm ruby

RUN gem install gollum
RUN gem install gollum-rugged_adapter

# mount an external repo to this directory
RUN mkdir /root/wikidata

EXPOSE 4567

ENTRYPOINT ["/usr/local/bin/gollum", "/root/wikidata"]
