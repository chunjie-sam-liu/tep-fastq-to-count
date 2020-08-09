

# Run pipeline in the this docker image

## Pull the docker image

```shell
docker pull chunjiesamliu/tep-pipeline:0.1
```

## Run pipeline with single end and pair end fastq file

After docker image being pulled, use this pipeline*.sh to transform the fastq files to the htseq count


```shell

# for single end
bash pipeline-sinle-end.sh -f /path/to/single.fq -o /path/to/outputdir -r /path/to/refdir

# for paired end

bash pipeline-pair-end.sh -f1 /path/to/fq1.fq -f2 /path/to/fq2.fq -o /path/to/outputdir -r /path/to/refdir
```

## For paralell to run pipeline

The pipeine*.sh is for the single sample, if you need to run handreds of samples. Using pipeline for each sample and then parallel to run the samples.