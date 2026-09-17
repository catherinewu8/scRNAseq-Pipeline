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

###############################
###---Data Pre-Processing---###
###############################

# Make a function for Seurat QC where minFeat is the minimum number of features,
# maxFeat is the maximum number of features, and mtPct is the maximum mitochondrial counts



