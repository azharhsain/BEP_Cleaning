/**********************************************************************************************
Project: BEP

Purpose: Baseline HH survey data checking outliers and dropping or changeing observations

Author:  Kyle Onda

Date  :  02 July, 2015
***********************************************************************************************/



* OPENING COMMANDS:

	clear
	set more off
	pause on
	version 12.0
	cap log close
	

* AUTOMATED SELECTION OF ROOT PATH BASED ON USER

	if c(os) == "Windows" {
		cd "C:/Users/`c(username)'/Dropbox"
	}
	else if c(os) == "MacOSX" {
		cd "/Users/`c(username)'/Dropbox"
	}
	local DROPBOX `c(pwd)'
	if "`c(username)'" == "nryan" {
	local DROPBOX_ROOT "`DROPBOX'/distribution"
	}
	else {
	local DROPBOX_ROOT "`DROPBOX'/Bihar Electrification Project"
	}

	
* SETTING PATH SHORTCUTS

	local WORKING_DATA  "`DROPBOX_ROOT'/Data/Survey/Baseline/Working Data"
	local OUTPUT  "`DROPBOX_ROOT'/Data/Survey/Baseline/Output"
	local CODE_FILE  "`DROPBOX_ROOT'/Data/Survey/Baseline/Code/Cleaning/Household"
	
	
* INCLUDING MACROS
	
	cd "`CODE_FILE'"
	include locals_hh.do
	
	
* READING WORKING DATA

	use "`WORKING_DATA'//CUMULATIVE_HH_RECONCILED_07May2015_WORKING"
	cd "`OUTPUT'//Outlier-HH"
	
	
*net install st0197 , from("http://www.stata-journal.com/software/sj10-3")
*ssc install appendfile

outsheet _household_id if _household_id==1589 using	HH_monthly_inc_outliers.csv, comma replace
outsheet _household_id if _household_id==1589 using	HH_month_year_income_outliers.csv, comma replace
outsheet _household_id if _household_id==1589 using	HH_exp_outliers.csv, comma replace
*Calculate household size 

egen size_HH= rownonmiss(a2_*)

dotplot(size_HH)
graph export size_HH.eps, replace
	

	

**Generate summary dummies for # people of each occupation in hh
local occup agri_labor artisan auto_driver cons_contractor crop_cultivation ///
dairy govt_service home_industry homemaker house_help idle migrant_worker ///
ngo_worker nonagri_labor organized_trade other petty_shop poultry priest ///
realestate_agent retired rickshaw_puller salaried_work security_guard sharecropping ///
student unemployed

foreach x of local occup{
	egen `x'_hh_members= rowtotal(*occup_`x') ,missing
}

*------------------------------------
*INCOME ISSUES************
*-------------------------------------
local inchead agri business construction forest_product industry job pension remittance ///
rent_dividend transport



*Annual-Monthly income outliers by income type
*---------------------------------------------
foreach x of local inchead{

set seed 1240 //replicate random draws for robust mahalanobis detection

gen ln_`x'_m=log(j6_`x'_inc_monthly) //normalize
gen ln_`x'_a=log(j6_`x'_inc_annual) //normalize

gen j6_`x'_inc_mon_0dum=0
replace j6_`x'_inc_mon_0dum=1 if j6_`x'_inc_monthly==0
gen j6_`x'_inc_ann_0dum=0
replace j6_`x'_inc_ann_0dum=1 if j6_`x'_inc_annual==0



qui bacon ln_`x'_m ln_`x'_a, gen(OL_inc_`x') replace p(0.10) //calculate mahanalobis distance on monthly vs. annual income 
drop ln_`x'_m ln_`x'_a

replace OL_inc_`x'=1 if j6_`x'_inc_annual<=j6_`x'_inc_monthly //also force code outlier if monthly income from source > annual income
replace OL_inc_`x'=0 if j6_`x'_inc_annual==. | j6_`x'_inc_monthly==.
																
		capture twoway (scatter j6_`x'_inc_monthly j6_`x'_inc_annual if OL_inc_`x'==0,msize(tiny)) ///
		(scatter j6_`x'_inc_monthly j6_`x'_inc_annual if OL_inc_`x'==1 ,msize(tiny)),  ///
		title(Monthly income vs. annual income from `x') legend(order(1 "income'" 2 "outliers")) 
		capture graph export HH_inc_outliers_`x'.png, replace
		
gsort +j6_`x'_inc_annual -j6_`x'_inc_monthly
outsheet  _district_id _feeder_id _household_id j6_`x'_*  *_hh_members  _surveyor_code  using j.csv if OL_inc_`x'==1 | j6_`x'_inc_annual==0 | j6_`x'_inc_monthly==0 , comma replace
				appendfile j.csv HH_month_year_income_outliers.csv
				erase j.csv
}		
		


***********************************************
***MAKE CHANGES TO THE ABOVE FLAGGED Income VARIABLES


//Transportation. Refer to HH_inc_outliers_transport.png
replace j6_transport_inc_annual=.y if OL_inc_transport==1
replace j6_transport_inc_monthly=.y if OL_inc_transport==1

replace j6_transport_inc_monthly=.z if j6_transport_inc_monthly==0
replace j6_transport_inc_annual=.z if j6_transport_inc_annual==0

//Industry. HH_month_year_income_outliers.xlsx and HH_inc_outliers_industry.png
replace j6_industry_inc_annual=.y if  j6_industry_inc_annual>300000
replace j6_industry_inc_monthly=.y if  j6_industry_inc_monthly>30000

replace j6_industry_inc_annual=.z if j6_industry_inc_annual==0
replace j6_industry_inc_monthly=.z if j6_industry_inc_monthly==0

replace j6_industry_inc_annual=.y if j6_industry_inc_annual<j6_industry_inc_monthly
replace j6_industry_inc_monthly=.y if j6_industry_inc_annual<j6_industry_inc_monthly

//Rent. Refer to HH_inc_outliers_rent_dividend.png
replace j6_rent_dividend_inc_monthly=.y if OL_inc_rent_dividend==1 | j6_rent_dividend_inc_monthly>20000
replace j6_rent_dividend_inc_annual=.y if OL_inc_rent_dividend==1 | j6_rent_dividend_inc_annual>250000

replace j6_rent_dividend_inc_monthly=.z if j6_rent_dividend_inc_monthly==0
replace j6_rent_dividend_inc_annual=.z if j6_rent_dividend_inc_annual==0


//Remittance. Refer to HH_inc_outliers_remittance.png
replace j6_remittance_inc_monthly=.y if OL_inc_remittance==1 | j6_remittance_inc_monthly>40000
replace j6_remittance_inc_annual=.y if OL_inc_remittance==1 | j6_remittance_inc_annual>800000

replace j6_remittance_inc_monthly=.z if j6_remittance_inc_monthly==0
replace j6_remittance_inc_annual=.z if j6_remittance_inc_annual==0


//Pension. Refer to HH_inc_outliers_pension.png
replace j6_pension_inc_monthly=.y if OL_inc_pension==1 | j6_pension_inc_monthly>100000
replace j6_pension_inc_annual=.y if OL_inc_pension==1 | j6_pension_inc_annual>1000000

replace j6_pension_inc_monthly=.z if j6_pension_inc_monthly==0
replace j6_pension_inc_annual=.z if j6_pension_inc_annual==0


//Job. Refer to HH_month_year_income_outliers.xlsx Replace missing if If annual/monthly income is greater than 15 or less than 6
replace j6_job_inc_monthly=.z if j6_job_inc_monthly==0 &  j6_job_inc_annual !=0
replace j6_job_inc_annual=.z if j6_job_inc_annual==0 & j6_job_inc_monthly!=0

replace j6_job_inc_monthly=.y if (j6_job_inc_annual/j6_job_inc_monthly>15 |  j6_job_inc_annual/j6_job_inc_monthly<6) & (j6_job_inc_monthly!=0 & j6_job_inc_annual!=0)
replace j6_job_inc_annual=.y if (j6_job_inc_annual/j6_job_inc_monthly>15 |  j6_job_inc_annual/j6_job_inc_monthly<6) & (j6_job_inc_monthly!=0 & j6_job_inc_annual!=0)

replace j6_job_inc_annual=.y if j6_job_inc_annual<j6_job_inc_monthly
replace j6_job_inc_monthly=.y if j6_job_inc_annual<j6_job_inc_monthly


//Forest Products , Refer to HH_inc_outliers_forest_products.png
replace j6_forest_product_inc_monthly=.y if OL_inc_forest_product==1 | j6_forest_product_inc_monthly>15000
replace j6_forest_product_inc_annual=.y if OL_inc_forest_product==1 | j6_forest_product_inc_annual>180000

replace j6_forest_product_inc_monthly=.z if j6_forest_product_inc_monthly==0
replace j6_forest_product_inc_annual=.z if j6_forest_product_inc_annual==0

//Construction, Refer to HH_inc_outliers_construction.png
replace j6_construction_inc_monthly=.y if OL_inc_construction==1 
replace j6_construction_inc_annual=.y if OL_inc_construction==1 

replace j6_construction_inc_monthly=.z if j6_construction_inc_monthly==0
replace j6_construction_inc_annual=.z if j6_construction_inc_annual==0


//Business. Refer to HH_month_year_income_outliers.xlsx . Replace missing if If annual/monthly income is greater than 15 or less than 6
replace j6_business_inc_monthly=.z if j6_business_inc_monthly==0 
replace j6_business_inc_annual=.z if j6_business_inc_annual==0 

replace j6_business_inc_monthly=.y if ((j6_job_inc_annual/j6_job_inc_monthly>15 |  j6_job_inc_annual/j6_job_inc_monthly<6)) & (j6_job_inc_monthly!=0 & j6_job_inc_annual!=0)
replace j6_business_inc_annual=.y if ((j6_job_inc_annual/j6_job_inc_monthly>15 |  j6_job_inc_annual/j6_job_inc_monthly<6)) & (j6_job_inc_monthly!=0 & j6_job_inc_annual!=0)

replace j6_business_inc_annual=.y if j6_business_inc_annual<j6_business_inc_monthly
replace j6_business_inc_monthly=.y if j6_business_inc_annual<j6_business_inc_monthly


//Agriculture 
replace j6_agri_inc_monthly=.z if j6_agri_inc_monthly==0 
replace j6_agri_inc_annual=.z if j6_agri_inc_annual==0 

replace j6_agri_inc_monthly=.z if j6_agri_inc_monthly==0
replace j6_agri_inc_annual=.z if j6_agri_inc_annual==0


*Generate total income
egen j6_inc_calc_monthly=rowtotal(j6**inc_monthly), missing //sum of all income heads (monthly basis)
egen j6_inc_calc_annual=rowtotal(j6**inc_annual), missing



* AFTER CORRECTING ABOVE OUTLIERS-CALCULATE MONTHLY INCOME BY ROWSUM


*Calculated income vs. reported income
*---------------------------------------------
gen ln_j12_earn_lastmonth=log(j12_earn_lastmonth)
gen ln_j6_inc_calc_monthly=log(j6_inc_calc_monthly)

set seed 1238989 //replicate random draws for robust mahalanobis detection
qui bacon ln_j12_earn_lastmonth ln_j6_inc_calc_monthly, gen(OL_inc_aggregated dist) replace p(0.15) //calculate mahanalobis distance on # of assets and average resale value of assets


*replace j6_inc_calc_monthly=.y if j6_business_inc_monthly==.y  | j6_agri_inc_monthly==.y /// 
*| j6_construction_inc_monthly==.y | j6_forest_product_inc_monthly==.y ///
*| j6_industry_inc_monthly==.y | j6_job_inc_monthly==.y | j6_pension_inc_monthly==.y | j6_remittance_inc_monthly==.y ///
*| j6_rent_dividend_inc_monthly==.y | j6_transport_inc_monthly==.y

replace OL_inc_aggregated=0 if j6_inc_calc_monthly==. | j12_earn_lastmonth==.
		capture twoway (scatter j12_earn_lastmonth j6_inc_calc_monthly if OL_inc_aggregated==0,msize(tiny)) ///
		(scatter j12_earn_lastmonth j6_inc_calc_monthly if OL_inc_aggregated==1,msize(tiny)),  ///
		title(Reported monthly income vs. rowsum income) legend(order(1 "income" 2 "outliers")) 
		capture graph export HH_monthly_inc_outliers.png, replace



outsheet  _district_id _feeder_id _household_id j12_earn_lastmonth j6_inc_calc_monthly  *_hh_members  _surveyor_code using HH_monthly_inc_outliers.csv if OL_inc_aggregated==1, comma replace

replace j6_inc_calc_monthly=. if OL_inc_aggregated==1
replace j12_earn_lastmonth=. if OL_inc_aggregated==1


*------------------------------------------------*
*EXPENDITURES*------------------------------------
*------------------------------------------------*

*Calculate monthly and annual expnediture  capita
egen j1_exp_month_calc=rowtotal(j1_**lastmonth), missing //sum all expenditure heads (monthly basis)

	
local exphead education elecbill festival food fuel insurance maintenance medical occupation other phonebill saving servant ///
toiletry travel


*Test 1: Catalogue where highest monthly expnediture last year<=lowest monthly expenditure last year

gsort -j2_high_exp_lastyear_value -j1_exp_month_calc 
outsheet  _district_id _feeder_id _household_id j1_exp_month_calc j2_high_exp_lastyear_value ///
j4_low_exp_lastyear_value _surveyor_code using high_low_exp_outliers.csv /// 
if j2_high_exp_lastyear_value<=j4_low_exp_lastyear_value & j4_low_exp_lastyear_value<. & j2_high_exp_lastyear_value<. , comma replace

***********************************************
***CODE FOR DECIDED CORRECTION OF ABOVE FLAGGED OUTLIERS HERE
**********************************************

replace j2_high_exp_lastyear_value=.y if j2_high_exp_lastyear_value<=j4_low_exp_lastyear_value
replace j4_low_exp_lastyear_value=.y if j2_high_exp_lastyear_value==.y


*Test 2: Expenditure by category vs total expenditure



//replace expenditure rowtotal to missing if less than 1000
replace j1_exp_month_calc=.z if j1_exp_month_calc<1000


//set rowtotal and expenditure item to missing for food if it takes up more than 90% of monthly expenditure
replace j1_food_exp_lastmonth=.z if j1_food_exp_lastmonth/j1_exp_month_calc>0.9

//calculate share of total monthly expenditure taken by each expenditure category
foreach x of local exphead{
gen share_exp_`x'=j1_`x'_exp_lastmonth/j1_exp_month_calc
dotplot share_exp_`x'
	graph export share_exp_`x'.png, replace
}



foreach x of local exphead{
gen ln_j1_`x'=log(j1_`x'_exp_lastmonth)

set seed 1238989 //replicate random draws for robust mahalanobis detection

qui bacon j1_`x'_exp_lastmonth share_exp_`x', gen(OL_exp_`x') replace p(0.025) //calculate mahanalobis distance on expenditure on item and share of total expenditure that represents
drop ln_j1_`x'
replace OL_exp_`x'=0 if j1_`x'_exp_lastmonth==. | j1_exp_month_calc==.

		capture twoway (scatter j1_`x'_exp_lastmonth share_exp_`x'  if OL_exp_`x'==0,msize(tiny)) ///
		(scatter j1_`x'_exp_lastmonth share_exp_`x'  if OL_exp_`x'==1 ,msize(tiny)),  ///
		title(Monthly expenditure in `x' vs. share of tot. monthly expenditure) legend(order(1 "Expenditure" 2 "Outliers")) 
		capture graph export HH_exp_outliers_`x'_share.png, replace
		

}


//Data changes, refer to HH_exp_outliers.xlsx for specific observations 
gsort -j1_exp_month_calc
egen OL_exp_count=rowtotal(OL_exp_*), missing //count how many categories there is outlier in
outsheet _district_id _feeder_id _household_id  j1_exp_month_calc j1_**_exp_lastmonth if OL_exp_count>0 using HH_exp_outliers.csv, comma replace 

//Algorithm works well, set according to outlier indicator
foreach x of local exphead{
replace j1_`x'_exp_lastmonth==.z if OL_exp_`x'==1
replace j1_exp_month_calc=.z  if OL_exp_`x'==1 
}




***********************************************
*CHECK WITH OTHER SECTIONS
**********************************************


***********SECTION B/C/D******************

local house_qlty house_area_value_sqft building_area_value_sqft bedroom_count kitchen_count living_count other_count ///
toilet_count other_count land_extra_value_sqft




//B12 ANIMALS-check correlation between livestock and occupation

//check correlation betw
bacon b12_buffalo_count dairy_hh_members, gen(OL_buffalo) replace p(0.15)

 twoway (scatter b12_buffalo_count dairy_hh_members if OL_buffalo==0) ///
				(scatter b12_buffalo_count dairy_hh_members if OL_buffalo==1)


				
	bacon b12_chicken_count poultry_hh_members, gen(OL_chicken) replace p(0.5)

 twoway (scatter b12_chicken_count poultry_hh_members if OL_buffalo==0) ///
				(scatter b12_chicken_count poultry_hh_members if OL_buffalo==1)





local assets kerosene_stove lpg_stove microwave_oven mixer_grinder ///
mud_chulah pressure_cooker smokeless_chulah toaster utensil camera ///
desktop laptop radio television air_conditioner air_cooler almirah ///
bed bulb_cfl ceiling_fan elec_sew_mach electric_iron geyer heater ///
immesion_rod nonelec_sew_mach refrigerator table_fan tube_light ///
washing_machine water_purifier animal_cart bicycle four_wheeler ///
tractor two_wheeler hand_pump landline_phone mobile_phone torch ///
wall_clock wrist_watch





outsheet _district_id _feeder_id _household_id using hh_outliers_c.csv if _household_id==1589 , comma replace
	
/*

foreach x of local assets{
	foreach i of numlist 1/5 {

		
		capture confirm variable c`i'_`x'_count
		
		
		if _rc!=0{
		display "no variable"
		}
		else{
			egen tot=total(c`i'_`x'_count)
			
			if sum(tot)>0{
				gen c`i'_`x'_AV=c`i'_`x'_resale_value/c`i'_`x'_count
				gen ln_c`i'_`x'_AV=log(c`i'_`x'_AV)
				gen ln_c`i'_`x'_count=log(c`i'_`x'_count)
				qui bacon ln_c`i'_`x'_AV ln_c`i'_`x'_count, gen(OL_`x'_c`i') replace p(0.15) //calculate mahanalobis distance on # of assets and average resale value of assets
				
				egen ol_count=total(OL_`x'_c`i')

				capture twoway (scatter c`i'_`x'_AV c`i'_`x'_count if OL_`x'_c`i'==0) ///
				(scatter c`i'_`x'_AV c`i'_`x'_count if OL_`x'_c`i'==1), ///
				title(Number of `x' by average resale value) legend(order(1 "`x'" 2 "outliers"))
				capture graph export c`i'_`x'_outliers.png, replace
				
				gsort -c`i'_`x'_AV -c`i'_`x'_count 
				if ol_count>0{
				outsheet _district_id _feeder_id _household_id c`i'_`x'_count c`i'_`x'_resale_value c`i'_`x'_AV  _surveyor_code ///
				using c`i'_`x'_outl.csv if OL_`x'_c`i'==1, comma replace
				appendfile c`i'_`x'_outl.csv hh_outliers_c.csv
				erase c`i'_`x'_outl.csv
				
				
				}
				drop ol_count
			}
			drop tot
			
			}
			
		}
		
	}
	
	
*/
			

	
//Algorithm did not work very well, based on visual inspection, suggest the following:





