################################################################################
####  02_SBATCH_EXTRACTION  ####################################################
################################################################################

library(tidyverse)
library(data.table)
library(rjson)

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
  EXTRACT       <- unique(EXTRACT)
  write.table(EXTRACT, file = paste0(OUT ,".csv"),sep = ",", append = T, quote = F, row.names = F, col.names = F)
}


################################################################################
### RUN SLURMEXTRACT ON BDLD ###################################################
################################################################################

# for (i in 1:84) {
#   for (j in 1:5) {
#     JSON  = paste0("/Volumes/TAYLOR-LAB/Finn/RESULTS/BDLD_LIBRARY/bdld3_",i,"_x6/ranking.json")
#     SLURM = paste0("/Volumes/TAYLOR-LAB/Finn/RESULTS/BDLD_LIBRARY/bdld3_",i,"_x6/slurm.out")
#     RANK = j
#     OUT = '~/Documents/Github/mscTayLab/csv/BDLD'
#     slurmExtract(JSON = JSON, SLURM = SLURM, RANK = RANK, OUT = OUT)
#   }
# }
# 
# for (i in c(1,2,3,4,6,7,9,10,11,12,13,14,17,18,21,23,25,26,27,28,30,31,32,33,35,36,38,39,41,42,43,44,45,46,48,49,50,51,54,55,56,57,58,59,61,62,64,65,66,67,69,71,73,74,76,77,78,79,82,84)) {
#   for (j in 1:5) {
#     JSON  = paste0("/Volumes/TAYLOR-LAB/Finn/RESULTS/BDLD_LIBRARY/bdld3_",i,"_x10/ranking.json")
#     SLURM = paste0("/Volumes/TAYLOR-LAB/Finn/RESULTS/BDLD_LIBRARY/bdld3_",i,"_x10/slurm.out")
#     RANK = j
#     OUT = '~/Documents/Github/mscTayLab/csv/BDLD'
#     slurmExtract(JSON = JSON, SLURM = SLURM, RANK = RANK, OUT = OUT)
#   }
# }

################################################################################
### RUN SLURMEXTRACT ON TIR-DC FAMILIES ########################################
################################################################################

# TIR DC1       --> repeat 7!
# TIR DC1 trim  --> repeat 7!
# TIR DC2       --> check if it restarted properly!
# TIR DC2 trim  --> check if it restarted properly!
# TIR DC3       --> TOO LONG!
# TIR DC3 trim R--> DONE!
# TIR DC3 trim L--> 
# TIR DC4       --> DONE!
# TIR DC5  --> 
# TIR DC6  --> 
# TIR DC7  --> 
# TIR DC8  --> 
# TIR DC9  --> 
# TIR DC10 --> 
# TIR DC11 --> 
# TIR DC12 --> 
# TIR DC13 --> 
# TIR DC14 --> 
# TIR DC15 --> 


# for (h in 1) {
#   for (i in 1:6) { # PLS REDO FOR TIR_DC_1_7 ONCE IT RAN!
#     for (j in 1:5) {
#       JSON  = paste0("/Volumes/TAYLOR-LAB/Finn/RESULTS/TIR_DC_LIBRARY/TIR_DC",h,"/TIR_DC",h,"_",i,"_x6/ranking.json")
#       SLURM = paste0("/Volumes/TAYLOR-LAB/Finn/RESULTS/TIR_DC_LIBRARY/TIR_DC",h,"/TIR_DC",h,"_",i,"_x6/slurm.out")
#       RANK = j
#       OUT = '~/Documents/Github/mscTayLab/csv/TIR'
#       slurmExtract(JSON = JSON, SLURM = SLURM, RANK = RANK, OUT = OUT)
#     }
#     for (j in 1:5) {
#       JSON  = paste0("/Volumes/TAYLOR-LAB/Finn/RESULTS/TIR_DC_LIBRARY/TIR_DC",h,"/TIR_DC",h,"_trim_",i,"_x6/ranking.json")
#       SLURM = paste0("/Volumes/TAYLOR-LAB/Finn/RESULTS/TIR_DC_LIBRARY/TIR_DC",h,"/TIR_DC",h,"_trim_",i,"_x6/slurm.out")
#       RANK = j
#       OUT = '~/Documents/Github/mscTayLab/csv/TIR'
#       slurmExtract(JSON = JSON, SLURM = SLURM, RANK = RANK, OUT = OUT)
#     }
#   }
# }
# 
# for (h in 4) {
#   for (i in 8) {
#     for (j in 1:5) {
#       JSON  = paste0("/Volumes/TAYLOR-LAB/Finn/RESULTS/TIR_DC_LIBRARY/TIR_DC",h,"/TIR_DC",h,"_",i,"_x6/ranking.json")
#       SLURM = paste0("/Volumes/TAYLOR-LAB/Finn/RESULTS/TIR_DC_LIBRARY/TIR_DC",h,"/TIR_DC",h,"_",i,"_x6/slurm.out")
#       RANK = j
#       OUT = '~/Documents/Github/mscTayLab/csv/TIR'
#       slurmExtract(JSON = JSON, SLURM = SLURM, RANK = RANK, OUT = OUT)
#     }
#   }
# }

# for (h in 3) {
#   for (i in 1:21) {
#     for (j in 1:5) {
#       JSON  = paste0("/Volumes/TAYLOR-LAB/Finn/RESULTS/TIR_DC_LIBRARY/TIR_DC",h,"/TIR_DC",h,"_trim_R_",i,"_x6/ranking.json")
#       SLURM = paste0("/Volumes/TAYLOR-LAB/Finn/RESULTS/TIR_DC_LIBRARY/TIR_DC",h,"/TIR_DC",h,"_trim_R_",i,"_x6/slurm.out")
#       RANK = j
#       OUT = '~/Documents/Github/mscTayLab/csv/TIR'
#       slurmExtract(JSON = JSON, SLURM = SLURM, RANK = RANK, OUT = OUT)
#     }
#     # for (j in 1:5) {
#     #   JSON  = paste0("/Volumes/TAYLOR-LAB/Finn/RESULTS/TIR_DC_LIBRARY/TIR_DC",h,"/TIR_DC",h,"_trim_L_",i,"_x6/ranking.json")
#     #   SLURM = paste0("/Volumes/TAYLOR-LAB/Finn/RESULTS/TIR_DC_LIBRARY/TIR_DC",h,"/TIR_DC",h,"_trim_L_",i,"_x6/slurm.out")
#     #   RANK = j
#     #   OUT = '~/Documents/Github/mscTayLab/csv/TIR'
#     #   slurmExtract(JSON = JSON, SLURM = SLURM, RANK = RANK, OUT = OUT)
#     # }
#   }
# }

################################################################################
### RUN SLURMEXTRACT ON CONTROLS ###############################################
################################################################################

# CNTRL    = list.files("/Volumes/TAYLOR-LAB/Finn/RESULTS/CNTRL/")
# CNTRL    = unlist(lapply(strsplit(CNTRL,   ".", fixed=TRUE), function(x) return(x[1])))  %>% unique()
# 
# for (FILE in CNTRL) {
#   for (j in 1:5) {
#     JSON  = paste0("/Volumes/TAYLOR-LAB/Finn/RESULTS/CNTRL/",FILE,"/ranking.json")
#     SLURM = paste0("/Volumes/TAYLOR-LAB/Finn/RESULTS/CNTRL/",FILE,"/slurm.out")
#     RANK = j
#     OUT = '~/Documents/Github/mscTayLab/csv/CNTRL'
#     slurmExtract(JSON = JSON, SLURM = SLURM, RANK = RANK, OUT = OUT)
#   }
# }

################################################################################
### RUN SLURMEXTRACT ON SYNTHETIC COMPLEXES ####################################
################################################################################

# SYNTHETIC    = list.files("/Volumes/TAYLOR-LAB/Finn/RESULTS/SYNTHETIC/")
# SYNTHETIC    = unlist(lapply(strsplit(SYNTHETIC,   ".", fixed=TRUE), function(x) return(x[1])))  %>% unique()
# 
# for (FILE in SYNTHETIC) {
#   for (j in 1:5) {
#     JSON  = paste0("/Volumes/TAYLOR-LAB/Finn/RESULTS/SYNTHETIC/",FILE,"/ranking.json")
#     SLURM = paste0("/Volumes/TAYLOR-LAB/Finn/RESULTS/SYNTHETIC/",FILE,"/slurm.out")
#     RANK = j
#     OUT = '~/Documents/Github/mscTayLab/csv/SYNTHETIC'
#     slurmExtract(JSON = JSON, SLURM = SLURM, RANK = RANK, OUT = OUT)
#   }
# }

################################################################################
### COMBINE DFs ################################################################
################################################################################

# TIR PREP
TIR    <- read.csv("~/Documents/Github/mscTayLab/csv/TIR.csv", header = F) %>% mutate(ORIGIN = "TIR", DC  = V1) 
TIR$DC <- unlist(lapply(strsplit(TIR$DC, "_", fixed=TRUE), function(x) return(x[2])))
TIR$DC <- as.numeric(unlist(lapply(strsplit(TIR$DC, "DC", fixed=TRUE), function(x) return(x[2]))))

# BDLD
BDLD      <- read.csv("~/Documents/Github/mscTayLab/csv/BDLD.csv",  header = F) %>% mutate(ORIGIN = "BDLD")
BDLD_LIB  <- read.csv("~/Documents/Github/mscTayLab/csv/bDLD3_library.csv", na.strings = c("", " ", "NA", NA))
BDLD_LIB$Species <- unlist(lapply(strsplit(BDLD_LIB$Sequence_FL, "OS=", fixed=TRUE), function(x) return(x[2])))
BDLD_LIB$Species <- unlist(lapply(strsplit(BDLD_LIB$Species, " OX=", fixed=TRUE), function(x) return(x[1])))

# OTHER
CNTRL     <- read.csv("~/Documents/Github/mscTayLab/csv/CNTRL.csv", header = F) %>% mutate(ORIGIN = "CNTRL")
SYNTHETIC <- read.csv("~/Documents/Github/mscTayLab/csv/SYNTHETIC.csv", header = F) %>% mutate(ORIGIN = "SYNTHETIC")

TIR_LIB  <- read.csv("~/Documents/Github/mscTayLab/csv/tir_library.csv", na.strings = c("", " ", "NA", NA))

# COMBINE DATAFRAMES
SE <- bind_rows(BDLD, TIR, CNTRL, SYNTHETIC) %>% 
  setnames(old = c("V1", "V2", "V3", "V4", "V5", "V6", "V7", "V8", "V9", "V10", "V11", "V12"), new = c("FILE", "MODEL", "TOL", "pLDDT", "pTM", "piTM", "iScore", "iRes", "iCnt", "RANK", "FILE_MODEL", "NUM_CLUSTERS"), skip_absent = T) %>%
  mutate(FILE_MODEL = paste(FILE, MODEL, sep = "_"))
  # retain model number only (as numeric column)
  SE$MODEL <- as.numeric(unlist(lapply(strsplit(SE$MODEL, "_", fixed=TRUE), function(x) return(x[2]))))
  # separate N_MULTIMERS to use for normalization of buried interfaces
  SE       <- separate(data = SE, col = FILE, sep = "_x",  into = c("FILE", "N_MULTIMERS"), convert = T)
  
  # ADD SPECIES INFORMATION FROM bDLD
  SE <- full_join(SE, BDLD_LIB) %>% filter(!is.na(FILE))
  #SE <- full_join(SE, TIR_LIB)  %>% filter(!is.na(FILE))


# WRITE FILE
write.csv(SE, file = "~/Documents/Github/mscTayLab/csv/01_SLURM_EXTRACTED.csv", row.names = F)
