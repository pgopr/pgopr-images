# PostgreSQL pgagroal

This project contains the PostgreSQL pgagroal image.

## Getting Started

```bash
# Create the image
make build

# Run, and register the container under postgresql-pgagroal
podman run -p 2345:2345 -p 2346:2346 -p 9104:9100 --name postgresql-pgagroal -d -e PG_PRIMARY_NAME=192.168.1.12 -e PG_PRIMARY_PORT=5432 -e PG_NETWORK_MASK=all -e PG_USER_NAME=myuser -e PG_USER_PASSWORD=mypass -e PG_DATABASE=mydb pgagroal-rocky10

# Shell to postgresql-pgagroal
podman exec -it postgresql-pgagroal /bin/bash
```

## Configuration

| **Property** | **Default** | **Unit** | **Required** | **Description** |
|--------------|-------------|----------|--------------|-----------------|
| **PG_PRIMARY_NAME** | | | Yes | The IP or hostname of the PostgreSQL primary server |
| **PG_PRIMARY_PORT** | | | Yes | The port of the PostgreSQL server |
| **PG_NETWORK_MASK** | | | Yes | The network mask for access |
| **PG_USER_NAME** | | | Yes | The user name |
| **PG_USER_PASSWORD** | | | Yes | The user password |
| **PG_DATABASE** | | | Yes | The user database |
| **PG_MAX_CONNECTIONS** | 100 | | No | The maximum number of connections |
| **PG_IDLE_TIMEOUT** | 0 | | No | The idle timeout setting |
| **PG_VALIDATION** | `off` | | No | The validation of connections |

## SSL support

SSL support will be enabled when `/pgconf` contains the files `root.crt`, `server.crt` and `server.key`.

Remember to disable passphase such that the server can boot without a password prompt.

A guide to this can be found [here](https://www.howtoforge.com/postgresql-ssl-certificates).
Test and production environments should **NOT** be using self-signed certificates.

## Volumes

| **Name** | **Description** |
|----------|-----------------|
| `/pgconf` | Volume for SSL configuration |
| `/pgagroal` | pgagroal configuration and runtime directory |
