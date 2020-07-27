#!/usr/bin/env bash
# @AUTHOR: Chun-Jie Liu
# @CONTACT: chunjie.sam.liu.at.gmail.com
# @DATE: 2020-07-27 11:48:08
# @DESCRIPTION:

# Number of input parameters

function map2genome {
  gzfile=$1
  cmd="docker run -v /workspace/liucj/refdata/star-genome-index-new:/refdata \
  -v /home/liucj/tmp/tep-cancer-cell-2017/fastq-files:/home/vault \
  chunjiesamliu/tep-pipeline:0.1 \
  STAR --genomeDir /refdata \
  --readFilesIn $gzfile \
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
  --outFileNamePrefix ${gzfile}_"
  echo $cmd
  eval $cmd
}

function bam2count {
  gzfile=$1
  cmd="docker run -v /workspace/liucj/refdata/star-genome-index-new:/refdata \
  -v /home/liucj/tmp/tep-cancer-cell-2017/fastq-files:/home/vault \
  chunjiesamliu/tep-pipeline:0.1 \
  htseq-count \
  /home/vault/${gzfile}_Aligned.sortedByCoord.out.bam \
  /refdata/Homo_sapiens.GRCh37.75-new.gtf > /home/vault/${gzfile}.htseq_count.txt"
  echo $cmd
  eval $cmd
}

for gz in `ls *gz`;
do
  {
    map2genome ${gz}
    bam2count ${gz}
  } &
done

