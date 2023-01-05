
# Base Ubuntu
#------------------------------------------------------------------------------
FROM reg.emt.local/docker/library/ubuntu:focal-20221019

ARG DEBIAN_FRONTEND=noninteractive

# Enable Secure Package Installation
RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends --no-install-suggests \
        ca-certificates \
        apt-transport-https \
    ; \
    sed -i 's|http://archive.ubuntu.com/ubuntu/|https://mirror.aarnet.edu.au/ubuntu/|g' /etc/apt/sources.list; \
    sed -i 's|http://security.ubuntu.com/ubuntu/|https://mirror.aarnet.edu.au/ubuntu/|g' /etc/apt/sources.list; \
    apt-get update; \
    apt-get install -y --no-install-recommends --no-install-suggests \
        gnupg \
        curl \
        wget \
        lsb-release \
    ; \
    rm -rf /var/lib/apt/lists/* ; \
    rm -Rf /usr/share/doc ; \
    rm -Rf /usr/share/man ; \
    apt-get clean
