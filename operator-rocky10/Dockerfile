#
# Eclipse Public License - v 2.0
#
# THE ACCOMPANYING PROGRAM IS PROVIDED UNDER THE TERMS OF THIS ECLIPSE
# PUBLIC LICENSE ("AGREEMENT"). ANY USE, REPRODUCTION OR DISTRIBUTION
# OF THE PROGRAM CONSTITUTES RECIPIENT'S ACCEPTANCE OF THIS AGREEMENT.
#
FROM rust:1 AS builder
ARG PGOPR_VERSION=main
ARG PGOPR_REPO=https://github.com/pgopr/pgopr.git
WORKDIR /build
RUN apt-get update && apt-get install -y --no-install-recommends git \
 && git clone --depth 1 --branch ${PGOPR_VERSION} ${PGOPR_REPO} pgopr \
 && cd pgopr && cargo build --release

FROM gcr.io/distroless/cc
LABEL maintainer="Jesper Pedersen <jesperpedersen.db@gmail.com>"
LABEL org.opencontainers.image.source="https://github.com/pgopr/pgopr-images"
LABEL summary="PostgreSQL operator for Kubernetes" \
      description="PostgreSQL operator for Kubernetes (pgopr)"
COPY --from=builder /build/pgopr/target/release/pgopr /usr/local/bin/pgopr
USER nonroot
CMD ["/usr/local/bin/pgopr"]
