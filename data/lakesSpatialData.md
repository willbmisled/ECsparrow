Create Spatial Objects for Waterbodies in HUC regions 01, 02, 03, and 06
========================================================
Stuff to do 
-------------------------
* ready 20141009

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
* Three spatial and one tabular datasets are created for the lakes in MRB1 and MRB2; both in geographic coordinates (NAD83)
  * lakes: a spatial Polygons Dataframe with the lake locations based on reachcode (WBRCHCODE)
  * lakesPt: a spatial Points Dataframe with the lake centroids based on reachcode (WBRCHCODE)
  * ECstates: state boundaries (derived from a shapefile from Jane Copeland) for states in MRB1 and MRB2
  * lakeStates: a table matching the 88662 lakes with reachcodes to states (note: lakes in more than 1 state arbitrarily assigned to 1 of the states.)
* "lakes", "lakesPt", and "lakeStates"" saved in "lakesSpatialData.rda"
* "ECstates" saved in "EClakes.rda"
* Link to this document: https://github.com/willbmisled/ECsparrow/blob/master/data/lakesSpatialData.md
  


















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








Assign Lakes to States
-------------------------
* use the "over" function (packages 'sp' and 'rgeos') to overlay lake Centroids on states
* this returns a df with 88274 of the 88662 lakes assigned to states
* NOTE: if a lake is more than 1 state it is arbitrarily assigned to one of the states (probably the one with the lowest index value)
* The 388 lakes that were not assigned are probably on the coast side of the state and just outside of the boundary.
* Next step is to overlay this polygons of the missing lakes on the states.
* This returns a df with 377 of the 388 missing lakes assigned to a state
* This leaves 11 lakes unassigned-for completeness I will check these visually and assign them to states.
* These were viewed individually in ArcGIS and assigned to states.
* Visually verified lakes include:


```
##         WBRCHCODE          State ST
## 1  03080201001942        Florida FL
## 2  01090002003246  Massachusetts MA
## 3  01090002003438  Massachusetts MA
## 4  02070011002029       Maryland MD
## 5  03010205008515 North Carolina NC
## 6  03020105001359 North Carolina NC
## 7  03020105001424 North Carolina NC
## 8  02080109000499       Virginia VA
## 9  02080109000503       Virginia VA
## 10 02080110001233       Virginia VA
## 11 03010205008503       Virginia VA
```


Data Definitions
-------------------------
**SpatialPolygonsDataFrame "Lakes" and SpatialPointsDataFrame "LakesPt"**
* 88662 observations
* Geographic Coordinates datum=NAD83 (proj4string="+proj=longlat +datum=NAD83 +no_defs +ellps=GRS80 +towgs84=0,0,06")

**Field** | **Definition**
------------- | -------------
**WBRCHCODE** | Waterbody Reachcode, unique identifier for a reservoir or lake from the attribute 'REACHCODE' in the shapefile(s) NHDwaterbody.  

**DataFrame "lakeStates"** 
* 88662 observations
* Geographic Coordinates datum=NAD83 (proj4string="+proj=longlat +datum=NAD83 +no_defs +ellps=GRS80 +towgs84=0,0,06")

**Field** | **Definition**
------------- | -------------
**WBRCHCODE** | Waterbody Reachcode, unique identifier for a reservoir or lake from the attribute 'REACHCODE' in the shapefile(s) NHDwaterbody. 
**State** | State names long form
**ST** | Two letter state abbreviation.

**SpatialPolygonsDataFrame "ECstates"** 
* 23 observations
* Geographic Coordinates datum=NAD83 (proj4string="+proj=longlat +datum=NAD83 +no_defs +ellps=GRS80 +towgs84=0,0,06")
* Attributes appear to be summary stats from the 2010 census.  Fields include:





