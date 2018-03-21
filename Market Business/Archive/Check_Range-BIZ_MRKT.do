/**********************************************************************************************
Project: BEP

Purpose: Checking range of observations for manually entered numneric entries household survey

Author:  Azhar Hussain

Date  :  27 March, 2015
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
	local CODE_FILE  "`DROPBOX_ROOT'/Data/Survey/Baseline/Code/Cleaning/Market Business"
	
	
* INCLUDING MACROS
	
	cd "`CODE_FILE'"
	include locals_biz.do
	
	
* READING WORKING DATA

	use "`WORKING_DATA'//CUMULATIVE_BIZ_MRKT_RECONCILED_07May2015_WORKING"
	cd "`OUTPUT'//Outlier-BIZ_MRKT"
	
	
* EXPORTING HISTOGRAM FOR VARIABLES TO CHECK RANGE AND ELIMINATE OUTLIERS

	//Assigning missing value to business rent value if it's greater than Rs 25000
	replace a5_rent=.z if (a5_rent>25000 & a5_rent<.)
	//Assigning missing value to customer count if it's greater than 500
	replace a13_customers=.z if (a13_customers>500 & a13_customers<.)
	//Assigning missing value to diesel cost if it's greater than Rs 100
	replace e9_diesel_cost=.z if (e9_diesel_cost>100 & e9_diesel_cost<.)
	//Assigning missing value to diesel exp (liter) if it's greater than 720 liter/month
	replace e9_genset_exp_litre=.z if (e9_genset_exp_litre>720 & e9_genset_exp_litre<.)	
	//Assigning missing value to diesel exp (rupee) if it's greater than Rs 100000/month 
	replace e9_genset_exp_rupee=.z if (e9_genset_exp_rupee>100000 & e9_genset_exp_rupee<.)
	//Assigning missing value to genset exp (rupee) if it's greater than Rs 100000/month 
	replace e9_genset_exp_monthly=.z if (e9_genset_exp_monthly>100000 & e9_genset_exp_monthly<.)
	//Assigning missing value to shared genset people count if it's greater than 1000
	replace e10_genset_shared_people=.z if (e10_genset_shared_people>1000 & e10_genset_shared_people<.)
	//Assigning missing value to shared genset people count if it's greater than 1000
	replace f12_lineman_pay=.z if (f12_lineman_pay>500 & f12_lineman_pay<.)
	foreach var in `outlier_var' {
		histogram `var', freq
		graph export "`var'.png", replace
	}	
	
	foreach i1 of numlist 1/28 {
		//Assigning missing value to total monthly wage if it is greater than Rs 15,000
		replace b1_tot_wages`i1'=.z if b1_tot_wages`i1'>15000
		replace b1_man_days`i1'=.z if b1_tot_wages`i1'>15000
		histogram b1_tot_wages`i1', freq
		graph export "b1_tot_wages`i1'.png", replace
	}
	foreach i2 of numlist 1/10 {
		histogram b2_tot_wages`i2', freq
		graph export "b2_tot_wages`i2'.png", replace
	}
	foreach i3 of numlist 1/2 {
		histogram b3_tot_wages`i3', freq
		graph export "b3_tot_wages`i3'.png", replace
	}
	foreach i4 of numlist 1/1 {
		histogram b4_tot_wages`i4', freq
		graph export "b4_tot_wages`i4'.png", replace
	}
	foreach i5 of numlist 1/12 {
		histogram b5_tot_wages`i5', freq
		graph export "b5_tot_wages`i5'.png", replace
	}
	foreach i6 of numlist 1/2 {
		histogram b6_tot_wages`i6', freq
		graph export "b6_tot_wages`i6'.png", replace
	}
	
	foreach i of numlist 1/7 {
		foreach x in `elec_equip_woth' | `nonelec_equip_woth' {
			capture histogram c`i'_`x'_own, freq
			capture graph export "c`i'_`x'_own.png", replace
			capture histogram c`i'_`x'_sale, freq
			capture graph export "c`i'_`x'_sale.png", replace
		}
	}
	

	//Assigning missing value to cellphone exp if it's greater than 6000
	replace g27_cellphone_exp=.z if (g27_cellphone_exp>6000 & g27_cellphone_exp<.)
	//Assigning missing value to employee exp if it's greater than sum of individual employee salary entered in Section B
	unab emp_wage: b*_tot_wages*
	egen month_wage=rowtotal(`emp_wage')
	replace g27_employeesalary_exp=.z if (g27_employeesalary_exp > month_wage & g27_employeesalary_exp <.)
	drop month_wage
	foreach b in `exp_head' {
		histogram g27_`b'_exp, freq
		graph export "g27_`b'_exp.png", replace
	}

	
* SAVING CLEANED DATA

	cd "`WORKING_DATA'"
	save CUMULATIVE_BIZ_MRKT_RECONCILED_07May2015_CLEANED, replace
	
