################################################################################
####  02_SBATCH_EVALUATION  ####################################################
################################################################################

library(tidyverse)

SE <- read.csv("~/Documents/Github/mscTayLab/csv/01_SLURM_EXTRACTED.csv")

#VIS %in% [CANDIDATE, CANDIDATE_low, OTHER, linear, none]
SE$VIS       <- c(NA)
SE$BURIED    <- c(NA)

SE$VIS[SE$FILE_MODEL %in% "bdld3_1_x6_model_1"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_1_x6_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_1_x6_model_3"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_1_x6_model_4"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_1_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_1_x6_model_1"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_1_x6_model_2"] <- 4
SE$BURIED[SE$FILE_MODEL %in% "bdld3_1_x6_model_3"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_1_x6_model_4"] <- 4
SE$BURIED[SE$FILE_MODEL %in% "bdld3_1_x6_model_5"] <- 5

SE$VIS[SE$FILE_MODEL %in% "bdld3_2_x6_model_1"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_2_x6_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_2_x6_model_3"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_2_x6_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_2_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_2_x6_model_1"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_2_x6_model_2"] <- 6
SE$BURIED[SE$FILE_MODEL %in% "bdld3_2_x6_model_3"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_2_x6_model_4"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_2_x6_model_5"] <- 5

SE$VIS[SE$FILE_MODEL %in% "bdld3_3_x6_model_1"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_3_x6_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_3_x6_model_3"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_3_x6_model_4"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_3_x6_model_5"] <- 'CANDIDATE_low'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_3_x6_model_1"] <- 3
SE$BURIED[SE$FILE_MODEL %in% "bdld3_3_x6_model_2"] <- 4
SE$BURIED[SE$FILE_MODEL %in% "bdld3_3_x6_model_3"] <- 3
SE$BURIED[SE$FILE_MODEL %in% "bdld3_3_x6_model_4"] <- 3
SE$BURIED[SE$FILE_MODEL %in% "bdld3_3_x6_model_5"] <- 2

SE$VIS[SE$FILE_MODEL %in% "bdld3_4_x6_model_1"] <- 'CANDIDATE'
SE$VIS[SE$FILE_MODEL %in% "bdld3_4_x6_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_4_x6_model_3"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_4_x6_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_4_x6_model_5"] <- 'CANDIDATE_low'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_4_x6_model_1"] <- 10
SE$BURIED[SE$FILE_MODEL %in% "bdld3_4_x6_model_2"] <- 4
SE$BURIED[SE$FILE_MODEL %in% "bdld3_4_x6_model_3"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_4_x6_model_4"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_4_x6_model_5"] <- 5

SE$VIS[SE$FILE_MODEL %in% "bdld3_5_x6_model_1"] <- 'OTHER'
SE$VIS[SE$FILE_MODEL %in% "bdld3_5_x6_model_2"] <- 'DIMER'
SE$VIS[SE$FILE_MODEL %in% "bdld3_5_x6_model_3"] <- 'DIMER'
SE$VIS[SE$FILE_MODEL %in% "bdld3_5_x6_model_4"] <- 'DIMER'
SE$VIS[SE$FILE_MODEL %in% "bdld3_5_x6_model_5"] <- 'none'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_5_x6_model_1"] <- 1
SE$BURIED[SE$FILE_MODEL %in% "bdld3_5_x6_model_2"] <- 3
SE$BURIED[SE$FILE_MODEL %in% "bdld3_5_x6_model_3"] <- 3
SE$BURIED[SE$FILE_MODEL %in% "bdld3_5_x6_model_4"] <- 3
SE$BURIED[SE$FILE_MODEL %in% "bdld3_5_x6_model_5"] <- 0


SE$VIS[SE$FILE_MODEL %in% "bdld3_6_x6_model_1"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_6_x6_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_6_x6_model_3"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_6_x6_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_6_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_6_x6_model_1"] <- 6
SE$BURIED[SE$FILE_MODEL %in% "bdld3_6_x6_model_2"] <- 6
SE$BURIED[SE$FILE_MODEL %in% "bdld3_6_x6_model_3"] <- 3
SE$BURIED[SE$FILE_MODEL %in% "bdld3_6_x6_model_4"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_6_x6_model_5"] <- 4

SE$VIS[SE$FILE_MODEL %in% "bdld3_7_x6_model_1"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_7_x6_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_7_x6_model_3"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_7_x6_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_7_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_7_x6_model_1"] <- 2
SE$BURIED[SE$FILE_MODEL %in% "bdld3_7_x6_model_2"] <- 2
SE$BURIED[SE$FILE_MODEL %in% "bdld3_7_x6_model_3"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_7_x6_model_4"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_7_x6_model_5"] <- 5

SE$VIS[SE$FILE_MODEL %in% "bdld3_8_x6_model_1"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_8_x6_model_2"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_8_x6_model_3"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_8_x6_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_8_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_8_x6_model_1"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_8_x6_model_2"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_8_x6_model_3"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_8_x6_model_4"] <- 6
SE$BURIED[SE$FILE_MODEL %in% "bdld3_8_x6_model_5"] <- 5

SE$VIS[SE$FILE_MODEL %in% "bdld3_9_x6_model_1"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_9_x6_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_9_x6_model_3"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_9_x6_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_9_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_9_x6_model_1"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_9_x6_model_2"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_9_x6_model_3"] <- 6
SE$BURIED[SE$FILE_MODEL %in% "bdld3_9_x6_model_4"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_9_x6_model_5"] <- 5

SE$VIS[SE$FILE_MODEL %in% "bdld3_10_x6_model_1"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_10_x6_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_10_x6_model_3"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_10_x6_model_4"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_10_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_10_x6_model_1"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_10_x6_model_2"] <- 6
SE$BURIED[SE$FILE_MODEL %in% "bdld3_10_x6_model_3"] <- 3
SE$BURIED[SE$FILE_MODEL %in% "bdld3_10_x6_model_4"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_10_x6_model_5"] <- 5

SE$VIS[SE$FILE_MODEL %in% "bdld3_11_x6_model_1"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_11_x6_model_2"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_11_x6_model_3"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_11_x6_model_4"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_11_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_11_x6_model_1"] <- 4
SE$BURIED[SE$FILE_MODEL %in% "bdld3_11_x6_model_2"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_11_x6_model_3"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_11_x6_model_4"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_11_x6_model_5"] <- 5

SE$VIS[SE$FILE_MODEL %in% "bdld3_12_x6_model_1"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_12_x6_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_12_x6_model_3"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_12_x6_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_12_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_12_x6_model_1"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_12_x6_model_2"] <- 3
SE$BURIED[SE$FILE_MODEL %in% "bdld3_12_x6_model_3"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_12_x6_model_4"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_12_x6_model_5"] <- 5

SE$VIS[SE$FILE_MODEL %in% "bdld3_13_x6_model_1"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_13_x6_model_2"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_13_x6_model_3"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_13_x6_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_13_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_13_x6_model_1"] <- 6
SE$BURIED[SE$FILE_MODEL %in% "bdld3_13_x6_model_2"] <- 3
SE$BURIED[SE$FILE_MODEL %in% "bdld3_13_x6_model_3"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_13_x6_model_4"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_13_x6_model_5"] <- 5

SE$VIS[SE$FILE_MODEL %in% "bdld3_14_x6_model_1"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_14_x6_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_14_x6_model_3"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_14_x6_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_14_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_14_x6_model_1"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_14_x6_model_2"] <- 3
SE$BURIED[SE$FILE_MODEL %in% "bdld3_14_x6_model_3"] <- 6
SE$BURIED[SE$FILE_MODEL %in% "bdld3_14_x6_model_4"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_14_x6_model_5"] <- 5

SE$VIS[SE$FILE_MODEL %in% "bdld3_15_x6_model_1"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_15_x6_model_2"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_15_x6_model_3"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_15_x6_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_15_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_15_x6_model_1"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_15_x6_model_2"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_15_x6_model_3"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_15_x6_model_4"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_15_x6_model_5"] <- 5

SE$VIS[SE$FILE_MODEL %in% "bdld3_16_x6_model_1"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_16_x6_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_16_x6_model_3"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_16_x6_model_4"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_16_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_16_x6_model_1"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_16_x6_model_2"] <- 4
SE$BURIED[SE$FILE_MODEL %in% "bdld3_16_x6_model_3"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_16_x6_model_4"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_16_x6_model_5"] <- 5

SE$VIS[SE$FILE_MODEL %in% "bdld3_17_x6_model_1"] <- 'CANDIDATE'
SE$VIS[SE$FILE_MODEL %in% "bdld3_17_x6_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_17_x6_model_3"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_17_x6_model_4"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_17_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_17_x6_model_1"] <- 8
SE$BURIED[SE$FILE_MODEL %in% "bdld3_17_x6_model_2"] <- 4
SE$BURIED[SE$FILE_MODEL %in% "bdld3_17_x6_model_3"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_17_x6_model_4"] <- 7
SE$BURIED[SE$FILE_MODEL %in% "bdld3_17_x6_model_5"] <- 5

SE$VIS[SE$FILE_MODEL %in% "bdld3_18_x6_model_1"] <- 'DIMER'
SE$VIS[SE$FILE_MODEL %in% "bdld3_18_x6_model_2"] <- 'OTHER'
SE$VIS[SE$FILE_MODEL %in% "bdld3_18_x6_model_3"] <- 'DIMER'
SE$VIS[SE$FILE_MODEL %in% "bdld3_18_x6_model_4"] <- 'DIMER'
SE$VIS[SE$FILE_MODEL %in% "bdld3_18_x6_model_5"] <- 'OTHER'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_18_x6_model_1"] <- 3
SE$BURIED[SE$FILE_MODEL %in% "bdld3_18_x6_model_2"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_18_x6_model_3"] <- 3
SE$BURIED[SE$FILE_MODEL %in% "bdld3_18_x6_model_4"] <- 3
SE$BURIED[SE$FILE_MODEL %in% "bdld3_18_x6_model_5"] <- 4

SE$VIS[SE$FILE_MODEL %in% "bdld3_19_x6_model_1"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_19_x6_model_2"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_19_x6_model_3"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_19_x6_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_19_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_19_x6_model_1"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_19_x6_model_2"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_19_x6_model_3"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_19_x6_model_4"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_19_x6_model_5"] <- 5

SE$VIS[SE$FILE_MODEL %in% "bdld3_20_x6_model_1"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_20_x6_model_2"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_20_x6_model_3"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_20_x6_model_4"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_20_x6_model_5"] <- 'none'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_20_x6_model_1"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_20_x6_model_2"] <- 1
SE$BURIED[SE$FILE_MODEL %in% "bdld3_20_x6_model_3"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_20_x6_model_4"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_20_x6_model_5"] <- 0

SE$VIS[SE$FILE_MODEL %in% "bdld3_21_x6_model_1"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_21_x6_model_2"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_21_x6_model_3"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_21_x6_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_21_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_21_x6_model_1"] <- 6
SE$BURIED[SE$FILE_MODEL %in% "bdld3_21_x6_model_2"] <- 3
SE$BURIED[SE$FILE_MODEL %in% "bdld3_21_x6_model_3"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_21_x6_model_4"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_21_x6_model_5"] <- 5

SE$VIS[SE$FILE_MODEL %in% "bdld3_22_x6_model_1"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_22_x6_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_22_x6_model_3"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_22_x6_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_22_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_22_x6_model_1"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_22_x6_model_2"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_22_x6_model_3"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_22_x6_model_4"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_22_x6_model_5"] <- 4

SE$VIS[SE$FILE_MODEL %in% "bdld3_23_x6_model_1"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_23_x6_model_2"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_23_x6_model_3"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_23_x6_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_23_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_23_x6_model_1"] <- 4
SE$BURIED[SE$FILE_MODEL %in% "bdld3_23_x6_model_2"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_23_x6_model_3"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_23_x6_model_4"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_23_x6_model_5"] <- 5

SE$VIS[SE$FILE_MODEL %in% "bdld3_24_x6_model_1"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_24_x6_model_2"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_24_x6_model_3"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_24_x6_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_24_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_24_x6_model_1"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_24_x6_model_2"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_24_x6_model_3"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_24_x6_model_4"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_24_x6_model_5"] <- 5

SE$VIS[SE$FILE_MODEL %in% "bdld3_25_x6_model_1"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_25_x6_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_25_x6_model_3"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_25_x6_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_25_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_25_x6_model_1"] <- 7
SE$BURIED[SE$FILE_MODEL %in% "bdld3_25_x6_model_2"] <- 4
SE$BURIED[SE$FILE_MODEL %in% "bdld3_25_x6_model_3"] <- 7
SE$BURIED[SE$FILE_MODEL %in% "bdld3_25_x6_model_4"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_25_x6_model_5"] <- 5

SE$VIS[SE$FILE_MODEL %in% "bdld3_26_x6_model_1"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_26_x6_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_26_x6_model_3"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_26_x6_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_26_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_26_x6_model_1"] <- 6
SE$BURIED[SE$FILE_MODEL %in% "bdld3_26_x6_model_2"] <- 2
SE$BURIED[SE$FILE_MODEL %in% "bdld3_26_x6_model_3"] <- 4
SE$BURIED[SE$FILE_MODEL %in% "bdld3_26_x6_model_4"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_26_x6_model_5"] <- 5

SE$VIS[SE$FILE_MODEL %in% "bdld3_27_x6_model_1"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_27_x6_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_27_x6_model_3"] <- 'CANDIDATE'
SE$VIS[SE$FILE_MODEL %in% "bdld3_27_x6_model_4"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_27_x6_model_5"] <- 'CANDIDATE'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_27_x6_model_1"] <- 6
SE$BURIED[SE$FILE_MODEL %in% "bdld3_27_x6_model_2"] <- 2
SE$BURIED[SE$FILE_MODEL %in% "bdld3_27_x6_model_3"] <- 9
SE$BURIED[SE$FILE_MODEL %in% "bdld3_27_x6_model_4"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_27_x6_model_5"] <- 8

SE$VIS[SE$FILE_MODEL %in% "bdld3_28_x6_model_1"] <- 'CANDIDATE'
SE$VIS[SE$FILE_MODEL %in% "bdld3_28_x6_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_28_x6_model_3"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_28_x6_model_4"] <- 'CANDIDATE'
SE$VIS[SE$FILE_MODEL %in% "bdld3_28_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_28_x6_model_1"] <- 6
SE$BURIED[SE$FILE_MODEL %in% "bdld3_28_x6_model_2"] <- 4
SE$BURIED[SE$FILE_MODEL %in% "bdld3_28_x6_model_3"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_28_x6_model_4"] <- 8
SE$BURIED[SE$FILE_MODEL %in% "bdld3_28_x6_model_5"] <- 5

SE$VIS[SE$FILE_MODEL %in% "bdld3_29_x6_model_1"] <- 'DIMER'
SE$VIS[SE$FILE_MODEL %in% "bdld3_29_x6_model_2"] <- 'OTHER'
SE$VIS[SE$FILE_MODEL %in% "bdld3_29_x6_model_3"] <- 'DIMER'
SE$VIS[SE$FILE_MODEL %in% "bdld3_29_x6_model_4"] <- 'DIMER'
SE$VIS[SE$FILE_MODEL %in% "bdld3_29_x6_model_5"] <- 'OTHER'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_29_x6_model_1"] <- 3
SE$BURIED[SE$FILE_MODEL %in% "bdld3_29_x6_model_2"] <- 1
SE$BURIED[SE$FILE_MODEL %in% "bdld3_29_x6_model_3"] <- 4
SE$BURIED[SE$FILE_MODEL %in% "bdld3_29_x6_model_4"] <- 3
SE$BURIED[SE$FILE_MODEL %in% "bdld3_29_x6_model_5"] <- 1

SE$VIS[SE$FILE_MODEL %in% "bdld3_30_x6_model_1"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_30_x6_model_2"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_30_x6_model_3"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_30_x6_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_30_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_30_x6_model_1"] <- 3
SE$BURIED[SE$FILE_MODEL %in% "bdld3_30_x6_model_2"] <- 4
SE$BURIED[SE$FILE_MODEL %in% "bdld3_30_x6_model_3"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_30_x6_model_4"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_30_x6_model_5"] <- 5

SE$VIS[SE$FILE_MODEL %in% "bdld3_31_x6_model_1"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_31_x6_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_31_x6_model_3"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_31_x6_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_31_x6_model_5"] <- 'CANDIDATE_low'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_31_x6_model_1"] <- 3
SE$BURIED[SE$FILE_MODEL %in% "bdld3_31_x6_model_2"] <- 3
SE$BURIED[SE$FILE_MODEL %in% "bdld3_31_x6_model_3"] <- 3
SE$BURIED[SE$FILE_MODEL %in% "bdld3_31_x6_model_4"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_31_x6_model_5"] <- 4

SE$VIS[SE$FILE_MODEL %in% "bdld3_32_x6_model_1"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_32_x6_model_2"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_32_x6_model_3"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_32_x6_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_32_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_32_x6_model_1"] <- 3
SE$BURIED[SE$FILE_MODEL %in% "bdld3_32_x6_model_2"] <- 4
SE$BURIED[SE$FILE_MODEL %in% "bdld3_32_x6_model_3"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_32_x6_model_4"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_32_x6_model_5"] <- 5

SE$VIS[SE$FILE_MODEL %in% "bdld3_33_x6_model_1"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_33_x6_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_33_x6_model_3"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_33_x6_model_4"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_33_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_33_x6_model_1"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_33_x6_model_2"] <- 3
SE$BURIED[SE$FILE_MODEL %in% "bdld3_33_x6_model_3"] <- 1
SE$BURIED[SE$FILE_MODEL %in% "bdld3_33_x6_model_4"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_33_x6_model_5"] <- 4

SE$VIS[SE$FILE_MODEL %in% "bdld3_34_x6_model_1"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_34_x6_model_2"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_34_x6_model_3"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_34_x6_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_34_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_34_x6_model_1"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_34_x6_model_2"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_34_x6_model_3"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_34_x6_model_4"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_34_x6_model_5"] <- 5

SE$VIS[SE$FILE_MODEL %in% "bdld3_35_x6_model_1"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_35_x6_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_35_x6_model_3"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_35_x6_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_35_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_35_x6_model_1"] <- 4
SE$BURIED[SE$FILE_MODEL %in% "bdld3_35_x6_model_2"] <- 4
SE$BURIED[SE$FILE_MODEL %in% "bdld3_35_x6_model_3"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_35_x6_model_4"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_35_x6_model_5"] <- 5

SE$VIS[SE$FILE_MODEL %in% "bdld3_36_x6_model_1"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_36_x6_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_36_x6_model_3"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_36_x6_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_36_x6_model_5"] <- 'CANDIDATE_low'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_36_x6_model_1"] <- 3
SE$BURIED[SE$FILE_MODEL %in% "bdld3_36_x6_model_2"] <- 3
SE$BURIED[SE$FILE_MODEL %in% "bdld3_36_x6_model_3"] <- 2
SE$BURIED[SE$FILE_MODEL %in% "bdld3_36_x6_model_4"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_36_x6_model_5"] <- 2

SE$VIS[SE$FILE_MODEL %in% "bdld3_37_x6_model_1"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_37_x6_model_2"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_37_x6_model_3"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_37_x6_model_4"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_37_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_37_x6_model_1"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_37_x6_model_2"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_37_x6_model_3"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_37_x6_model_4"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_37_x6_model_5"] <- 5

SE$VIS[SE$FILE_MODEL %in% "bdld3_38_x6_model_1"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_38_x6_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_38_x6_model_3"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_38_x6_model_4"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_38_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_38_x6_model_1"] <- 2
SE$BURIED[SE$FILE_MODEL %in% "bdld3_38_x6_model_2"] <- 2
SE$BURIED[SE$FILE_MODEL %in% "bdld3_38_x6_model_3"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_38_x6_model_4"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_38_x6_model_5"] <- 5

SE$VIS[SE$FILE_MODEL %in% "bdld3_39_x6_model_1"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_39_x6_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_39_x6_model_3"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_39_x6_model_4"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_39_x6_model_5"] <- 'CANDIDATE_low'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_39_x6_model_1"] <- 4
SE$BURIED[SE$FILE_MODEL %in% "bdld3_39_x6_model_2"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_39_x6_model_3"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_39_x6_model_4"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_39_x6_model_5"] <- 3

SE$VIS[SE$FILE_MODEL %in% "bdld3_40_x6_model_1"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_40_x6_model_2"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_40_x6_model_3"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_40_x6_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_40_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_40_x6_model_1"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_40_x6_model_2"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_40_x6_model_3"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_40_x6_model_4"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_40_x6_model_5"] <- 5

SE$VIS[SE$FILE_MODEL %in% "bdld3_41_x6_model_1"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_41_x6_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_41_x6_model_3"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_41_x6_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_41_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_41_x6_model_1"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_41_x6_model_2"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_41_x6_model_3"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_41_x6_model_4"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_41_x6_model_5"] <- 5

SE$VIS[SE$FILE_MODEL %in% "bdld3_42_x6_model_1"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_42_x6_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_42_x6_model_3"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_42_x6_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_42_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_42_x6_model_1"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_42_x6_model_2"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_42_x6_model_3"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_42_x6_model_4"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_42_x6_model_5"] <- 0

SE$VIS[SE$FILE_MODEL %in% "bdld3_43_x6_model_1"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_43_x6_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_43_x6_model_3"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_43_x6_model_4"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_43_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_43_x6_model_1"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_43_x6_model_2"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_43_x6_model_3"] <- 7
SE$BURIED[SE$FILE_MODEL %in% "bdld3_43_x6_model_4"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_43_x6_model_5"] <- 5

SE$VIS[SE$FILE_MODEL %in% "bdld3_44_x6_model_1"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_44_x6_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_44_x6_model_3"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_44_x6_model_4"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_44_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_44_x6_model_1"] <- 2
SE$BURIED[SE$FILE_MODEL %in% "bdld3_44_x6_model_2"] <- 2
SE$BURIED[SE$FILE_MODEL %in% "bdld3_44_x6_model_3"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_44_x6_model_4"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_44_x6_model_5"] <- 5

SE$VIS[SE$FILE_MODEL %in% "bdld3_45_x6_model_1"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_45_x6_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_45_x6_model_3"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_45_x6_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_45_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_45_x6_model_1"] <- 2
SE$BURIED[SE$FILE_MODEL %in% "bdld3_45_x6_model_2"] <- 3
SE$BURIED[SE$FILE_MODEL %in% "bdld3_45_x6_model_3"] <- 4
SE$BURIED[SE$FILE_MODEL %in% "bdld3_45_x6_model_4"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_45_x6_model_5"] <- 5

SE$VIS[SE$FILE_MODEL %in% "bdld3_46_x6_model_1"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_46_x6_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_46_x6_model_3"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_46_x6_model_4"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_46_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_46_x6_model_1"] <- 6
SE$BURIED[SE$FILE_MODEL %in% "bdld3_46_x6_model_2"] <- 3
SE$BURIED[SE$FILE_MODEL %in% "bdld3_46_x6_model_3"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_46_x6_model_4"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_46_x6_model_5"] <- 2

SE$VIS[SE$FILE_MODEL %in% "bdld3_47_x6_model_1"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_47_x6_model_2"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_47_x6_model_3"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_47_x6_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_47_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_47_x6_model_1"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_47_x6_model_2"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_47_x6_model_3"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_47_x6_model_4"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_47_x6_model_5"] <- 1

SE$VIS[SE$FILE_MODEL %in% "bdld3_48_x6_model_1"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_48_x6_model_2"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_48_x6_model_3"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_48_x6_model_4"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_48_x6_model_5"] <- 'none'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_48_x6_model_1"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_48_x6_model_2"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_48_x6_model_3"] <- 3
SE$BURIED[SE$FILE_MODEL %in% "bdld3_48_x6_model_4"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_48_x6_model_5"] <- 0

SE$VIS[SE$FILE_MODEL %in% "bdld3_49_x6_model_1"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_49_x6_model_2"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_49_x6_model_3"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_49_x6_model_4"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_49_x6_model_5"] <- 'CANDIDATE_low'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_49_x6_model_1"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_49_x6_model_2"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_49_x6_model_3"] <- 4
SE$BURIED[SE$FILE_MODEL %in% "bdld3_49_x6_model_4"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_49_x6_model_5"] <- 6

SE$VIS[SE$FILE_MODEL %in% "bdld3_50_x6_model_1"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_50_x6_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_50_x6_model_3"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_50_x6_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_50_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_50_x6_model_1"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_50_x6_model_2"] <- 6
SE$BURIED[SE$FILE_MODEL %in% "bdld3_50_x6_model_3"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_50_x6_model_4"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_50_x6_model_5"] <- 5

SE$VIS[SE$FILE_MODEL %in% "bdld3_51_x6_model_1"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_51_x6_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_51_x6_model_3"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_51_x6_model_4"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_51_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_51_x6_model_1"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_51_x6_model_2"] <- 3
SE$BURIED[SE$FILE_MODEL %in% "bdld3_51_x6_model_3"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_51_x6_model_4"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_51_x6_model_5"] <- 3

SE$VIS[SE$FILE_MODEL %in% "bdld3_52_x6_model_1"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_52_x6_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_52_x6_model_3"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_52_x6_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_52_x6_model_5"] <- 'none'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_52_x6_model_1"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_52_x6_model_2"] <- 1
SE$BURIED[SE$FILE_MODEL %in% "bdld3_52_x6_model_3"] <- 4
SE$BURIED[SE$FILE_MODEL %in% "bdld3_52_x6_model_4"] <- 3
SE$BURIED[SE$FILE_MODEL %in% "bdld3_52_x6_model_5"] <- 0

SE$VIS[SE$FILE_MODEL %in% "bdld3_53_x6_model_1"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_53_x6_model_2"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_53_x6_model_3"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_53_x6_model_4"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_53_x6_model_5"] <- 'none'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_53_x6_model_1"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_53_x6_model_2"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_53_x6_model_3"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_53_x6_model_4"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_53_x6_model_5"] <- 0

SE$VIS[SE$FILE_MODEL %in% "bdld3_54_x6_model_1"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_54_x6_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_54_x6_model_3"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_54_x6_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_54_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_54_x6_model_1"] <- 2
SE$BURIED[SE$FILE_MODEL %in% "bdld3_54_x6_model_2"] <- 4
SE$BURIED[SE$FILE_MODEL %in% "bdld3_54_x6_model_3"] <- 1
SE$BURIED[SE$FILE_MODEL %in% "bdld3_54_x6_model_4"] <- 3
SE$BURIED[SE$FILE_MODEL %in% "bdld3_54_x6_model_5"] <- 5

SE$VIS[SE$FILE_MODEL %in% "bdld3_55_x6_model_1"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_55_x6_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_55_x6_model_3"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_55_x6_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_55_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_55_x6_model_1"] <- 7
SE$BURIED[SE$FILE_MODEL %in% "bdld3_55_x6_model_2"] <- 4
SE$BURIED[SE$FILE_MODEL %in% "bdld3_55_x6_model_3"] <- 7
SE$BURIED[SE$FILE_MODEL %in% "bdld3_55_x6_model_4"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_55_x6_model_5"] <- 5

SE$VIS[SE$FILE_MODEL %in% "bdld3_56_x6_model_1"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_56_x6_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_56_x6_model_3"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_56_x6_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_56_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_56_x6_model_1"] <- 1
SE$BURIED[SE$FILE_MODEL %in% "bdld3_56_x6_model_2"] <- 3
SE$BURIED[SE$FILE_MODEL %in% "bdld3_56_x6_model_3"] <- 3
SE$BURIED[SE$FILE_MODEL %in% "bdld3_56_x6_model_4"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_56_x6_model_5"] <- 5

SE$VIS[SE$FILE_MODEL %in% "bdld3_57_x6_model_1"] <- 'circular'
SE$VIS[SE$FILE_MODEL %in% "bdld3_57_x6_model_2"] <- 'circular'
SE$VIS[SE$FILE_MODEL %in% "bdld3_57_x6_model_3"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_57_x6_model_4"] <- 'circular'
SE$VIS[SE$FILE_MODEL %in% "bdld3_57_x6_model_5"] <- 'OTHER'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_57_x6_model_1"] <- 6
SE$BURIED[SE$FILE_MODEL %in% "bdld3_57_x6_model_2"] <- 6
SE$BURIED[SE$FILE_MODEL %in% "bdld3_57_x6_model_3"] <- 1
SE$BURIED[SE$FILE_MODEL %in% "bdld3_57_x6_model_4"] <- 6
SE$BURIED[SE$FILE_MODEL %in% "bdld3_57_x6_model_5"] <- 6

SE$VIS[SE$FILE_MODEL %in% "bdld3_58_x6_model_1"] <- 'OTHER'
SE$VIS[SE$FILE_MODEL %in% "bdld3_58_x6_model_2"] <- 'OTHER'
SE$VIS[SE$FILE_MODEL %in% "bdld3_58_x6_model_3"] <- 'circular'
SE$VIS[SE$FILE_MODEL %in% "bdld3_58_x6_model_4"] <- 'circular'
SE$VIS[SE$FILE_MODEL %in% "bdld3_58_x6_model_5"] <- 'OTHER'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_58_x6_model_1"] <- 6
SE$BURIED[SE$FILE_MODEL %in% "bdld3_58_x6_model_2"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_58_x6_model_3"] <- 6
SE$BURIED[SE$FILE_MODEL %in% "bdld3_58_x6_model_4"] <- 6
SE$BURIED[SE$FILE_MODEL %in% "bdld3_58_x6_model_5"] <- 7

SE$VIS[SE$FILE_MODEL %in% "bdld3_59_x6_model_1"] <- 'OTHER'
SE$VIS[SE$FILE_MODEL %in% "bdld3_59_x6_model_2"] <- 'OTHER'
SE$VIS[SE$FILE_MODEL %in% "bdld3_59_x6_model_3"] <- 'OTHER'
SE$VIS[SE$FILE_MODEL %in% "bdld3_59_x6_model_4"] <- 'OTHER'
SE$VIS[SE$FILE_MODEL %in% "bdld3_59_x6_model_5"] <- 'OTHER'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_59_x6_model_1"] <- 3
SE$BURIED[SE$FILE_MODEL %in% "bdld3_59_x6_model_2"] <- 4
SE$BURIED[SE$FILE_MODEL %in% "bdld3_59_x6_model_3"] <- 4
SE$BURIED[SE$FILE_MODEL %in% "bdld3_59_x6_model_4"] <- 3
SE$BURIED[SE$FILE_MODEL %in% "bdld3_59_x6_model_5"] <- 5

SE$VIS[SE$FILE_MODEL %in% "bdld3_60_x6_model_1"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_60_x6_model_2"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_60_x6_model_3"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_60_x6_model_4"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_60_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_60_x6_model_1"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_60_x6_model_2"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_60_x6_model_3"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_60_x6_model_4"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_60_x6_model_5"] <- 1

SE$VIS[SE$FILE_MODEL %in% "bdld3_61_x6_model_1"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_61_x6_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_61_x6_model_3"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_61_x6_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_61_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_61_x6_model_1"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_61_x6_model_2"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_61_x6_model_3"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_61_x6_model_4"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_61_x6_model_5"] <- 5

SE$VIS[SE$FILE_MODEL %in% "bdld3_62_x6_model_1"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_62_x6_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_62_x6_model_3"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_62_x6_model_4"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_62_x6_model_5"] <- 'CANDIDATE_low'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_62_x6_model_1"] <- 6
SE$BURIED[SE$FILE_MODEL %in% "bdld3_62_x6_model_2"] <- 4
SE$BURIED[SE$FILE_MODEL %in% "bdld3_62_x6_model_3"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_62_x6_model_4"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_62_x6_model_5"] <- 6

SE$VIS[SE$FILE_MODEL %in% "bdld3_63_x6_model_1"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_63_x6_model_2"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_63_x6_model_3"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_63_x6_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_63_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_63_x6_model_1"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_63_x6_model_2"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_63_x6_model_3"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_63_x6_model_4"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_63_x6_model_5"] <- 6

SE$VIS[SE$FILE_MODEL %in% "bdld3_64_x6_model_1"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_64_x6_model_2"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_64_x6_model_3"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_64_x6_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_64_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_64_x6_model_1"] <- 3
SE$BURIED[SE$FILE_MODEL %in% "bdld3_64_x6_model_2"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_64_x6_model_3"] <- 3
SE$BURIED[SE$FILE_MODEL %in% "bdld3_64_x6_model_4"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_64_x6_model_5"] <- 4

SE$VIS[SE$FILE_MODEL %in% "bdld3_65_x6_model_1"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_65_x6_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_65_x6_model_3"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_65_x6_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_65_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_65_x6_model_1"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_65_x6_model_2"] <- 4
SE$BURIED[SE$FILE_MODEL %in% "bdld3_65_x6_model_3"] <- 6
SE$BURIED[SE$FILE_MODEL %in% "bdld3_65_x6_model_4"] <- 4
SE$BURIED[SE$FILE_MODEL %in% "bdld3_65_x6_model_5"] <- 2

SE$VIS[SE$FILE_MODEL %in% "bdld3_66_x6_model_1"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_66_x6_model_2"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_66_x6_model_3"] <- 'OTHER'
SE$VIS[SE$FILE_MODEL %in% "bdld3_66_x6_model_4"] <- 'OTHER'
SE$VIS[SE$FILE_MODEL %in% "bdld3_66_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_66_x6_model_1"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_66_x6_model_2"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_66_x6_model_3"] <- 3
SE$BURIED[SE$FILE_MODEL %in% "bdld3_66_x6_model_4"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_66_x6_model_5"] <- 2

SE$VIS[SE$FILE_MODEL %in% "bdld3_67_x6_model_1"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_67_x6_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_67_x6_model_3"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_67_x6_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_67_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_67_x6_model_1"] <- 4
SE$BURIED[SE$FILE_MODEL %in% "bdld3_67_x6_model_2"] <- 1
SE$BURIED[SE$FILE_MODEL %in% "bdld3_67_x6_model_3"] <- 4
SE$BURIED[SE$FILE_MODEL %in% "bdld3_67_x6_model_4"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_67_x6_model_5"] <- 5

SE$VIS[SE$FILE_MODEL %in% "bdld3_68_x6_model_1"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_68_x6_model_2"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_68_x6_model_3"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_68_x6_model_4"] <- 'OTHER'
SE$VIS[SE$FILE_MODEL %in% "bdld3_68_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_68_x6_model_1"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_68_x6_model_2"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_68_x6_model_3"] <- 2
SE$BURIED[SE$FILE_MODEL %in% "bdld3_68_x6_model_4"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_68_x6_model_5"] <- 5

SE$VIS[SE$FILE_MODEL %in% "bdld3_69_x6_model_1"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_69_x6_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_69_x6_model_3"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_69_x6_model_4"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_69_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_69_x6_model_1"] <- 3
SE$BURIED[SE$FILE_MODEL %in% "bdld3_69_x6_model_2"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_69_x6_model_3"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_69_x6_model_4"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_69_x6_model_5"] <- 4

SE$VIS[SE$FILE_MODEL %in% "bdld3_70_x6_model_1"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_70_x6_model_2"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_70_x6_model_3"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_70_x6_model_4"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_70_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_70_x6_model_1"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_70_x6_model_2"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_70_x6_model_3"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_70_x6_model_4"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_70_x6_model_5"] <- 5

SE$VIS[SE$FILE_MODEL %in% "bdld3_71_x6_model_1"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_71_x6_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_71_x6_model_3"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_71_x6_model_4"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_71_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_71_x6_model_1"] <- 4
SE$BURIED[SE$FILE_MODEL %in% "bdld3_71_x6_model_2"] <- 4
SE$BURIED[SE$FILE_MODEL %in% "bdld3_71_x6_model_3"] <- 7
SE$BURIED[SE$FILE_MODEL %in% "bdld3_71_x6_model_4"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_71_x6_model_5"] <- 5

SE$VIS[SE$FILE_MODEL %in% "bdld3_72_x6_model_1"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_72_x6_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_72_x6_model_3"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_72_x6_model_4"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_72_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_72_x6_model_1"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_72_x6_model_2"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_72_x6_model_3"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_72_x6_model_4"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_72_x6_model_5"] <- 5

SE$VIS[SE$FILE_MODEL %in% "bdld3_73_x6_model_1"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_73_x6_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_73_x6_model_3"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_73_x6_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_73_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_73_x6_model_1"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_73_x6_model_2"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_73_x6_model_3"] <- 4
SE$BURIED[SE$FILE_MODEL %in% "bdld3_73_x6_model_4"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_73_x6_model_5"] <- 5

SE$VIS[SE$FILE_MODEL %in% "bdld3_74_x6_model_1"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_74_x6_model_2"] <- 'CANDIDATE'
SE$VIS[SE$FILE_MODEL %in% "bdld3_74_x6_model_3"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_74_x6_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_74_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_74_x6_model_1"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_74_x6_model_2"] <- 8
SE$BURIED[SE$FILE_MODEL %in% "bdld3_74_x6_model_3"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_74_x6_model_4"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_74_x6_model_5"] <- 5

SE$VIS[SE$FILE_MODEL %in% "bdld3_75_x6_model_1"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_75_x6_model_2"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_75_x6_model_3"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_75_x6_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_75_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_75_x6_model_1"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_75_x6_model_2"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_75_x6_model_3"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_75_x6_model_4"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_75_x6_model_5"] <- 5

SE$VIS[SE$FILE_MODEL %in% "bdld3_76_x6_model_1"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_76_x6_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_76_x6_model_3"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_76_x6_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_76_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_76_x6_model_1"] <- 1
SE$BURIED[SE$FILE_MODEL %in% "bdld3_76_x6_model_2"] <- 1
SE$BURIED[SE$FILE_MODEL %in% "bdld3_76_x6_model_3"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_76_x6_model_4"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_76_x6_model_5"] <- 5

SE$VIS[SE$FILE_MODEL %in% "bdld3_77_x6_model_1"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_77_x6_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_77_x6_model_3"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_77_x6_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_77_x6_model_5"] <- 'none'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_77_x6_model_1"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_77_x6_model_2"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_77_x6_model_3"] <- 2
SE$BURIED[SE$FILE_MODEL %in% "bdld3_77_x6_model_4"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_77_x6_model_5"] <- 0

SE$VIS[SE$FILE_MODEL %in% "bdld3_78_x6_model_1"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_78_x6_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_78_x6_model_3"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_78_x6_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_78_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_78_x6_model_1"] <- 4
SE$BURIED[SE$FILE_MODEL %in% "bdld3_78_x6_model_2"] <- 4
SE$BURIED[SE$FILE_MODEL %in% "bdld3_78_x6_model_3"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_78_x6_model_4"] <- 4
SE$BURIED[SE$FILE_MODEL %in% "bdld3_78_x6_model_5"] <- 5

SE$VIS[SE$FILE_MODEL %in% "bdld3_79_x6_model_1"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_79_x6_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_79_x6_model_3"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_79_x6_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_79_x6_model_5"] <- 'CANDIDATE_low'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_79_x6_model_1"] <- 1
SE$BURIED[SE$FILE_MODEL %in% "bdld3_79_x6_model_2"] <- 3
SE$BURIED[SE$FILE_MODEL %in% "bdld3_79_x6_model_3"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_79_x6_model_4"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_79_x6_model_5"] <- 4

SE$VIS[SE$FILE_MODEL %in% "bdld3_80_x6_model_1"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_80_x6_model_2"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_80_x6_model_3"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_80_x6_model_4"] <- 'OTHER'
SE$VIS[SE$FILE_MODEL %in% "bdld3_80_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_80_x6_model_1"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_80_x6_model_2"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_80_x6_model_3"] <- 6
SE$BURIED[SE$FILE_MODEL %in% "bdld3_80_x6_model_4"] <- 3
SE$BURIED[SE$FILE_MODEL %in% "bdld3_80_x6_model_5"] <- 5

SE$VIS[SE$FILE_MODEL %in% "bdld3_81_x6_model_1"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_81_x6_model_2"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_81_x6_model_3"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_81_x6_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_81_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_81_x6_model_1"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_81_x6_model_2"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_81_x6_model_3"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_81_x6_model_4"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_81_x6_model_5"] <- 5

SE$VIS[SE$FILE_MODEL %in% "bdld3_82_x6_model_1"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_82_x6_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_82_x6_model_3"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_82_x6_model_4"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_82_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_82_x6_model_1"] <- 2
SE$BURIED[SE$FILE_MODEL %in% "bdld3_82_x6_model_2"] <- 3
SE$BURIED[SE$FILE_MODEL %in% "bdld3_82_x6_model_3"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_82_x6_model_4"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_82_x6_model_5"] <- 4

SE$VIS[SE$FILE_MODEL %in% "bdld3_83_x6_model_1"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_83_x6_model_2"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_83_x6_model_3"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_83_x6_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_83_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_83_x6_model_1"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_83_x6_model_2"] <- 4
SE$BURIED[SE$FILE_MODEL %in% "bdld3_83_x6_model_3"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_83_x6_model_4"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_83_x6_model_5"] <- 5

SE$VIS[SE$FILE_MODEL %in% "bdld3_84_x6_model_1"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_84_x6_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_84_x6_model_3"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_84_x6_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_84_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_84_x6_model_1"] <- 3
SE$BURIED[SE$FILE_MODEL %in% "bdld3_84_x6_model_2"] <- 4
SE$BURIED[SE$FILE_MODEL %in% "bdld3_84_x6_model_3"] <- 3
SE$BURIED[SE$FILE_MODEL %in% "bdld3_84_x6_model_4"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_84_x6_model_5"] <- 5

SE$VIS[SE$FILE_MODEL %in% "MYD88-DD_slim3_x6_model_1"] <- 'FILAMENT'
SE$VIS[SE$FILE_MODEL %in% "MYD88-DD_slim3_x6_model_2"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "MYD88-DD_slim3_x6_model_3"] <- 'FILAMENT'
SE$VIS[SE$FILE_MODEL %in% "MYD88-DD_slim3_x6_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "MYD88-DD_slim3_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "MYD88-DD_slim3_x6_model_1"] <- 9
SE$BURIED[SE$FILE_MODEL %in% "MYD88-DD_slim3_x6_model_2"] <- 4
SE$BURIED[SE$FILE_MODEL %in% "MYD88-DD_slim3_x6_model_3"] <- 6
SE$BURIED[SE$FILE_MODEL %in% "MYD88-DD_slim3_x6_model_4"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "MYD88-DD_slim3_x6_model_5"] <- 5

SE$VIS[SE$FILE_MODEL %in% "DHF58_x6_model_1"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "DHF58_x6_model_2"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "DHF58_x6_model_3"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "DHF58_x6_model_4"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "DHF58_x6_model_5"] <- 'none'
SE$BURIED[SE$FILE_MODEL %in% "DHF58_x6_model_1"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "DHF58_x6_model_2"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "DHF58_x6_model_3"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "DHF58_x6_model_4"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "DHF58_x6_model_5"] <- 0

SE$VIS[SE$FILE_MODEL %in% "DHF91_x6_model_1"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "DHF91_x6_model_2"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "DHF91_x6_model_3"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "DHF91_x6_model_4"] <- 'DIMER'
SE$VIS[SE$FILE_MODEL %in% "DHF91_x6_model_5"] <- 'none'
SE$BURIED[SE$FILE_MODEL %in% "DHF91_x6_model_1"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "DHF91_x6_model_2"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "DHF91_x6_model_3"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "DHF91_x6_model_4"] <- 3
SE$BURIED[SE$FILE_MODEL %in% "DHF91_x6_model_5"] <- 0

SE$VIS[SE$FILE_MODEL %in% "MyD88_SPL2_short_x6_model_1"] <- 'OTHER'
SE$VIS[SE$FILE_MODEL %in% "MyD88_SPL2_short_x6_model_2"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "MyD88_SPL2_short_x6_model_3"] <- 'FILAMENT'
SE$VIS[SE$FILE_MODEL %in% "MyD88_SPL2_short_x6_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "MyD88_SPL2_short_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "MyD88_SPL2_short_x6_model_1"] <- 1
SE$BURIED[SE$FILE_MODEL %in% "MyD88_SPL2_short_x6_model_2"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "MyD88_SPL2_short_x6_model_3"] <- 10
SE$BURIED[SE$FILE_MODEL %in% "MyD88_SPL2_short_x6_model_4"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "MyD88_SPL2_short_x6_model_5"] <- 5

SE$VIS[SE$FILE_MODEL %in% "MyD88_SPL1_FL_x6_model_1"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "MyD88_SPL1_FL_x6_model_2"] <- 'FILAMENT'
SE$VIS[SE$FILE_MODEL %in% "MyD88_SPL1_FL_x6_model_3"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "MyD88_SPL1_FL_x6_model_4"] <- 'OTHER'
SE$VIS[SE$FILE_MODEL %in% "MyD88_SPL1_FL_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "MyD88_SPL1_FL_x6_model_1"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "MyD88_SPL1_FL_x6_model_2"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "MyD88_SPL1_FL_x6_model_3"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "MyD88_SPL1_FL_x6_model_4"] <- 1
SE$BURIED[SE$FILE_MODEL %in% "MyD88_SPL1_FL_x6_model_5"] <- 4

SE$VIS[SE$FILE_MODEL %in% "CRP_MOUSE_x6_model_1"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "CRP_MOUSE_x6_model_2"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "CRP_MOUSE_x6_model_3"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "CRP_MOUSE_x6_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "CRP_MOUSE_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "CRP_MOUSE_x6_model_1"] <- 6
SE$BURIED[SE$FILE_MODEL %in% "CRP_MOUSE_x6_model_2"] <- 6
SE$BURIED[SE$FILE_MODEL %in% "CRP_MOUSE_x6_model_3"] <- 6
SE$BURIED[SE$FILE_MODEL %in% "CRP_MOUSE_x6_model_4"] <- 6
SE$BURIED[SE$FILE_MODEL %in% "CRP_MOUSE_x6_model_5"] <- 6

SE$VIS[SE$FILE_MODEL %in% "TNFa_MOUSE_x6_model_1"] <- 'TRIMER'
SE$VIS[SE$FILE_MODEL %in% "TNFa_MOUSE_x6_model_2"] <- 'TRIMER'
SE$VIS[SE$FILE_MODEL %in% "TNFa_MOUSE_x6_model_3"] <- 'TRIMER'
SE$VIS[SE$FILE_MODEL %in% "TNFa_MOUSE_x6_model_4"] <- 'TRIMER'
SE$VIS[SE$FILE_MODEL %in% "TNFa_MOUSE_x6_model_5"] <- 'TRIMER'
SE$BURIED[SE$FILE_MODEL %in% "TNFa_MOUSE_x6_model_1"] <- 8
SE$BURIED[SE$FILE_MODEL %in% "TNFa_MOUSE_x6_model_2"] <- 6
SE$BURIED[SE$FILE_MODEL %in% "TNFa_MOUSE_x6_model_3"] <- 6
SE$BURIED[SE$FILE_MODEL %in% "TNFa_MOUSE_x6_model_4"] <- 6
SE$BURIED[SE$FILE_MODEL %in% "TNFa_MOUSE_x6_model_5"] <- 6

# SE$VIS[SE$FILE_MODEL %in% "XXXXXXX_x6_model_1"] <- 'EVAL'
# SE$VIS[SE$FILE_MODEL %in% "XXXXXXX_x6_model_2"] <- 'EVAL'
# SE$VIS[SE$FILE_MODEL %in% "XXXXXXX_x6_model_3"] <- 'EVAL'
# SE$VIS[SE$FILE_MODEL %in% "XXXXXXX_x6_model_4"] <- 'EVAL'
# SE$VIS[SE$FILE_MODEL %in% "XXXXXXX_x6_model_5"] <- 'EVAL'
# SE$BURIED[SE$FILE_MODEL %in% "XXXXXXX_x6_model_1"] <- 0
# SE$BURIED[SE$FILE_MODEL %in% "XXXXXXX_x6_model_2"] <- 0
# SE$BURIED[SE$FILE_MODEL %in% "XXXXXXX_x6_model_3"] <- 0
# SE$BURIED[SE$FILE_MODEL %in% "XXXXXXX_x6_model_4"] <- 0
# SE$BURIED[SE$FILE_MODEL %in% "XXXXXXX_x6_model_5"] <- 0


################################################################################################################################################################
################################################################################################################################################################
################################################################################################################################################################

SE$VIS[SE$FILE_MODEL %in% "ASC-PYD_x10_model_1"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "ASC-PYD_x10_model_2"] <- 'FILAMENT'
SE$VIS[SE$FILE_MODEL %in% "ASC-PYD_x10_model_3"] <- 'FILAMENT'
SE$VIS[SE$FILE_MODEL %in% "ASC-PYD_x10_model_4"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "ASC-PYD_x10_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "ASC-PYD_x10_model_1"] <- 9
SE$BURIED[SE$FILE_MODEL %in% "ASC-PYD_x10_model_2"] <- 2
SE$BURIED[SE$FILE_MODEL %in% "ASC-PYD_x10_model_3"] <- 9
SE$BURIED[SE$FILE_MODEL %in% "ASC-PYD_x10_model_4"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "ASC-PYD_x10_model_5"] <- 8

SE$VIS[SE$FILE_MODEL %in% "MAVS-CARD_MOUSE_x6_model_1"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "MAVS-CARD_MOUSE_x6_model_2"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "MAVS-CARD_MOUSE_x6_model_3"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "MAVS-CARD_MOUSE_x6_model_4"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "MAVS-CARD_MOUSE_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "MAVS-CARD_MOUSE_x6_model_1"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "MAVS-CARD_MOUSE_x6_model_2"] <- 1
SE$BURIED[SE$FILE_MODEL %in% "MAVS-CARD_MOUSE_x6_model_3"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "MAVS-CARD_MOUSE_x6_model_4"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "MAVS-CARD_MOUSE_x6_model_5"] <- 1

SE$VIS[SE$FILE_MODEL %in% "FADD-DED_MOUSE_x6_model_1"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "FADD-DED_MOUSE_x6_model_2"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "FADD-DED_MOUSE_x6_model_3"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "FADD-DED_MOUSE_x6_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "FADD-DED_MOUSE_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "FADD-DED_MOUSE_x6_model_1"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "FADD-DED_MOUSE_x6_model_2"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "FADD-DED_MOUSE_x6_model_3"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "FADD-DED_MOUSE_x6_model_4"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "FADD-DED_MOUSE_x6_model_5"] <- 5

SE$VIS[SE$FILE_MODEL %in% "CRADD-CARD_MOUSE_x6_model_1"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "CRADD-CARD_MOUSE_x6_model_2"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "CRADD-CARD_MOUSE_x6_model_3"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "CRADD-CARD_MOUSE_x6_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "CRADD-CARD_MOUSE_x6_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "CRADD-CARD_MOUSE_x6_model_1"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "CRADD-CARD_MOUSE_x6_model_2"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "CRADD-CARD_MOUSE_x6_model_3"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "CRADD-CARD_MOUSE_x6_model_4"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "CRADD-CARD_MOUSE_x6_model_5"] <- 0

SE$VIS[SE$FILE_MODEL %in% "bdld3_1_x10_model_1"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_1_x10_model_2"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_1_x10_model_3"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_1_x10_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_1_x10_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_1_x10_model_1"] <- 8
SE$BURIED[SE$FILE_MODEL %in% "bdld3_1_x10_model_2"] <- 8
SE$BURIED[SE$FILE_MODEL %in% "bdld3_1_x10_model_3"] <- 9
SE$BURIED[SE$FILE_MODEL %in% "bdld3_1_x10_model_4"] <- 9
SE$BURIED[SE$FILE_MODEL %in% "bdld3_1_x10_model_5"] <- 8

SE$VIS[SE$FILE_MODEL %in% "bdld3_2_x10_model_1"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_2_x10_model_2"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_2_x10_model_3"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_2_x10_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_2_x10_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_2_x10_model_1"] <- 9
SE$BURIED[SE$FILE_MODEL %in% "bdld3_2_x10_model_2"] <- 9
SE$BURIED[SE$FILE_MODEL %in% "bdld3_2_x10_model_3"] <- 9
SE$BURIED[SE$FILE_MODEL %in% "bdld3_2_x10_model_4"] <- 9
SE$BURIED[SE$FILE_MODEL %in% "bdld3_2_x10_model_5"] <- 9

SE$VIS[SE$FILE_MODEL %in% "bdld3_3_x10_model_1"] <- 'CANDIDATE'
SE$VIS[SE$FILE_MODEL %in% "bdld3_3_x10_model_2"] <- 'CANDIDATE'
SE$VIS[SE$FILE_MODEL %in% "bdld3_3_x10_model_3"] <- 'CANDIDATE'
SE$VIS[SE$FILE_MODEL %in% "bdld3_3_x10_model_4"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_3_x10_model_5"] <- 'CANDIDATE'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_3_x10_model_1"] <- 8
SE$BURIED[SE$FILE_MODEL %in% "bdld3_3_x10_model_2"] <- 7
SE$BURIED[SE$FILE_MODEL %in% "bdld3_3_x10_model_3"] <- 7
SE$BURIED[SE$FILE_MODEL %in% "bdld3_3_x10_model_4"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_3_x10_model_5"] <- 7

SE$VIS[SE$FILE_MODEL %in% "bdld3_4_x10_model_1"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_4_x10_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_4_x10_model_3"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_4_x10_model_4"] <- 'CANDIDATE'
SE$VIS[SE$FILE_MODEL %in% "bdld3_4_x10_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_4_x10_model_1"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_4_x10_model_2"] <- 8
SE$BURIED[SE$FILE_MODEL %in% "bdld3_4_x10_model_3"] <- 7
SE$BURIED[SE$FILE_MODEL %in% "bdld3_4_x10_model_4"] <- 12
SE$BURIED[SE$FILE_MODEL %in% "bdld3_4_x10_model_5"] <- 8

SE$VIS[SE$FILE_MODEL %in% "bdld3_6_x10_model_1"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_6_x10_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_6_x10_model_3"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_6_x10_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_6_x10_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_6_x10_model_1"] <- 7
SE$BURIED[SE$FILE_MODEL %in% "bdld3_6_x10_model_2"] <- 8
SE$BURIED[SE$FILE_MODEL %in% "bdld3_6_x10_model_3"] <- 9
SE$BURIED[SE$FILE_MODEL %in% "bdld3_6_x10_model_4"] <- 9
SE$BURIED[SE$FILE_MODEL %in% "bdld3_6_x10_model_5"] <- 8

SE$VIS[SE$FILE_MODEL %in% "bdld3_7_x10_model_1"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_7_x10_model_2"] <- 'CANDIDATE'
SE$VIS[SE$FILE_MODEL %in% "bdld3_7_x10_model_3"] <- 'CANDIDATE'
SE$VIS[SE$FILE_MODEL %in% "bdld3_7_x10_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_7_x10_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_7_x10_model_1"] <- 7
SE$BURIED[SE$FILE_MODEL %in% "bdld3_7_x10_model_2"] <- 7
SE$BURIED[SE$FILE_MODEL %in% "bdld3_7_x10_model_3"] <- 6
SE$BURIED[SE$FILE_MODEL %in% "bdld3_7_x10_model_4"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_7_x10_model_5"] <- 8

SE$VIS[SE$FILE_MODEL %in% "bdld3_9_x10_model_1"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_9_x10_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_9_x10_model_3"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_9_x10_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_9_x10_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_9_x10_model_1"] <- 7
SE$BURIED[SE$FILE_MODEL %in% "bdld3_9_x10_model_2"] <- 7
SE$BURIED[SE$FILE_MODEL %in% "bdld3_9_x10_model_3"] <- 8
SE$BURIED[SE$FILE_MODEL %in% "bdld3_9_x10_model_4"] <- 8
SE$BURIED[SE$FILE_MODEL %in% "bdld3_9_x10_model_5"] <- 8

SE$VIS[SE$FILE_MODEL %in% "bdld3_10_x10_model_1"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_10_x10_model_2"] <- 'CANDIDATE'
SE$VIS[SE$FILE_MODEL %in% "bdld3_10_x10_model_3"] <- 'CANDIDATE'
SE$VIS[SE$FILE_MODEL %in% "bdld3_10_x10_model_4"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_10_x10_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_10_x10_model_1"] <- 4
SE$BURIED[SE$FILE_MODEL %in% "bdld3_10_x10_model_2"] <- 10
SE$BURIED[SE$FILE_MODEL %in% "bdld3_10_x10_model_3"] <- 12
SE$BURIED[SE$FILE_MODEL %in% "bdld3_10_x10_model_4"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_10_x10_model_5"] <- 9

SE$VIS[SE$FILE_MODEL %in% "bdld3_11_x10_model_1"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_11_x10_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_11_x10_model_3"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_11_x10_model_4"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_11_x10_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_11_x10_model_1"] <- 9
SE$BURIED[SE$FILE_MODEL %in% "bdld3_11_x10_model_2"] <- 8
SE$BURIED[SE$FILE_MODEL %in% "bdld3_11_x10_model_3"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_11_x10_model_4"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_11_x10_model_5"] <- 9

SE$VIS[SE$FILE_MODEL %in% "bdld3_12_x10_model_1"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_12_x10_model_2"] <- 'CANDIDATE'
SE$VIS[SE$FILE_MODEL %in% "bdld3_12_x10_model_3"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_12_x10_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_12_x10_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_12_x10_model_1"] <- 8
SE$BURIED[SE$FILE_MODEL %in% "bdld3_12_x10_model_2"] <- 7
SE$BURIED[SE$FILE_MODEL %in% "bdld3_12_x10_model_3"] <- 7
SE$BURIED[SE$FILE_MODEL %in% "bdld3_12_x10_model_4"] <- 8
SE$BURIED[SE$FILE_MODEL %in% "bdld3_12_x10_model_5"] <- 9

SE$VIS[SE$FILE_MODEL %in% "bdld3_13_x10_model_1"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_13_x10_model_2"] <- 'CANDIDATE'
SE$VIS[SE$FILE_MODEL %in% "bdld3_13_x10_model_3"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_13_x10_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_13_x10_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_13_x10_model_1"] <- 9
SE$BURIED[SE$FILE_MODEL %in% "bdld3_13_x10_model_2"] <- 6
SE$BURIED[SE$FILE_MODEL %in% "bdld3_13_x10_model_3"] <- 9
SE$BURIED[SE$FILE_MODEL %in% "bdld3_13_x10_model_4"] <- 9
SE$BURIED[SE$FILE_MODEL %in% "bdld3_13_x10_model_5"] <- 9

SE$VIS[SE$FILE_MODEL %in% "bdld3_14_x10_model_1"] <- 'CANDIDATE'
SE$VIS[SE$FILE_MODEL %in% "bdld3_14_x10_model_2"] <- 'CANDIDATE'
SE$VIS[SE$FILE_MODEL %in% "bdld3_14_x10_model_3"] <- 'CANDIDATE'
SE$VIS[SE$FILE_MODEL %in% "bdld3_14_x10_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_14_x10_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_14_x10_model_1"] <- 8
SE$BURIED[SE$FILE_MODEL %in% "bdld3_14_x10_model_2"] <- 7
SE$BURIED[SE$FILE_MODEL %in% "bdld3_14_x10_model_3"] <- 13
SE$BURIED[SE$FILE_MODEL %in% "bdld3_14_x10_model_4"] <- 9
SE$BURIED[SE$FILE_MODEL %in% "bdld3_14_x10_model_5"] <- 9

SE$VIS[SE$FILE_MODEL %in% "bdld3_17_x10_model_1"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_17_x10_model_2"] <- 'CANDIDATE'
SE$VIS[SE$FILE_MODEL %in% "bdld3_17_x10_model_3"] <- 'CANDIDATE'
SE$VIS[SE$FILE_MODEL %in% "bdld3_17_x10_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_17_x10_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_17_x10_model_1"] <- 9
SE$BURIED[SE$FILE_MODEL %in% "bdld3_17_x10_model_2"] <- 12
SE$BURIED[SE$FILE_MODEL %in% "bdld3_17_x10_model_3"] <- 22
SE$BURIED[SE$FILE_MODEL %in% "bdld3_17_x10_model_4"] <- 9
SE$BURIED[SE$FILE_MODEL %in% "bdld3_17_x10_model_5"] <- 9

SE$VIS[SE$FILE_MODEL %in% "bdld3_18_x10_model_1"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_18_x10_model_2"] <- 'DIMER'
SE$VIS[SE$FILE_MODEL %in% "bdld3_18_x10_model_3"] <- 'DIMER'
SE$VIS[SE$FILE_MODEL %in% "bdld3_18_x10_model_4"] <- 'DIMER'
SE$VIS[SE$FILE_MODEL %in% "bdld3_18_x10_model_5"] <- 'DIMER'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_18_x10_model_1"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_18_x10_model_2"] <- 1
SE$BURIED[SE$FILE_MODEL %in% "bdld3_18_x10_model_3"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_18_x10_model_4"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_18_x10_model_5"] <- 5

SE$VIS[SE$FILE_MODEL %in% "bdld3_21_x10_model_1"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_21_x10_model_2"] <- 'CANDIDATE'
SE$VIS[SE$FILE_MODEL %in% "bdld3_21_x10_model_3"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_21_x10_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_21_x10_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_21_x10_model_1"] <- 9
SE$BURIED[SE$FILE_MODEL %in% "bdld3_21_x10_model_2"] <- 11
SE$BURIED[SE$FILE_MODEL %in% "bdld3_21_x10_model_3"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_21_x10_model_4"] <- 9
SE$BURIED[SE$FILE_MODEL %in% "bdld3_21_x10_model_5"] <- 9

SE$VIS[SE$FILE_MODEL %in% "bdld3_23_x10_model_1"] <- 'CANDIDATE'
SE$VIS[SE$FILE_MODEL %in% "bdld3_23_x10_model_2"] <- 'CANDIDATE'
SE$VIS[SE$FILE_MODEL %in% "bdld3_23_x10_model_3"] <- 'CANDIDATE'
SE$VIS[SE$FILE_MODEL %in% "bdld3_23_x10_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_23_x10_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_23_x10_model_1"] <- 12
SE$BURIED[SE$FILE_MODEL %in% "bdld3_23_x10_model_2"] <- 13
SE$BURIED[SE$FILE_MODEL %in% "bdld3_23_x10_model_3"] <- 19
SE$BURIED[SE$FILE_MODEL %in% "bdld3_23_x10_model_4"] <- 9
SE$BURIED[SE$FILE_MODEL %in% "bdld3_23_x10_model_5"] <- 9

SE$VIS[SE$FILE_MODEL %in% "bdld3_25_x10_model_1"] <- 'CANDIDATE'
SE$VIS[SE$FILE_MODEL %in% "bdld3_25_x10_model_2"] <- 'CANDIDATE'
SE$VIS[SE$FILE_MODEL %in% "bdld3_25_x10_model_3"] <- 'CANDIDATE'
SE$VIS[SE$FILE_MODEL %in% "bdld3_25_x10_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_25_x10_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_25_x10_model_1"] <- 14
SE$BURIED[SE$FILE_MODEL %in% "bdld3_25_x10_model_2"] <- 8
SE$BURIED[SE$FILE_MODEL %in% "bdld3_25_x10_model_3"] <- 9
SE$BURIED[SE$FILE_MODEL %in% "bdld3_25_x10_model_4"] <- 7
SE$BURIED[SE$FILE_MODEL %in% "bdld3_25_x10_model_5"] <- 9

SE$VIS[SE$FILE_MODEL %in% "bdld3_26_x10_model_1"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_26_x10_model_2"] <- 'CANDIDATE'
SE$VIS[SE$FILE_MODEL %in% "bdld3_26_x10_model_3"] <- 'CANDIDATE'
SE$VIS[SE$FILE_MODEL %in% "bdld3_26_x10_model_4"] <- 'CANDIDATE'
SE$VIS[SE$FILE_MODEL %in% "bdld3_26_x10_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_26_x10_model_1"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_26_x10_model_2"] <- 16
SE$BURIED[SE$FILE_MODEL %in% "bdld3_26_x10_model_3"] <- 15
SE$BURIED[SE$FILE_MODEL %in% "bdld3_26_x10_model_4"] <- 13
SE$BURIED[SE$FILE_MODEL %in% "bdld3_26_x10_model_5"] <- 7

SE$VIS[SE$FILE_MODEL %in% "bdld3_27_x10_model_1"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_27_x10_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_27_x10_model_3"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_27_x10_model_4"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_27_x10_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_27_x10_model_1"] <- 7
SE$BURIED[SE$FILE_MODEL %in% "bdld3_27_x10_model_2"] <- 6
SE$BURIED[SE$FILE_MODEL %in% "bdld3_27_x10_model_3"] <- 10
SE$BURIED[SE$FILE_MODEL %in% "bdld3_27_x10_model_4"] <- 4
SE$BURIED[SE$FILE_MODEL %in% "bdld3_27_x10_model_5"] <- 9

SE$VIS[SE$FILE_MODEL %in% "bdld3_28_x10_model_1"] <- 'CANDIDATE'
SE$VIS[SE$FILE_MODEL %in% "bdld3_28_x10_model_2"] <- 'CANDIDATE'
SE$VIS[SE$FILE_MODEL %in% "bdld3_28_x10_model_3"] <- 'CANDIDATE'
SE$VIS[SE$FILE_MODEL %in% "bdld3_28_x10_model_4"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_28_x10_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_28_x10_model_1"] <- 6
SE$BURIED[SE$FILE_MODEL %in% "bdld3_28_x10_model_2"] <- 6
SE$BURIED[SE$FILE_MODEL %in% "bdld3_28_x10_model_3"] <- 9
SE$BURIED[SE$FILE_MODEL %in% "bdld3_28_x10_model_4"] <- 8
SE$BURIED[SE$FILE_MODEL %in% "bdld3_28_x10_model_5"] <- 9

SE$VIS[SE$FILE_MODEL %in% "bdld3_30_x10_model_1"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_30_x10_model_2"] <- 'CANDIDATE'
SE$VIS[SE$FILE_MODEL %in% "bdld3_30_x10_model_3"] <- 'CANDIDATE'
SE$VIS[SE$FILE_MODEL %in% "bdld3_30_x10_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_30_x10_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_30_x10_model_1"] <- 9
SE$BURIED[SE$FILE_MODEL %in% "bdld3_30_x10_model_2"] <- 7
SE$BURIED[SE$FILE_MODEL %in% "bdld3_30_x10_model_3"] <- 7
SE$BURIED[SE$FILE_MODEL %in% "bdld3_30_x10_model_4"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_30_x10_model_5"] <- 9

SE$VIS[SE$FILE_MODEL %in% "bdld3_31_x10_model_1"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_31_x10_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_31_x10_model_3"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_31_x10_model_4"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_31_x10_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_31_x10_model_1"] <- 8
SE$BURIED[SE$FILE_MODEL %in% "bdld3_31_x10_model_2"] <- 7
SE$BURIED[SE$FILE_MODEL %in% "bdld3_31_x10_model_3"] <- 6
SE$BURIED[SE$FILE_MODEL %in% "bdld3_31_x10_model_4"] <- 6
SE$BURIED[SE$FILE_MODEL %in% "bdld3_31_x10_model_5"] <- 9

SE$VIS[SE$FILE_MODEL %in% "bdld3_32_x10_model_1"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_32_x10_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_32_x10_model_3"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_32_x10_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_32_x10_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_32_x10_model_1"] <- 6
SE$BURIED[SE$FILE_MODEL %in% "bdld3_32_x10_model_2"] <- 7
SE$BURIED[SE$FILE_MODEL %in% "bdld3_32_x10_model_3"] <- 6
SE$BURIED[SE$FILE_MODEL %in% "bdld3_32_x10_model_4"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_32_x10_model_5"] <- 9

SE$VIS[SE$FILE_MODEL %in% "bdld3_33_x10_model_1"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_33_x10_model_2"] <- 'CANDIDATE'
SE$VIS[SE$FILE_MODEL %in% "bdld3_33_x10_model_3"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_33_x10_model_4"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_33_x10_model_5"] <- 'CANDIDATE'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_33_x10_model_1"] <- 4
SE$BURIED[SE$FILE_MODEL %in% "bdld3_33_x10_model_2"] <- 7
SE$BURIED[SE$FILE_MODEL %in% "bdld3_33_x10_model_3"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_33_x10_model_4"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_33_x10_model_5"] <- 7

SE$VIS[SE$FILE_MODEL %in% "bdld3_35_x10_model_1"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_35_x10_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_35_x10_model_3"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_35_x10_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_35_x10_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_35_x10_model_1"] <- 9
SE$BURIED[SE$FILE_MODEL %in% "bdld3_35_x10_model_2"] <- 8
SE$BURIED[SE$FILE_MODEL %in% "bdld3_35_x10_model_3"] <- 7
SE$BURIED[SE$FILE_MODEL %in% "bdld3_35_x10_model_4"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_35_x10_model_5"] <- 10

SE$VIS[SE$FILE_MODEL %in% "bdld3_36_x10_model_1"] <- 'CANDIDATE'
SE$VIS[SE$FILE_MODEL %in% "bdld3_36_x10_model_2"] <- 'CANDIDATE'
SE$VIS[SE$FILE_MODEL %in% "bdld3_36_x10_model_3"] <- 'CANDIDATE'
SE$VIS[SE$FILE_MODEL %in% "bdld3_36_x10_model_4"] <- 'CANDIDATE'
SE$VIS[SE$FILE_MODEL %in% "bdld3_36_x10_model_5"] <- 'CANDIDATE'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_36_x10_model_1"] <- 4
SE$BURIED[SE$FILE_MODEL %in% "bdld3_36_x10_model_2"] <- 7
SE$BURIED[SE$FILE_MODEL %in% "bdld3_36_x10_model_3"] <- 8
SE$BURIED[SE$FILE_MODEL %in% "bdld3_36_x10_model_4"] <- 7
SE$BURIED[SE$FILE_MODEL %in% "bdld3_36_x10_model_5"] <- 8

SE$VIS[SE$FILE_MODEL %in% "bdld3_38_x10_model_1"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_38_x10_model_2"] <- 'CANDIDATE'
SE$VIS[SE$FILE_MODEL %in% "bdld3_38_x10_model_3"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_38_x10_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_38_x10_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_38_x10_model_1"] <- 9
SE$BURIED[SE$FILE_MODEL %in% "bdld3_38_x10_model_2"] <- 7
SE$BURIED[SE$FILE_MODEL %in% "bdld3_38_x10_model_3"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_38_x10_model_4"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_38_x10_model_5"] <- 9

SE$VIS[SE$FILE_MODEL %in% "bdld3_39_x10_model_1"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_39_x10_model_2"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_39_x10_model_3"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_39_x10_model_4"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_39_x10_model_5"] <- 'none'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_39_x10_model_1"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_39_x10_model_2"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_39_x10_model_3"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_39_x10_model_4"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_39_x10_model_5"] <- 0

SE$VIS[SE$FILE_MODEL %in% "bdld3_41_x10_model_1"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_41_x10_model_2"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_41_x10_model_3"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_41_x10_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_41_x10_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_41_x10_model_1"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_41_x10_model_2"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_41_x10_model_3"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_41_x10_model_4"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_41_x10_model_5"] <- 0

SE$VIS[SE$FILE_MODEL %in% "bdld3_42_x10_model_1"] <- 'CANDIDATE'
SE$VIS[SE$FILE_MODEL %in% "bdld3_42_x10_model_2"] <- 'CANDIDATE'
SE$VIS[SE$FILE_MODEL %in% "bdld3_42_x10_model_3"] <- 'CANDIDATE'
SE$VIS[SE$FILE_MODEL %in% "bdld3_42_x10_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_42_x10_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_42_x10_model_1"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_42_x10_model_2"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_42_x10_model_3"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_42_x10_model_4"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_42_x10_model_5"] <- 0

SE$VIS[SE$FILE_MODEL %in% "bdld3_43_x10_model_1"] <- 'CANDIDATE'
SE$VIS[SE$FILE_MODEL %in% "bdld3_43_x10_model_2"] <- 'CANDIDATE'
SE$VIS[SE$FILE_MODEL %in% "bdld3_43_x10_model_3"] <- 'CANDIDATE'
SE$VIS[SE$FILE_MODEL %in% "bdld3_43_x10_model_4"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_43_x10_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_43_x10_model_1"] <- 13
SE$BURIED[SE$FILE_MODEL %in% "bdld3_43_x10_model_2"] <- 11
SE$BURIED[SE$FILE_MODEL %in% "bdld3_43_x10_model_3"] <- 13
SE$BURIED[SE$FILE_MODEL %in% "bdld3_43_x10_model_4"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_43_x10_model_5"] <- 2

SE$VIS[SE$FILE_MODEL %in% "bdld3_44_x10_model_1"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_44_x10_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_44_x10_model_3"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_44_x10_model_4"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_44_x10_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_44_x10_model_1"] <- 9
SE$BURIED[SE$FILE_MODEL %in% "bdld3_44_x10_model_2"] <- 7
SE$BURIED[SE$FILE_MODEL %in% "bdld3_44_x10_model_3"] <- 7
SE$BURIED[SE$FILE_MODEL %in% "bdld3_44_x10_model_4"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_44_x10_model_5"] <- 9

SE$VIS[SE$FILE_MODEL %in% "bdld3_45_x10_model_1"] <- 'CANDIDATE'
SE$VIS[SE$FILE_MODEL %in% "bdld3_45_x10_model_2"] <- 'CANDIDATE'
SE$VIS[SE$FILE_MODEL %in% "bdld3_45_x10_model_3"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_45_x10_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_45_x10_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_45_x10_model_1"] <- 10
SE$BURIED[SE$FILE_MODEL %in% "bdld3_45_x10_model_2"] <- 12
SE$BURIED[SE$FILE_MODEL %in% "bdld3_45_x10_model_3"] <- 8
SE$BURIED[SE$FILE_MODEL %in% "bdld3_45_x10_model_4"] <- 9
SE$BURIED[SE$FILE_MODEL %in% "bdld3_45_x10_model_5"] <- 9

SE$VIS[SE$FILE_MODEL %in% "bdld3_46_x10_model_1"] <- 'CANDIDATE'
SE$VIS[SE$FILE_MODEL %in% "bdld3_46_x10_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_46_x10_model_3"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_46_x10_model_4"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_46_x10_model_5"] <- 'CANDIDATE'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_46_x10_model_1"] <- 9
SE$BURIED[SE$FILE_MODEL %in% "bdld3_46_x10_model_2"] <- 7
SE$BURIED[SE$FILE_MODEL %in% "bdld3_46_x10_model_3"] <- 11
SE$BURIED[SE$FILE_MODEL %in% "bdld3_46_x10_model_4"] <- 7
SE$BURIED[SE$FILE_MODEL %in% "bdld3_46_x10_model_5"] <- 13

SE$VIS[SE$FILE_MODEL %in% "bdld3_48_x10_model_1"] <- 'CANDIDATE'
SE$VIS[SE$FILE_MODEL %in% "bdld3_48_x10_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_48_x10_model_3"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_48_x10_model_4"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_48_x10_model_5"] <- 'CANDIDATE'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_48_x10_model_1"] <- 6
SE$BURIED[SE$FILE_MODEL %in% "bdld3_48_x10_model_2"] <- 8
SE$BURIED[SE$FILE_MODEL %in% "bdld3_48_x10_model_3"] <- 7
SE$BURIED[SE$FILE_MODEL %in% "bdld3_48_x10_model_4"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_48_x10_model_5"] <- 7

SE$VIS[SE$FILE_MODEL %in% "bdld3_49_x10_model_1"] <- 'CANDIDATE'
SE$VIS[SE$FILE_MODEL %in% "bdld3_49_x10_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_49_x10_model_3"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_49_x10_model_4"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_49_x10_model_5"] <- 'CANDIDATE_low'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_49_x10_model_1"] <- 13
SE$BURIED[SE$FILE_MODEL %in% "bdld3_49_x10_model_2"] <- 3
SE$BURIED[SE$FILE_MODEL %in% "bdld3_49_x10_model_3"] <- 11
SE$BURIED[SE$FILE_MODEL %in% "bdld3_49_x10_model_4"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_49_x10_model_5"] <- 0

SE$VIS[SE$FILE_MODEL %in% "bdld3_50_x10_model_1"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_50_x10_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_50_x10_model_3"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_50_x10_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_50_x10_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_50_x10_model_1"] <- 9
SE$BURIED[SE$FILE_MODEL %in% "bdld3_50_x10_model_2"] <- 12
SE$BURIED[SE$FILE_MODEL %in% "bdld3_50_x10_model_3"] <- 2
SE$BURIED[SE$FILE_MODEL %in% "bdld3_50_x10_model_4"] <- 6
SE$BURIED[SE$FILE_MODEL %in% "bdld3_50_x10_model_5"] <- 10

SE$VIS[SE$FILE_MODEL %in% "bdld3_51_x10_model_1"] <- 'CANDIDATE'
SE$VIS[SE$FILE_MODEL %in% "bdld3_51_x10_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_51_x10_model_3"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_51_x10_model_4"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_51_x10_model_5"] <- 'CANDIDATE_low'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_51_x10_model_1"] <- 15
SE$BURIED[SE$FILE_MODEL %in% "bdld3_51_x10_model_2"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_51_x10_model_3"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_51_x10_model_4"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_51_x10_model_5"] <- 8

SE$VIS[SE$FILE_MODEL %in% "bdld3_54_x10_model_1"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_54_x10_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_54_x10_model_3"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_54_x10_model_4"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_54_x10_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_54_x10_model_1"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_54_x10_model_2"] <- 7
SE$BURIED[SE$FILE_MODEL %in% "bdld3_54_x10_model_3"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_54_x10_model_4"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_54_x10_model_5"] <- 0

SE$VIS[SE$FILE_MODEL %in% "bdld3_55_x10_model_1"] <- 'CANDIDATE'
SE$VIS[SE$FILE_MODEL %in% "bdld3_55_x10_model_2"] <- 'CANDIDATE'
SE$VIS[SE$FILE_MODEL %in% "bdld3_55_x10_model_3"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_55_x10_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_55_x10_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_55_x10_model_1"] <- 14
SE$BURIED[SE$FILE_MODEL %in% "bdld3_55_x10_model_2"] <- 12
SE$BURIED[SE$FILE_MODEL %in% "bdld3_55_x10_model_3"] <- 12
SE$BURIED[SE$FILE_MODEL %in% "bdld3_55_x10_model_4"] <- 9
SE$BURIED[SE$FILE_MODEL %in% "bdld3_55_x10_model_5"] <- 9

SE$VIS[SE$FILE_MODEL %in% "bdld3_56_x10_model_1"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_56_x10_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_56_x10_model_3"] <- 'CANDIDATE'
SE$VIS[SE$FILE_MODEL %in% "bdld3_56_x10_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_56_x10_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_56_x10_model_1"] <- 7
SE$BURIED[SE$FILE_MODEL %in% "bdld3_56_x10_model_2"] <- 10
SE$BURIED[SE$FILE_MODEL %in% "bdld3_56_x10_model_3"] <- 15
SE$BURIED[SE$FILE_MODEL %in% "bdld3_56_x10_model_4"] <- 9
SE$BURIED[SE$FILE_MODEL %in% "bdld3_56_x10_model_5"] <- 9

SE$VIS[SE$FILE_MODEL %in% "bdld3_57_x10_model_1"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_57_x10_model_2"] <- 'OTHER'
SE$VIS[SE$FILE_MODEL %in% "bdld3_57_x10_model_3"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_57_x10_model_4"] <- 'OTHER'
SE$VIS[SE$FILE_MODEL %in% "bdld3_57_x10_model_5"] <- 'OTHER'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_57_x10_model_1"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_57_x10_model_2"] <- 1
SE$BURIED[SE$FILE_MODEL %in% "bdld3_57_x10_model_3"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_57_x10_model_4"] <- 4
SE$BURIED[SE$FILE_MODEL %in% "bdld3_57_x10_model_5"] <- 5

SE$VIS[SE$FILE_MODEL %in% "bdld3_58_x10_model_1"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_58_x10_model_2"] <- 'OTHER'
SE$VIS[SE$FILE_MODEL %in% "bdld3_58_x10_model_3"] <- 'OTHER'
SE$VIS[SE$FILE_MODEL %in% "bdld3_58_x10_model_4"] <- 'OTHER'
SE$VIS[SE$FILE_MODEL %in% "bdld3_58_x10_model_5"] <- 'OTHER'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_58_x10_model_1"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_58_x10_model_2"] <- 9
SE$BURIED[SE$FILE_MODEL %in% "bdld3_58_x10_model_3"] <- 2
SE$BURIED[SE$FILE_MODEL %in% "bdld3_58_x10_model_4"] <- 9
SE$BURIED[SE$FILE_MODEL %in% "bdld3_58_x10_model_5"] <- 5

SE$VIS[SE$FILE_MODEL %in% "bdld3_59_x10_model_1"] <- 'DIMER'
SE$VIS[SE$FILE_MODEL %in% "bdld3_59_x10_model_2"] <- 'DIMER'
SE$VIS[SE$FILE_MODEL %in% "bdld3_59_x10_model_3"] <- 'DIMER'
SE$VIS[SE$FILE_MODEL %in% "bdld3_59_x10_model_4"] <- 'DIMER'
SE$VIS[SE$FILE_MODEL %in% "bdld3_59_x10_model_5"] <- 'DIMER'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_59_x10_model_1"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_59_x10_model_2"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_59_x10_model_3"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_59_x10_model_4"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_59_x10_model_5"] <- 5

SE$VIS[SE$FILE_MODEL %in% "bdld3_61_x10_model_1"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_61_x10_model_2"] <- 'CANDIDATE'
SE$VIS[SE$FILE_MODEL %in% "bdld3_61_x10_model_3"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_61_x10_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_61_x10_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_61_x10_model_1"] <- 10
SE$BURIED[SE$FILE_MODEL %in% "bdld3_61_x10_model_2"] <- 13
SE$BURIED[SE$FILE_MODEL %in% "bdld3_61_x10_model_3"] <- 8
SE$BURIED[SE$FILE_MODEL %in% "bdld3_61_x10_model_4"] <- 9
SE$BURIED[SE$FILE_MODEL %in% "bdld3_61_x10_model_5"] <- 9

SE$VIS[SE$FILE_MODEL %in% "bdld3_62_x10_model_1"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_62_x10_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_62_x10_model_3"] <- 'CANDIDATE'
SE$VIS[SE$FILE_MODEL %in% "bdld3_62_x10_model_4"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_62_x10_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_62_x10_model_1"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_62_x10_model_2"] <- 11
SE$BURIED[SE$FILE_MODEL %in% "bdld3_62_x10_model_3"] <- 13
SE$BURIED[SE$FILE_MODEL %in% "bdld3_62_x10_model_4"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_62_x10_model_5"] <- 9

SE$VIS[SE$FILE_MODEL %in% "bdld3_64_x10_model_1"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_64_x10_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_64_x10_model_3"] <- 'CANDIDATE'
SE$VIS[SE$FILE_MODEL %in% "bdld3_64_x10_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_64_x10_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_64_x10_model_1"] <- 7
SE$BURIED[SE$FILE_MODEL %in% "bdld3_64_x10_model_2"] <- 8
SE$BURIED[SE$FILE_MODEL %in% "bdld3_64_x10_model_3"] <- 6
SE$BURIED[SE$FILE_MODEL %in% "bdld3_64_x10_model_4"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_64_x10_model_5"] <- 9

SE$VIS[SE$FILE_MODEL %in% "bdld3_65_x10_model_1"] <- 'CANDIDATE'
SE$VIS[SE$FILE_MODEL %in% "bdld3_65_x10_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_65_x10_model_3"] <- 'CANDIDATE'
SE$VIS[SE$FILE_MODEL %in% "bdld3_65_x10_model_4"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_65_x10_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_65_x10_model_1"] <- 12
SE$BURIED[SE$FILE_MODEL %in% "bdld3_65_x10_model_2"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_65_x10_model_3"] <- 20
SE$BURIED[SE$FILE_MODEL %in% "bdld3_65_x10_model_4"] <- 7
SE$BURIED[SE$FILE_MODEL %in% "bdld3_65_x10_model_5"] <- 6

SE$VIS[SE$FILE_MODEL %in% "bdld3_66_x10_model_1"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_66_x10_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_66_x10_model_3"] <- 'CANDIDATE'
SE$VIS[SE$FILE_MODEL %in% "bdld3_66_x10_model_4"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_66_x10_model_5"] <- 'none'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_66_x10_model_1"] <- 9
SE$BURIED[SE$FILE_MODEL %in% "bdld3_66_x10_model_2"] <- 8
SE$BURIED[SE$FILE_MODEL %in% "bdld3_66_x10_model_3"] <- 7
SE$BURIED[SE$FILE_MODEL %in% "bdld3_66_x10_model_4"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_66_x10_model_5"] <- 0

SE$VIS[SE$FILE_MODEL %in% "bdld3_67_x10_model_1"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_67_x10_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_67_x10_model_3"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_67_x10_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_67_x10_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_67_x10_model_1"] <- 8
SE$BURIED[SE$FILE_MODEL %in% "bdld3_67_x10_model_2"] <- 7
SE$BURIED[SE$FILE_MODEL %in% "bdld3_67_x10_model_3"] <- 7
SE$BURIED[SE$FILE_MODEL %in% "bdld3_67_x10_model_4"] <- 7
SE$BURIED[SE$FILE_MODEL %in% "bdld3_67_x10_model_5"] <- 9

SE$VIS[SE$FILE_MODEL %in% "bdld3_69_x10_model_1"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_69_x10_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_69_x10_model_3"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_69_x10_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_69_x10_model_5"] <- 'CANDIDATE_low'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_69_x10_model_1"] <- 9
SE$BURIED[SE$FILE_MODEL %in% "bdld3_69_x10_model_2"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_69_x10_model_3"] <- 8
SE$BURIED[SE$FILE_MODEL %in% "bdld3_69_x10_model_4"] <- 9
SE$BURIED[SE$FILE_MODEL %in% "bdld3_69_x10_model_5"] <- 8

SE$VIS[SE$FILE_MODEL %in% "bdld3_71_x10_model_1"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_71_x10_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_71_x10_model_3"] <- 'CANDIDATE'
SE$VIS[SE$FILE_MODEL %in% "bdld3_71_x10_model_4"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_71_x10_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_71_x10_model_1"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_71_x10_model_2"] <- 7
SE$BURIED[SE$FILE_MODEL %in% "bdld3_71_x10_model_3"] <- 7
SE$BURIED[SE$FILE_MODEL %in% "bdld3_71_x10_model_4"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_71_x10_model_5"] <- 9

SE$VIS[SE$FILE_MODEL %in% "bdld3_73_x10_model_1"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_73_x10_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_73_x10_model_3"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_73_x10_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_73_x10_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_73_x10_model_1"] <- 9
SE$BURIED[SE$FILE_MODEL %in% "bdld3_73_x10_model_2"] <- 7
SE$BURIED[SE$FILE_MODEL %in% "bdld3_73_x10_model_3"] <- 8
SE$BURIED[SE$FILE_MODEL %in% "bdld3_73_x10_model_4"] <- 9
SE$BURIED[SE$FILE_MODEL %in% "bdld3_73_x10_model_5"] <- 9

SE$VIS[SE$FILE_MODEL %in% "bdld3_74_x10_model_1"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_74_x10_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_74_x10_model_3"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_74_x10_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_74_x10_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_74_x10_model_1"] <- 9
SE$BURIED[SE$FILE_MODEL %in% "bdld3_74_x10_model_2"] <- 8
SE$BURIED[SE$FILE_MODEL %in% "bdld3_74_x10_model_3"] <- 9
SE$BURIED[SE$FILE_MODEL %in% "bdld3_74_x10_model_4"] <- 9
SE$BURIED[SE$FILE_MODEL %in% "bdld3_74_x10_model_5"] <- 9

SE$VIS[SE$FILE_MODEL %in% "bdld3_76_x10_model_1"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_76_x10_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_76_x10_model_3"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_76_x10_model_4"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_76_x10_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_76_x10_model_1"] <- 4
SE$BURIED[SE$FILE_MODEL %in% "bdld3_76_x10_model_2"] <- 5
SE$BURIED[SE$FILE_MODEL %in% "bdld3_76_x10_model_3"] <- 7
SE$BURIED[SE$FILE_MODEL %in% "bdld3_76_x10_model_4"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_76_x10_model_5"] <- 9

SE$VIS[SE$FILE_MODEL %in% "bdld3_77_x10_model_1"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_77_x10_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_77_x10_model_3"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_77_x10_model_4"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_77_x10_model_5"] <- 'none'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_77_x10_model_1"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_77_x10_model_2"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_77_x10_model_3"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_77_x10_model_4"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_77_x10_model_5"] <- 0

SE$VIS[SE$FILE_MODEL %in% "bdld3_78_x10_model_1"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_78_x10_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_78_x10_model_3"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_78_x10_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_78_x10_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_78_x10_model_1"] <- 8
SE$BURIED[SE$FILE_MODEL %in% "bdld3_78_x10_model_2"] <- 7
SE$BURIED[SE$FILE_MODEL %in% "bdld3_78_x10_model_3"] <- 8
SE$BURIED[SE$FILE_MODEL %in% "bdld3_78_x10_model_4"] <- 9
SE$BURIED[SE$FILE_MODEL %in% "bdld3_78_x10_model_5"] <- 9

SE$VIS[SE$FILE_MODEL %in% "bdld3_79_x10_model_1"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_79_x10_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_79_x10_model_3"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_79_x10_model_4"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_79_x10_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_79_x10_model_1"] <- 7
SE$BURIED[SE$FILE_MODEL %in% "bdld3_79_x10_model_2"] <- 12
SE$BURIED[SE$FILE_MODEL %in% "bdld3_79_x10_model_3"] <- 10
SE$BURIED[SE$FILE_MODEL %in% "bdld3_79_x10_model_4"] <- 8
SE$BURIED[SE$FILE_MODEL %in% "bdld3_79_x10_model_5"] <- 9

SE$VIS[SE$FILE_MODEL %in% "bdld3_82_x10_model_1"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_82_x10_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_82_x10_model_3"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_82_x10_model_4"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "bdld3_82_x10_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_82_x10_model_1"] <- 4
SE$BURIED[SE$FILE_MODEL %in% "bdld3_82_x10_model_2"] <- 6
SE$BURIED[SE$FILE_MODEL %in% "bdld3_82_x10_model_3"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_82_x10_model_4"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "bdld3_82_x10_model_5"] <- 9

SE$VIS[SE$FILE_MODEL %in% "bdld3_84_x10_model_1"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_84_x10_model_2"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_84_x10_model_3"] <- 'CANDIDATE_low'
SE$VIS[SE$FILE_MODEL %in% "bdld3_84_x10_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "bdld3_84_x10_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "bdld3_84_x10_model_1"] <- 9
SE$BURIED[SE$FILE_MODEL %in% "bdld3_84_x10_model_2"] <- 6
SE$BURIED[SE$FILE_MODEL %in% "bdld3_84_x10_model_3"] <- 6
SE$BURIED[SE$FILE_MODEL %in% "bdld3_84_x10_model_4"] <- 1
SE$BURIED[SE$FILE_MODEL %in% "bdld3_84_x10_model_5"] <- 9

SE$VIS[SE$FILE_MODEL %in% "MAVS-CARD_MOUSE_x10_model_1"] <- 'OTHER'
SE$VIS[SE$FILE_MODEL %in% "MAVS-CARD_MOUSE_x10_model_2"] <- 'CANDIDATE'
SE$VIS[SE$FILE_MODEL %in% "MAVS-CARD_MOUSE_x10_model_3"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "MAVS-CARD_MOUSE_x10_model_4"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "MAVS-CARD_MOUSE_x10_model_5"] <- 'none'
SE$BURIED[SE$FILE_MODEL %in% "MAVS-CARD_MOUSE_x10_model_1"] <- 1
SE$BURIED[SE$FILE_MODEL %in% "MAVS-CARD_MOUSE_x10_model_2"] <- 12
SE$BURIED[SE$FILE_MODEL %in% "MAVS-CARD_MOUSE_x10_model_3"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "MAVS-CARD_MOUSE_x10_model_4"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "MAVS-CARD_MOUSE_x10_model_5"] <- 0

SE$VIS[SE$FILE_MODEL %in% "FADD-DED_MOUSE_x10_model_1"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "FADD-DED_MOUSE_x10_model_2"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "FADD-DED_MOUSE_x10_model_3"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "FADD-DED_MOUSE_x10_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "FADD-DED_MOUSE_x10_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "FADD-DED_MOUSE_x10_model_1"] <- 9
SE$BURIED[SE$FILE_MODEL %in% "FADD-DED_MOUSE_x10_model_2"] <- 9
SE$BURIED[SE$FILE_MODEL %in% "FADD-DED_MOUSE_x10_model_3"] <- 10
SE$BURIED[SE$FILE_MODEL %in% "FADD-DED_MOUSE_x10_model_4"] <- 9
SE$BURIED[SE$FILE_MODEL %in% "FADD-DED_MOUSE_x10_model_5"] <- 9

SE$VIS[SE$FILE_MODEL %in% "CRADD-CARD_MOUSE_x10_model_1"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "CRADD-CARD_MOUSE_x10_model_2"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "CRADD-CARD_MOUSE_x10_model_3"] <- 'none'
SE$VIS[SE$FILE_MODEL %in% "CRADD-CARD_MOUSE_x10_model_4"] <- 'linear'
SE$VIS[SE$FILE_MODEL %in% "CRADD-CARD_MOUSE_x10_model_5"] <- 'linear'
SE$BURIED[SE$FILE_MODEL %in% "CRADD-CARD_MOUSE_x10_model_1"] <- 9
SE$BURIED[SE$FILE_MODEL %in% "CRADD-CARD_MOUSE_x10_model_2"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "CRADD-CARD_MOUSE_x10_model_3"] <- 0
SE$BURIED[SE$FILE_MODEL %in% "CRADD-CARD_MOUSE_x10_model_4"] <- 7
SE$BURIED[SE$FILE_MODEL %in% "CRADD-CARD_MOUSE_x10_model_5"] <- 9

SE <- SE %>% mutate(BURIED_norm = round(BURIED/N_MULTIMERS, 2),
                    BURIED_norm_grp = case_when(BURIED_norm == 0 ~ "0",
                                                BURIED_norm > 0 & BURIED_norm <= 1   ~ "< 1",
                                                BURIED_norm > 1 & BURIED_norm <= 2.5 ~ "> 1"),
                    mainCat = case_when(VIS %in% c("DIMER", "OTHER", "circular") ~ "OTHER INTERACTION",
                                        VIS == "none" ~ "NO INTERACTION OBSERVED",
                                        BURIED_norm >= 1 ~ "HELICAL FILAMENT CANDIDATE",
                                        BURIED_norm < 1 ~ "LOW CANDIDATE")) %>% unique()

# WRITE FILE
write.csv(SE, file = "~/Documents/Github/mscTayLab/csv/02_SLURM_EVALUATED.csv", row.names = F)
