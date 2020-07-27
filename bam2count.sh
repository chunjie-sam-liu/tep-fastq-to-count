#!/usr/bin/env bash
# @AUTHOR: Chun-Jie Liu
# @CONTACT: chunjie.sam.liu.at.gmail.com
# @DATE: 2020-07-24 16:06:44
# @DESCRIPTION:

# Number of input parameters
docker run -v /workspace/liucj/refdata/star-genome-index-new:/refdata \
  -v /home/liucj/tmp/tep-mapping:/home/vault \
  chunjiesamliu/tep-pipeline:0.1 \
  htseq-count \
  /home/vault/map_ERR1769022_Aligned.sortedByCoord.out.bam \
  /refdata/Homo_sapiens.GRCh37.75-new.gtf > ERR1769022.htseq_count.txt

## test

docker run -v /workspace/liucj/refdata/star-genome-index-new:/refdata \
  -v /home/liucj/tmp/tep-cancer-cell-2017/fastq-files:/home/vault \
  chunjiesamliu/tep-pipeline:0.1 \
  htseq-count \
  /home/vault/SRR5019883_1.fastq.gzAligned.sortedByCoord.out.bam \
  /refdata/Homo_sapiens.GRCh37.75-new.gtf > SRR5019883_1.fastq.gz.htseq_count.txt
