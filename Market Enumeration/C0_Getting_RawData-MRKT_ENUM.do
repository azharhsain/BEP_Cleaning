/*****************************************************************
Project: BEP

Purpose: Baseline market business enumeration raw data generation

Author:  Azhar Hussain

Date  :  08 April, 2015
******************************************************************/



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

	
* DEFINING LOCALS
	
	//Download Date for the raw enumeration data
	local RAW_DATA_DATE 06Jan2015
	//Creation Date for the latest market list and mapping files
	local LIST_DATE 11Jan2015
	

* DEFINING LOCATION OF DIRECTORIES

	local RAW_DATA     "`DROPBOX_ROOT'/Data\Survey\Sampling\Survey Data\Sampling Data\Business Sampling\Raw Data"
	local WORKING_DATA "`DROPBOX_ROOT'/Data\Survey\Baseline\Raw Data"
	local ENUM_CHK "`DROPBOX_ROOT'\Data\Survey\Sampling\Survey Data\Sampling Data\Business Sampling\Market List and Mapping"
	
	
* READING RAW DATA AND GENERATING WORKING DATASET

	//First screen of the data
	//Enumeration- level data. Not at the shop -level. There might be multiple enumerations in a market	
	//If 2 people enumerate each half of a market. Each person is considered to have completed one enumeration				
	insheet using "`RAW_DATA'/BEPBU_ENUM_MOD_V7_`RAW_DATA_DATE'.csv"
	rename key parent_key
	gsort parent_key
	rename number num_enumeration //Rank of the enumeration within a market in the data

	//Renaming key variables
	rename screen_1district_name district
	label var district "District name"
	rename screen_1block_name block
	label var block "Block name"
	rename screen_2market_place market
	label var market "Marketplace name"

	//Replace market names to uniquely identify markets with the same name
	replace market="Sandalpur 1" if parent_key=="uuid:1ce0e102-0910-4869-8d54-e189e0acdc59"
	replace market="Sandalpur 2" if parent_key=="uuid:10fbae7a-0d84-4713-b998-17a4f0913f72"

	//Replacing start times where tablets were found to have their clocks reset to Jan 2012/ 2014
	replace starttime="09-02-2014  18:32:00" if parent_key=="uuid:11712cc8-73dc-49d6-a256-e952e1722525"
	replace starttime="09-07-2014  18:29:00" if parent_key=="uuid:291cbe7b-7aa0-4a94-82c5-a9ed563ba039"
	replace starttime="09-16-2014  18:29:00" if parent_key=="uuid:575907cc-1498-4c17-865a-e6dcefafcc2d"
	replace starttime="09-16-2014  18:14:00" if parent_key=="uuid:5cc69594-6856-4382-9d9e-88124436a6ca"
	replace starttime="09-07-2014  23:22:00" if parent_key=="uuid:77001b31-5e34-40ff-a646-271bca6f57ee"
	replace starttime="12-04-2014  14:22:00" if parent_key=="uuid:f5e6c816-757f-4f3b-ab23-5b034954d531"
	replace starttime="12-06-2014  13:59:00" if parent_key=="uuid:6f3fc74e-8172-4279-938a-c69d3273101e"
	replace starttime="12-03-2014  15:12:00" if parent_key=="uuid:0743b157-0551-493b-9528-0066ca2a02e2"
	replace starttime="12-02-2014  15:06:00" if parent_key=="uuid:e8d232bd-02f7-4234-8705-e68bf882dd19"
	replace starttime="12-25-2014  17:54:00" if parent_key=="uuid:5332ed0e-70e2-40b1-9c23-9300ca3d781d"
	replace starttime="12-06-2014  14:00:00" if parent_key=="uuid:136b049c-e055-4494-9492-f03ee14b344d"
	replace starttime="12-05-2014  14:42:00" if parent_key=="uuid:41e43e83-731d-49ac-a15e-c5ab1f537590"

	tab market if inlist(parent_key,"uuid:10ce0ebe-e79f-4b14-bc5d-77950e3d45ef","uuid:7c8ba53f-13dc-45f8-a2d6-62aebeadc769", ///
	"uuid:71fc2b49-ab3a-4d62-8845-c8b958388db4","uuid:60c846ac-4f24-40fc-bbc4-cb6921919d91", ///
	"uuid:73ee2eac-8603-46bb-a4e3-99d0ec14b02a","uuid:3b734a8b-c4c8-4f75-8e2c-09e2d4d89bba", ///
	"uuid:3223b2cf-281c-423a-baa8-175325c88b2c") 

	//Issues with Maharajganj market (Siwan district)
	drop if inlist(parent_key,"uuid:3223b2cf-281c-423a-baa8-175325c88b2c","uuid:878e7918-8074-487d-8b15-8263418e89be", ///
	"uuid:c8d970ff-6ffa-40ee-a229-c82c0da1365a","uuid:c94cf0f9-dd54-4ce1-8ded-869ed507b38b", ///
	"uuid:e4d55239-77c5-459e-bc8a-427d3a1d07f0","uuid:5d3766a2-d8a6-4832-8dc1-7c7dc3a46e6b") 
	drop if inlist(parent_key,"uuid:10ce0ebe-e79f-4b14-bc5d-77950e3d45ef","uuid:7c8ba53f-13dc-45f8-a2d6-62aebeadc769", ///
	"uuid:71fc2b49-ab3a-4d62-8845-c8b958388db4","uuid:60c846ac-4f24-40fc-bbc4-cb6921919d91", ///
	"uuid:73ee2eac-8603-46bb-a4e3-99d0ec14b02a","uuid:3b734a8b-c4c8-4f75-8e2c-09e2d4d89bba")
	//Issues with random entry - Hj market
	drop if inlist(parent_key,"uuid:84afde57-b0dd-428e-a2f0-846a3f94e320")
	//Issues with Barhariya market (Siwan) and Sandalpur bazar (Katihar)
	drop if inlist(parent_key,"uuid:4bf93cf9-8a0c-49e7-a889-4822a0e5a8e9","uuid:afdde0e1-4adb-41fb-afdd-ae60aa42dbd8")
	//Issues with enumerations for Harda Bazar and Milikpur Bazar (Purnea district)
	drop if inlist(parent_key,"uuid:77fa0040-947f-49bf-9ea0-1720a55b9f", "uuid:ae41e38d-d382-4787-b8d5-cb781f6203", ///
	"uuid:ae41e38d-d382-4787-b8d5-cb781f6203","uuid:220f525e-be07-4352-9822-800a1d5f93")
	//Issues with enumerations in Bhagwanpur (Chapra, Siwan districts)
	drop if inlist(parent_key,"uuid:3e9f840b-2d5b-4dd3-a050-2be38198e0eb")
	//Same market ennumerated twice - Barsoyi Baazar, Purnea District
	drop if inlist(parent_key, "uuid:67a7991d-dfa3-4d51-aef3-020b47fb9ff1")
	//Tablet issue where same form was sent twice to the server
	drop if inlist(parent_key, "uuid:1f600405-1f1f-4c77-8791-ac1578910b", "uuid:194dc602-4b19-419b-a740-d100093373", ///
	"uuid:9a0207d1-951b-4e3d-94ad-3ba51faa98", "uuid:1faba93e-526b-4466-a199-e7785b41a7", "uuid:913ea28c-13d7-4fec-b7ef-de44442c86")
	//Issues with Patna markets
	drop if inlist(parent_key, "uuid:1bc15155-cc6f-42e7-9960-e95b0b7d962a", "uuid:4a7067f1-2304-438f-bf25-55da9419a2c8")

	//Dropping old enumerations if the market had to be reenumerated
	*Chapra
	drop if inlist(parent_key, "uuid:156d4f61-49fb-43d3-b5a6-3fad7c013598", "uuid:85c87fe2-e53c-43e2-8624-6d6e31a8de55", ///
	"uuid:a35ba684-f783-4672-92d6-9952fe5f3f15", "uuid:23699b0b-5985-41f2-9730-0ad73cf7959c", "uuid:4866ac89-3f55-4706-8820-5b371e5f24b0")
	drop if inlist(parent_key, "uuid:6dc71a93-1b64-4932-9708-8e755cb9ee80", "uuid:bac2e81c-69e8-43eb-8a7d-760319a33570" ///
	"uuid:5e7ec2c2-d659-4068-8959-6f9f29c2f1b4", "uuid:e513f3d9-c0cc-4965-a6d6-3502771d9a90", "uuid:74aa395f-61fe-4081-8521-8fe4ecbfab52")
	drop if inlist(parent_key, "uuid:c5b1166b-cffa-44b6-ac0d-8b43459b9294", "uuid:94cd2ab7-4266-4218-b392-393a15ee9d4e" ///
	"uuid:a8dca43a-9174-4735-98e9-1eaff832d1d7", "uuid:0e579e70-ec9b-412e-9954-950c1c3bd2cd", "uuid:0e579e70-ec9b-412e-9954-950c1c3bd2cd")
	drop if inlist(parent_key, "uuid:5e7ec2c2-d659-4068-8959-6f9f29c2f1b4", "uuid:a8dca43a-9174-4735-98e9-1eaff832d1d7")
	*Siwan
	drop if inlist(parent_key, "uuid:d6f372c9-d458-4f42-99dd-39eb7b385609", "uuid:4af907a5-4da3-492a-8e4a-0aa3847c30b9", ///
	"uuid:4af907a5-4da3-492a-8e4a-0aa3847c30b9")

	//Generating flag if numbering protocol not followed in the data using the ranking variable
	//The implementation here was found to be very bad and hence this is not an effective way of establishing the order
	bys district block market: gen count_enum=_N 
	bys district block market: egen max_enum=max(num_enumeration)
	gen flag_numbering=1
	replace flag_numbering=0 if count_enum==max_enum

	//Dropping variables that are not required
	drop endtime deviceid subscriberid simid devicephonenum ///
	screen_1scr_1 screen_1surv_name screen_1superv_name screen_1team_code setofscreen_3 ///
	gps_coordinatelatitude gps_coordinatelongitude gps_coordinatealtitude ///
	gps_coordinateaccuracy metainstanceid flag_numbering max_enum

	tempfile Enum_Area
	save "`Enum_Area'"
	clear

	******************** Merging Shop-level Data with Enumeration-level Data ********************
	//Inputting Shop- level data
	insheet using "`RAW_DATA'/BEPBU_ENUM_MOD_V7-screen_3_`RAW_DATA_DATE'.csv"
	gsort parent_key key

	merge m:1 parent_key using "`Enum_Area'", generate (mergeEnumeration)
	label define mergeEnumeration 1 "Shop List only" 2 "Main screen only" ///
								3 "Both shop and main screen lists"

	gsort parent_key

	//Dropping markets deleted from the enumeration- level data
	keep if mergeEnumeration==3

	//Dropping variables that are not required
	drop shopsser_num shopsgps_reading1latitude shopsgps_reading1longitude ///
	shopsgps_reading1altitude shopsgps_reading1accuracy

	// Flag to check if shop actively running
	gen flag_active=1
	replace flag_active=0 if open_month==2


	tempfile Enumeration
	gsort parent_key
	save "`Enumeration'"
	clear

	******************** Inputting Tracking Sheet Data to check for problem Enumerations ******************** 
	//Tracking Sheets contain information, in wide format, about the markets enumerated and the order of enumeration within each market
	insheet using "`ENUM_CHK'/market_list_`LIST_DATE'.csv", names
	//Renaming all variables to indicate they come from the tracking sheet's market list
	rename district district_list
	rename pss pss_list
	rename feeder feeder_list
	rename market market_list

	//Converting all variables to the upper case before any operation
	replace district_list = upper(district_list)
	replace pss_list = upper(pss_list)
	replace feeder_list = upper(feeder_list)
	replace market_list = upper(market_list)

	//Flag observations with missing info in the list
	gen flag_list=0
	replace flag_list=1 if missing(district_list)|missing(pss_list)|missing(feeder_list)|missing(market_list)
	list district_list pss_list feeder_list market_list if flag_list==1
	drop if flag_list==1
	drop flag_list

	// Tagging duplicate markets
	duplicates tag district_list pss_list feeder_list market_list, generate(dup_market)
	list district_list pss_list feeder_list market_list if dup_market==1

	// Dropping duplicate markets and making the list unique
	duplicates drop district_list pss_list feeder_list market_list, force
	egen market_id = group ( district_list pss_list feeder_list market_list)
	egen feeder_id = group ( district_list pss_list feeder_list)
	duplicates drop district_list pss_list feeder_list market_list, force

	tempfile mkt_list
	save "`mkt_list'"
	clear

	//Inputting mapping sheet which connects enumeration- level and tracking sheet data
	insheet using "`ENUM_CHK'/market_mapping_`LIST_DATE'.csv", names
	tempfile mkt_mapping
	save "`mkt_mapping'"

	//Before merging, we drop enumerations that had issues to ensure a clean merge and identify other issues if any
	drop if inlist(key,"uuid:84afde57-b0dd-428e-a2f0-846a3f94e320","uuid:878e7918-8074-487d-8b15-8263418e89be", ///
	"uuid:c8d970ff-6ffa-40ee-a229-c82c0da1365a","uuid:c94cf0f9-dd54-4ce1-8ded-869ed507b38b", ///
	"uuid:e4d55239-77c5-459e-bc8a-427d3a1d07f0","uuid:5d3766a2-d8a6-4832-8dc1-7c7dc3a46e6b") 
	drop if inlist(key,"uuid:10ce0ebe-e79f-4b14-bc5d-77950e3d45ef","uuid:7c8ba53f-13dc-45f8-a2d6-62aebeadc769", ///
	"uuid:71fc2b49-ab3a-4d62-8845-c8b958388db4","uuid:60c846ac-4f24-40fc-bbc4-cb6921919d91", ///
	"uuid:73ee2eac-8603-46bb-a4e3-99d0ec14b02a","uuid:3b734a8b-c4c8-4f75-8e2c-09e2d4d89bba", ///
	"uuid:3223b2cf-281c-423a-baa8-175325c88b2c")
	drop if inlist(key,"uuid:4bf93cf9-8a0c-49e7-a889-4822a0e5a8e9","uuid:afdde0e1-4adb-41fb-afdd-ae60aa42dbd8")
	drop if inlist(key,"uuid:77fa0040-947f-49bf-9ea0-1720a55b9f", "uuid:ae41e38d-d382-4787-b8d5-cb781f6203", ///
	"uuid:ae41e38d-d382-4787-b8d5-cb781f6203","uuid:220f525e-be07-4352-9822-800a1d5f93")
	drop if inlist(key,"uuid:3e9f840b-2d5b-4dd3-a050-2be38198e0eb")
	drop if inlist(key, "uuid:67a7991d-dfa3-4d51-aef3-020b47fb9ff1")
	drop if inlist(key,"uuid:1f600405-1f1f-4c77-8791-ac1578910b", "uuid:194dc602-4b19-419b-a740-d100093373", ///
	"uuid:9a0207d1-951b-4e3d-94ad-3ba51faa98", "uuid:1faba93e-526b-4466-a199-e7785b41a7", "uuid:913ea28c-13d7-4fec-b7ef-de44442c86")
	drop if key=="uuid:9504a836-8b18-4f95-866c-03447cbf0181"

	//Dropping old enumerations if the market had to be reenumerated
	*Chapra
	drop if inlist(key, "uuid:156d4f61-49fb-43d3-b5a6-3fad7c013598", "uuid:85c87fe2-e53c-43e2-8624-6d6e31a8de55", ///
	"uuid:a35ba684-f783-4672-92d6-9952fe5f3f15", "uuid:23699b0b-5985-41f2-9730-0ad73cf7959c", "uuid:4866ac89-3f55-4706-8820-5b371e5f24b0")
	drop if inlist(key, "uuid:6dc71a93-1b64-4932-9708-8e755cb9ee80", "uuid:bac2e81c-69e8-43eb-8a7d-760319a33570" ///
	"uuid:5e7ec2c2-d659-4068-8959-6f9f29c2f1b4", "uuid:e513f3d9-c0cc-4965-a6d6-3502771d9a90", "uuid:74aa395f-61fe-4081-8521-8fe4ecbfab52")
	drop if inlist(key, "uuid:c5b1166b-cffa-44b6-ac0d-8b43459b9294", "uuid:94cd2ab7-4266-4218-b392-393a15ee9d4e" ///
	"uuid:a8dca43a-9174-4735-98e9-1eaff832d1d7")
	*Siwan
	drop if key=="uuid:d6f372c9-d458-4f42-99dd-39eb7b385609"

	//Converting all variables to upper case before any merging or cleaning operation
	replace district_list = upper(district_list)
	replace pss_list = upper(pss_list)
	replace feeder_list = upper(feeder_list)
	replace market_list = upper(market_list)

	merge m:1 district_list pss_list feeder_list market_list using "`mkt_list'", generate (mergeMapping)
	label define mergeMapping 1 "Mapping only" 2 "Market List only" ///
								3 "Both Mapping and Market lists"

	//Drop feeders with any unmatched markets
	br if mergeMapping==2|mergeMapping==1
								
	//Keeping all mapped markets
	keep if mergeMapping==3

	rename key parent_key
	gsort parent_key

	//Dropping variables that are not required
	drop  dup_market surveyor_name_x surveyor_x supervisor_name_x supervisor_x

	tempfile mkt_mapped
	save "`mkt_mapped'"

	//Merging all enumeration- mapping to the shop- level data
	merge 1:m parent_key using "`Enumeration'", generate (mergeMapData)
	label define mergeMapData 1 "Mapped list only" 2 "Data list only" ///
								3 "Both Mapped and Data lists"

	******************** Cleaning Data at the Shop-Level ********************

	//Renaming surveyor and supervisor codes to indicate they are obtained from the survey data
	rename screen_1surv_code surveyor_code_data 
	rename screen_1superv_code supervisor_code_data

	//Tracking sheet originally provided in the wide format
	//Wide format has all enumerations for a market in the same row
	//Reshaping data in the long format
	//Long format has one row for each enumeration in the tracking sheet
	reshape long  surveyor code shops, i(key) j(surveyor_position)

	//Resolving surveyor mismatches (Wave 1)
	replace surveyor_code_data=122 if parent_key=="uuid:19ba15cc-0957-49c8-a802-ac02ab6e07e5"
	replace surveyor_code_data=104 if parent_key=="uuid:217fe658-80ec-4cf9-bd03-c6b4cecf6137"
	replace surveyor_code_data=128 if parent_key=="uuid:291cbe7b-7aa0-4a94-82c5-a9ed563ba039"
	replace surveyor_code_data=123 if parent_key=="uuid:5439bcfd-8cb2-43ff-accc-277d1c9d7fc0"
	replace surveyor_code_data=117 if parent_key=="uuid:69f5b3e0-3f94-4b3a-9d88-14e13ef8aaf9"
	replace surveyor_code_data=117 if parent_key=="uuid:7ec6a962-0a84-4124-8d57-a0e47718e6c7"
	replace surveyor_code_data=131 if parent_key=="uuid:a7a8e2a4-7def-4f50-acb4-722a51918fa7"
	replace surveyor_code_data=110 if parent_key=="uuid:acbd8cb2-347a-4b93-a7e6-a948366143de"
	replace surveyor_code_data=131 if parent_key=="uuid:b17b69af-60e5-4b55-9d3d-c60093e550c8"
	replace surveyor_code_data=123 if parent_key=="uuid:f8150ee3-4e68-4a40-b5f4-4321ef973720"
	replace surveyor_code_data=127 if parent_key=="uuid:b77e0416-1b45-4b88-b832-9a8611149dbe"
	//Resolving surveyor mismatches (Wave 3)
	replace surveyor_code_data=119 if parent_key=="uuid:45684110-4878-441d-8d1a-b8806b73a112" & code==119
	replace surveyor_code_data=205 if parent_key=="uuid:45684110-4878-441d-8d1a-b8806b73a112" & code==205
	replace code=102 if parent_key=="uuid:7823e88c-7198-4578-b112-24a14fb7ae29"
	replace code=130 if parent_key=="uuid:1dc9f6a0-a715-4d1c-8306-48e0f1c140f1"
	replace code=104 if parent_key=="uuid:34fe31ab-a390-46c7-a172-ab172d4a7e92"
	replace code=121 if parent_key=="uuid:fa7545b3-66d8-4661-872d-6537e93be10f"
	replace surveyor_code_data=119 if parent_key=="uuid:1fdd9813-960e-4497-9ead-2455ecc37609"
	replace code=122 if parent_key=="uuid:6ec2b4ac-5055-43a4-8907-8bce84e4f925"
	replace code=201 if parent_key=="uuid:5a483c0c-10dd-4aaf-aded-646c0ba41c14"
	replace code=305 if parent_key=="uuid:2c48f004-e903-4e94-9bb5-07722001c40a"
	replace surveyor_code_data=107 if parent_key=="uuid:ea1d3093-8c18-421a-accc-2b7f6e49fb63"
	replace code=103 if parent_key=="uuid:916c5c55-8b48-4604-803e-1246ce997e1a"
	replace code=202 if parent_key=="uuid:55174762-d0f6-4904-875e-cfd1399030c9"
	replace surveyor_code_data=204 if parent_key=="uuid:d6f372c9-d458-4f42-99dd-39eb7b385609"
	replace surveyor_code_data=203 if parent_key=="uuid:59d70eac-d779-4441-a91b-db6664929eff"

	//Dropping some excess rows which were created as a result of reshaping the dataset
	//These are empty codes which had lesser than 6 enumerations in the market
	//Hence, this resulted in some empty columns in the tracking sheet which led to empty rows while reshaping 
	drop if missing(code)

	//Rank shops at the enumeration-level
	//Assigning ranks to only those enumerations where the suryeor code entered matches 
	//the surveyor code on the tracking sheet
	gen enumerator_rank=.
	replace enumerator_rank= surveyor_position if surveyor_code_data==code

	//pos denotes the position of the shop for the single enumeration exercise
	//So, parent_key and pos should uniquely identify any shop that has been enumerated
	gsort parent_key pos enumerator_rank
	duplicates tag parent_key pos enumerator_rank, generate(dup_rank)
	duplicates drop parent_key pos, force

	//Generating number of shops and first shops for each enumeration /
	gsort parent_key pos
	bys parent_key: gen first_shop= _n==1
	bys parent_key: gen total_shops_enumeration=_N

	//Correcting pos for markets in which there have been multiple enumerations. 
	//In the field, the second enumeration will start at 1001, the third at 2001,
	//we are correcting so that all pos are sequential and match the maps
	egen temp_uid=concat( market_id feeder_id), punct("-")
	sort temp_uid pos
	bysort temp_uid: gen pos1=_n

	duplicates tag district_list pss_list feeder_list market_list pos, generate(dup_ennum)
	replace pos1=pos if dup_ennum==1
	drop temp_uid

	cd "`WORKING_DATA'"
	save ENUMERATION_BIZ_MRKT_`RAW_DATA_DATE', replace
	