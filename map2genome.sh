#!/usr/bin/env bash
# @AUTHOR: Chun-Jie Liu
# @CONTACT: chunjie.sam.liu.at.gmail.com
# @DATE: 2020-07-23 15:33:32
# @DESCRIPTION:

# Number of input parameters

docker run -v /workspace/liucj/refdata/star-genome-index-new:/refdata \
  -v /home/liucj/tmp/tep-mapping:/home/vault \
  chunjiesamliu/tep-pipeline:0.1 \
  STAR --genomeDir /refdata \
  --readFilesIn ERR1769022_1.fastq.gz ERR1769022_2.fastq.gz \
  --readFilesCommand gunzip -c \
  --runThreadN 24 \
  --genomeLoad NoSharedMemory \
  --outFilterMultimapNmax 20 \
  --alignSJoverhangMin 8 \
  --alignSJDBoverhangMin 1 \
  --outFilterMismatchNmax 999 \
  --outFilterMismatchNoverReadLmax 0.04 \
  --alignIntronMin 20 \
  --alignIntronMax 1000000 \
  --alignMatesGapMax 1000000 \
  --outSAMheaderHD @HD VN:1.4 SO:coordinate \
  --outSAMunmapped Within \
  --outFilterType BySJout \
  --outSAMattributes NH HI AS NM MD \
  --outSAMtype BAM SortedByCoordinate \
  --quantMode GeneCounts \
  --sjdbScore 1 \
  --limitBAMsortRAM 20000000000 \
  --outFileNamePrefix map_ERR1769022_



docker run -v /workspace/liucj/refdata/star-genome-index-new:/refdata \
  -v /home/liucj/tmp/tep-cancer-cell-2017/fastq-files:/home/vault \
  chunjiesamliu/tep-pipeline:0.1 \
  STAR --genomeDir /refdata \
  --readFilesIn SRR5019883_1.fastq.gz \
  --readFilesCommand gunzip -c \
  --runThreadN 24 \
  --genomeLoad NoSharedMemory \
  --outFilterMultimapNmax 20 \
  --alignSJoverhangMin 8 \
  --alignSJDBoverhangMin 1 \
  --outFilterMismatchNmax 999 \
  --outFilterMismatchNoverReadLmax 0.04 \
  --alignIntronMin 20 \
  --alignIntronMax 1000000 \
  --alignMatesGapMax 1000000 \
  --outSAMheaderHD @HD VN:1.4 SO:coordinate \
  --outSAMunmapped Within \
  --outFilterType BySJout \
  --outSAMattributes NH HI AS NM MD \
  --outSAMtype BAM SortedByCoordinate \
  --quantMode GeneCounts \
  --sjdbScore 1 \
  --limitBAMsortRAM 20000000000 \
  --outFileNamePrefix SRR5019883_1.fastq.gz