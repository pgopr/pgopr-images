#
# Eclipse Public License - v 2.0
#
# THE ACCOMPANYING PROGRAM IS PROVIDED UNDER THE TERMS OF THIS ECLIPSE
# PUBLIC LICENSE ("AGREEMENT"). ANY USE, REPRODUCTION OR DISTRIBUTION
# OF THE PROGRAM CONSTITUTES RECIPIENT'S ACCEPTANCE OF THIS AGREEMENT.
#
FROM rockylinux/rockylinux:10

LABEL maintainer="Jesper Pedersen <jesperpedersen.db@gmail.com>"

LABEL summary="PostgreSQL pgagroal" \
      description="PostgreSQL pgagroal"

# COPY conf/licenses /licenses

RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-10.noarch.rpm \
 && rpm -Uvh https://download.postgresql.org/pub/repos/yum/reporpms/EL-10-x86_64/pgdg-redhat-repo-latest.noarch.rpm \
 && dnf -y update \
 && dnf -y install wget tar \
 && dnf -y install pgagroal \
 && dnf -y clean all

RUN useradd -ms /bin/bash pgagroal

COPY root/ /
RUN chmod +x /usr/bin/run-pgagroal

RUN mkdir -p /pgconf /pgagroal
COPY conf/* /conf/
RUN chown -R pgagroal:pgagroal /conf /pgconf /pgagroal
RUN chmod 700 /conf /pgconf /pgagroal

RUN cd /tmp \
 && wget https://github.com/prometheus/node_exporter/releases/download/v1.10.2/node_exporter-1.10.2.linux-amd64.tar.gz \
 && tar xzf node_exporter-1.10.2.linux-amd64.tar.gz \
 && mv node_exporter-1.10.2.linux-amd64/node_exporter /usr/local/bin/node_exporter \
 && cd / \
 && rm -rf /tmp/node_exporter* \
 && chown pgagroal:pgagroal /usr/local/bin/node_exporter

VOLUME ["/pgconf", "/pgagroal"]

EXPOSE 2345
EXPOSE 2346
EXPOSE 9100

HEALTHCHECK --interval=10s --timeout=5s --start-period=30s --retries=3 \
  CMD pgagroal-cli -c /pgagroal/pgagroal.conf ping || exit 1

USER pgagroal
WORKDIR /home/pgagroal
CMD ["/usr/bin/run-pgagroal"]
