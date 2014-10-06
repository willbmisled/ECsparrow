East Coast Sparrow Model Data
========================================================
Stuff to do 
-------------------------
* ready to go 20141006

<!---
use these command instead of the knit icon if you want the data and work loaded into the R workspace
First make sure you are in the data directory: 
  setwd('data')
  library(knitr)
  knit('EClakesSQL.rmd')
  
Some useful RSQLite commands
      EC<-dbConnect(SQLite(), dbname='EClakes.sqlite')
      dbListTables(EC)                         # List the tables in the database
      dbListFields(EC, "R2002m2")               # List the columns in a table
      dbReadTable(EC, "R2020m2")                # Display the data in a table method1
      dbGetQuery(EC, "SELECT * from R2020m1")   # Display the data in a table method2
-->

Create EClakes.sqlite in the "./data/" subdirectory and add the following tables
-------------------------
* **Table R2002m1**: Nitrogen predictions for MRB1 aggregated to lakes by reachcode (WBRchCd). Original data received from Anne Hoos on September 11 2014 (Sasdataset: "mrb1_massbalancereservoirs_2002.sas7bdat" in “forBryan_corrected_MRB1_Nitrogen_2002vs2020.zip”) and saved to C:\Bryan\EPA\Data\Sparrow\EastCoast\Predictions20140911. File read directly into R and saved as a table in EClakes.sqlite.

* **Table R2002m2**: Nitrogen predictions for MRB2 aggregated to lakes by reachcode (WBRchCd). Original data received from Anne Hoos on September 23 2014 (Sasdataset: "mrb2_massbalancereservoirs_2002.sas7bdat" in “forBryan_MRB2_Nitrogen_2002vs2020.zip”) and saved to C:\Bryan\EPA\Data\Sparrow\EastCoast\Predictions20140923. File read directly into R and saved as a table in EClakes.sqlite.

* **Table R2020m1**: Nitrogen predictions for MRB1 aggregated to lakes by reachcode (WBRchCd). Original data received from Anne Hoos on September 11 2014 (Sasdataset: "mrb1_massbalancereservoirs_2020.sas7bdat" in “forBryan_corrected_MRB1_Nitrogen_2002vs2020.zip”) and saved to C:\Bryan\EPA\Data\Sparrow\EastCoast\Predictions20140911. File read directly into R and saved as a table in EClakes.sqlite.

* **Table R2020m2**: Nitrogen predictions for MRB2 aggregated to lakes by reachcode (WBRchCd). Original data received from Anne Hoos on September 23 2014 (Sasdataset: "mrb2_massbalancereservoirs_2020.sas7bdat" in “forBryan_MRB2_Nitrogen_2002vs2020.zip”) and saved to C:\Bryan\EPA\Data\Sparrow\EastCoast\Predictions20140923. File read directly into R and saved as a table in EClakes.sqlite.

* Link to this document: https://github.com/willbmisled/ECsparrow/blob/master/data/EClakesSQL.md
















Data Table Descriptions
-------------------------
Sources:
* MRB1 data: README_definitionofattributes_massbalancereservoirs.xlsx 
* MRB2 data: README_definitionofattributes_massbalancereservoirs_MRB2.xlsx

Definition of attributes from the "massbalancereservoirs"  data sets  (output from  postprocessing  of NHDPlus  SPARROW model runs)
The file lists results for each of the 17,885 lakes/reservoirs in MRB1 and the 23,681 lakes/reservoirs in MRB2 (corresponding to the unique waterbody reach codes for each MRB) that are simulated as a lake or reservoir in the current (August 2013) version of the SPARROW model for the northeast (hydroregion 01 and 02). 
The attributes in red (see XLSX files) are reported in the tables in Appendix 1 of Moorman and others, 2014, U.S. Geological Survey Data Series Report 820.   (results are reported for 'large lakes' (surface area >= 5 square kilometers)
          Moorman, M.C., Hoos, A.B., Bricker, S.B., Moore, R.B., García, A.M., and Ator, S.W., 2014, Nutrient load summaries for major lakes and estuaries of the Eastern United States, 2002: U.S. Geological Survey Data Series 820, 94 p.,  http://dx.doi.org/10.3133/ds820.
With one important exception (explained in next sentence), we chose to report in the DS Report 820 appendix tables  the "input" part of the mass balance rather than the "output"(because the report focused on loads entering lakes/reservoirs/estuaries. 
      The one exception to this is the estimate of "Total load" and "Total yield",  reported along with source share percentages in DS Report 820.  We tried but found it messy to compute source shares percentages accurately for  for loads entering the lake from the various tributaries and lakeshore catchments, so the percentages pertain to outflow (i.e. are for load at downstream end of outlet reach).
      To be consistent with how the source share percentages are derived, therefore,  we reported the outflow  load and yield values in the source share table
      
**Data Definitions for TablesR2002m1 and R2020m1**

**Field** | **Definition**
------------- | -------------
**EstuaryGroup** | Grouping number, for presentation of results in Appendix 1 of DS Report 820 
**WBRCHCODE** | Waterbody Reachcode,  unique identifier for a reservoir or lake.  Most of these corresponds with the attribute 'REACHCODE' in the shapefile NHDwaterbody except where manual fixes were made (documented in the SAS program that populates the SPARROW input data  set); in a few cases a new reachcode was assigned by Craig Johnston in 2012.  Note: this field originally names "WBRchCd" in the MRB2 files
**GNIS_NAME** | Waterbody name from the Geographic Name Information System
**demtarea** | Cumulative drainage area (km2) for the downstream node of the flowline reach segment at the downstream end of the reservoir (same as CUMDRAINAG)
**AreaSqKm** | Total area of surface area of the reservoir/lake, in km2  (from Craig Johnston)
**invhload_aggreg** | Inverse of the hydraulic load aggregated for lake (i.e. inverse of hload_aggreg, see below for calculation);  in days/meter - this is the value reported in DS 820 as "Residence time, d/m" 
**TN_arealloading_in_perflush (misnomer,  should be named TN_LOAD_in_perflush)** | Tributary inflow load to lake per flushing rate (i.e. per hydraulic load, or could express as inflow load multiplied by inverse hydraulic load),  in kg*d/m, calculated as TN_LOAD_inflow / hload_aggreg - this is the value reported in DS 820 as "Load from watershed per hydraulic flushing rate of receiving waterbody"
**TP_arealloading_in_perflush (misnomer,  should be named TP_LOAD_in_perflush)** | Product of TP_arealloading_inload and invhload_aggreg   (see definitions of these attributes elsewhere)
**TN_CONC_inload** | Tributary inflow Nitrogen Concentration, mg/L  -  this is value reported in USGS DS 820 as "Concentration of tributary inflow to receiving water", calculated as  (TN_LOAD_inflow) / (TOT_CFS * 28.32 * 1/1000000 * 86400 * 365 ).   Would have preferred to use sum of tributary inflow MAFLOWU as the demonimator but this was difficult to compute;  thus it's a slightly mixed calculation
**TP_CONC_inload** | Tributary inflow Phosphorus Concentration, mg/L  -  this is value reported in USGS DS 820 as "Concentration of tributary inflow to receiving water", calculated as  (TP_LOAD_inflow) / (TOT_CFS * 28.32 * 1/1000000 * 86400 * 365 ).   Would have preferred to use sum of tributary inflow MAFLOWU as the demonimator but this was difficult to compute;  thus it's a slightly mixed calculation
**TNTP_CONC_inload** | Ratio of TN_CONC_inload to TP_CONC_inload - this is the value reported in USGS DS 820 as "Ratio of TN:TP"
**TN_massdecay** | Nitrogen mass removed in the lake,  kg/yr, summed from the amount removed in each incremental reservoir segment - this is value reported in USGS DS 820 as "Load assimilated in receiving waterbody"
**TP_massdecay** | Phosphorus mass removed in the lake,  kg/yr, summed from the amount removed in each incremental reservoir segment - this is value reported in USGS DS 820 as "Load assimilated in receiving waterbody"
**TN_decayperinflow** | Ratio of TN_massdecay to TN_LOAD_inflow
**TP_decayperinflow** | Ratio of TP_massdecay to TP_LOAD_inflow
**FTYPE** | Type of waterbody  ( only Lake/Pond waterbody polygons are included in the SPARROW input data set) 
**FCODE** | Code for waterbody, from NHDWaterbody
**Acres** | Total area of surface area of the reservoir/lake, in acres
**networked** | Flag indicating that lake/reservoir waterbody intersects with initialized flowline (1 = yes, all entries in this table have value of 1)
**ReachType** | Flag indicating whether flowline segment is a stream (0) or reservoir (2) reach,  used for SPARROW model simulation of mass removed (all entries in this table have value = 2)
**huc8** | 8-digit hydrologic unit code for the reach segment at the downstream end of the watebody polygon
**TOT_CFS** | Mean annual streamflow (cfs) for the reach segment at the downstream end of the reservoir (MAFLOWU). Note: this field originally names "MAFLOWU" in the MRB2 files
**DIVERGENCE** | 
**OUTLET** | Flag indicating outlet reach  (all reaches in this data set are the outlet reaches)
**hload_aggreg** | Hydraulic load of the lake/reservoir (also known as the surface overflow rate, qs),  in meters per year, calculated as MAFLOWU * 0.02832 * 86400 * 365 / (AreaSA_KM2 * 1000000)
**hload_aggreg_yr** | Hydraulic load, in meters per year
**RetentCoeff_Nurnberg** | Retention Coefficient (Rs) of the reservoir, computed as 15 /  (hload +  18)   (using Nurnberg, 1998)
**TN_LOAD_outflow** | Total nitrogen load at downstream node of exit reach, in kg/yr - this is the value reported in USGS DS 820 source share table as "Total load".    Wanted to use TN_LOAD_inflow here, to be consistent with use of trib inflow info in the table that follows, but see explanation at top of this file
**TP_LOAD_outflow** | Total phosphorus load at downstream node of exit reach, in kg/yr - this is the value reported in USGS DS 820 source share table as "Total load" -  Wanted to use TN_LOAD_inflow here, to be consistent with use of trib inflow info in the table that follows, but see explanation at top of this file
**TNTP_LOAD_outflow** | Ratio of TN_LOAD_outflow to TP_LOAD_outflow
**TN_LOAD_inflow** | Total nitrogen load entering lake from all tributaries and adjacent areas,  calculated from mass balance (load at downstream node of exit reach plus load removed in lake)
**TP_LOAD_inflow** | Total phosphorus load entering lake from all tributaries and adjacent areas,  calculated from mass balance (load at downstream node of exit reach plus load removed in lake)
**TNTP_LOAD_inflow** | Ratio of TN_LOAD_inflow to TP_LOAD_inflow
**TN_arealloading_inload** | Net specific or areal nitrogen loading (L) of the reservoir (kg/km2-yr), computed as ratio of TN_LOAD_inflow to AreaSqKm
**TN_arealloading_outload** | Net specific or areal nitrogen loading (L) of the reservoir (kg/km2-yr), computed as ratio of TN_LOAD_outflow to AreaSqKm
**TN_CONC_inlake** | Estimated In-Lake Nitrogen Concentration of reservoir  (mg/L), calculated as TN_arealloading_outload / (hload * (1 - RetentCoeff_Nurnberg))
**TP_arealloading_inload** | Net specific or areal phosphorus loading (L) of the reservoir (kg/km2-yr), computed as ratio of TP_LOAD_inflow to AreaSqKm
**TP_arealloading_outload** | Net specific or areal phosphorus loading (L) of the reservoir (kg/km2-yr), computed as ratio of TP_LOAD_outflow to AreaSqKm
**TP_CONC_inlake** | Estimated In-Lake Phosphorus Concentration of reservoir  (mg/L), calculated as TP_arealloading_outload / (hload * (1 - RetentCoeff_Nurnberg))

**Data Definitions for TablesR2002m2 and R2020m2**

**Field** | **Definition**
------------- | -------------
**ClusterNum** | Grouping number, for presentation of results in Appendix 1 of DS Report 820 
**WBRCHCODE** | Waterbody Reachcode (original field name: WBRchCd),  unique identifier for a reservoir or lake.  Most of these corresponds with the attribute 'REACHCODE' in the shapefile NHDwaterbody except where manual fixes were made (documented in the SAS program that populates the SPARROW input data  set); in a few cases a new reachcode was assigned by Anne Hoos in 2010
**WB_NAME_v2** | Waterbody name from the Geographic Name Information System (with corrections/revisions from Jennifer Murphy and Anne Hoos, 2010
**cumdrainag** | Cumulative drainage area (km2) for the downstream node of the flowline reach segment at the downstream end of the reservoir (same as CUMDRAINAG)
**Res_sumofsegmentSA_KM2** | Total area of surface area of the reservoir/lake, in km2  (from summing SA_KM2 for all the flowline segments associated with reservoir or lake
**invhload_aggreg** | Inverse of the hydraulic load aggregated for lake (i.e. inverse of hload_aggreg, see below for calculation);  in days/meter - this is the value reported in DS 820 as "Residence time, d/m" 
**TN_arealloading_in_perflush (misnomer,  should be named TN_LOAD_in_perflush)** | Tributary inflow load to lake per flushing rate (i.e. per hydraulic load, or could express as inflow load multiplied by inverse hydraulic load),  in kg*d/m, calculated as TN_LOAD_inflow / hload_aggreg - this is the value reported in DS 820 as "Load from watershed per hydraulic flushing rate of receiving waterbody"
**TP_arealloading_in_perflush (misnomer,  should be named TP_LOAD_in_perflush)** | Product of TP_arealloading_inload and invhload_aggreg   (see definitions of these attributes elsewhere)
**TN_CONC_inload** | Tributary inflow Nitrogen Concentration, mg/L  -  this is value reported in USGS DS 820 as "Concentration of tributary inflow to receiving water", calculated as  (TN_LOAD_inflow) / (TOT_CFS * 28.32 * 1/1000000 * 86400 * 365 ).   Would have preferred to use sum of tributary inflow MAFLOWU as the demonimator but this was difficult to compute;  thus it's a slightly mixed calculation
**TP_CONC_inload** | Tributary inflow Phosphorus Concentration, mg/L  -  this is value reported in USGS DS 820 as "Concentration of tributary inflow to receiving water", calculated as  (TP_LOAD_inflow) / (TOT_CFS * 28.32 * 1/1000000 * 86400 * 365 ).   Would have preferred to use sum of tributary inflow MAFLOWU as the demonimator but this was difficult to compute;  thus it's a slightly mixed calculation
**TNTP_CONC_inload** | Ratio of TN_CONC_inload to TP_CONC_inload - this is the value reported in USGS DS 820 as "Ratio of TN:TP"
**TN_massdecay** | Nitrogen mass removed in the lake,  kg/yr, summed from the amount removed in each incremental reservoir segment - this is value reported in USGS DS 820 as "Load assimilated in receiving waterbody"
**TP_massdecay** | Phosphorus mass removed in the lake,  kg/yr, summed from the amount removed in each incremental reservoir segment - this is value reported in USGS DS 820 as "Load assimilated in receiving waterbody"
**TN_decayperinflow** | Ratio of TN_massdecay to TN_LOAD_inflow
**TP_decayperinflow** | Ratio of TP_massdecay to TP_LOAD_inflow
**Res_NumSegments** | Total number of flowline segments associated with reservoir or lake
**WB_AREASQKM** | Total area of the waterbody polygon (from the NHDwaterbody shapefile).  Where multiple waterbody polygons constitute a reservoir this number is smaller than Res_sumofsegmentSA_KM2
**WB_FTYPE** | Type of waterbody  ( only Lake/Pond waterbody polygons are included in the SPARROW input data set) 
**WB_GNIS_ID** | Waterbody ID from the Geographic Name Information System, from the shapefile NHDwaterbody 
**WB_Comment** | Comment added by Anne Hoos or Jennifer Murphy if changes were made to attributes from NHDwaterbody (e.g. if WBRchCd was changed where two or more WBRchCd values refer to the same reservoir, or if determined that waterbody was coastal/brackish rather than freshwater and therefore SA_KM2 set to 0)
**TempArcID** | Flag (set equal to waterbody comid) indicating that this is a single-polygon reservoir/lake (verified from inspection) that was missing Waterbody Reachcode assignment in the shapefile NHDwaterbody and therefore WBRchCd has been set to waterbody comid 
**outletreach_comid** | COMID of outlet reach,  i.e. the  flowline identified as the most downstream (largest value of cumdrainag) for the reservoir or lake 
**outletreach_LAT** | Latitude (decimal degrees)  of downstream node of the outlet reach
**outletreach_LON** | Longitude (decimal degrees)  of downstream node of the outlet reach
**huc8** | 8-digit hydrologic unit code for the reach segment at the downstream end of the watebody polygon
**TN_LOAD** | same as TN_LOAD_outflow,  see below  (I should have deleted this attribute from the data set after renaming it to TN_LOAD_OUTFLOW)
**rchtype** | Flag indicating whether flowline segment is a stream (0) or reservoir (2) reach,  used for SPARROW model simulation of mass removed (all entries in this table have value = 2)
**TOT_CFS** | Mean annual streamflow (cfs) for the reach segment at the downstream end of the reservoir (MAFLOWU)
**TP_LOAD** | same as TP_LOAD_OUTFLOW,  see below (I should have deleted this attribute from the dataset after renaming it to TP_LOAD_OUTFLOW)
**hload_aggreg** | Hydraulic load of the lake/reservoir (also known as the surface overflow rate, qs),  in meters per year, calculated as MAFLOWU * 0.02832 * 86400 * 365 / (AreaSA_KM2 * 1000000)
**hload_aggreg_yr** | Hydraulic load, in meters per year
**RetentCoeff_Nurnberg** | Retention Coefficient (Rs) of the reservoir, computed as 15 /  (hload +  18)   (using Nurnberg, 1998)
**TN_LOAD_outflow** | Total nitrogen load at downstream node of exit reach, in kg/yr - this is the value reported in USGS DS 820 source share table as "Total load".    Wanted to use TN_LOAD_inflow here, to be consistent with use of trib inflow info in the table that follows, but see explanation at top of this file
**TP_LOAD_outflow** | Total phosphorus load at downstream node of exit reach, in kg/yr - this is the value reported in USGS DS 820 source share table as "Total load" -  Wanted to use TN_LOAD_inflow here, to be consistent with use of trib inflow info in the table that follows, but see explanation at top of this file
**TNTP_LOAD_outflow** | Ratio of TN_LOAD_outflow to TP_LOAD_outflow
**TN_LOAD_inflow** | Total nitrogen load entering lake from all tributaries and adjacent areas,  calculated from mass balance (load at downstream node of exit reach plus load removed in lake)
**TP_LOAD_inflow** | Total phosphorus load entering lake from all tributaries and adjacent areas,  calculated from mass balance (load at downstream node of exit reach plus load removed in lake)
**TNTP_LOAD_inflow** | Ratio of TN_LOAD_inflow to TP_LOAD_inflow
**TN_arealloading_inload** | Net specific or areal nitrogen loading (L) of the reservoir (kg/km2-yr), computed as ratio of TN_LOAD_inflow to AreaSqKm
**TN_arealloading_outload** | Net specific or areal nitrogen loading (L) of the reservoir (kg/km2-yr), computed as ratio of TN_LOAD_outflow to AreaSqKm
**TN_CONC_inlake** | Estimated In-Lake Nitrogen Concentration of reservoir  (mg/L), calculated as TN_arealloading_outload / (hload * (1 - RetentCoeff_Nurnberg))
**TP_arealloading_inload** | Net specific or areal phosphorus loading (L) of the reservoir (kg/km2-yr), computed as ratio of TP_LOAD_inflow to AreaSqKm
**TP_arealloading_outload** | Net specific or areal phosphorus loading (L) of the reservoir (kg/km2-yr), computed as ratio of TP_LOAD_outflow to AreaSqKm
**TP_CONC_inlake** | Estimated In-Lake Phosphorus Concentration of reservoir  (mg/L), calculated as TP_arealloading_outload / (hload * (1 - RetentCoeff_Nurnberg))
**TNTP_CONC_inlake** | Ratio of TN_CONC_inlake to TP_CONC_inlake







