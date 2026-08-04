# PostgreSQL operator

This project contains the [pgopr](https://pgopr.github.io/) operator image.

## Getting Started

```bash
# Create the image
make build

# Run, and register the container under operator-container
podman run --name operator-container -d -e PGOPR_TARGET_NAMESPACE=default operator-rocky10
```

## Deployment

The image is published to `ghcr.io/pgopr/operator` and is the default used by the `pgopr` command line tool:

```bash
pgopr deploy --image ghcr.io/pgopr/operator:latest
```

## Configuration

The operator runs as a non-root user (`nonroot`) on a distroless base image, which does **not** include a shell or package manager.

| **Property**            | **Default** | **Required** | **Description**                       |
|-------------------------|-------------|--------------|---------------------------------------|
| **PGOPR_TARGET_NAMESPACE** | `default` | No          | The namespace the operator watches    |

When deployed to Kubernetes, the operator authenticates through the in-cluster service account; no additional configuration is required.
