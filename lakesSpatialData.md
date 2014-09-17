Create Spatial Objects for Waterbodies in HUC regions 01, 02, and 03
========================================================
Spatial Data
-------------------------
* read the nhdwaterbody.shp files for the three regions
* identify and remove duplicate lakes
* merge lakes from the regions
* dissolve based on reachcode-output= SpatialPolygonsDataframe "lakes" with geographic coordinates
* get the centroids and convert to spdf with reachcode (WBRCHCODE) as an attribute. output= SpatialPointsDataframe "lakes" with geographic coordinates
* save "lakes" and "lakesPt"










