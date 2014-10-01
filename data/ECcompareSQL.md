East Coast Sparrow Model Compare Methods to Aggregate Loads to Lakes-Data Step
========================================================
Stuff to do 
-------------------------
* ready to go 20140930
<<<<<<< HEAD
* But, R2002 does not have a field for incremental load.  Need to verify if it is included in the input load so I can compare my method for calculating total lake concentrations.
=======
* But, R2002 does not have a field for incremental load.  I can still compare my method for calculating inflow and outflow loads but not total lake concentrations.
>>>>>>> e265630f21b75e693fc6215f87103ad8ec78fed8

<!---
use these command instead of the knit icon if you want the data and work loaded into the R workspace
  setwd('data')
  library(knitr)
  knit('ECcompareSQL.rmd')
  
Some useful RSQLite commands
      EC<-dbConnect(SQLite(), dbname='ECcompare.sqlite')
      dbListTables(EC)                         # List the tables in the database
      dbListFields(EC, "reachcodes")               # List the columns in a table
      dbReadTable(EC, "N2002")                # Display the data in a table method1
      dbGetQuery(EC, "SELECT * from flowlines")   # Display the data in a table method2
-->

Create ECcompare.sqlite in the "./data/" subdirectory and add the following tables
-------------------------
* **Table N2002**: Nitrogen predictions for flowlines in MRB1; Incremental loads reported without decay. Original data received from Anne Hoos on September 29 2014 (Sasdataset: "predict_tn_2002_mrb1_exc_incdeca.sas7bdat"" in "Corrected_predictandmassbal_tn_2002_mrb1_excludeincdecay_noatmsec.zip") and saved to C:\Bryan\EPA\Data\Sparrow\EastCoast\Predictions20140923. File read directly into R and saved as a table in ECcompare.sqlite. NOTE:Only a small subset of the available data fields are kept to reduce the size of the database (see ECcompareDataDefinitions.xls).
* **Table R2002**: Nitrogen predictions MRB1 (N2002) aggregated to lakes by reachcode (WBRchCd). Original data received from Anne Hoos on September 29 2014 (Sasdataset: "mrb1_massbalancereservoirs_2002.sas7bdat" in “Corrected_predictandmassbal_tn_2002_mrb1_excludeincdecay_noatmsec.zip”) and saved to C:\Bryan\EPA\Data\Sparrow\EastCoast\Predictions20140923. File read directly into R and saved as a table in ECcompare.sqlite. NOTE:Only a small subset of the available data fields are kept to reduce the size of the database (see ECcompareDataDefinitions.xls). 
* **Table "flowlines**": Links the flowline COMIDs to the MRB1 WBIDs and shows whether the flowline is an input or output to the lake or an internal reach. Imported from tblJoinFlowline_WBID_InOut (MRB1.mdb)
* **Table "reachcodes"** links the MRB1 WaterbodyIDs (WBID) to the NHDplus waterbody Reachcodes (WBRchCd). Created (code below) from: MRB1_NHDWaterbody (WaterbodyDatabase.mdb: the MRB1 NHDplus waterbodies showing the COMIDs and Reachcodes) and tblJoinCOMID_WBID (WaterbodyDatabase.mdb: a table to match waterbody COMIDs to the Lake WBIDs). The reachcodes are used to compare values to R2002.
<<<<<<< HEAD
* browseURL('https://github.com/willbmisled/ECsparrow/blob/master/data/ECcompareSQL.md')
=======
>>>>>>> e265630f21b75e693fc6215f87103ad8ec78fed8
    















Create table "reachcodes": join the WBIDs to the GRIDCODES for MRB1
-------------------------
* Gridcodes for each NHDplus waterbody (COMID) are in the table MRB1_NHDWaterbody in EC2014.mdb
* The waterbody COMIDs and Gridcodes need to be joined to the WBIDs in tblJoinCOMID_WBID
* These tables are imported into a new SQLite databse (ECcompare.sqlite)
* SQL is used to 
  * read the tables from ECcompare.sqlite, join them and write them to a new table.
  * identify the WBIDs with multiple GRIDcodes 
  * create a new table with WBID, COMID, GRIDCODE, and the Count
  * delete the tables temp, temp1, tblJoinCOMID_WBID & MRB1_NHDWaterbody
* we end with a single table (reachcodes) in ECcompare.sqlite
* Evaluate reachcodes
  * 36306 observations
  * 36274 unique WBIDs 
  * 28008 unique Reachcodes
  * 8293 COMIDs with missing reachcodes; most of these are not really lakes but there is one (a subWaterbody of lake Champlain; WBID=22302965) with a missing reachcode.
  * 56 observations with multiple reachcodes representing 24 WBID lakes
* Below is a list of the lakes with multiple reachcodes (reachcodes$Count>1).  These should be removed from the anlaysis.


```
##           WBID    COMID       WBRCHCD Count
## 1880   1720193  1720187 1020004001703     2
## 1881   1720193  1720193 1020004001711     2
## 2578   2587109  2585309 2040105001573     2
## 2579   2587109  2587109 2040105001797     2
## 2592   2587239  2585459 2040105001601     2
## 2593   2587239  2587239 2040105001604     2
## 3544   2678796  2674786 1050002003597     3
## 3545   2678796  2678796 1050002004149     3
## 3546   2678796  2675480 1050002004154     3
## 4044   2684326  2682038 1050002003992     2
## 4045   2684326  2684326 1050002003993     2
## 4051   2684388  2682322 1050002003991     2
## 4052   2684388  2684388 1050002004139     2
## 4188   2741492  2739308 2040103000929     2
## 4189   2741492  2741492 2040103001116     2
## 7277   4493058  4489688 2040202002736     2
## 7278   4493058  4493058 2040202002960     2
## 14603  6149863  6146749 1100001001512     2
## 14604  6149863  6149863 1100001001707     2
## 17347  6248656  6247096 2030103002109     2
## 17348  6248656  6248656 2030103002396     2
## 20927  7715078  7714588 1100005003201     2
## 20928  7715078  7715078 1100005003490     2
## 22822  8390908  8390912 2060008000998     2
## 22823  8390908  8390908 2060008000999     2
## 25435  9312497  5842312 1060003002118     2
## 25436  9312497  9312497 1060003002156     2
## 25682  9326606  9326590 1080106001881     2
## 25683  9326606  9326606 1080106001885     2
## 27441  9479066  9443357 2040301008817     2
## 27442  9479066  9479066 2040301008946     2
## 29898  9512548  9512548 2030105001257     2
## 29899  9512548  9512546 2030105001259     2
## 33513 19333595 19333065 1040001000649     2
## 33514 19333595 19333595 1040001000777     2
## 33550 19333669 19333669 1040001000794     2
## 33551 19333669 19333637 1040001000802     2
## 33718 19334883 19334883 1040001000759     2
## 33719 19334883 19334219 1080101001111     2
## 33932 22222791  7688829 1080204001183     2
## 33933 22222791 22222791 1080204001452     2
## 34073 22223101  7689297 1080204001281     3
## 34074 22223101 22223101 1080204001284     3
## 34075 22223101  9344247 1080204001447     3
## 34744 22294870 22294080 2020002001089     2
## 34745 22294870 22294870 2020002001285     2
## 34943 22302965 15447546            NA     7
## 34944 22302965 15447624 2010007000278     7
## 34945 22302965 22302965 2010008000258     7
## 34946 22302965 10312598 2010008000622     7
## 34947 22302965 15447762 2010008000674     7
## 34948 22302965  4586930 2010008000708     7
## 34949 22302965 15447620 2010008000736     7
## 34950 22302965 15447630 2010008000737     7
## 35229 22305061 22303243 2020001001555     2
## 35230 22305061 22305061 2020001001925     2
```


Data Definitions for table "N2002"
-------------------------
**Field** | **Definition**
------------- | -------------
**comid** | Stream Reach Identifier from NHDplus
**WBRCHCD** | Unique identifier for a reservoir or lake,  from nhdwaterbody dbf file Aug 2011
**PLOAD_TOTAL** | Total Flux (kg/yr)
**PLOAD_INC_TOTAL** | Total Incremental (Inc) Flux (kg/yr)
**concentration** | Mean Flow-Weighted Concentration (mg/L)


Data Definitions for table "R2002"
-------------------------
**Field** | **Definition**
------------- | -------------
**TN_CONC_inload** | Tributary inflow Nitrogen Concentration, mg/L  -  this is value reported in USGS DS 820 as "Concentration of tributary inflow to receiving water", calculated as  (TN_LOAD_inflow) / (TOT_CFS * 28.32 * 1/1000000 * 86400 * 365 ).   Would have preferred to use sum of tributary inflow MAFLOWU as the demonimator but this was difficult to compute;  thus it's a slightly mixed calculation
**TN_massdecay** | Nitrogen mass removed in the lake,  kg/yr, summed from the amount removed in each incremental reservoir segment - this is value reported in USGS DS 820 as "Load assimilated in receiving waterbody"
**TOT_CFS** | Flow (ft3/sec): to convert to m3/yr multiply by 893593
**TN_LOAD_outflow** | Total nitrogen load at downstream node of exit reach, in kg/yr - this is the value reported in USGS DS 820 source share table as "Total load".    Wanted to use TN_LOAD_inflow here, to be consistent with use of trib inflow info in the table that follows, but see explanation at top of this file
**TN_LOAD_inflow** | Total nitrogen load entering lake from all tributaries and adjacent areas,  calculated from mass balance (load at downstream node of exit reach plus load removed in lake)
**TN_CONC_inlake** | Estimated In-Lake Nitrogen Concentration of reservoir  (mg/L), calculated as TN_arealloading_outload / (hload * (1 - RetentCoeff_Nurnberg))


Data Definitions for table "flowlines"
-------------------------
**Field** | **Definition**
------------- | -------------
**WBID** | Unique lake identifier from WaterbodyDatabase.mdb
**SelectLake** | 1=lake not flagged; 0=at least one reach in lake has a problem (missing data, diverision, Nin not equal Nout)
**Reach** | NHDplus identifier (COMID)
**GridCode** | Stream Reach GridCode
**LakeOutflow** | 1 = reach is an outflow; 0 = not an outflow
**ReachInLake** | 1 = reach is internal to lake; 0 = not in lake
**ReachUpstream** | 1 = reach immediately downstream of lake; 0 = not downstream
**ReachDownstream** | 1 = reach immediately upstream of lake; 0 = not upstream
**FlagReach** | 1 = problem with reach 
**LakeFcode** | NHDplus Fcode for Waterbody
**ReachFcode** | NHDplus Fcode for Stream Reach
**HasNPData** | The original MRB1 SPARROW model had N/P data for this reach
**Diversion** | Known diversion in the reach
**NinEqNout** | Nitrogen Inputs to reach = outputs

Data Definitions for table "reachcodes"
-------------------------
**Field** | **Definition**
------------- | -------------
**WBID** | Unique Waterbody ID
**COMID** | NHDplus Unique Waterbody ID-sometimes there are multiple COMID for a single WBID
**WBRCHCD** | NHDplus Waterbody Reachcode associated with each COMID; Note this was converted to numeric so leading Zero was lost.  Leading Zero can be added back or used as numeric.
**Count** | Number of WBRchCds associated with the WBID-for analysis keep Count==1 



