#!/bin/bash

#------ Download metadata from NIH ------#

esearch -db sra -query PRJNA843078 | efetch -format runinfo > runinfo.csv


#---- Download SRR accession numbers ----#

cut -d',' -f1 runinfo.csv | tail -n +2 > SRR_list.txt
