# FASTA PREP

library(tidyverse)

gerdol <- read.csv("~/Documents/Github/mscTayLab/results/fasta/Gerdol_2017_Supplementary.xlsx - MyD88.csv")
gerdol <- gerdol %>% mutate(FASTA = paste0(">",Protein.name, "_",Species, "_",Subclass)) %>% select(-c(Protein.name, Species, Subclass))
gerdol <- gerdol %>% select(FASTA, Sequence)
gerdol <- gerdol %>% mutate(FULL = paste(FASTA, Sequence)) %>% select(-FASTA, -Sequence)

gerdol_fixed <- gerdol %>% 
  mutate(FULL=strsplit(FULL, " ")) %>% 
  unnest(FULL)

write.table(gerdol_fixed, file = "~/Documents/Github/mscTayLab/results/fasta/Gerdol_2017.fasta", quote = F, row.names = F, col.names = F)
