#!/bin/bash

#------ Convert SRR runs into FASTQ files ------#

# Uncomment the section below if you want to convert a list of SRR runs

#for SRR in $(cat SRR_list.txt); do
#	fasterq-dump \
#		--split-files \
#		--threads 8 \
#	--include-technical \
#		--temp ./tmp \
#		${SRR}/${SRR}.sra
#done

# Uncomment the section below if you want to convert a single SRR run

#fasterq-dump \
#	--split-files \
#	--threads 8 \
#	--include-technical \
#	--temp ./tmp \
#	SRR19432685/SRR19432685.sra

# Change the code based on the resources available on your machine
