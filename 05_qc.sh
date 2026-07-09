#!/bin/bash

#--- Run Quality Control on FASTQ file(s) ---#

mkdir -p fastqc_results

fastqc -t 6 -o fastqc_results *.fastq *.fastq.gz

mkdir -p multiqc_results

multiqc fastqc_results -o multiqc_results



## Change number of threads based on your available resources
