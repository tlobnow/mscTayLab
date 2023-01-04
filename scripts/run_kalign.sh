#!/usr/bin/env bash

#parallel 'sh run_kalign.sh {}' :::: ~/Documents/Github/mscTayLab/fasta_files/INDS.txt

FILE=$1
EXEC=~/Documents/Github/mscTayLab/fasta_files/GERDOL/${FILE}/${FILE}

# FOR TIR-DC prep
#/Users/finnlo/opt/anaconda3/pkgs/kalign2-2.04-hb4d813b_2/bin/kalign < ${EXEC}.adj.fasta > ${EXEC}.msa.kalign.aln.fasta


# FOR 01_BROWSE_TIR-DC
/Users/finnlo/opt/anaconda3/pkgs/kalign2-2.04-hb4d813b_2/bin/kalign < ${EXEC}.msa.kalign.aln.trim.fasta > ${EXEC}.msa.kalign.aln.trim2.fasta
/Users/finnlo/opt/anaconda3/pkgs/kalign2-2.04-hb4d813b_2/bin/kalign < ${EXEC}.msa.kalign.aln.trim.L.fasta > ${EXEC}.msa.kalign.aln.trim2.L.fasta
/Users/finnlo/opt/anaconda3/pkgs/kalign2-2.04-hb4d813b_2/bin/kalign < ${EXEC}.msa.kalign.aln.trim.R.fasta > ${EXEC}.msa.kalign.aln.trim2.R.fasta
