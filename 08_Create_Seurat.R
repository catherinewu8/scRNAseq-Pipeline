#--- Set up environment ---#
library(tidyverse)
library(Seurat)

#---Load Data---#

dirs <- list.dirs(
  getwd(), 
  recursive = FALSE, 
  full.names = FALSE
)

#---Build Seurat Objects---#

gse <- "" # Enter GSE ID here

sample_dirs <- dirs[grep1(paste0(gse,"_SRR"), dirs)]

seurat_list <- list()

