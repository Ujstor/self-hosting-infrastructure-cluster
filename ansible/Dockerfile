FROM python:3.12-slim

WORKDIR /ansible

ENV ANSIBLE_CONFIG=./ansible.cfg
ENV PYTHONUNBUFFERED=1

RUN apt-get update && \
	apt-get install -y \
	sshpass \
	openssh-client \
	git \
	sudo \
	vim \
	&& rm -rf /var/lib/apt/lists/*

COPY requirements.yml ./requirements.yml

RUN pip install --upgrade pip && \
	pip install ansible-core==2.17 distlib netaddr jsonschema ipaddr  jmespath && \
	ansible-galaxy install -r requirements.yml

COPY . .

CMD ["/bin/bash"]
