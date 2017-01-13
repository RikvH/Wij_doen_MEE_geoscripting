#!/bin/bash
echo "Wij doen MEE"
echo "12 January 2016"
echo "Calculate LandSat NDVI"

#If there are old output files these have to be removed
#otherwise the script wont run
echo "remove old output files"
rm $(ls ndvi_*.tif)
rm $(ls ndvi_*.xml)

echo "get input file"
fn=$(ls *INT1U.tif)
echo "The input file: $fn"

int1fn="ndvi_original.tif"
int2fn="ndvi_resampled.tif"
outfn="ndvi_resampled_and_reprojected.tif"

echo "The output file: $outfn"

echo "calculate ndvi"
gdal_calc.py -A $fn --A_band=4 -B $fn --B_band=3 --outfile=$int1fn --calc="(A.astype(float)-B)/(A.astype(float)+B)" --type='Float32'
echo "resample ndvi"
gdalwarp -tr 60 60 -r near $int1fn $int2fn 
echo "reproject ndvi"
gdalwarp -t_srs EPSG:4326 $int2fn $outfn 

echo "look at some histogram statistics"
gdalinfo -hist -stats $int1fn
gdalinfo -hist -stats $int2fn
gdalinfo -hist -stats $outfn
