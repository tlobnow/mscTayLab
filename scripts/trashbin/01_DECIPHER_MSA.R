library(tidyverse)
library(DECIPHER)
library(Biostrings)
library(ShortRead)
library(data.table)
library(seqinr)
library(stringr)

# Generate Fasta files from tables
for (i in 1:15) {
  FILE <- read.csv(paste0("~/Documents/Github/mscTayLab/results/csv/Gerdol_2017_ecTIR-DC_",i,".csv"))
  FILE$Species <- FILE$Species %>% str_replace(" ", "_")
  # generate fasta
  FILE <- FILE %>% mutate(FASTA = paste0(">",Protein.name, "_",Species, "_",Subclass)) %>% select(-c(Protein.name, Species, Subclass))
  FILE <- FILE %>% select(FASTA, Sequence)
  FILE <- FILE %>% mutate(FULL = paste(FASTA, Sequence)) %>% select(-FASTA, -Sequence)
  FILE_fixed <- FILE %>%  mutate(FULL=strsplit(FULL, " ")) %>% unnest(FULL)
  
  write.table(FILE_fixed, file = paste0("~/Documents/Github/mscTayLab/results/fasta/Gerdol_2017_ecTIR-DC_",i,".fasta"), quote = F, row.names = F, col.names = F)
}

# #FILE <- read.csv("~/Documents/Github/mscTayLab/results/csv/Gerdol_2017_MyD88.csv")
# #FILE <- read.csv("~/Documents/Github/mscTayLab/results/csv/Gerdol_2017_IL1R.csv")
# 
# # replace species name " " with "_"
# FILE$Species <- FILE$Species %>% str_replace(" ", "_")
# 
# # generate fasta
# FILE <- FILE %>% mutate(FASTA = paste0(">",Protein.name, "_",Species, "_",Subclass)) %>% select(-c(Protein.name, Species, Subclass))
# FILE <- FILE %>% select(FASTA, Sequence)
# FILE <- FILE %>% mutate(FULL = paste(FASTA, Sequence)) %>% select(-FASTA, -Sequence)
# FILE_fixed <- FILE %>%  mutate(FULL=strsplit(FULL, " ")) %>% unnest(FULL)
# 
# write.table(FILE_fixed, file = paste0("~/Documents/Github/mscTayLab/results/fasta/Gerdol_2017_",NAME,".fasta"), quote = F, row.names = F, col.names = F)

################################################################################

# SIMPLE ALIGNMENT FOR PHYLOGENETIC ANALYSIS

FILE = "MOUSE_TIR.similarity" # based on MetaPhOrs results
fas <- read.table(paste0("~/Documents/Github/mscTayLab/results/fasta/",FILE,".fasta"), sep = "\t")
fas$V1 <- fas$V1 %>% str_replace(" ", "_")
write.table(fas, file = paste0("~/Documents/Github/mscTayLab/results/fasta/",FILE,".simplified.fasta"), quote = F, row.names = F, col.names = F)

fas <- (paste0("~/Documents/Github/mscTayLab/results/fasta/",FILE,".simplified.fasta"))
seqs <- readAAStringSet(fas, use.names = T)
seqs <- RemoveGaps(seqs)
nms  <- unique(seqs@ranges@NAMES)
aligned <- AlignSeqs(seqs[nms], iterations = 10)
aligned@ranges@NAMES <- unlist(lapply(strsplit(aligned@ranges@NAMES, "_[", fixed=TRUE), function(x) return(x[2])))
aligned@ranges@NAMES <- unlist(lapply(strsplit(aligned@ranges@NAMES, "]", fixed=TRUE), function(x) return(x[1])))
aligned@ranges@NAMES

file_path <- paste0("~/Documents/Github/mscTayLab/results/aln/",FILE,".aln.fasta")
fas <- paste0("~/Documents/Github/mscTayLab/results/aln/",FILE,".aln.fasta")
writeXStringSet(aligned, file_path)
dbConn <- dbConnect(SQLite(), ":memory:")
Seqs2DB(fas, "FASTA", dbConn, paste0(FILE))
desc <- dbGetQuery(dbConn, "select description from Seqs")
Add2DB(data.frame(desc=desc, stringsAsFactors=FALSE), dbConn)
Add2DB(data.frame(identifier=desc, stringsAsFactors=FALSE), dbConn)
#BrowseDB(dbConn)
aa <- SearchDB(dbConn)
dbDisconnect(dbConn)
amplicon <- subseq(aa)
names(amplicon) <- desc$description
BrowseSeqs(amplicon)

for (i in 1:15) {
  fas <- paste0("~/Documents/Github/mscTayLab/results/fasta/Gerdol_2017_ecTIR-DC_",i,".fasta")
  
  # load the sequences from the file (change "DNA" to "RNA" or "AA" if necessary)
  seqs <- readAAStringSet(fas, use.names = T)
  seqs <- RemoveGaps(seqs)
  writeXStringSet(seqs, "~/Documents/Github/mscTayLab/results/fasta/full_fas.fasta", append = T)
}

fas <- paste0("~/Documents/Github/mscTayLab/results/fasta/full_fas.fasta")
seqs <- readAAStringSet(fas, use.names = T)
seqs <- RemoveGaps(seqs)
nms  <- unique(seqs@ranges@NAMES)
aligned <- AlignSeqs(seqs[nms])
file_path <- paste0("~/Documents/Github/mscTayLab/results/aln/full_fas.aln.fasta")
writeXStringSet(aligned, file_path)
fas <- paste0("~/Documents/Github/mscTayLab/results/aln/full_fas.aln.fasta")
dbConn <- dbConnect(SQLite(), ":memory:")
Seqs2DB(fas, "FASTA", dbConn, paste0("ecTIR-DC_ALL"))
desc <- dbGetQuery(dbConn, "select description from Seqs")
Add2DB(data.frame(identifier=desc, stringsAsFactors=FALSE), dbConn)
aa <- SearchDB(dbConn)
dbDisconnect(dbConn)
amplicon <- subseq(aa)
names(amplicon) <- desc$description
BrowseSeqs(amplicon)
# 
# for (i in 1:15) {
#   fas <- paste0("~/Documents/Github/mscTayLab/results/fasta/Gerdol_2017_ecTIR-DC_",i,".fasta")
# 
#   # load the sequences from the file (change "DNA" to "RNA" or "AA" if necessary)
#   seqs <- readAAStringSet(fas, use.names = T)
#   seqs <- RemoveGaps(seqs)
#   nms  <- unique(seqs@ranges@NAMES)
# 
#   # align sequences
#   aligned <- AlignSeqs(seqs[nms])
# 
#   #write the alignment to a new FASTA file
#   file_path <- paste0("~/Documents/Github/mscTayLab/results/aln/Gerdol_2017_ecTIR-DC_",i,".aln.fasta")
#   writeXStringSet(aligned, file_path)
# 
#   # open alignment
#   fas <- paste0("~/Documents/Github/mscTayLab/results/aln/Gerdol_2017_ecTIR-DC_",i,".aln.fasta")
#   
#   # Open connection
#   dbConn <- dbConnect(SQLite(), ":memory:")
#   Seqs2DB(fas, "FASTA", dbConn, paste0("ecTIR-DC_ALL"))
#   
#   # get the FASTA record description
#   desc <- dbGetQuery(dbConn, "select description from Seqs")
#   
#   Add2DB(data.frame(identifier=desc, stringsAsFactors=FALSE), dbConn)
#   #BrowseDB(dbConn)
#   
#   aa <- SearchDB(dbConn)
#   dbDisconnect(dbConn)
#   amplicon <- subseq(aa)
#   names(amplicon) <- desc$description
#   #readline(prompt = paste0("You looked at ecTIR-DC_", i,". Would you like to continue?"))
# }
# BrowseSeqs(amplicon)


