#
# Eclipse Public License - v 2.0
#
# THE ACCOMPANYING PROGRAM IS PROVIDED UNDER THE TERMS OF THIS ECLIPSE
# PUBLIC LICENSE ("AGREEMENT"). ANY USE, REPRODUCTION OR DISTRIBUTION
# OF THE PROGRAM CONSTITUTES RECIPIENT'S ACCEPTANCE OF THIS AGREEMENT.
#
FROM rockylinux/rockylinux:10

LABEL maintainer="Jesper Pedersen <jesperpedersen.db@gmail.com>"

LABEL summary="Grafana and Prometheus" \
      description="Grafana and Prometheus"

# COPY conf/licenses /licenses

COPY conf/grafana.repo /etc/yum.repos.d/grafana.repo

RUN dnf -y update \
 && dnf -y install wget tar curl \
 && dnf -y install grafana \
 && dnf -y clean all

RUN useradd -ms /bin/bash grafana

COPY root/ /
RUN chmod +x /usr/bin/run-grafana

RUN mkdir -p /etc/prometheus /var/lib/prometheus

COPY conf/prometheus.yml /etc/prometheus/prometheus.yml

RUN cd /tmp \
 && wget https://github.com/prometheus/node_exporter/releases/download/v1.10.2/node_exporter-1.10.2.linux-amd64.tar.gz \
 && tar xzf node_exporter-1.10.2.linux-amd64.tar.gz \
 && mv node_exporter-1.10.2.linux-amd64/node_exporter /usr/local/bin/node_exporter \
 && rm -rf /tmp/node_exporter* \
 && wget https://github.com/prometheus/prometheus/releases/download/v2.51.1/prometheus-2.51.1.linux-amd64.tar.gz \
 && tar xzf prometheus-2.51.1.linux-amd64.tar.gz \
 && mv prometheus-2.51.1.linux-amd64/prometheus /usr/local/bin/ \
 && mv prometheus-2.51.1.linux-amd64/promtool /usr/local/bin/ \
 && mv prometheus-2.51.1.linux-amd64/consoles /etc/prometheus/ \
 && mv prometheus-2.51.1.linux-amd64/console_libraries /etc/prometheus/ \
 && rm -rf /tmp/prometheus* \
 && chown -R grafana:grafana /usr/local/bin/node_exporter /etc/prometheus /var/lib/prometheus /usr/local/bin/prometheus /usr/local/bin/promtool

EXPOSE 3000
EXPOSE 9090
EXPOSE 9100

HEALTHCHECK --interval=10s --timeout=5s --start-period=30s --retries=3 \
  CMD curl -f http://localhost:3000/api/health || exit 1

USER grafana
WORKDIR /usr/share/grafana

CMD ["/usr/bin/run-grafana"]
