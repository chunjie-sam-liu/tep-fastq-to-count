#!/usr/bin/env bash
# @AUTHOR: Chun-Jie Liu
# @CONTACT: chunjie.sam.liu.at.gmail.com
# @DATE: 2020-07-23 14:53:00
# @DESCRIPTION:

# Number of input parameters
docker run -v /workspace/liucj/refdata/star-genome-index:/refdata chunjiesamliu/tep-pipeline:0.1 \
  STAR --runThreadN 80 \
  --runMode genomeGenerate \
  --genomeDir /refdata \
  --genomeFastaFiles /refdata/hg19.fa \
  --sjdbGTFfile /refdata/gencode.v19.annotation.gtf \
  --sjdbOverhang 100