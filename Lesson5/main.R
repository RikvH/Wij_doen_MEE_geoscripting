#####################################
## Wij doen MEE                    ##
## Assignment 5 - NDVI             ##
## Dillen Bruil and Rik van Heumen ##
## 13-1-2017                       ##
#####################################

rm(list=ls())

# Import packages

  #install.packages("raster") #in case not installed
library(raster)

# Download and load datasets

download.file(url = 'https://dl.dropboxusercontent.com/s/akb9oyye3ee92h3/LT51980241990098-SC20150107121947.tar.gz',
              destfile = 'data/landsat5', method = 'auto')
download.file(url = 'https://dl.dropboxusercontent.com/s/i1ylsft80ox6a32/LC81970242014109-SC20141230042441.tar.gz',
              destfile = 'data/landsat8', method = 'auto')
untar('data/landsat5', exdir = 'data/')
untar('data/landsat8', exdir = 'data/')

# Source functions

source('R/same_extent.R')
source('R/ndvi.R')
source('R/clouds.R')


# Calculate ndvi and ndvi without clouds for landsat 5 and landsat 8

ndvi_5 <- calcNDVI(landsat5_red_crop, landsat5_NIR_crop)
ndvi_8 <- calcNDVI(landsat8_red_crop, landsat8_NIR_crop)

ndvi_5_nc <- landsatCloudFree(ndvi_5,landsat5_fmask_crop)
ndvi_8_nc <- landsatCloudFree(ndvi_8,landsat8_fmask_crop)

#calculate the differences
#negative values means decreased vegetation, positives values mean increased vegetation
dif_ndvi <- ndvi_8_nc - ndvi_5_nc  


# Output
# Plots showing the ndvi and the differences
plot(ndvi_5_nc, main="NDVI 8 April 1990")
plot(ndvi_8_nc, main="NDVI 18 April 2014")

plot(dif_ndvi, main="Change in vegetation")
legend("topleft", "Negative: decrease in vegetation
Positive: increase in vegetation", bty = "n")


#write last plot to output file as a png
png("output/difference_ndvi.png")
plot(dif_ndvi, main="Change in vegetation")
legend("topleft", "Negative: decrease in vegetation
Positive: increase in vegetation
       ", bty = "n")
dev.off()



