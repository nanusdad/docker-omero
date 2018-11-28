FROM busybox
MAINTAINER hadrien.mary@gmail.com

# Add sysadmin user
RUN groupadd -g 1000 sysadmin
RUN useradd -g 1000 -u 1000 -d /data -s /bin/sh sysadmin

RUN mkdir /data
RUN chown sysadmin.sysadmin /data
RUN chmod 777 /data
RUN touch /data/init_volume

WORKDIR /data
VOLUME /data
