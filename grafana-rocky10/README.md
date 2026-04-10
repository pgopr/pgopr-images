# Grafana and Prometheus

This project contains the Grafana and Prometheus image.

## Getting Started

```bash
# Create the image
make build

# Run, and register the container under grafana-container
podman run -p 3000:3000 -p 9090:9090 -p 9100:9100 --name grafana-container -d grafana-rocky10

# Shell to grafana-container
podman exec -it grafana-container /bin/bash
```

## Configuration

Grafana is accessible at `http://localhost:3000` with the default credentials:

| **Property**      | **Default** |
|--------------------|-------------|
| **Username**       | admin       |
| **Password**       | admin       |

Prometheus is accessible at `http://localhost:9090` without authentication by default.

Custom configuration can be mounted by overriding:
- `/etc/grafana/grafana.ini` for Grafana
- `/etc/prometheus/prometheus.yml` for Prometheus

## License

All images are released under the [Eclipse Public License - v2.0](https://www.eclipse.org/legal/epl-2.0/)
