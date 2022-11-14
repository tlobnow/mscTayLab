library(tidyverse)
library(DECIPHER)
library(Biostrings)
library(ShortRead)
library(data.table)
library(seqinr)


# FASTA PREP

library(tidyverse)

gerdol <- read.csv("~/Documents/Github/mscTayLab/results/fasta/Gerdol_2017_IL1R.csv")
gerdol <- gerdol %>% mutate(FASTA = paste0(">",Protein.name, "_",Species, "_",Subclass)) %>% select(-c(Protein.name, Species, Subclass))
gerdol <- gerdol %>% select(FASTA, Sequence)
gerdol <- gerdol %>% mutate(FULL = paste(FASTA, Sequence)) %>% select(-FASTA, -Sequence)

gerdol_fixed <- gerdol %>%
  mutate(FULL=strsplit(FULL, " ")) %>%
  unnest(FULL)

write.table(gerdol_fixed, file = "~/Documents/Github/mscTayLab/results/fasta/Gerdol_2017_IL1R.fasta", quote = F, row.names = F, col.names = F)

################################################################################

# specify the path to the FASTA file (in quotes)
#fas <- "~/Documents/Github/mscTayLab/results/fasta/uniprot-compressed_true_download_true_format_fasta_query__28Myeloid_-2022.11.09-14.54.00.73.fasta"
fas <- "~/Documents/Github/mscTayLab/results/fasta/Gerdol_2017.fasta"

# load the sequences from the file (change "DNA" to "RNA" or "AA" if necessary)
seqs <- readAAStringSet(fas, use.names = T)
seqs <- RemoveGaps(seqs)
#gc_content <- letterFrequency(seqs, letters = "GC", as.prob = TRUE)
#head(gc_content)
#seqs[which(gc_content == max(gc_content))]

nms  <- unique(seqs@ranges@NAMES)

# align sequences
aligned <- AlignSeqs(seqs[nms])

#write the alignment to a new FASTA file
file_path <- "~/Documents/Github/mscTayLab/results/aln/gerdol_MyD88.aln.fasta"
writeXStringSet(aligned, file_path)

# open alignment
fas <- "~/Documents/Github/mscTayLab/results/aln/gerdol_MyD88.aln.fasta"

# Open connection
dbConn <- dbConnect(SQLite(), ":memory:")
Seqs2DB(fas, "FASTA", dbConn, "MyD88")

# get the FASTA record description
desc <- dbGetQuery(dbConn, "select description from Seqs")

Add2DB(data.frame(identifier=desc, stringsAsFactors=FALSE), dbConn)
BrowseDB(dbConn)

aa <- SearchDB(dbConn)
dbDisconnect(dbConn)
amplicon <- subseq(aa)

BrowseSeqs(amplicon)


