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
	local DROPBOX_ROOT "`DROPBOX'/distribution"
	}
	else {
	local DROPBOX_ROOT "`DROPBOX'/Bihar Electrification Project"
	}

	
* SETTING PATH SHORTCUTS

	local INPUT_DATA  "`DROPBOX_ROOT'/Data/Survey/Baseline/Raw Data"
	local WORKING_DATA  "`DROPBOX_ROOT'/Data/Survey/Baseline/Working Data"
	local CODE_FILE  "`DROPBOX_ROOT'/Data/Survey/Baseline/Code/Cleaning/Market Business"
	

* MERGING MARKET NAME AND LOADING RAW DATA IN MEMORY

	cd "`INPUT_DATA'"
	insheet using "Market.csv", n
	split marketid, p(-) generate(village_id)
	destring village_id*, replace
	merge 1:m village_id1 village_id2 village_id3 village_id4 using CUMULATIVE_BIZ_MRKT_RECONCILED_07May2015, nogen

	
* INSTALLING PROGRAMS FROM STATA ARCHIVES

	//ssc install winsor
	//ssc install tab_chi
	
	
* RUNNING .DO FILES

	cd "`CODE_FILE'"

	run "C2_Dropping_Variables-BIZ_MRKT.do"
	
	run "C3_Renaming_Variables-BIZ_MRKT.do"
	
	run "C4_Treating_OpenEnded_Variables-BIZ_MRKT.do"
	
	run "C5_Splitting_String_Values-BIZ_MRKT.do"
	
	run "C6_Labeling_Variables-BIZ_MRKT.do"
	
	run "C7_Labeling_Values-BIZ_MRKT.do"
	
	run "C8_Checking_Skip_Patterns-BIZ_MRKT.do"
	
	//run "C9_Checking_Outliers-BIZ_MRKT.do"
	
	run "C10_Recoding_Variables-BIZ_MRKT.do"
	
	run "C11_Changing_Date_Format-BIZ_MRKT.do"
	
	run "C12_Standardizing_Units-BIZ_MRKT.do"

	order _all, sequential

	
* SAVING WORKING DATA AND CODEBOOK

	cd "`WORKING_DATA'"
	save CUMULATIVE_BIZ_MRKT_RECONCILED_07May2015_WORKING, replace
	log using market_business_survey_codebook.txt, text replace
	codebook
	log close
