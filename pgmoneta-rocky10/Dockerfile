#
# Eclipse Public License - v 2.0
#
# THE ACCOMPANYING PROGRAM IS PROVIDED UNDER THE TERMS OF THIS ECLIPSE
# PUBLIC LICENSE ("AGREEMENT"). ANY USE, REPRODUCTION OR DISTRIBUTION
# OF THE PROGRAM CONSTITUTES RECIPIENT'S ACCEPTANCE OF THIS AGREEMENT.
#
FROM rockylinux/rockylinux:10

LABEL maintainer="Jesper Pedersen <jesperpedersen.db@gmail.com>"

LABEL summary="PostgreSQL pgmoneta" \
      description="PostgreSQL pgmoneta"
      
# COPY conf/licenses /licenses

RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-10.noarch.rpm \
 && rpm -Uvh https://download.postgresql.org/pub/repos/yum/reporpms/EL-10-x86_64/pgdg-redhat-repo-latest.noarch.rpm \
 && dnf -y update \
 && dnf -y install wget tar crontabs \
 && dnf -y install pgmoneta \
 && dnf -y clean all

RUN useradd -ms /bin/bash pgmoneta

COPY root/ /
RUN chmod +x /usr/bin/run-pgmoneta  

RUN mkdir -p /pgconf /pgmoneta \
COPY conf/* /conf/  
RUN chown -R pgmoneta:pgmoneta /conf /pgconf /pgmoneta  
RUN chmod 700 /conf /pgconf /pgmoneta  

RUN cd /tmp \
 && wget https://github.com/prometheus/node_exporter/releases/download/v1.10.2/node_exporter-1.10.2.linux-amd64.tar.gz \
 && tar xzf node_exporter-1.10.2.linux-amd64.tar.gz \
 && mv node_exporter-1.10.2.linux-amd64/node_exporter /usr/local/bin/node_exporter \
 && cd / \
 && rm -rf /tmp/node_exporter* \
 && chown pgmoneta:pgmoneta /usr/local/bin/node_exporter

VOLUME ["/pgconf","/pgmoneta"]
EXPOSE 5001
EXPOSE 9100
USER pgmoneta
WORKDIR /home/pgmoneta
CMD ["/usr/bin/run-pgmoneta"]