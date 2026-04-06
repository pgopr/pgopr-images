# PostgreSQL pgexporter

This project contains the PostgreSQL pgexporter image.

## Getting Started

```bash
# Create the image
make build

# Run, and register the container under pgexporter-container
podman run -p 5002:5002 -p 9100:9100 --name pgexporter-container -d -e PG_PRIMARY_NAME=postgres-primary -e PG_PRIMARY_PORT=5432 -e PG_EXPORTER_NAME=pgexporter -e PG_EXPORTER_PASSWORD=pgexporter pgexporter-rocky10

# Shell to pgexporter-container
podman exec -it pgexporter-container /bin/bash
```

## Configuration

| **Property**           | **Default** | **Unit** | **Required** | **Description** |
|-------------------------|-------------|----------|--------------|-----------------|
| **PG_PRIMARY_NAME**     |             |          | Yes          | The name of the PostgreSQL primary server |
| **PG_PRIMARY_PORT**     | 5432        |          | Yes          | The port of the PostgreSQL primary server |
| **PG_EXPORTER_NAME**    |             |          | Yes          | The pgexporter user name |
| **PG_EXPORTER_PASSWORD** |            |          | Yes          | The password for the pgexporter user |

## PostgreSQL Setup

The pgexporter user requires the `pg_monitor` role and specific grants
on the primary:

```sql
CREATE ROLE pgexporter WITH NOSUPERUSER NOCREATEDB NOCREATEROLE NOREPLICATION LOGIN PASSWORD 'pgexporter';
GRANT pg_monitor TO pgexporter;
GRANT SELECT ON TABLE pg_file_settings, pg_authid TO pgexporter;
GRANT EXECUTE ON FUNCTION pg_show_all_file_settings TO pgexporter;
```

## Volumes

| **Name**     | **Description** |
|--------------|-----------------|
| `/pgconf`    | Volume for SSL configuration |
