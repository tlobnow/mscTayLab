################################################################################
####  FUNCTIONS ################################################################
################################################################################
library(pacman)
pacman::p_load(tidyverse, DECIPHER, msa, Biostrings, bios2mds)

###
### FUNCTION TO CREATE A MSA USING DECIPHER ####################################
###
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

###
### FUNCTION TO BROWSE AN ALIGNMENT USING AN SQL-BASED dbCONN ##################
###
browse <- function(FASTA, BROWSE, HIGHLIGHT = NA, START = NA, END = NA) {
  if (BROWSE == T) {
    dbConn <- dbConnect(SQLite(), ":memory:")
    Seqs2DB(FASTA, "FASTA", dbConn, paste0(FILE))
    desc <- dbGetQuery(dbConn, "select description from Seqs")
    Add2DB(data.frame(desc=desc, stringsAsFactors=FALSE), dbConn)
    Add2DB(data.frame(identifier=desc, stringsAsFactors=FALSE), dbConn)
    BrowseDB(dbConn)
    aa <- SearchDB(dbConn)
    #dbDisconnect(dbConn)
    amplicon <- subseq(aa, start = START, end = END)
    names(amplicon) <- desc$description
    BrowseSeqs(amplicon, highlight = HIGHLIGHT)
  } else {
    print("not browsing Seqs in dbConn.")
  } 
}

### FUNCTION TO EXTRACT AF2C-MODEL-INFORMATION FROM ############################
### RANKING.json AND  MERGED SLURM-JOB OUTPUT FILES ############################
###
slurmExtract <- function(JSON, SLURM, RANK, OUT) {
  result <- rjson::fromJSON(file = JSON)
  order <- as.data.frame(result[["order"]])
  colnames(order)[colnames(order)%in%'result[["order"]]'] <- "ORDER"
  order$ORDER[grep("*_recycled_*", order$ORDER)] <- "F"
  order <- order %>% filter(ORDER != "F")
  top <- order$ORDER[RANK]
  SLURM        <- read.table(SLURM, sep = "\t")
  SLURM        <- SLURM %>% mutate(RECYCLED = F, TOP = F, INFO = F)
  SLURM$RECYCLED[grep("*_recycled_*", SLURM$V1)] <- T
  SLURM$TOP[grep(top, SLURM$V1)] <- T
  SLURM$INFO[grep("*Info:*", SLURM$V1)] <- T
  keep = which(SLURM$RECYCLED == F & SLURM$TOP == T & SLURM$INFO == T) + 1
  SLURM1       <- SLURM %>% filter(RECYCLED == F & TOP == T & INFO == T) %>% select(V1)
  SLURM2       <- SLURM %>% slice(keep) %>% select(V1)
  SLURM2       <- separate(data = SLURM2, col = V1,   sep = " = ", into = c("V1", "NUM_CLUSTERS", "CLUSTER_SIZES", "CLUSTERS"), convert = T)
  SLURM2$NUM_CLUSTERS  <- as.numeric(unlist(lapply(strsplit(SLURM2$NUM_CLUSTERS, ", ", fixed=TRUE), function(x) return(x[1]))))
  SLURM2$NUM_CLUSTERS  <- str_replace(SLURM2$NUM_CLUSTERS, ",", "_")
  SLURM2$NUM_CLUSTERS  <- str_replace(SLURM2$NUM_CLUSTERS, " ", "_")
  SLURM2$NUM_CLUSTERS  <- str_replace(SLURM2$NUM_CLUSTERS, "/", "_")
  SLURM2$CLUSTER_SIZES <- unlist(lapply(strsplit(SLURM2$CLUSTER_SIZES, ",  clusters", fixed=TRUE), function(x) return(x[1])))
  SLURM2$CLUSTER_SIZES <- str_replace(SLURM2$CLUSTER_SIZES, ",", "_")
  SLURM2$CLUSTER_SIZES <- str_replace(SLURM2$CLUSTER_SIZES, " ", "_")
  SLURM2$CLUSTER_SIZES <- str_replace(SLURM2$CLUSTER_SIZES, "/", "_")
  SLURM2$CLUSTERS      <- str_replace(SLURM2$CLUSTERS, ",", "_")
  SLURM2$CLUSTERS      <- str_replace(SLURM2$CLUSTERS, " ", "_")
  SLURM1        <- separate(data = SLURM1, col = V1,   sep = ",",   into = c("NAME", "TOL", "pLDDT", "pTM", "piTM", "iScore", "iRes"), convert = T)
  SLURM1        <- separate(data = SLURM1, col = NAME, sep = " ",   into = c("INFO", "FILE", "MODEL", "PERFORMED", "X", "CYCLE"), convert = T)
  SLURM1$TOL    <- as.numeric(unlist(lapply(strsplit(SLURM1$TOL,   "= ", fixed=TRUE), function(x) return(x[2]))))
  SLURM1$pLDDT  <- as.numeric(unlist(lapply(strsplit(SLURM1$pLDDT, "= ", fixed=TRUE), function(x) return(x[2]))))
  SLURM1$pTM    <- as.numeric(unlist(lapply(strsplit(SLURM1$pTM,   "= ", fixed=TRUE), function(x) return(x[2]))))
  SLURM1$piTM   <- as.numeric(unlist(lapply(strsplit(SLURM1$piTM,  "= ", fixed=TRUE), function(x) return(x[2]))))
  SLURM1$iScore <- as.numeric(unlist(lapply(strsplit(SLURM1$iScore,"= ", fixed=TRUE), function(x) return(x[2]))))
  SLURM1        <- separate(data = SLURM1, col = iRes, sep =  "iCnt = ", into = c("iRes", "iCnt"), convert = T)
  SLURM1$iRes   <- as.numeric(unlist(lapply(strsplit(SLURM1$iRes,  "= ", fixed=TRUE), function(x) return(x[2]))))
  SLURM1$iCnt   <- as.numeric(SLURM1$iCnt)
  SLURM         <- bind_cols(SLURM1, SLURM2)
  EXTRACT       <- SLURM %>% mutate(RANKING = RANK, FILE_MODEL = paste(FILE, MODEL, sep = "_")) %>% select(FILE, MODEL, TOL, pLDDT, pTM, piTM, iScore, iRes, iCnt, RANKING, FILE_MODEL, NUM_CLUSTERS)
  EXTRACT$MODEL <- unlist(lapply(strsplit(EXTRACT$MODEL, "_multimer", fixed=TRUE), function(x) return(x[1])))
  write.table(EXTRACT, file = paste0(OUT ,".csv"),sep = ",", append = T, quote = F, row.names = F, col.names = F)
}


### FUNCTION TO EXTRACT FASTA-PARTS BASED ON PATTERN & EXTRACT THE LINKER LENGTHS ###
Trim_Loop <- function(consensus_DD, consensus_TIR, fasta_frame){
  for (x in 1:dim(fasta_frame)[1]) {
    subject <- fasta_frame$SEQUENCE[x]
    i <- nchar(subject) #length of subject
    s <- 1 #starting value for trimming
    m_DD  <- matchPattern(pattern = consensus_DD,  subject, max.mismatch = 2)
    m_TIR <- matchPattern(pattern = consensus_TIR, subject, max.mismatch = 2)
    #use the matchPattern function to find first match of consensus in subject 
    if(length(m_DD@ranges@start) == 1 && length(m_TIR@ranges@start) == 1){
      while(m_DD@ranges@start != 1){
        s <- s+1
        sub_subject <- substring(subject, s, i)
        m_DD <- matchPattern(pattern = consensus_DD, sub_subject, max.mismatch = 2)
      }
      m_TIR <- matchPattern(pattern = consensus_TIR, subject, max.mismatch = 2)
      u <- nchar(sub_subject)
      while((m_TIR@ranges@start+m_TIR@ranges@width-1) != nchar(sub_subject)){
        u <- u-1
        sub_subject <- substring(sub_subject, 1, u) #trim now from the sequence matched and trimmed for DD_consensus
        m_TIR <- matchPattern(pattern = consensus_TIR, sub_subject, max.mismatch = 2)
      }
      fasta_frame$TRIMMED_SEQUENCE[x] = sub_subject
      #print(paste0(i, sub_subject))
    }
    else{
      fasta_frame$TRIMMED_SEQUENCE[x] = NA
      #print(paste0(i, NA))
    }
  }
  fasta_frame <<- fasta_frame
}


### FUNCTION TO TURN A CSV FILE INTO FASTA #####################################
# FILE = XXX.csv
# LOC_IN = CSV PATH
# LOC_OUT = FASTA PATH
csv2fasta <- function(FILE, LOC_IN, LOC_OUT) {
  PREP <- read.csv(paste0(LOC_IN, FILE)) %>% 
    mutate(PRE_FASTA_1 = ">", PRE_FASTA_2 = paste0(PRE_FASTA_1, Protein.name)) %>%
    select(PRE_FASTA_2, Sequence)
  
  PREP <- PREP %>% 
    pivot_longer(names_to = "DISCARD", values_to = "FASTA", cols = c(PRE_FASTA_2, Sequence)) %>%
    select(-DISCARD)
  
  write.table(PREP, paste0(LOC_OUT,FILE, ".fasta"), quote = F, row.names = F, col.names = F)
}
