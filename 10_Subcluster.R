#--- Set up environment ---#
library(tidyverse)
library(Seurat)

#--- Load data ---#
file <- # Enter saved RDS file name here
  
obj <- readRDS(file)

#--- Perform Subclustering ---#
res <- "" # Indicate resolution 

Idents(obj) <- res # Ensure correct resolution is assigned to object

obj_subset <- subset(
  obj, 
  idents = c() # List clusters of interest
)

#--- Process Subclustered object ---#