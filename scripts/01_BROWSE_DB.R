################################################################################
####  01_BROWSE_SEQS  ##########################################################
################################################################################

source("https://raw.githubusercontent.com/tlobnow/mscTayLab/main/scripts/functions.R")

# (1) SUPPLY THE INPUT INFORMATION FOR VISUALIZATION

INDS    = list.files("~/Documents/Github/mscTayLab/fasta_files/GERDOL/")
INDS    = unlist(lapply(strsplit(INDS,   ".", fixed=TRUE), function(x) return(x[1])))  %>% unique()
LOC     = "~/Documents/Github/mscTayLab/fasta_files/GERDOL/"

RUN = F

if (RUN == T) {
  for (FILE in INDS) {
    dir.create(file.path(paste0(LOC, FILE)))
    file.copy(from = paste0(LOC, FILE, ".csv.fasta"), to = paste0(LOC, FILE, "/", FILE, ".fasta"))
    #DD_MOUSE  <- data.frame(V1 = c(">MyD88-DD_MOUSE", "RLSLFLNPRTPVAADWTLLAEEMGFEYLEIRELETRPDPTRSLLDAWQGRSGASVGRLLELLALLDREDILKELKSRISRIEEDCQKYLGKQQNQESE"))
    #DD_HUMAN  <- data.frame(V1 = c(">MyD88-DD_HUMAN", "RLSLFLNVRTQVAADWTALAEEMDFEYLEIRQLETQADPTGRLLDAWQGRPGASVGRLLELLTKLGRDDVLLELGPSIEEDCQKYILKQQQEEAE"))
    TIR_MOUSE <- data.frame(V1 = c(">MyD88-TIR_MOUSE", "ELFDAFICYCPNDIEFVQEMIRQLEQTDYRLKLCVSDRDVLPGTCVWSIASELIEKRCRRMVVVVSDDYLQSKECDFQTKFALSLSPGVQQKRLIPIKYKAMKKDFPSILRFITICDYTNPCTKSWFWTRLAKAL"))
    TIR_HUMAN <- data.frame(V1 = c(">MyD88-TIR_HUMAN", "ERFDAFICYCPSDIQFVQEMIRQLEQTNYRLKLCVSDRDVLPGTCVWSIASELIEKRCRRMVVVVSDDYLQSKECDFQTKFALSLSPGAHQKRLIPIKYKAMKKEFPSILRFITVCDYTNPCTKSWFWTRLAKAL"))
    
    TEST_FILE <- read.table(paste0(LOC, FILE,"/",FILE,".fasta"), sep = "\t")
    FASTA     <- bind_rows(#DD_MOUSE, DD_HUMAN, 
      TIR_MOUSE, TIR_HUMAN, TEST_FILE)
    FILE_PATH <- paste0(LOC, FILE,"/",FILE,".adj.fasta")
    write.table(FASTA, FILE_PATH, quote = F, row.names = F, col.names = F)
  }
}

if (RUN == T) {
  # (2) USE KALIGN TO FACILITATE MSA OF FASTA FILES (or the aln_db fct if you want, but kalign gives pretty good results)
  system(command = "for i in ~/Documents/Github/mscTayLab/fasta_files/GERDOL/*.fasta; do echo $(basename -a -s .csv.fasta $i); done > ~/Documents/Github/mscTayLab/fasta_files/INDS.txt")
  system(command = "parallel 'sh ~/Documents/Github/mscTayLab/scripts/run_kalign.sh {}' :::: ~/Documents/Github/mscTayLab/fasta_files/INDS.txt")
}

if (RUN == T) {
  for (i in 1:15) {
    FILE    = paste0("Gerdol_2017_ecTIR-DC_", i)
    METHOD  = "kalign" #c(Muscle, ClustalW, ClustalOmega, kalign)
    FASTA   = paste0(LOC,FILE,"/",FILE,".msa.",METHOD,".aln.fasta") # load aln file for viewing
    BROWSE  = F
    START = NA
    END   = NA
    browse(FASTA = FASTA, BROWSE = BROWSE, HIGHLIGHT = NA, START = START, END = END)
    PROMPT <- readline(prompt = paste0("Continue?"))
  }
}