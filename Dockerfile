from alpine:3.11

ARG PACKER_VERSION=1.5.5

RUN apk add --no-cache bash ansible curl && \
    curl -s https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip | unzip - && \
    mv packer /usr/bin && \
    chmod +x /usr/bin/packer && \
    pip3 install awscli


