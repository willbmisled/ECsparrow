Create Spatial Objects for Waterbodies in HUC regions 01, 02, 03, and 06
========================================================
Stuff to do 
-------------------------
* ready 20140930

<!---
use these command instead of the knit icon if you want the data and work loaded into the R workspace
First make sure you are in the data directory: 
  setwd('data')
  library(knitr)
  knit('lakesSpatialData.rmd')
  
-->


Spatial Data
-------------------------
* read the nhdwaterbody.shp files for the four regions
* identify and remove duplicate lakes
* merge lakes from the regions
* dissolve based on reachcode-output= SpatialPolygonsDataframe "lakes" with geographic coordinates
* get the centroids and convert to spdf with reachcode (WBRCHCODE) as an attribute. output= SpatialPointsDataframe "lakes" with geographic coordinates
* save data in "lakesSpatialData.rda"
* two spatial datasets are created for the lakes in MRB1 and MRB2; both in geographic coordinates
  * lakes: a spatial Polygons Dataframe with the lake locations based on reachcode (WBRCHCODE)
  * lakesPt: a spatial Points Dataframe with the lake centroids based on reachcode (WBRCHCODE)
  


************
The following code will open the formatted text version of the Rmarkdown file in a browser:
************
    browseURL('https://github.com/willbmisled/ECsparrow/blob/master/data/lakesSpatialData.md')
************
The data can be loaded into R with the following code:
************
  #Get the Data (make sure you are in the "data" subdirectory)
    load(url('lakesSpatialData.rda'))



















Missing reachcodes 
-------------------------
* We have spatial data (lakesPt or lakes) for all but 43 of the lakes in EC aggregated lakes files (EClakes.sqlite)
* The documentation of this database shows that some reachcodes were derived for lakes in MRB2.  
* These are probably the missing lakes.
* Here is a list of the missing reachcodes.


```
##  [1] "03"             "01"             "07"             "11"            
##  [5] "08"             "04"             "11584048"       "11584038"      
##  [9] "11584046"       "11584040"       "03020201025512" "10527779"      
## [13] "9737212"        "11564540"       "9737188"        "11563346"      
## [17] "14451569"       "14451543"       "6444768"        "6444608"       
## [21] "031300024858"   "21714404"       "6467846"        "6468224"       
## [25] "18698303"       "19569682"       "19569598"       "18698893"      
## [29] "21678064"       "6495032"        "22270958"       "6495028"       
## [33] "6495030"        "22198215"       "18926164"       "18632968"      
## [37] "18926156"       "18156295"       "22760058"       "22760460"      
## [41] "19267368"       "18926182"       "18156275"
```

