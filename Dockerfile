FROM ubuntu:16.04
ARG ANSIBLE_VER
ARG VAULT_VER

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get -y update && \
    apt-get -y install build-essential ca-certificates curl jq libffi-dev libssl-dev openssh-client python python-dev python-setuptools unzip wget && \
    curl -o /vault.zip https://releases.hashicorp.com/vault/${VAULT_VER}/vault_${VAULT_VER}_linux_amd64.zip && \
    unzip /vault.zip -d /usr/local/bin && \
    rm -f /vault.zip && \
    chmod 0777 /usr/local/bin/vault && \
    easy_install pip && \
    /usr/local/bin/pip install -U pip && \
    pip install ansible==$ANSIBLE_VER && \
    pip install boto boto3 && \
    apt-get purge -y build-essential libffi-dev libssl-dev python-dev && \
    apt-get -y autoremove && \
    rm -rf /var/lib/apt/lists/*

CMD ["ansible"]
