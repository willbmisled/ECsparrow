East Coast Sparrow Model Data
========================================================
<!---
use these command instead of the knit icon if you want the data and work loaded into the R workspace
  library(knitr)
  knit('./data/ECdata.rmd')
-->

Create EC.sqlite in the "./data/" subdirectory and add the following tables
-------------------------
* East Coast Sparrow data received from Anne Hoos on September 23 2014 as 4 sas files (forBryan_MRB2_Nitrogen_2002vs2020.zip) and saved to C:\Bryan\EPA\Data\Sparrow\EastCoast\Predictions20140923. The datasets are: 
  * The East Coast SPARROW model Nitrogen predictions for each flowline for the CMAQ N deposition predictions for years 2002 and 2020. Two files:
    * Table "N2002": source = mrb2_predict_tn_2002.sas7bdat
    * Table "N2020": source = mrb2_predict_tn_2020.sas7bdat: table renamed "N2020" 
  * The East Coast SPARROW model Nitrogen predictions aggregated to lakes (based on reachcodes). Two files:
    * Table "R2002": source = mrb2_massbalancereservoirs_2002.sas7bdat
    * Table "R2020": source = mrb2_massbalancereservoirs_2020.sas7bdat
* For MRB1 only the following tables were created/added to EC.sqlite
  * Table "WBIDflowlines": links the flowline COMIDs to the MRB1 WBIDs and shows whether the flowline is an input or output to the lake or an internal reach. Imported from tblJoinFlowline_WBID_InOut (MRB1.mdb)
  * Table "reachcodes" links the MRB1 WaterbodyIDs (WBID) to the NHDplus waterbody Reachcodes (WBRchCd). Created (code below) from:
    * MRB1_NHDWaterbody (WaterbodyDatabase.mdb): the MRB1 NHDplus waterbodies showing the COMIDs and Reachcodes.
    * tblJoinCOMID_WBID (WaterbodyDatabase.mdb): a table to match waterbody COMIDs to the Lake WBIDs
    





