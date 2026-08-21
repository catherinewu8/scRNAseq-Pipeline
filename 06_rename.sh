#!/bin/bash

set -euo pipefail

while read -r SRR; do
    for read in R1 R2; do
        old="${SRR}/${SRR}.sra_S1_L001_${read}_001.fastq"
        new="${SRR}/${SRR}_S1_L001_${read}_001.fastq"

        if [[ -f "$old" ]]; then
            mv "$old" "$new"
            echo "Renamed: $old -> $new"
        else
            echo "Skipping missing file: $old"
        fi
    done
done < SRR_list.txt
