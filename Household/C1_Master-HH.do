/**********************************************************************
Project: BEP

Purpose: Baseline market business survey data cleaning master .do file

Author:  Azhar Hussain

Date  :  30 March, 2015
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
	local CODE_FILE  "`DROPBOX_ROOT'/Data/Survey/Baseline/Code/Cleaning/Household"
	local OUTPUT  "`DROPBOX_ROOT'/Data/Survey/Baseline/Output"

	
* MERGING AREA TYPE AND LOADING RAW DATA IN MEMORY

	cd "`INPUT_DATA'"
	insheet using "Area_Type.csv", n
	split areaid, p(-) generate(village_id)
	destring village_id*, replace
	merge 1:m village_id1 village_id2 village_id3 village_id4 using CUMULATIVE_HH_RECONCILED_07May2015, nogen


* INSTALLING PROGRAMS FROM STATA ARCHIVES

	//ssc install winsor
	//ssc install tab_chi

	
* RUNNING .DO FILES

	cd "`CODE_FILE'"
	
	run "C2_Dropping_Variables-HH.do"
	
	run "C3_Renaming_Variables-HH.do"
	
	run "C4_Treating_OpenEnded_Variables-HH.do"

	run "C5_Splitting_String_Values-HH.do"
	
	run "C6_Labeling_Variables-HH.do"
	
	run "C7_Labeling_Values-HH.do"

	run "C8_Checking_Skip_Patterns-HH.do"
	
	//run "C9_Checking_Outliers-HH.do"
		
	run "C10_Recoding_Variables-HH.do"

	run "C11_Changing_Date_Format-HH.do"

	run "C12_Standardizing_Units-HH.do"
	
	order _all, sequential
	
	
* SAVING WORKING DATA AND CODEBOOK

	cd "`WORKING_DATA'"
	save CUMULATIVE_HH_RECONCILED_07May2015_WORKING, replace
	log using household_survey_codebook.txt, text replace
	codebook
	log close
