from alpine:3.11

ARG PACKER_VERSION=1.5.5

# Most likely this will be the value by default with auto discovery,
# but we save time telling ansible what python do we want to use
# and we can eliminate the problem of "what if it does not..."
ENV ANSIBLE_PYTHON_INTERPRETER=/usr/bin/python

# from apk, ansible uses python3 which will not work only if python3
# installed on the server (ansible remote) and it just does not work
# because yum does not have a python3 module
RUN apk add --no-cache \
    musl-dev python python-dev py-pip libffi-dev openssh openssl-dev \
    bash curl gcc && \
    curl -s https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip | unzip - && \
    mv packer /usr/bin && \
    chmod +x /usr/bin/packer && \
    pip install --upgrade pip && \
    pip install awscli && \
    pip install ansible

# Python 2.7 will be declared end-of-life in January of 2020 by the upstream
# Python community. We strongly recommend our customers install Python 3 on
# their Amazon Linux 2 systems and migrate their code and applications to
# Python 3. We will continue to provide critical security patches for Python 2
# as per our LTS commitment for Amazon Linux 2 core packages (until June,
# 2023).
#
# There are no plans to change the default Python interpreter. It is our
# intention to retain Python 2.7 as the default for the lifetime of Amazon
# Linux 2.
#
# https://forums.aws.amazon.com/thread.jspa?threadID=312472
