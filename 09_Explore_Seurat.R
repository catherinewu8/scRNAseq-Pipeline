#--- Set up environment ---#
library(tidyverse)
library(Seurat)

#--- Load data ---#
file <- # Enter saved RDS file name here

obj <- readRDS(file)

#--- Explore Data---#
markers <- # Enter a list of markers for desired clusters
res <- "Resolution of Interest" # Enter resolution of interest

dp <- DotPlot(
  object = obj, 
  features = markers, 
  group.by = res
)
