# The MIT License (MIT)
#
# Copyright (c) 2022 Jesper Pedersen <jesper.pedersen@redhat.com>
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the "Software"),
# to deal in the Software without restriction, including without limitation
# the rights to use, copy, modify, merge, publish, distribute, sublicense,
# and/or sell copies of the Software, and to permit persons to whom the Software
# is furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
# INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
# PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
# HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
# SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#
# pgsql15-primary-rocky9
FROM rockylinux:9

LABEL maintainer="Jesper Pedersen <jesper.pedersen@redhat.com>"

LABEL summary="PostgreSQL 15 Primary" \
      description="PostgreSQL 15 Primary"

# COPY conf/licenses /licenses

ENV PGVERSION="15"
ENV PGROOT="/usr/pgsql-${PGVERSION}"

RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm \
 && rpm -Uvh https://download.postgresql.org/pub/repos/yum/reporpms/EL-9-x86_64/pgdg-redhat-repo-latest.noarch.rpm \
 && dnf -y update \
 && dnf -y install wget \
 && dnf -y install postgresql15 postgresql15-server postgresql15-contrib postgresql15-libs \
 && dnf -y clean all

COPY root/ /

RUN mkdir -p /conf /pgconf /pgdata /pgwal
COPY conf/* /conf/
RUN chown -R postgres:postgres /conf /pgconf /pgdata /pgwal
RUN chmod 700 /conf /pgconf /pgdata /pgwal

RUN mkdir -p /usr/local/bin
RUN cd /tmp \
 && wget https://github.com/prometheus/node_exporter/releases/download/v1.4.0/node_exporter-1.4.0.linux-amd64.tar.gz \
 && tar xzf node_exporter-1.4.0.linux-amd64.tar.gz \
 && mv node_exporter-1.4.0.linux-amd64/node_exporter /usr/local/bin/node_exporter \
 && rm -Rf node_exporter-1.4.0.linux-amd64 node_exporter-1.4.0.linux-amd64.tar.gz \
 && chown postgres:postgres /usr/local/bin/node_exporter

VOLUME ["/pgconf", "/pgdata", "/pgwal"]

EXPOSE 5432
EXPOSE 9100

USER 26

CMD ["/usr/bin/run-postgresql"]
