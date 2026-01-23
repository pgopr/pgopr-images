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
# pgmoneta-rocky10
FROM rockylinux/rockylinux:10

LABEL maintainer="Jesper Pedersen <jesper.pedersen@redhat.com>"

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