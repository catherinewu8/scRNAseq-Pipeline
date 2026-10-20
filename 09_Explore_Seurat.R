#--- Set up environment ---#
library(tidyverse)
library(Seurat)

#--- Load data ---#
file <- # Enter saved RDS file name here

obj <- readRDS(file)

#--- Explore Data---#
markers <- # Enter a list of markers for desired clusters

