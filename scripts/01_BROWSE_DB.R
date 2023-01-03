################################################################################
####  01_BROWSE_SEQS  ##########################################################
################################################################################
library(pacman)
pacman::p_load(tidyverse, DECIPHER, msa, Biostrings, bios2mds)

# (1) USE KALIGN TO FACILITATE MSA OF FASTA FILES (or the aln_db fct if you want, but kalign gives pretty good results)

#FILE=bdld3
#kalign < ${FILE}.fasta > ${FILE}.msa.kalign.aln.fasta





# (2) SUPPLY THE ALIGNMENT FOR VISUALIZATION

LOC = "~/Documents/Github/mscTayLab/fasta_files/"
FILE = "bdld3"

dir.create(file.path(LOC, FILE))
file.copy(from = paste0(LOC, FILE, ".fasta"), to = paste0(LOC, FILE, "/", FILE, ".fasta"))

MyD88_DD_MOUSE <- data.frame(MyD88_DD_MOUSE = c(">MyD88-DD_MOUSE", "RLSLFLNPRTPVAADWTLLAEEMGFEYLEIRELETRPDPTRSLLDAWQGRSGASVGRLLELLALLDREDILKELKSRISRIEEDCQKYLGKQQNQESE"))
MyD88_DD_HUMAN <- data.frame(MyD88_DD_HUMAN = c(">MyD88-DD_HUMAN", "RLSLFLNVRTQVAADWTALAEEMDFEYLEIRQLETQADPTGRLLDAWQGRPGASVGRLLELLTKLGRDDVLLELGPSIEEDCQKYILKQQQEEAE"))
TEST_FILE <- read.table(paste0(LOC, FILE,"/",FILE,".fasta"), sep = "\t")
FASTA     <- bind_rows(MyD88_DD_MOUSE, MyD88_DD_HUMAN, TEST_FILE)
FILE_PATH <- paste0(LOC, FILE,"/",FILE,".adj.fasta")
write.table(FASTA, FILE_PATH, quote = F, row.names = F, col.names = F)

FASTA  <- readAAStringSet(paste0(LOC,FILE,"/",FILE,".adj.fasta"))

LOC     = "~/Documents/Github/mscTayLab/fasta_files/"
METHOD  = "kalign" #c(Muscle, ClustalW, ClustalOmega, kalign)
FASTA   = paste0(LOC,FILE,"/",FILE,".msa.",METHOD,".aln.fasta") # load aln file for viewing
BROWSE  = T
START   = NA
END     = NA

browse(FASTA = FASTA, BROWSE = T, HIGHLIGHT = NA, START = START, END = END)


