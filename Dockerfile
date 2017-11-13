FROM ubuntu:16.04
ARG ANSIBLE_VER

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get -y update && \
    apt-get -y install build-essential ca-certificates libffi-dev libssl-dev python python-dev python-setuptools && \
    easy_install pip && \
    /usr/local/bin/pip install -U pip && \
    pip install ansible==$ANSIBLE_VER && \
    apt-get purge -y build-essential libffi-dev libssl-dev python-dev && \
    rm -rf /var/lib/apt/lists/*

CMD ["ansible"]
