#!/usr/bin/env bash

IND=ARCHAEA_DD_2157

#INPUT=/Users/finnlo/Documents/Github/mscTayLab/results/aln/$IND.aln.fasta
#OUTPUT=/Users/finnlo/Documents/Github/mscTayLab/results/phylo/$IND.phy

INPUT=~/Documents/Github/mscTayLab/alignments/DD_UNIVERSAL_TREE_ALN/$IND.I.aln.fasta
OUTPUT=~/Documents/Github/mscTayLab/phylip/DD_UNIVERSAL_TREE_PHY/$IND.I.phy

python /Users/finnlo/Documents/Github/mscTayLab/scripts/fasta2phylip.py -i $INPUT -r -o $OUTPUT
