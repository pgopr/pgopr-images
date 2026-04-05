# PostgreSQL Replica

This project contains the PostgreSQL Replica image.

## Getting Started

```bash
# Create the image
make build

# Run, and register the container under postgresql-replica
podman run -p 5433:5432 -p 9101:9100 --name postgresql-replica -d -e PG_PRIMARY=10.0.0.1 -e PG_REPLICATION_NAME=repl -e PG_REPLICATION_PASSWORD=replpass -e PG_SLOT_NAME=replica1 pgsql18-replica-rocky10

# psql to postgresql-replica
psql -h localhost -p 5433 -U myuser mydb

# Shell to postgresql-replica
podman exec -it postgresql-replica /usr/bin/bash
```

## Configuration

| Property | Default | Unit | Required | Description |
|----------|---------|------|----------|-------------|
| PG_PRIMARY | | | Yes | The IP or hostname of the primary database |
| PG_REPLICATION_NAME | | | Yes | The replication user name |
| PG_REPLICATION_PASSWORD | | | Yes | The password for the replication user |
| PG_SLOT_NAME | | | Yes | The replication slot name |

## Volumes

| Name | Description |
|------|-------------|
| `/pgconf` | Volume for SSL configuration |
| `/pgdata` | PostgreSQL data directory |
| `/pgwal` | PostgreSQL Write-Ahead Log (WAL) |
