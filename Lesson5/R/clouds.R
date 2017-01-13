#####################################
## Wij doen MEE                    ##
## Assignment 5 - NDVI             ##
## Dillen Bruil and Rik van Heumen ##
## 13-1-2017                       ##
#####################################

#Removes clouds

#x = ndvi
#y = fmask

#General cloud removal function
cloud2NA <- function(x,y){
  x[y != 0] <- NA
  return (x)
}

#Applies cloud removal to NDVI input
landsatCloudFree <- function(x,y){
  overlay(x, y, fun=cloud2NA)
}
 
  