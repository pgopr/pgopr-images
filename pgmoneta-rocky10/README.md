# PostgreSQL pgmoneta

This project contains the PostgreSQL pgmoneta image.

## Getting Started

```bash
# Create the image
make build

# Run, and register the container under pgmoneta-container
podman run -p 5001:5001 -p 9100:9100 --name pgmoneta-container -d -e PG_PRIMARY_NAME=postgres-primary -e PG_PRIMARY_PORT=5432 -e PG_BACKUP_NAME=backup_user -e PG_BACKUP_PASSWORD=backup_pass -e PG_BACKUP_SLOT=replication_slot pgsql18-pgmoneta-rocky10

# Connect to pgmoneta
pgmoneta-cli -h localhost -p 5001 -U backup_user -P backup_pass info

# Shell to pgmoneta-container
podman exec -it pgmoneta-container /bin/bash 
```

## Configuration

| **Property**       | **Default** | **Unit** | **Required** | **Description** |
|---------------------|-------------|----------|--------------|-----------------|
| **PG_PRIMARY_NAME** |             |          | Yes          | The name of the PostgreSQL primary server |
| **PG_PRIMARY_PORT** | 5432        |          | Yes          | The port of the PostgreSQL primary server |
| **PG_BACKUP_NAME**  |             |          | Yes          | The backup user name |
| **PG_BACKUP_PASSWORD** |         |          | Yes          | The password for the backup user |
| **PG_BACKUP_SLOT**  |             |          | Yes          | The replication slot name for backups |

## Volumes

| **Name**     | **Description** |
|--------------|-----------------|
| `/pgconf`    | Volume for SSL configuration |
| `/pgmoneta`  | pgmoneta backup and configuration directory |
