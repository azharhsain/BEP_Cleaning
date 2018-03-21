/**********************************************************************
Project: BEP

Purpose: Baseline market business survey data cleaning master .do file

Author:  Azhar Hussain

Date  :  27 March, 2015
***********************************************************************/



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
	local DROPBOX_ROOT "`DROPBOX'/Bihar Electrification Project"
	}
	else {
	local DROPBOX_ROOT "`DROPBOX'/Bihar Electrification Project"
	}

	
* SETTING PATH SHORTCUTS

	local INPUT_DATA  "`DROPBOX_ROOT'/Data/Survey/Baseline/Raw Data"
	local WORKING_DATA  "`DROPBOX_ROOT'/Data/Survey/Baseline/Working Data"
	local CODE_FILE  "`DROPBOX_ROOT'/Data/Survey/Baseline/Code/Cleaning/Area Business"
	
		
* READING WORKING DATA

	cd "`INPUT_DATA'"
	use CUMULATIVE_BIZ_VIL_18Feb2015

	
* INSTALLING PROGRAMS FROM STATA ARCHIVES

	//ssc install winsor
	//ssc install tab_chi
	
	
* RUNNING .DO FILES

	cd "`CODE_FILE'"

	run "C2_Dropping_Variables-BIZ_VIL.do"
	
	run "C3_Renaming_Variables-BIZ_VIL.do"
	
	run "C4_Splitting_String_Values-BIZ_VIL.do"
	
	run "C5_Labeling_Variables-BIZ_VIL.do"
	
	run "C6_Labeling_Values-BIZ_VIL.do"
	
	run "C7_Checking_Skip_Patterns-BIZ_VIL.do"
	
	run "C8_Checking_Outliers-BIZ_VIL.do"
	
	run "C9_Recoding_Variables-BIZ_VIL.do"
	
	run "C10_Changing_Date_Format-BIZ_VIL.do"
	
	run "C11_Standardizing_Units-BIZ_VIL.do"
	
	run "C12_Treating_OpenEnded_Variables-BIZ_VIL.do"

	order _all, sequential

	
* SAVING WORKING DATA

	cd "`WORKING_DATA'"
	save CUMULATIVE_BIZ_VIL_18Feb2015_WORKING, replace
