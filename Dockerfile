FROM alpine:latest
MAINTAINER David A Howard <dhoward@thing-hub.io>
ADD src /
RUN echo http://dl-cdn.alpinelinux.org/alpine/latest-stable/main > /etc/apk/repositories;\
    echo http://dl-cdn.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories;\
    apk add --update iptables ip6tables sudo strongswan;\
    rm -rf /var/cache/apk/*
CMD ["/start.sh"]
