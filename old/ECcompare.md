East Coast Sparrow Model Compare Methods to Aggregate Loads to Lakes
========================================================
Data
-------------------------
* Data received from Anne Hoos on September 23 2014 as 4 sas files (forBryan_MRB2_Nitrogen_2002vs2020.zip) and saved to C:\Bryan\EPA\Data\Sparrow\EastCoast\Predictions20140923
  * mrb2_massbalancereservoirs_2002.sas7bdat
  * mrb2_massbalancereservoirs_2020.sas7bdat
  * mrb2_predict_tn_2002.sas7bdat
  * mrb2_predict_tn_2020.sas7bdat
* SAS datasets opened in SAS and exported to Access
* These data were added to a new access database (C:\Bryan\EPA\Data\Sparrow\EastCoast\Predictions20140923\EC2014.mdb) and the following tables were added as linked tables
  * MRB1_NHDWaterbody (WaterbodyDatabse.mdb): the MRB1 NHDplus waterbodies showing the COMIDs and Reachcodes.
  * tblJoinCOMID_WBID (WaterbodyDatabse.mdb): a table to match waterbody COMIDs to the Lake WBIDs
  * tblJoinFlowline_WBID_InOut (MRB1.mdb): this table links the flowline COMIDs to the WBIDs and shows whether the flowline is an input or output to the lake or an internal reach.
  * tblWBID_SParrowLoadDSS (MRB1.mdb): table with the Sparrow loads and flow I calculated from the DSS data.
* tblWBRCHCODE was created with the "qryWBRCHCODE_Final".  This table links the WBIDs to the Waterbody Reachcodes.  A more detailed analysis of this relationship is presented below. 

<!---
use these command instead of the knit icon if you want the data and work loaded into the R workspace
  library(knitr)
  knit('./ECcompare.rmd')
-->







Use RSQLite to create tblJoinWBID_WBRchCd and export to access
-------------------------
* First step: join the WBIDs to the GRIDCODES for MRB1
  * Gridcodes for each NHDplus waterbody (COMID) are in the table MRB1_NHDWaterbody in EC2014.mdb
  * The waterbody COMIDs and Gridcodes need to be joined to the WBIDs in tblJoinCOMID_WBID
  * These tables are imported into a new SQLite databse (EC.sqlite)
  * SQL is used to 
    * read the tables from EC.sqlite, join them and write them to a new table.
    * identify the WBIDs with multiple GRIDcodes 
    * create a new table with WBID, COMID, GRIDCODE, and the Count
    * delete the tables temp, temp1, tblJoinCOMID_WBID & MRB1_NHDWaterbody
  * we end with a single table (tblJoinWBID_WBRchCd) in EC.sqlite
  * Evaluate tblJoinWBID_WBRchCd
      * 36306 observations
      * 36274 unique WBIDs 
      * 28008 unique Reachcodes
      * 8293 COMIDs with missing reachcodes; most of these are not really lakes but there is one is a subWaterbody of lake Champlain (WBID=22302965) with a missing reachcode.
      * 56 observations with multiple reachcodes representing 24 WBID lakes
  * Below is a list of the lakes with multiple reachcodes.  These should be removed from the anlaysis.
  

```
##           WBID    COMID       WBRchCd Count
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


Data Definitions for tblJoinWBID_WBRchCd
-------------------------
**Field** | **Definition**
------------- | -------------
**WBID** | Unique Waterbody ID
**COMID** | NHDplus Unique Waterbody ID-sometimes there are multiple COMID for a single WBID
**WBRchCd** | NHDplus Waterbody Reachcode associated with each COMID; Note this was converted to numeric so leading Zero was lost.  Leading Zero can be added back or used as numeric.
**Count** | Number of WBRchCds associated with the WBID-for analysis keep Count==1 

Estimate Nitrogen Loads for Each WBID
-------------------------
**Get the 2002 Nitrogen predictions with the undecayed incremental loads**
* There are a lot of fields most of which will not be used so I am not going to give data definitions
* add table to EC.sqlite 





