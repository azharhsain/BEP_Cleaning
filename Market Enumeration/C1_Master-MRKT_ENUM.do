/***************************************************************************
Project: BEP

Purpose: Baseline market business enumeration data cleaning master .do file

Author:  Azhar Hussain

Date  :  09 April, 2015
****************************************************************************/



* OPENING COMMANDS

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
	local CODE_FILE  "`DROPBOX_ROOT'/Data/Survey/Baseline/Code/Cleaning/Market Enumeration"
	
	
* READING WORKING DATA

	cd "`INPUT_DATA'"
	use ENUMERATION_BIZ_MRKT_06Jan2015

		
* RUNNING .DO FILES

	cd "`CODE_FILE'"

	run "C2_Dropping_Variables-MRKT_ENUM.do"
	
	run "C3_Renaming_Variables-MRKT_ENUM.do"
	
	run "C4_Labeling_Variables-MRKT_ENUM.do"
	
	run "C5_Labeling_Values-MRKT_ENUM.do"
		
	run "C6_Recoding_Variables-MRKT_ENUM.do"

	
* MERGING FEEDER CODES
	
	tempfile MRKT_ENUM
	save "`MRKT_ENUM'", replace
	clear
	cd "`INPUT_DATA'"
	insheet using "Feeder_ID.csv",n
	merge 1:m _district_name _feeder_name _pss_name using `MRKT_ENUM'
	replace _feeder_code= substr(_feeder_code,1,8)

	
* SAVING WORKING DATA
	
	cd "`WORKING_DATA'"
	save ENUMERATION_BIZ_MRKT_06Jan2015_WORKING, replace
