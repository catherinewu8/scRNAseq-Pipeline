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

# For standard 10X output

for (d in sample_dirs) {
  if (file.exists(file.path(d, "outs/filtered_feature_bc_matrix/"))){
    counts <- Read10X(file.path(d, "outs/filtered_feature_bc_matrix/"))
    
    seurat_list[[sub(".*_","",basename(d))]] <- CreateSeuratObject(
      counts = counts, 
      project = sub(".*_","",basename(d))
    )
  }
}

# For h5 file output



###############################
###---Data Pre-Processing---###
###############################

# Make a function for Seurat QC where minFeat is the minimum number of features,
# maxFeat is the maximum number of features, and mtPct is the maximum mitochondrial counts

qc_function <- function(seurat, minFeat, maxFeat, mtPct){
  seurat[["percent.mt"]] <- PercentageFeatureSet(seurat, pattern = "^MT-")
  seurat <- subset(seurat, subset = nFeature_RNA > minFeat & nFeature_RNA < maxFeat & percent.mt < mtPct)
}


seurat_list <- lapply(seurat_list,
                      function(x) {
                        qc_function(x, 200, 2500, 15)
                      }
)

lapply(seurat_list, function(x) {
  colnames(x@meta.data)
})

# Normalize Data

seurat_list <- lapply(seurat_list,
                      function(x){
                        NormalizeData(x,
                                      normalization.method = "LogNormalize",
                                      scale.factor = 10000)
                      }
)

# Find Variable Features

seurat_list <- lapply(seurat_list,
                      function(x){
                        FindVariableFeatures(x,
                                             selection.method = "vst",
                                             nfeatures = 2000)
                      }
)



###########################
###--- Merge Objects ---###
###########################

# Combine objects and rename cell ids to differentiate samples

combined <- merge(
  x = seurat_list[[1]],
  y = seurat_list[-1],
  add.cell.ids = "orig.ident"
)


head(colnames(combined))
tail(colnames(combined))


#--- Scale Data ---#

combined <- ScaleData(combined,
                      features = VariableFeatures(combined))



#--- Linear Dimensional Reduction ---#
seed <- 42
resolution <- c(0.2, 0.5, 1, 1.5, 2)  # Change as needed


combined <- RunPCA(combined,
                   features = VariableFeatures(combined),
                   seed.use = seed
)

ElbowPlot(combined)



#--- Integrate with harmony ---#

library("harmony")

combined <- RunHarmony(
  object = combined,
  group.by.vars = "orig.ident",
  dims.use = 1:30,
  reduction.save = "harmony"
)


DimPlot(
  combined,
  reduction = "harmony",
  group.by = "patient"
)

# Find neighbors

combined <- FindNeighbors(
  object = combined,
  reduction = "harmony",
  dims = 1:30
)

combined <- FindClusters(
  object = combined,
  resolution = resolution
)

# UMAP

combined <- RunUMAP(
  object = combined,
  reduction = "harmony",
  dims = 1:20,
  reduction.name = "harmony_umap"
)

# Make sure harmonization worked, no batch effects

DimPlot(
  object = combined,
  reduction = "harmony_umap",
  group.by = "orig.ident"
)

# Plot different resolutions

DimPlot(
  object = combined,
  reduction = "harmony_umap",
  group.by = c(
    "RNA_snn_res.0.2",
    "RNA_snn_res.0.5",
    "RNA_snn_res.1",
    "RNA_snn_res.1.5",
    "RNA_snn_res.2"
  ),
  label = TRUE
)



#--- Join Layers ---#

combined <- JoinLayers(combined, assay = "RNA")

#--- Save Seurat Object ---#
saveRDS <- saveRDS(
  combined, 
  file = paste0(gse,"_combined.rds")
)


