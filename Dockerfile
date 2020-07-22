FROM ubuntu:20.04
LABEL maintainer="Chun-Jie Liu <chunjie.sam.liu@gmail.com>"

# install fastqc
RUN apt-get update -qq \
  && apt-get -y --no-install-recommends install \
  fastqc \
  rna-star \
  python3 \
  python3-pip \
  && ln -s /usr/bin/python3.8 /usr/bin/python \
  && ln -s /usr/bin/pip3 /usr/bin/pip \
  && apt-get clean \
  && apt-get autoremove \
  && rm -rf /var/lib/apt/lists/*

# reference data
# create user
RUN groupadd -g 2000 vault \
  && useradd -m -s /usr/bin/bash -u 2001 -g vault vault
USER vault
WORKDIR /home/vault

ENTRYPOINT [ "/usr/bin/bash" ]