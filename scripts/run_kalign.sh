#!/usr/bin/env bash

#parallel 'sh run_kalign.sh {}' :::: ~/Documents/Github/mscTayLab/fasta_files/INDS.txt

FILE=$1
EXEC=~/Documents/Github/mscTayLab/fasta_files/GERDOL/${FILE}/${FILE}

#/Users/finnlo/opt/anaconda3/pkgs/kalign2-2.04-hb4d813b_2/bin/kalign < ${EXEC}.adj.fasta > ${EXEC}.msa.kalign.aln.fasta

# FOR TIR-DC FAMILIES
/Users/finnlo/opt/anaconda3/pkgs/kalign2-2.04-hb4d813b_2/bin/kalign < ${EXEC}.adj.fasta > ${EXEC}.msa.kalign.aln.fasta
