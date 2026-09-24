FROM debian:bookworm-slim

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        admesh \
        fonts-liberation \
        openscad \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /project

ENTRYPOINT ["openscad"]
CMD ["--version"]

