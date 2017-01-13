#####################################
## Wij doen MEE                    ##
## Assignment 5 - NDVI             ##
## Dillen Bruil and Rik van Heumen ##
## 13-1-2017                       ##
#####################################

# Calculate NDVI function
# x = red_band
# y = NIR_band

#general NDVI function
ndvOver <- function(x, y){
  ndvi <- (y - x) / (x + y)
  return(ndvi)
}

#Applies NDVI function to raster_red and raster_ndvi
calcNDVI <- function(x, y){
  overlay(x, y, fun = ndvOver)
}

