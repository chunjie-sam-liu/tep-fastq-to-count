#!/usr/bin/env bash
# @AUTHOR: Chun-Jie Liu
# @CONTACT: chunjie.sam.liu.at.gmail.com
# @DATE: 2020-07-23 15:33:32
# @DESCRIPTION:

# Number of input parameters
docker run -v /workspace/liucj/refdata/star-genome-index-new:/refdata \
  -v /home/liucj/tmp/tep-mapping:/home/vault \
  chunjiesamliu/tep-pipeline:0.1 \
  STAR --runMode alignReads \
  --runThreadN 40 \
  --genomeDir /refdata \
  --quantMode TranscriptomeSAM GeneCounts \
  --outSAMtype BAM SortedByCoordinate \
  --outFileNamePrefix ERR1769022_ \
  --outSJfilterReads Unique \
  --outSAMattrRGline ID:ERR1769022 SM:ERR1769022 PL:ILLUMINA \
  --alignIntronMin 20 \
  --alignIntronMax 50000 \
  --outFilterMismatchNmax 5 \
  --outSAMmultNmax 1 \
  --outSAMmapqUnique 60 \
  --readFilesCommand gunzip -c \
  --readFilesIn ERR1769022_1.fastq.gz ERR1769022_2.fastq.gz
