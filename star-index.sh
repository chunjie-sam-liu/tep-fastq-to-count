#!/usr/bin/env bash
# @AUTHOR: Chun-Jie Liu
# @CONTACT: chunjie.sam.liu.at.gmail.com
# @DATE: 2020-07-23 14:53:00
# @DESCRIPTION:

# Number of input parameters
STAR --runThreadN 20 \
  --runMode genomeGenerate \
  --genomeDir /refdata \
  --genomeFastaFiles /refdata/hg19.fa \
  --sjdbGTFfile /refdata/gencode.v19.annotation.gtf \
  --sjdbOverhang 100