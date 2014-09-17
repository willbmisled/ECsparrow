East Coast Sparrow Model Notes
========================================================
Data
-------------------------
* Data received from Ann Hoos in September 2014 as 4 sas files and save to C:\Bryan\EPA\Data\Sparrow\EastCoast\Predictions20140911
  * mrb1_massbalancereservoirs_2002.sas7bdat
  * mrb1_massbalancereservoirs_2002.sas7bdat
  * mrb1_predict_tn_2002.sas7bdat
  * mrb1_predict_tn_2002.sas7bdat
* These data were added to a new access database (EC2014.mdb) and the following tables were added
  * MRB1_NHDWaterbody (WaterbodyDatabse.mdb): the MRB1 NHDplus waterbodies showing the COMIDs and Reachcodes.
  * tblJoinCOMID_WBID (WaterbodyDatabse.mdb): a table to match waterbody COMIDs to the Lake WBIDs
  * tblJoinFlowline_WBID_InOut (MRB1.mdb): this table links the flowline COMIDs to the WBIDs and shows whether the flowline is an input or output to the lake or an internal reach.
  * tblWBID_SParrowLoadDSS (MRB1.mdb): table with the Sparrow loads and flow I calculated from the DSS data.
  
Data Definintions for TN2002 and TN2020 predictions
-------------------------
**Note: some fields differ between 2002 and 2020.  See comments.**
  
**Name** | **Label** | **Comment**
------------- | ------------- | -------------
Name | Label | Comment
comid |  | 
reachcode_comb |  | 
MAFLOWU |  | 
EstuaryGroup |  | 
EstuaryCode |  | 
NOAA_targetonly |  | 
ReachTOT |  | 
ReachType |  | 
WBRchCd | Unique identifier for a reservoir or lake,  from nhdwaterbody dbf file Aug 2011 | 
tot_area | Upstream Drainage Area (km2) | 
inc_area | Incremental Drainage Area (km2) | 
arcid |  | 
fnode | Upstream Reach Node Identifier | 
tnode | Downstream Reach Node Identifier | 
hydseq | SPARROW Reach Hydrologic Sequencing Code | 
frac | Fraction Upstream Flux Diverted to Reach | 
iftran | If Reach Transmits Flux (1=yes, 0=no) | 
target | Destination Reach for Delivery (0/1) | 
ls_weight | Least-Squares Weight | 
STAID |  | 
DEPVAR |  | 
PLOAD_TOTAL | Total Flux (kg/yr) | 
PLOAD_PT_MUN_SMJ | PT_MUN_SMJ Flux (kg/yr) | 
PLOAD_PT_MUN_CB | PT_MUN_CB Flux (kg/yr) | 
PLOAD_PT_MUN_NWENG | PT_MUN_NWENG Flux (kg/yr) | 
PLOAD_PT_MUN_DELHUD | PT_MUN_DELHUD Flux (kg/yr) | 
PLOAD_CMAQ2020KG | CMAQ2020KG Flux (kg/yr) | Only TN2020
PLOAD_CMAQ2002KG | CMAQ2002KG Flux (kg/yr) | TN2002 only
PLOAD_DEP_ANIMALUNC_KGNI | DEP_ANIMALUNC_KGNI Flux (kg/yr) | TN2002 only
PLOAD_DEP_ANIMALCON_KGNI | DEP_ANIMALCON_KGNI Flux (kg/yr) | TN2002 only
PLOAD_DEP_FERT_KGNI | DEP_FERT_KGNI Flux (kg/yr) | TN2002 only
PLOAD_DEP_INDUSELEC_KGNI | DEP_INDUSELEC_KGNI Flux (kg/yr) | TN2002 only
PLOAD_DEP_INDUSOTH_KGNI | DEP_INDUSOTH_KGNI Flux (kg/yr) | TN2002 only
PLOAD_DEP_VEHICLE_KGNI | DEP_VEHICLE_KGNI Flux (kg/yr) | TN2002 only
PLOAD_DEP_BIOFIRE_KGNI | DEP_BIOFIRE_KGNI Flux (kg/yr) | TN2002 only
PLOAD_DEP_INTL_KGNI | DEP_INTL_KGNI Flux (kg/yr) | TN2002 only
PLOAD_DEP_AREA_KGNI | DEP_AREA_KGNI Flux (kg/yr) | TN2002 only
PLOAD_URBLAND_SN | URBLAND_SN Flux (kg/yr) | 
PLOAD_FERTROTATION | FERTROTATION Flux (kg/yr) | 
PLOAD_FERT_OTHER | FERT_OTHER Flux (kg/yr) | 
PLOAD_MANUREALL | MANUREALL Flux (kg/yr) | 
PLOAD_ND_TOTAL | Total Non-Decayed (ND) Flux (kg/yr) | 
PLOAD_ND_PT_MUN_SMJ | PT_MUN_SMJ Non-Decayed (ND) Flux (kg/yr) | 
PLOAD_ND_PT_MUN_CB | PT_MUN_CB Non-Decayed (ND) Flux (kg/yr) | 
PLOAD_ND_PT_MUN_NWENG | PT_MUN_NWENG Non-Decayed (ND) Flux (kg/yr) | 
PLOAD_ND_PT_MUN_DELHUD | PT_MUN_DELHUD Non-Decayed (ND) Flux (kg/yr) | 
PLOAD_ND_CMAQ2020KG | CMAQ2020KG Non-Decayed (ND) Flux (kg/yr) | Only TN2020
PLOAD_ND_CMAQ2002KG | CMAQ2002KG Non-Decayed (ND) Flux (kg/yr) | TN2002 only
PLOAD_ND_DEP_ANIMALUNC_KGNI | DEP_ANIMALUNC_KGNI Non-Decayed (ND) Flux (kg/yr) | TN2002 only
PLOAD_ND_DEP_ANIMALCON_KGNI | DEP_ANIMALCON_KGNI Non-Decayed (ND) Flux (kg/yr) | TN2002 only
PLOAD_ND_DEP_FERT_KGNI | DEP_FERT_KGNI Non-Decayed (ND) Flux (kg/yr) | TN2002 only
PLOAD_ND_DEP_INDUSELEC_KGNI | DEP_INDUSELEC_KGNI Non-Decayed (ND) Flux (kg/yr) | TN2002 only
PLOAD_ND_DEP_INDUSOTH_KGNI | DEP_INDUSOTH_KGNI Non-Decayed (ND) Flux (kg/yr) | TN2002 only
PLOAD_ND_DEP_VEHICLE_KGNI | DEP_VEHICLE_KGNI Non-Decayed (ND) Flux (kg/yr) | TN2002 only
PLOAD_ND_DEP_BIOFIRE_KGNI | DEP_BIOFIRE_KGNI Non-Decayed (ND) Flux (kg/yr) | TN2002 only
PLOAD_ND_DEP_INTL_KGNI | DEP_INTL_KGNI Non-Decayed (ND) Flux (kg/yr) | TN2002 only
PLOAD_ND_DEP_AREA_KGNI | DEP_AREA_KGNI Non-Decayed (ND) Flux (kg/yr) | TN2002 only
PLOAD_ND_URBLAND_SN | URBLAND_SN Non-Decayed (ND) Flux (kg/yr) | 
PLOAD_ND_FERTROTATION | FERTROTATION Non-Decayed (ND) Flux (kg/yr) | 
PLOAD_ND_FERT_OTHER | FERT_OTHER Non-Decayed (ND) Flux (kg/yr) | 
PLOAD_ND_MANUREALL | MANUREALL Non-Decayed (ND) Flux (kg/yr) | 
PLOAD_INC_TOTAL | Total Incremental (Inc) Flux (kg/yr) | 
PLOAD_INC_PT_MUN_SMJ | PT_MUN_SMJ Incremenatal Flux (kg/yr) | 
PLOAD_INC_PT_MUN_CB | PT_MUN_CB Incremenatal Flux (kg/yr) | 
PLOAD_INC_PT_MUN_NWENG | PT_MUN_NWENG Incremenatal Flux (kg/yr) | 
PLOAD_INC_PT_MUN_DELHUD | PT_MUN_DELHUD Incremenatal Flux (kg/yr) | 
PLOAD_INC_CMAQ2020KG | CMAQ2020KG Incremenatal Flux (kg/yr) | Only TN2020
PLOAD_INC_CMAQ2002KG | CMAQ2002KG Incremenatal Flux (kg/yr) | TN2002 only
PLOAD_INC_DEP_ANIMALUNC_KGNI | DEP_ANIMALUNC_KGNI Incremenatal Flux (kg/yr) | TN2002 only
PLOAD_INC_DEP_ANIMALCON_KGNI | DEP_ANIMALCON_KGNI Incremenatal Flux (kg/yr) | TN2002 only
PLOAD_INC_DEP_FERT_KGNI | DEP_FERT_KGNI Incremenatal Flux (kg/yr) | TN2002 only
PLOAD_INC_DEP_INDUSELEC_KGNI | DEP_INDUSELEC_KGNI Incremenatal Flux (kg/yr) | TN2002 only
PLOAD_INC_DEP_INDUSOTH_KGNI | DEP_INDUSOTH_KGNI Incremenatal Flux (kg/yr) | TN2002 only
PLOAD_INC_DEP_VEHICLE_KGNI | DEP_VEHICLE_KGNI Incremenatal Flux (kg/yr) | TN2002 only
PLOAD_INC_DEP_BIOFIRE_KGNI | DEP_BIOFIRE_KGNI Incremenatal Flux (kg/yr) | TN2002 only
PLOAD_INC_DEP_INTL_KGNI | DEP_INTL_KGNI Incremenatal Flux (kg/yr) | TN2002 only
PLOAD_INC_DEP_AREA_KGNI | DEP_AREA_KGNI Incremenatal Flux (kg/yr) | TN2002 only
PLOAD_INC_URBLAND_SN | URBLAND_SN Incremenatal Flux (kg/yr) | 
PLOAD_INC_FERTROTATION | FERTROTATION Incremenatal Flux (kg/yr) | 
PLOAD_INC_FERT_OTHER | FERT_OTHER Incremenatal Flux (kg/yr) | 
PLOAD_INC_MANUREALL | MANUREALL Incremenatal Flux (kg/yr) | 
RES_DECAY | Flux Decayed in Reservoir (kg/yr) | 
DEL_FRAC | Share of Total Flux Delivered | 
total_yield | Total Upstream Yield (kg/ha/yr) | 
inc_total_yield | Total Incremental Yield (kg/ha/yr) | 
concentration | Mean Flow-Weighted Concentration (mg/L) | 
map_del_frac | Reach Flux Share Delivered (%) | 
sh_PT_MUN_SMJ | Share of Inc Flux from PT_MUN_SMJ (%) | 
sh_PT_MUN_CB | Share of Inc Flux from PT_MUN_CB (%) | 
sh_PT_MUN_NWENG | Share of Inc Flux from PT_MUN_NWENG (%) | 
sh_PT_MUN_DELHUD | Share of Inc Flux from PT_MUN_DELHUD (%) | 
sh_CMAQ2020KG | Share of Inc Flux from CMAQ2020KG (%) | Only TN2020
sh_CMAQ2002KG | Share of Inc Flux from CMAQ2002KG (%) | TN2002 only
sh_Dep_AnimalUnc_Kgni | Share of Inc Flux from DEP_ANIMALUNC_KGNI (%) | TN2002 only
sh_Dep_AnimalCon_Kgni | Share of Inc Flux from DEP_ANIMALCON_KGNI (%) | TN2002 only
sh_Dep_Fert_Kgni | Share of Inc Flux from DEP_FERT_KGNI (%) | TN2002 only
sh_Dep_IndusElec_Kgni | Share of Inc Flux from DEP_INDUSELEC_KGNI (%) | TN2002 only
sh_Dep_IndusOth_Kgni | Share of Inc Flux from DEP_INDUSOTH_KGNI (%) | TN2002 only
sh_Dep_Vehicle_Kgni | Share of Inc Flux from DEP_VEHICLE_KGNI (%) | TN2002 only
sh_Dep_BioFire_Kgni | Share of Inc Flux from DEP_BIOFIRE_KGNI (%) | TN2002 only
sh_Dep_Intl_Kgni | Share of Inc Flux from DEP_INTL_KGNI (%) | TN2002 only
sh_Dep_Area_Kgni | Share of Inc Flux from DEP_AREA_KGNI (%) | TN2002 only
sh_UrbLand_SN | Share of Inc Flux from URBLAND_SN (%) | 
sh_FertRotation | Share of Inc Flux from FERTROTATION (%) | 
sh_Fert_other | Share of Inc Flux from FERT_OTHER (%) | 
sh_ManureAll | Share of Inc Flux from MANUREALL (%) | 



Data Definintions for "massbalancereservoirs"
-------------------------
Definition of attributes from the "massbalancereservoirs"  data set  (output from  postprocessing  of NHDPlus  SPARROW model runs)
The file lists results for each of the 17,885 lakes/reservoirs  (corresponding to the 17,885 unique waterbody reach codes) that are simulated as a lake or reservoir in the current (August 2013) version of the SPARROW model for the northeast (hydroregion 01 and 02). 
The attributes in red are reported in the tables in Appendix 1 of Moorman and others, 2014, U.S. Geological Survey Data Series Report 820.   (results are reported for 'large lakes' (surface area >= 5 square kilometers)
          Moorman, M.C., Hoos, A.B., Bricker, S.B., Moore, R.B., García, A.M., and Ator, S.W., 2014, Nutrient load summaries for major lakes and estuaries of the Eastern United States, 2002: U.S. Geological Survey Data Series 820, 94 p.,  http://dx.doi.org/10.3133/ds820.
With one important exception (explained in next sentence), we chose to report in the DS Report 820 appendix tables  the "input" part of the mass balance rather than the "output"(because the report focused on loads entering lakes/reservoirs/estuaries. 
      The one exception to this is the estimate of "Total load" and "Total yield",  reported along with source share percentages in DS Report 820.  We tried but found it messy to compute source shares percentages accurately for  for loads entering the lake from the various tributaries and lakeshore catchments, so the percentages pertain to outflow (i.e. are for load at downstream end of outlet reach).
      To be consistent with how the source share percentages are derived, therefore,  we reported the outflow  load and yield values in the source share table
      
**Attribute in "massbalancereservoirs"  data set** | **Definition**
------------- | -------------
EstuaryGroup | Grouping number, for presentation of results in Appendix 1 of DS Report 820 
WBRCHCODE | Waterbody Reachcode,  unique identifier for a reservoir or lake.  Most of these corresponds with the attribute 'REACHCODE' in the shapefile NHDwaterbody except where manual fixes were made (documented in the SAS program that populates the SPARROW input data  set); in a few cases a new reachcode was assigned by Craig Johnston in 2012
GNIS_NAME | Waterbody name from the Geographic Name Information System
demtarea | Cumulative drainage area (km2) for the downstream node of the flowline reach segment at the downstream end of the reservoir (same as CUMDRAINAG)
AreaSqKm | Total area of surface area of the reservoir/lake, in km2  (from Craig Johnston)
invhload_aggreg | Inverse of the hydraulic load aggregated for lake (i.e. inverse of hload_aggreg, see below for calculation);  in days/meter - this is the value reported in DS 820 as "Residence time, d/m" 
TN_arealloading_in_perflush (misnomer,  should be named TN_LOAD_in_perflush) | Tributary inflow load to lake per flushing rate (i.e. per hydraulic load, or could express as inflow load multiplied by inverse hydraulic load),  in kg*d/m, calculated as TN_LOAD_inflow / hload_aggreg - this is the value reported in DS 820 as "Load from watershed per hydraulic flushing rate of receiving waterbody"
TP_arealloading_in_perflush (misnomer,  should be named TP_LOAD_in_perflush) | Product of TP_arealloading_inload and invhload_aggreg   (see definitions of these attributes elsewhere)
TN_CONC_inload | Tributary inflow Nitrogen Concentration, mg/L  -  this is value reported in USGS DS 820 as "Concentration of tributary inflow to receiving water", calculated as  (TN_LOAD_inflow) / (TOT_CFS * 28.32 * 1/1000000 * 86400 * 365 ).   Would have preferred to use sum of tributary inflow MAFLOWU as the demonimator but this was difficult to compute;  thus it's a slightly mixed calculation
TP_CONC_inload | Tributary inflow Phosphorus Concentration, mg/L  -  this is value reported in USGS DS 820 as "Concentration of tributary inflow to receiving water", calculated as  (TP_LOAD_inflow) / (TOT_CFS * 28.32 * 1/1000000 * 86400 * 365 ).   Would have preferred to use sum of tributary inflow MAFLOWU as the demonimator but this was difficult to compute;  thus it's a slightly mixed calculation
TNTP_CONC_inload | Ratio of TN_CONC_inload to TP_CONC_inload - this is the value reported in USGS DS 820 as "Ratio of TN:TP"
TN_massdecay | Nitrogen mass removed in the lake,  kg/yr, summed from the amount removed in each incremental reservoir segment - this is value reported in USGS DS 820 as "Load assimilated in receiving waterbody"
TP_massdecay | Phosphorus mass removed in the lake,  kg/yr, summed from the amount removed in each incremental reservoir segment - this is value reported in USGS DS 820 as "Load assimilated in receiving waterbody"
TN_decayperinflow | Ratio of TN_massdecay to TN_LOAD_inflow
TP_decayperinflow | Ratio of TP_massdecay to TP_LOAD_inflow
FTYPE | Type of waterbody  ( only Lake/Pond waterbody polygons are included in the SPARROW input data set) 
FCODE | Code for waterbody, from NHDWaterbody
Acres | Total area of surface area of the reservoir/lake, in acres
networked | Flag indicating that lake/reservoir waterbody intersects with initialized flowline (1 = yes, all entries in this table have value of 1)
ReachType | Flag indicating whether flowline segment is a stream (0) or reservoir (2) reach,  used for SPARROW model simulation of mass removed (all entries in this table have value = 2)
huc8 | 8-digit hydrologic unit code for the reach segment at the downstream end of the watebody polygon
TOT_CFS | Mean annual streamflow (cfs) for the reach segment at the downstream end of the reservoir (MAFLOWU)
DIVERGENCE | 
OUTLET | Flag indicating outlet reach  (all reaches in this data set are the outlet reaches)
hload_aggreg | Hydraulic load of the lake/reservoir (also known as the surface overflow rate, qs),  in meters per year, calculated as MAFLOWU * 0.02832 * 86400 * 365 / (AreaSA_KM2 * 1000000)
hload_aggreg_yr | Hydraulic load, in meters per year
RetentCoeff_Nurnberg | Retention Coefficient (Rs) of the reservoir, computed as 15 /  (hload +  18)   (using Nurnberg, 1998)
TN_LOAD_outflow | Total nitrogen load at downstream node of exit reach, in kg/yr - this is the value reported in USGS DS 820 source share table as "Total load".    Wanted to use TN_LOAD_inflow here, to be consistent with use of trib inflow info in the table that follows, but see explanation at top of this file
TP_LOAD_outflow | Total phosphorus load at downstream node of exit reach, in kg/yr - this is the value reported in USGS DS 820 source share table as "Total load" -  Wanted to use TN_LOAD_inflow here, to be consistent with use of trib inflow info in the table that follows, but see explanation at top of this file
TNTP_LOAD_outflow | Ratio of TN_LOAD_outflow to TP_LOAD_outflow
TN_LOAD_inflow | Total nitrogen load entering lake from all tributaries and adjacent areas,  calculated from mass balance (load at downstream node of exit reach plus load removed in lake)
TP_LOAD_inflow | Total phosphorus load entering lake from all tributaries and adjacent areas,  calculated from mass balance (load at downstream node of exit reach plus load removed in lake)
TNTP_LOAD_inflow | Ratio of TN_LOAD_inflow to TP_LOAD_inflow
TN_arealloading_inload | Net specific or areal nitrogen loading (L) of the reservoir (kg/km2-yr), computed as ratio of TN_LOAD_inflow to AreaSqKm
TN_arealloading_outload | Net specific or areal nitrogen loading (L) of the reservoir (kg/km2-yr), computed as ratio of TN_LOAD_outflow to AreaSqKm
TN_CONC_inlake | Estimated In-Lake Nitrogen Concentration of reservoir  (mg/L), calculated as TN_arealloading_outload / (hload * (1 - RetentCoeff_Nurnberg))
TP_arealloading_inload | Net specific or areal phosphorus loading (L) of the reservoir (kg/km2-yr), computed as ratio of TP_LOAD_inflow to AreaSqKm
TP_arealloading_outload | Net specific or areal phosphorus loading (L) of the reservoir (kg/km2-yr), computed as ratio of TP_LOAD_outflow to AreaSqKm
TP_CONC_inlake | Estimated In-Lake Phosphorus Concentration of reservoir  (mg/L), calculated as TP_arealloading_outload / (hload * (1 - RetentCoeff_Nurnberg))

Analysis
-------------------------
* The first step is to aggregate and calculate the loads using my methods for each WBID.  This is done with qryCalLoads (EC2014.mdb)
* Loads are then compared.  WBID is joined to the Waterbody Reach ID with qryCompareLoads.  
* Input and incremental loads could not be compared since the raw data are for the decayed loads only and I need the undecayed loads.
* Output loads compare favorably for about 17k of the 17.8k lakes.
* Differences are due to differing views of what a lake is.  Some lakes have multiple reachcodes and some lakes have hydrologic issues.  But, in general it is a favorable comparison.
* Likewise flow is pretty much the same in both methods (qryCompareFlow)








  
