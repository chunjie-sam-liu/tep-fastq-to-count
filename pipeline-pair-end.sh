#!/usr/bin/env bash
# @AUTHOR: Chun-Jie Liu
# @CONTACT: chunjie.sam.liu.at.gmail.com
# @DATE: 2020-08-12 17:29:44
# @DESCRIPTION:

# Number of input parameters
param=$#

function message {
  echo "Notice: Mapping single end fastq files to human genome."
  echo "        -f1|--fq1: Absolute path of fastqfile."
  echo "        -f2|--fq2: Absolute path of fastqfile."
  echo "        -o|--outpath: Absolute path of Output directory."
  echo "        -r|--refpath: Absolute path of Reference directory"
  echo "Example:"
  echo "bash pipeline-sinle-end.sh -f1 /path/to/fq1.fq -f2 /path/to/fq2.fq -o /path/to/outputdir -r /path/to/refdir"
}

function checkfile {
  [[ -e $1 ]] || {
    echo "Error: $1 does not exist."
    message
    exit 0
 }
}

function checkparam {
  [[ ${param} != 8 ]] && message && exit 0
}

function map2genome {
  FASTQPATH=`dirname ${FASTQFILE1}`
  FASTQNAME=`basename ${FASTQFILE1}`
  cmd="docker run \
  -v ${REFPATH}:/refdata \
  -v ${FASTQPATH}:/home/vault \
  -v ${OUTPATH}:/output \
  chunjiesamliu/tep-pipeline:0.1 \
  STAR --genomeDir /refdata \
  --readFilesIn ${FASTQNAME1} ${FASTQNAME2}\
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
  --outFileNamePrefix /output/${FASTQNAME}_"
  echo ${cmd}
  eval ${cmd}
}

function bam2count {
  FASTQNAME=`basename ${FASTQFILE1}`
  cmd="docker run \
  -v ${REFPATH}:/refdata \
  -v ${OUTPATH}:/output \
  chunjiesamliu/tep-pipeline:0.1 \
  htseq-count \
  /output/${FASTQNAME}_Aligned.sortedByCoord.out.bam \
  /refdata/Homo_sapiens.GRCh37.75-new.gtf \
  -c /output/${FASTQNAME}.htseq_count.txt"
  echo ${cmd}
  eval ${cmd}
}

function main {
  FASTQNAME=`basename ${FASTQFILE1}`
  {
    map2genome
    bam2count
  } 1>${OUTPATH}/${FASTQNAME}.log 2>${OUTPATH}/${FASTQNAME}.log
}


checkparam

POSITIONAL=()
while [[ $# -gt 0 ]]; do
  key="$1"
  case $key in
      -f1|--fq1) FASTQFILE1="$2"; shift; shift; checkfile ${FASTQFILE1};;
      -f2|--fq2) FASTQFILE2="$2"; shift; shift; checkfile ${FASTQFILE2};;
      -o|--outpath) OUTPATH="$2"; shift; shift; checkfile ${OUTPATH};;
      -r|--refpath) REFPATH="$2"; shift; shift; checkfile ${REFPATH};;
      *) POSITIONAL+=("$1"); shift;;
  esac
done
set -- "${POSITIONAL[@]}"

main

