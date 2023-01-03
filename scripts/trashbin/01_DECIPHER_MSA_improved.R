library(pacman)
pacman::p_load(tidyverse, DECIPHER, msa, Biostrings, bios2mds)

################################################################################
### ALIGN WITH DECIPHER PACKAGE   ##############################################
################################################################################

# Provide the name of the file
#FILE      <- "ARCHAEA_DD_2157"
#FASTA1    <- read.table(paste0("~/Documents/Github/mscTayLab/fasta_files/DD_UNIVERSAL_TREE/", FILE, ".fasta"), sep = "\t")
#FASTA2    <- read.table(paste0("~/Documents/Github/mscTayLab/fasta_files/MYD88-DD.fasta"), sep = "\t")
#FASTA     <- bind_rows(FASTA1,FASTA2)
# 
# FILE <- "prosite_TP_DD"
# 
# system(command = paste0("mkdir -p ", LOC, FILE))
# system(command = paste0("mv ", LOC, FILE,".fasta ", LOC, FILE))
# 
# FASTA <- read.table(paste0(LOC, FILE,"/",FILE, ".fasta"), sep = "\t")
# FASTA$V1  <- FASTA$V1 %>% str_replace(" ", "_")
# write.table(FASTA, file = paste0(LOC,FILE,"/",FILE,".02.fasta"), quote = F, row.names = F, col.names = F)
# FASTA   <- paste0(LOC,FILE,"/", FILE, ".fasta")
# SEQS    <- readAAStringSet(FASTA, use.names = T)
# SEQS    <- RemoveGaps(SEQS)
# 
# SEQS@ranges@NAMES <- unlist(lapply(strsplit(SEQS@ranges@NAMES, "OS=", fixed=TRUE), function(x) return(x[2])))
# #SEQS@ranges@NAMES <- unlist(lapply(strsplit(SEQS@ranges@NAMES, "OX=", fixed=TRUE), function(x) return(x[1])))
# SEQS@ranges@NAMES <- unlist(lapply(strsplit(SEQS@ranges@NAMES, " PE=", fixed=TRUE), function(x) return(x[1])))
# #SEQS@ranges@NAMES[SEQS@ranges@NAMES %in% NA] <- "MyD88-DD_MOUSE"
# SEQS@ranges@NAMES
# FILE_PATH <- paste0(LOC,FILE,"/",FILE,".03.fasta")
# writeXStringSet(SEQS, FILE_PATH)
# NMS       <- unique(SEQS@ranges@NAMES)
# ALIGNED   <- AlignSeqs(unique(SEQS[NMS]), iterations = 10)
# FILE_PATH <- paste0(LOC,FILE,"/",FILE,".04.decipher.aln.fasta")
# writeXStringSet(ALIGNED, FILE_PATH)
# 
# dbConn <- dbConnect(SQLite(), ":memory:")
# Seqs2DB(FASTA, "FASTA", dbConn, paste0(FILE))
# desc <- dbGetQuery(dbConn, "select description from Seqs")
# Add2DB(data.frame(desc=desc, stringsAsFactors=FALSE), dbConn)
# Add2DB(data.frame(identifier=desc, stringsAsFactors=FALSE), dbConn)
# BrowseDB(dbConn)
# aa <- SearchDB(dbConn)
# dbDisconnect(dbConn)
# amplicon <- subseq(aa)
# names(amplicon) <- desc$description
# BrowseSeqs(amplicon)

################################################################################
### ALIGN W/ MSA PACKAGE     ###################################################
################################################################################

#method = "Muscle"
#method = "ClustalW"
# method = "ClustalOmega"
# 
# FASTA     <- readAAStringSet(paste0(LOC,FILE,"/",FILE,".03.fasta"))
# 
# if (METHOD == "Muscle") {
#   FASTA_SEQS <- msa::msa(inputSeqs = FASTA, method = "Muscle")
#   FASTA_SEQS <- msa::msaConvert(FASTA_SEQS, "bios2mds::align")
#   bios2mds::export.fasta(FASTA_SEQS, outfile = paste0(LOC,FILE,"/",FILE,".05.msa.muscle.aln.fasta"))
#   FASTA     <- paste0(LOC,FILE,"/",FILE,".05.msa.muscle.aln.fasta")
#   } else if (METHOD == "ClustalW") {
#   FASTA_SEQS <- msa::msa(inputSeqs = FASTA, method = "ClustalW")
#   FASTA_SEQS <- msa::msaConvert(FASTA_SEQS, "bios2mds::align")
#   bios2mds::export.fasta(FASTA_SEQS, outfile = paste0(LOC,FILE,"/",FILE,".05.msa.clustalW.aln.fasta"))
#   FASTA     <- paste0(LOC,FILE,"/",FILE,".05.msa.clustalW.aln.fasta")
# } else if (METHOD == "ClustalOmega") {
#   FASTA_SEQS <- msa::msa(inputSeqs = FASTA, method = "ClustalOmega")
#   FASTA_SEQS <- msa::msaConvert(FASTA_SEQS, "bios2mds::align")
#   bios2mds::export.fasta(FASTA_SEQS, outfile = paste0(LOC,FILE,"/",FILE,".05.msa.clustalOmega.aln.fasta"))
#   FASTA     <- paste0(LOC,FILE,"/",FILE,".05.msa.clustalOmega.aln.fasta")
# } else {
#   print("Sorry. Please choose one of the msa options from above by unhashing the method of your choice.")
# }
# 
# BROWSE = F
# 
# if (BROWSE == T) {
#   dbConn <- dbConnect(SQLite(), ":memory:")
#   Seqs2DB(FASTA, "FASTA", dbConn, paste0(FILE))
#   desc <- dbGetQuery(dbConn, "select description from Seqs")
#   Add2DB(data.frame(desc=desc, stringsAsFactors=FALSE), dbConn)
#   Add2DB(data.frame(identifier=desc, stringsAsFactors=FALSE), dbConn)
#   #BrowseDB(dbConn)
#   aa <- SearchDB(dbConn)
#   #dbDisconnect(dbConn)
#   amplicon <- subseq(aa)
#   names(amplicon) <- desc$description
#   BrowseSeqs(amplicon)
# } else {
#   print("not browsing Seqs in dbConn.")
# }

################################################################################
### ALIGN W/ specific FASTA PACKAGE     ########################################
################################################################################

LOC = "~/Documents/Github/mscTayLab/fasta_files/"
#FILE = "Nhal_1492"
FILE = "MyD88_Mammalia"
#FILE = "mini_mammal"

system(command = paste0("mkdir -p ", LOC, FILE)) # creates a 
system(command = paste0("mv ", LOC, FILE,".fasta ", LOC, FILE))

MyD88_DD_MOUSE  <- read.table(paste0(LOC, "MYD88-DD_MOUSE.fasta"), sep = "\t")
MyD88_DD_HUMAN  <- read.table(paste0(LOC, "MYD88-DD_HUMAN.fasta"), sep = "\t")
TEST_FILE       <- read.table(paste0(LOC, FILE,"/",FILE,".fasta"), sep = "\t")
FASTA           <- bind_rows(MyD88_DD_MOUSE, MyD88_DD_HUMAN, TEST_FILE)
FILE_PATH <- paste0(LOC, FILE,"/",FILE,".06.fasta")
write.table(FASTA, FILE_PATH, quote = F, row.names = F, col.names = F)


# You can align using this function or just use the simplified version below

aln_db <- function(LOC, FILE, NUM = "", METHOD) {
  FASTA     <- readAAStringSet(paste0(LOC,FILE,"/",FILE, NUM,".fasta"))
  if (METHOD == "Muscle") {
    FASTA_SEQS <- msa::msa(inputSeqs = FASTA, method = "Muscle")
    FASTA_SEQS <- msa::msaConvert(FASTA_SEQS, "bios2mds::align")
    bios2mds::export.fasta(FASTA_SEQS, outfile = paste0(LOC,FILE,"/",FILE,".msa.",METHOD,".aln.fasta"))
    FASTA     <- paste0(LOC,FILE,"/",FILE,".msa.",METHOD,".aln.fasta")
  } else if (METHOD == "ClustalW") {
    FASTA_SEQS <- msa::msa(inputSeqs = FASTA, method = "ClustalW")
    FASTA_SEQS <- msa::msaConvert(FASTA_SEQS, "bios2mds::align")
    bios2mds::export.fasta(FASTA_SEQS, outfile = paste0(LOC,FILE,"/",FILE,".msa.",METHOD,".aln.fasta"))
    FASTA     <- paste0(LOC,FILE,"/",FILE,".msa.",METHOD,".aln.fasta")
  } else if (METHOD == "ClustalOmega") {
    FASTA_SEQS <- msa::msa(inputSeqs = FASTA, method = "ClustalOmega")
    FASTA_SEQS <- msa::msaConvert(FASTA_SEQS, "bios2mds::align")
    bios2mds::export.fasta(FASTA_SEQS, outfile = paste0(LOC,FILE,"/",FILE,".msa.",METHOD,".aln.fasta"))
    FASTA     <- paste0(LOC,FILE,"/",FILE,".msa.",METHOD,".aln.fasta")
  } else {
    print("Sorry. Please choose one of the msa options from above by unhashing the method of your choice.")
  }
}

FASTA  <- readAAStringSet(paste0(LOC,FILE,"/",FILE, ".06",".fasta"))
FASTA1 <- FASTA[grep("GN=Myd88", FASTA@ranges@NAMES)]
FASTA2 <- FASTA[grep("GN=MYD88", FASTA@ranges@NAMES)]
FASTA  <- c(FASTA1,FASTA2)
FASTA@ranges@NAMES <- unlist(lapply(strsplit(FASTA@ranges@NAMES, "OS=", fixed=TRUE), function(x) return(x[2])))
FASTA@ranges@NAMES <- unlist(lapply(strsplit(FASTA@ranges@NAMES, " PE=", fixed=TRUE), function(x) return(x[1])))
NMS    <- unique(FASTA@ranges@NAMES)  # gets rid of species duplicates, better overview, but loss of info, if you want to keep all individuals, then unhash the next line
#NMS    <- FASTA@ranges@NAMES         # to keep all individuals

# SIMPLIFIED VERSION FOR ALIGNMENT
FASTA_SEQS <- msa::msa(inputSeqs = FASTA[NMS], method = "ClustalOmega")
#FASTA_SEQS <- msa::msa(inputSeqs = FASTA, method = "ClustalOmega")
#FASTA_SEQS <- msa::msa(inputSeqs = FASTA, method = "Muscle")
FASTA_SEQS <- msa::msaConvert(FASTA_SEQS, "bios2mds::align")
bios2mds::export.fasta(FASTA_SEQS, outfile = paste0(LOC,FILE,"/",FILE,".05.msa.clustalOmega.aln.fasta"))

FASTA     <- paste0(LOC,FILE,"/",FILE,".05.msa.clustalOmega.aln.fasta")

LOC     = "~/Documents/Github/mscTayLab/fasta_files/"
NUM     = ".06"
METHOD  = "ClustalOmega" #c(Muscle, ClustalW, ClustalOmega)

#aln_db(LOC = LOC, FILE = FILE, NUM = NUM, METHOD = METHOD)

################################################################################
################################################################################
################################################################################

browse <- function(FASTA, BROWSE, HIGHLIGHT) {
  if (BROWSE == T) {
    dbConn <- dbConnect(SQLite(), ":memory:")
    Seqs2DB(FASTA, "FASTA", dbConn, paste0(FILE))
    desc <- dbGetQuery(dbConn, "select description from Seqs")
    Add2DB(data.frame(desc=desc, stringsAsFactors=FALSE), dbConn)
    Add2DB(data.frame(identifier=desc, stringsAsFactors=FALSE), dbConn)
    BrowseDB(dbConn)
    aa <- SearchDB(dbConn)
    #dbDisconnect(dbConn)
    amplicon <- subseq(aa, )
    names(amplicon) <- desc$description
    BrowseSeqs(amplicon, highlight = HIGHLIGHT)
  } else {
    print("not browsing Seqs in dbConn.")
  } 
}


FASTA     <- paste0(LOC,FILE,"/",FILE,".05.msa.clustalOmega.aln.fasta")
BROWSE  = T
#HIGHLIGHT = 156
browse(FASTA = FASTA, BROWSE = T, HIGHLIGHT = NA)


################################################################################
####  01_BROWSE_SEQS  ##########################################################
################################################################################
library(pacman)
pacman::p_load(tidyverse, DECIPHER, msa, Biostrings, bios2mds)

# (1) USE KALIGN TO FACILITATE MSA OF FASTA FILES (or the aln_db fct if you want, but kalign gives pretty good results)
# (2) SUPPLY THE ALIGNMENT FOR VISUALIZATION

LOC = "~/Documents/Github/mscTayLab/fasta_files/"
FILE = "bdld3"

# MAC-SPECIFIC system commands 
system(command = paste0("mkdir -p ", LOC, FILE)) # creates new folder named as your file
system(command = paste0("mv ", LOC, FILE,".fasta ", LOC, FILE)) # moves fasta to that folder, all new files (aln etc) will be created in here

MyD88_DD_MOUSE  <- read.table(paste0(LOC, "MYD88-DD_MOUSE.fasta"), sep = "\t")
MyD88_DD_HUMAN  <- read.table(paste0(LOC, "MYD88-DD_HUMAN.fasta"), sep = "\t")
TEST_FILE       <- read.table(paste0(LOC, FILE,"/",FILE,".fasta"), sep = "\t")
FASTA           <- bind_rows(MyD88_DD_MOUSE, MyD88_DD_HUMAN, TEST_FILE)
FILE_PATH <- paste0(LOC, FILE,"/",FILE,".adj.fasta")
write.table(FASTA, FILE_PATH, quote = F, row.names = F, col.names = F)

FASTA  <- readAAStringSet(paste0(LOC,FILE,"/",FILE,".adj.fasta"))
#FASTA1 <- FASTA[grep("GN=Myd88", FASTA@ranges@NAMES)] # filter for fastas that codes for MyD88
#FASTA2 <- FASTA[grep("GN=MYD88", FASTA@ranges@NAMES)] # filter for fastas that codes for MYD88
#FASTA  <- c(FASTA1,FASTA2) # join

# Adjust name from suuuuuper long and annoying to crisp species only
#FASTA@ranges@NAMES <- unlist(lapply(strsplit(FASTA@ranges@NAMES, "OS=", fixed=TRUE), function(x) return(x[2])))
#FASTA@ranges@NAMES <- unlist(lapply(strsplit(FASTA@ranges@NAMES, " PE=", fixed=TRUE), function(x) return(x[1])))
#NMS    <- unique(FASTA@ranges@NAMES)  # gets rid of species duplicates, better overview, but loss of info, if you want to keep all individuals, then unhash the next line
#NMS    <- FASTA@ranges@NAMES         # to keep all individuals

# FASTA   <- paste0(LOC,FILE,"/",FILE,".adj.fasta")
# LOC     = "~/Documents/Github/mscTayLab/fasta_files/"
# NUM     = ".adj"
# METHOD  = "Muscle" #c(Muscle, ClustalW, ClustalOmega)

# aln_db(LOC = LOC, FILE = FILE, NUM = NUM, METHOD = METHOD)

## ADJUST FILE NAME AS NEEDED, RUN THESE TWO LINES IN THE COMMAND LINE WITHIN THE DESIGNATED FOLDER

#FILE=bdld3
#kalign < ${FILE}.fasta > ${FILE}.msa.kalign.aln.fasta

################################################################################
################################################################################
################################################################################

LOC = "~/Documents/Github/mscTayLab/fasta_files/"
METHOD  = "kalign" #c(Muscle, ClustalW, ClustalOmega, kalign)

FASTA     <- paste0(LOC,FILE,"/",FILE,".msa.",METHOD,".aln.fasta") # load aln file for viewing
BROWSE  = T
START = NA #1055 #1020 # 1020 #470 #1080 #850
END = NA #1155 #1120 #1180 #630 #1200 #940
browse(FASTA = FASTA, BROWSE = T, HIGHLIGHT = NA, START = START, END = END)


################################################################################
### READ JSON ##################################################################
################################################################################
# library(rjson)
# test.json <- fromJSON(file = "/Volumes/TAYLOR-LAB-1/Finn/runs_af2c/00_BACTERIA/Nhal_1493_x6/ranking_all_221215_812974.json")
# chains <- as.data.frame(test.json$chains)
# chain_lengths <- as.data.frame(test.json$chain_lengths)
# clusters <- as.data.frame(test.json$clusters)



