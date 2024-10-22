East Coast SPARROW: Compare Methods to Aggregate Loads to Lakes
========================================================
Stuff to do 
-------------------------
* 

<!---
use these command instead of the knit icon if you want the data and work loaded into the R workspace
First make sure you are in the analysis directory: 
  setwd('analysis')
  library(knitr)
  knit('compareMethods.rmd')
  
Some useful RSQLite commands
setwd('..')
      EC<-dbConnect(SQLite(), dbname='../data/ECcompare.sqlite')
      dbListTables(EC)                         # List the tables in the database
      dbListFields(EC, "R2002m1")               # List the columns in a table
      dbReadTable(EC, "R2002m2")                # Display the data in a table method1
      dbGetQuery(EC, "SELECT * from R2020m1")   # Display the data in a table method2
-->

Introduction
-------------------------
* The East Coast SPARROW model predicts nitrogen loads to streams in MRB1 and MRB2 (HUC regions 01, 02, 03, and 06)
* Information on the East Coast Model can be found here:
  * Moorman, M.C., Hoos, A.B., Bricker, S.B., Moore, R.B., García, A.M., and Ator, S.W., 2014, Nutrient load summaries for major lakes and estuaries of the Eastern United States, 2002: U.S. Geological Survey Data Series 820, 94 p.,  http://dx.doi.org/10.3133/ds820.
* Estimates of atmospheric deposition of nitrogen are derived from the CMAQ (Community Multi-scale Air Quality Model) model (http://www.epa.gov/AMD/Research/RIA/cmaq.html)
* The referenced USGS publication aggregates the loads from individual flowlines to NHDplus lakes (defined by reachcode).
* In this paper listed below we also aggregate the flowlines to lakes (based a dissolve of contiguous NHDplus lakes)
  * Milstead, W. B., J. W. Hollister, R. B. Moore, and H. A. Walker. 2013. Estimating Summer Nutrient Concentrations in Northeastern Lakes from SPARROW Load Predictions and Modeled Lake Depth and Volume. PLoS ONE PLoS ONE 8:e81457.
* Lakes defined by WBID and those defined by reachcode are largely comparable (see data definitions below) so we should be able to compare methods.
* Ann Hoos and Rich Moore have provide the lakes data from their methods and the East Coast Sparrow Predictions for the flowlines.
* The goal of this project is to recalculate the loads to lakes using the Milstead et al methods to compare results.

Objectives
-------------------------
* Calculate input, output, and internal loads to lakes based on methods from Milstead et al
* Compare to loads calculated in Moorman et al

Data Sources
-------------------------
* The East Coast SPARROW N predictions by flowline are in: '/data/ECcompare.sqlite'. 
* Data Description: https://github.com/willbmisled/ECsparrow/blob/master/data/ECcompareSQL.md
* Four tables are included:
  * **N2002**: N predictions based on 2002 conditions for flowlines
  * **R2002**: N2002 predictions aggregated to lakes
  * **flowlines**: crosswalk flowlines to lakes based on WBID
  * **reachcodes**: crosswalk WBID to reachcodes








Results
-------------------------
* Lake trophic state w
