from ubuntu:artful

MAINTAINER alljoynsville

RUN DEBIAN_FRONTEND=noninteractive apt-get -yqq update \
 && DEBIAN_FRONTEND=noninteractive apt-get -yqq install openssh-server
 && mkdir /var/run/sshd \
 && useradd -m sshuser -s /bin/bash -u 1001 \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["/usr/sbin/sshd", "-D"]
