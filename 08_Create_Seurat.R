#--- Set up environment ---#
library(tidyverse)
library(Seurat)

#---Load Data---#

dirs <- list.dirs(
  getwd(), 
  recursive = FALSE, 
  full.names = FALSE
)

##################################
###--- Build Seurat Objects ---###
##################################

gse <- "" # Enter GSE ID here

sample_dirs <- dirs[grep1(paste0(gse,"_SRR"), dirs)]

seurat_list <- list()

for (d in sample_dirs) {
  if (file.exists(file.path(d, "outs/filtered_feature_bc_matrix/"))){
    counts <- Read10X(file.path(d, "outs/filtered_feature_bc_matrix/"))
    
    seurat_list[[sub(".*_","",basename(d))]] <- CreateSeuratObject(
      counts = counts, 
      project = sub(".*_","",basename(d))
    )
  }
}

