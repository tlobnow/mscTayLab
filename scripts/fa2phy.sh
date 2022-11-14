#!/usr/bin/env bash

IND=gerdol_MyD88

INPUT=/Users/finnlo/Documents/Github/mscTayLab/results/aln/$IND.aln.fasta
OUTPUT=/Users/finnlo/Documents/Github/mscTayLab/results/phylo/$IND.phy

python /Users/finnlo/Documents/Github/mscTayLab/scripts/fasta2phylip.py -i $INPUT -r -o $OUTPUT
