FROM ubuntu:20.04
LABEL maintainer="Chun-Jie Liu <chunjie.sam.liu@gmail.com>"

# install fastqc
RUN apt-get update -qq \
  && apt-get -y --no-install-recommends install \
  fastqc \
  rna-star \
  build-essential \
  python2.7-dev \
  python-numpy \
  python-matplotlib \
  python-pysam \
  python-htseq

# reference data
# create user
RUN groupadd -g 2000 vault \
  && useradd -m -s /usr/bin/bash -u 2001 -g vault vault
USER vault
WORKDIR /home/vault

ENTRYPOINT [ "/usr/bin/bash" ]