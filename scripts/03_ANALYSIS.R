################################################################################
####  03_ANALYSIS & VISUALIZATION ##############################################
################################################################################

library(tidyverse)
library(ggalt)
library(ggbiplot)
library(ggfortify)

SE <- read.csv("~/Documents/Github/mscTayLab/csv/sbatch_extract_full.csv")
SE <- SE %>% mutate(inv.RANK = 6-RANK)

#isolate <- SE %>% filter(FILE_MODEL %in% "bdld3_28_x10_model_1")
#isolate <- SE %>% filter(FILE %in% c("ASC-PYD", "MYD88-DD_slim3"))
#isolate <- SE %>% filter(FILE %in% c("MAVS-CARD_MOUSE"))
isolate <- SE %>% filter(VIS %in% c("FILAMENT"))
#isolate <- SE %>% filter(BURIED_norm_grp == "BURIED_norm < 2.5")
#isolate <- SE %>% filter(BURIED > 12)

ggplot() +
  geom_encircle(data = SE, aes(iRes, piTM, group=VIS,fill=VIS, col = VIS, alpha = 0.1), spread = 0.1) +
  geom_point(data = SE, aes(iRes, piTM, col = VIS, size = inv.RANK, alpha = 0.2)) +
  ggtitle(paste0("x = iRes, y = piTM, col = VIS, size = RANK"))# +
  #geom_label(data = isolate, aes(iRes, piTM), label = isolate$FILE_MODEL, nudge_y = 0.05) +
  #facet_wrap(~mainCat)

ggplot() +
  geom_encircle(data = SE, aes(iRes, piTM, group=mainCat,fill=mainCat, col = mainCat, alpha = 0.1), spread = 0.1) +
  geom_point(data = SE, aes(iRes, piTM, col = mainCat, size = inv.RANK, alpha = 0.2)) +
  ggtitle(paste0("x = iRes, y = piTM, col = mainCat, size = RANK"))

ggplot() + 
  geom_encircle(data = SE, aes(iRes, piTM, group=BURIED_norm_grp,fill=BURIED_norm_grp, col = BURIED_norm_grp, alpha = 0.1), spread = 0.1) +
  geom_point(data = SE, aes(iRes, piTM, col = BURIED_norm_grp, size = inv.RANK, alpha = 0.2)) + 
  ggtitle(paste0("x = iRes, y = piTM, col = BURIED_norm_grp, size = RANK"))# +
#  geom_label(data = isolate, aes(iRes, piTM), label = isolate$FILE_MODEL, nudge_y = 0.05)
#facet_wrap(~mainCat)

ggplot() + 
  geom_encircle(data = SE, aes(pLDDT, piTM, group=BURIED_norm_grp,fill=BURIED_norm_grp, col = BURIED_norm_grp, alpha = 0.1), spread = 0.1) +
  geom_point(data = SE, aes(pLDDT, piTM, col = BURIED_norm_grp, size = inv.RANK, alpha = 0.2)) + 
  ggtitle(paste0("x = iRes, y = piTM, col = BURIED_norm_grp, size = RANK"))

SE.pca <- prcomp(SE[,c(8:15, 17, 20)], center = TRUE,scale. = TRUE)

ggbiplot::ggbiplot(SE.pca, groups = SE$BURIED_norm_grp, ellipse = T)

SE.pca.plot <- autoplot(SE.pca, data = SE, colour = 'BURIED_norm_grp', size = "inv.RANK") #+ facet_wrap(~BURIED_norm_grp)
SE.pca.plot

# BY BURIED_norm_grp
plot(SE[,c(8:15, 17, 20)],  col = c("blue", "red", "green")[as.factor(SE$BURIED_norm_grp)])

# BY mainCat
plot(SE[,c(8:15, 17, 20)],  col = c("blue", "red", "green", "violet")[as.factor(SE$mainCat)])

# BY VIS
plot(SE, pch = 19, col = c("yellow", "orange", "red", "violet", "purple", "blue",  "lightgreen", "green")[as.factor(SE$VIS)])

# pLDDT vs. piTM, BY VIS
#plot(SE$pLDDT, SE$piTM, pch = 19, col = c("red", "orange", "yellow", "violet", "purple", "blue",  "darkgray", "green")[as.factor(SE$VIS)])
#legend("topleft",       pch = 19, col = c("red", "orange", "yellow", "violet", "purple", "blue",  "darkgray", "green"), legend = levels(as.factor(SE$VIS)))




