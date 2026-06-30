#!/bin/bash

#------ Download metadata ------#

esearch -db sra -query PRJNA843078 | efetch -format runinfo > runinfo.csv


#--- Download SRR accessions ---#

cut -d',' -f1 runinfo.csv | tail -n +2 > SRR_list.txt
