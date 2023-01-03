#!/usr/bin/env bash

FILE=test

EXEC=~/Documents/Github/mscTayLab/fasta_files/${FILE}/${FILE}

/Users/finnlo/opt/anaconda3/pkgs/kalign2-2.04-hb4d813b_2/bin/kalign < ${EXEC}.adj.fasta > ${EXEC}.msa.kalign.aln.fasta
