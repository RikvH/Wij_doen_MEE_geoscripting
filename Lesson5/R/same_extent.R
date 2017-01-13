#####################################
## Wij doen MEE                    ##
## Assignment 5 - NDVI             ##
## Dillen Bruil and Rik van Heumen ##
## 13-1-2017                       ##
#####################################

#Creats raster files from all necessary bands

landsat5_red <- raster('data/LT51980241990098KIS00_sr_band3.tif')
landsat5_NIR <- raster('data/LT51980241990098KIS00_sr_band4.tif')
landsat5_fmask <- raster('data/LT51980241990098KIS00_cfmask.tif')

landsat8_red <- raster('data/LC81970242014109LGN00_sr_band4.tif')
landsat8_NIR <- raster('data/LC81970242014109LGN00_sr_band5.tif')
landsat8_fmask <- raster('data/LC81970242014109LGN00_cfmask.tif')

#sets all the raster files to the same extent

landsat5_red_crop <- intersect(landsat5_red, landsat8_red)
landsat5_NIR_crop <- intersect(landsat5_NIR, landsat8_NIR)
landsat5_fmask_crop <- intersect(landsat5_fmask, landsat8_fmask) 

landsat8_red_crop <- intersect(landsat8_red, landsat5_red)
landsat8_NIR_crop <- intersect(landsat8_NIR, landsat5_NIR)
landsat8_fmask_crop <- intersect(landsat8_fmask, landsat5_fmask)


