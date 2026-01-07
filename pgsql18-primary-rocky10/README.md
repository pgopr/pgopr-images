# PostgreSQL Primary

This project contains the PostgreSQL Primary image.

## Getting Started

```bash
# Create the image
make build

# Run, and register the container under postgresql-primary
podman run -p 5432:5432 -p 9100:9100 --name postgresql-primary -d -e PG_DATABASE=mydb -e PG_USER_NAME=myuser -e PG_USER_PASSWORD=mypass -e PG_NETWORK_MASK=all pgsql18-primary-rocky10

# psql to postgresql-primary
psql -h localhost -p 5432 -U myuser mydb

# Shell to postgresql-primary
podman exec -it postgresql-primary /usr/bin/bash

## Configuration

| Property | Default | Unit | Required | Description |
|----------|---------|------|----------|-------------|
| PG_DATABASE | | | Yes | The name of the database |
| PG_USER_NAME | | | Yes | The user name |
| PG_USER_PASSWORD | | | Yes | The password for the user |
| PG_NETWORK_MASK | | | Yes | The network mask for database access |
| PG_DATABASE_ENCODING | UTF8 | | | The encoding of the database |
| PG_MAX_CONNECTIONS | 100 | | | `max_connections` setting |
| PG_SHARED_BUFFERS | 256 | MB | | `shared_buffers` setting |
| PG_WORK_MEM | 8 | MB | | `work_mem` setting |
| PG_MAX_PARALLEL_WORKERS | 8 | | | `max_parallel_workers` setting |
| PG_EFFECTIVE_CACHE_SIZE | 1 | GB | | `effective_cache_size` setting |
| PG_MAX_WAL_SIZE | 1 | GB | | `max_wal_size` setting |
| PG_PASSWORD_ENCRYPTION | scram-sha-256 | | | `password_encryption` setting |

## Volumes

| Name | Description |
|------|-------------|
| `/pgconf` | Volume for SSL configuration |
| `/pgdata` | PostgreSQL data directory |
| `/pgwal` | PostgreSQL Write-Ahead Log (WAL) |
