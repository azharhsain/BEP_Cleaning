/**********************************************************************************************
Project: BEP

Purpose: Checking range of observations for manually entered numneric entries household survey

Author:  Azhar Hussain

Date  :  01 June, 2015
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

*INSTALLING PROGRAM
*ssc install bacon
*ssc install qlognorm
	
* READING WORKING DATA

	use "`WORKING_DATA'//CUMULATIVE_HH_RECONCILED_07May2015_WORKING"
	cd "`OUTPUT'//Outlier-HH"
		
	
* EXPORTING HISTOGRAM FOR VARIABLES TO CHECK RANGE AND ELIMINATE OUTLIERS

	// Assigning missing value to card caount var if the sum of count of all types of cards is greater than count of members of household
	replace d5_bpl_green_card_count=1 if ( d5_bpl_green_card_count>32 & d5_bpl_green_card_count< .)
	replace d5_bpl_red_card_count=1 if (d5_bpl_red_card_count>32 & d5_bpl_red_card_count< .)
	replace d5_bpl_yellow_card_count=1 if (d5_bpl_yellow_card_count>32 & d5_bpl_yellow_card_count< .)
	generate green_card_count=d5_bpl_green_card_count
	generate red_card_count=d5_bpl_red_card_count
	generate yellow_card_count=d5_bpl_yellow_card_count
	recode green_card_count red_card_count yellow_card_count (.=0) (.a=0) (.b=0) (.c=0) (.d=0)
	generate bpl_card_count= green_card_count + red_card_count + yellow_card_count
	replace d5_bpl_green_card_count=.z if (bpl_card_count>(a_adult_female_count+a_adult_male_count))
	replace d5_bpl_red_card_count=.z if (bpl_card_count>(a_adult_female_count+a_adult_male_count))
	replace d5_bpl_yellow_card_count=.z if (bpl_card_count>(a_adult_female_count+a_adult_male_count))
	drop green_card_count red_card_count yellow_card_count bpl_card_count
	
	
	
*High and low extremum	
	
	// Assigning missing value to building and total house area if building area is greater than total area
	replace b5_house_area_value_sqft=.z if (((b7_building_area_value_sqft> b5_house_area_value_sqft) | (b7_building_area_value_sqft>15000)) & (!missing(b7_building_area_value_sqft)) & (!missing(b5_house_area_value_sqft)))
	replace b7_building_area_value_sqft=.z if (((b7_building_area_value_sqft> b5_house_area_value_sqft) | (b7_building_area_value_sqft>15000)) & (!missing(b7_building_area_value_sqft)) & (!missing(b5_house_area_value_sqft)))	
	
	//Plot lognormal quantile plot to identify high and low extrema
	*qlognorm b5_house_area_value_sqft, ylog grid xlog
	replace b5_house_area_value_sqft=.z if b5_house_area_value_sqft<=150
	
	*qlognorm b7_building_area_value_sqft, ylog grid xlog
	replace b7_building_area_value_sqft=.z if b7_building_area_value_sqft<200
	
	// Convering variables which have entries out of 10 in percentage
	generate i19_meter_tamper_penal_percent= 10*i19_meter_tamper_penal
	generate i21_hooking_penal_percent= 10*i21_hooking_penal
	generate i23_bribe_penal_percent= 10*i23_bribe_penal
	
	
	// Assigning missing value to genset capacity if it is greater than 500 kW/HP
	replace e6_genset_capacity_kW= .z if (( e6_genset_capacity_kW>500) & (e6_genset_capacity_kW<.)) //Here one surveyor has entered 999999 as capacity in some cases
	
	
	// Assigning missing value to monthly exp on genset if it is more than Rs 10000
	replace e9_genset_exp_monthly= .z if ((e9_genset_exp_monthly>10000) & (e9_genset_exp_monthly<.))

	
	
	// Assigning missing value to PSS/Franchisee distance if it is more than 50 km
	replace e49_franchise_pss_distance_val_m=.z if ((e49_franchise_pss_distance_val_m>50000) & (e49_franchise_pss_distance_val_m<.)) 
	replace e50_franchise_pss_time_value_min=.z if ((e49_franchise_pss_distance_val_m>50000) & (e49_franchise_pss_distance_val_m<.))
	
	
	// Assigning missing value to PSS/Franchisee time taken to reach if it is more than 15 hours
	replace e50_franchise_pss_time_value_min=.z if ((e50_franchise_pss_time_value_min>900) & (e50_franchise_pss_time_value_min<.)) 
	replace e49_franchise_pss_distance_val_m=.z if ((e50_franchise_pss_time_value_min>900) & (e50_franchise_pss_time_value_min<.)) 
	
	//Assign missing value to PSS Franchise distance and time if implied speed is less than 0.5km/hr or more than 200km/hr
	gen pss_travel_speed_impute=(e49_franchise_pss_distance_val_m/1000)/(e50_franchise_pss_time_value_min/60)
	replace e50_franchise_pss_time_value_min=.z if pss_travel_speed_impute<0.5 | pss_travel_speed_impute>200
	replace e49_franchise_pss_distance_val_m=.z if pss_travel_speed_impute<0.5 | pss_travel_speed_impute>200
	drop pss_travel_speed_impute
	
	// Assigning missing value to organisation meetup duration if it is more than 2 years
	replace i11_org_meet_duration_day=.z if ((i11_org_meet_duration_day>730) & (i11_org_meet_duration_day<.))
	replace i10_member_local_org=.z if ((i11_org_meet_duration_day>730) & (i11_org_meet_duration_day<.))
	
	
	// Assigning missing value to neighbourhood interaction duration if it is more than 1 year
	replace i13_neighbor_interact_time_day=.z if ((i13_neighbor_interact_time_day>365) & (i13_neighbor_interact_time_day<.))
	
	
	// Assigning missing value to diesel cost if it is more than Rs 100
	replace e9_diesel_cost=.z if ((e9_diesel_cost>100) & (e9_diesel_cost<.))
	replace e9_genset_exp_monthly=.z if ((e9_diesel_cost>100) & (e9_diesel_cost<.))
	replace e9_genset_exp_rupee=.z if ((e9_genset_exp_rupee>10000) & (e9_genset_exp_rupee<.))
	replace e9_genset_exp_monthly=.z if ((e9_genset_exp_rupee>10000) & (e9_genset_exp_rupee<.))
	foreach var of varlist `outlier_var' {
		histogram `var', freq
		graph export "`var'.png", replace
	}
	
	//Assigning missing value to household member age var if it's greater than 120 and less than 3 years
	foreach i1 of numlist 1/32 {
		replace a1_family_mem_age`i1'= .z if (((a1_family_mem_age`i1'>120) & (a1_family_mem_age`i1'<.)) | (a1_family_mem_age`i1'<3))
		histogram a1_family_mem_age`i1', freq
		graph export "a1_family_mem_age`i1'.png", replace
	}
	
	//Assigning missing value to bedroom count var if it's greater than 9 and adult count of HH < bedroom count
	replace b8_bedroom_count = .z if ((( b8_bedroom_count>9 & b8_bedroom_count<. )) & (( a_adult_female_count+a_adult_male_count)< b8_bedroom_count ))
	//Assigning missing value to kitchen count var if it's greater than 2 and bedroom count
	replace b8_kitchen_count = .z if (( b8_kitchen_count>2 & b8_kitchen_count<.) & ( b8_kitchen_count>b8_bedroom_count ))
	//Assigning missing value to livingarea count var if it's greater than 2 and bedroom count
	replace b8_kitchen_count = .z if (( b8_living_count>2 & b8_living_count<. ) & ( b8_living_count>b8_bedroom_count ))
	//Assigning missing value to toilet count var if it's greater than 2 and bedroom count
	replace b8_toilet_count = .z if (( b8_toilet_count>2 & b8_toilet_count<. ) & ( b8_toilet_count>b8_bedroom_count ))
	foreach i2 in bedroom living kitchen toilet {
		histogram b8_`i2'_count, freq
		graph export "b8_`i2'_count.png", replace
	}

	//Assigning missing value to buffalo count var if it's greater than 9 and occupation of household doesn't include dairy	
	replace b12_buffalo_count = .z if (( b12_buffalo_count>9 & b12_buffalo_count<. ) & ( a6_mem2_occup_dairy==0 ))
	//Assigning missing value to buffalo count var if it's greater than 9 and occupation of household doesn't include crop cultivation	
	replace b12_bullock_count = .z if (( b12_bullock_count>9 & b12_bullock_count<. ) & ( a6_mem2_occup_crop_cultivation==0 ))
	//Assigning missing value to chicken count var if it's greater than 9 and occupation of household doesn't include poultry	
	replace b12_chicken_count = .z if (( b12_chicken_count>25 & b12_chicken_count<. ) & ( a6_mem1_occup_poultry==0 | a6_mem2_occup_poultry==0))
	//Assigning missing value to cow count var if it's greater than 9 and occupation of household doesn't include dairy	
	replace b12_cow_count = .z if (( b12_cow_count>9 & b12_cow_count<. ) & ( a6_mem2_occup_dairy==0 ))
	//Assigning missing value to goat count var if it's greater than 9 and occupation of household doesn't include dairy	
	replace b12_goat_count = .z if ( b12_goat_count>15 & b12_goat_count<. )
	foreach i3 in `animal_woth' {
		histogram b12_`i3'_count, freq
		graph export "b12_`i3'_count.png", replace
	}
	
	local cook_assets kerosene_stove lpg_stove mud_chulah pressure_cooker utensil
	
	foreach x of local cook_assets{
		gen `x'_AV=c1_`x'_resale_value/c1_`x'_count
		*qlognorm `x'_AV, grid xlog ylog
		*qui graph export `x'_AV_lognorm.png, replace
		*window manage close graph 
		*graph box `x'_AV
		*qui graph export `x'_AV.png, replace

	}
	
	local c2_assets television 
	foreach x of local c2_assets{
			gen `x'_AV=c2_`x'_resale_value/c2_`x'_count
		/*
		qlognorm `x'_AV, grid xlog ylog
		qui graph export `x'_AV_lognorm.png, replace
		window manage close graph 
		graph box `x'_AV
		qui graph export `x'_AV.png, replace
		*/
	}
	
	local c3_assets almirah  bed bulb_cfl ceiling_fan electric_iron immersion_rod 
		foreach x of local c3_assets{
			gen `x'_AV=c3_`x'_resale_value/c3_`x'_count
		/*
		qlognorm `x'_AV, grid xlog ylog
		qui graph export `x'_AV_lognorm.png, replace
		window manage close graph 
		graph box `x'_AV
		qui graph export `x'_AV.png, replace
		*/
	}
	
	local c4_assets bicycle tractor two_wheeler 
		foreach x of local c4_assets{
			gen `x'_AV=c4_`x'_resale_value/c4_`x'_count
			/*
		qlognorm `x'_AV, grid xlog ylog
		qui graph export `x'_AV_lognorm.png, replace
		window manage close graph 
		graph box `x'_AV
		qui graph export `x'_AV.png, replace
		*/
	}
	
	local c5_assets hand_pump mobile_phone torch wall_clock wrist_watch
	
	foreach x of local c5_assets{
			gen `x'_AV=c5_`x'_resale_value/c5_`x'_count
			/*
		qlognorm `x'_AV, grid xlog ylog
		qui graph export `x'_AV_lognorm.png, replace
		window manage close graph 
		graph box `x'_AV
		qui graph export `x'_AV.png, replace
		*/
	}
	
	
	
	//Assigning missing value to kerosene stove count if it is more than 10
	replace c1_kerosene_stove_resale_value=.z if ((c1_kerosene_stove_count>10) & (c1_kerosene_stove_count<.))
	replace c1_kerosene_stove_count=.z if ((c1_kerosene_stove_count>10) & (c1_kerosene_stove_count<.))
	//Assigning missing value to kerosene stove resale value if it is more than Rs 1000/unit	 or less than Rs 20/unit
	replace c1_kerosene_stove_count=.z if ((c1_kerosene_stove_resale_value/c1_kerosene_stove_count>1000) & (c1_kerosene_stove_resale_value<.)) | (c1_kerosene_stove_resale_value/c1_kerosene_stove_count<20)
	replace c1_kerosene_stove_resale_value=.z if ((c1_kerosene_stove_resale_value/c1_kerosene_stove_count>1000) & (c1_kerosene_stove_resale_value<.)) | (c1_kerosene_stove_resale_value/c1_kerosene_stove_count<20)
	//Assigning missing value to lpg stove count if it is more than 10
	replace c1_lpg_stove_resale_value=.z if ((c1_lpg_stove_count>10) & (c1_lpg_stove_count<.))
	replace c1_lpg_stove_count=.z if ((c1_lpg_stove_count>10) & (c1_lpg_stove_count<.))
	//Assigning missing value to lpg stove resale value if it is more than Rs 10000/unit or less than Rs 100/unit
	replace c1_lpg_stove_count=.z if ((c1_lpg_stove_resale_value/c1_lpg_stove_count>10000) & (c1_lpg_stove_resale_value<.)) | (c1_lpg_stove_resale_value/c1_lpg_stove_count<100)
	replace c1_lpg_stove_resale_value=.z if ((c1_lpg_stove_resale_value/c1_lpg_stove_count>10000) & (c1_lpg_stove_resale_value<.)) | (c1_lpg_stove_resale_value/c1_lpg_stove_count<100)
	//Assigning missing value to mud chulah count if it is more than 25
	replace c1_mud_chulah_resale_value=.z if ((c1_mud_chulah_count>25) & (c1_mud_chulah_count<.))
	replace c1_mud_chulah_count=.z if ((c1_mud_chulah_count>25) & (c1_mud_chulah_count<.))
	//Assigning missing value to mud chulah resale value if it is more than Rs 500/unit or less than Rs 5/unit
	replace c1_mud_chulah_count=.z if ((c1_mud_chulah_resale_value/c1_mud_chulah_count>500) & (c1_mud_chulah_resale_value<.)) | (c1_mud_chulah_resale_value/c1_mud_chulah_count<5)
	replace c1_mud_chulah_resale_value=.z if ((c1_mud_chulah_resale_value/c1_mud_chulah_count>500) & (c1_mud_chulah_resale_value<.)) | (c1_mud_chulah_resale_value/c1_mud_chulah_count<5)
	//Assigning missing value to pressure cooker count if it is more than 10
	replace c1_pressure_cooker_resale_value=.z if ((c1_pressure_cooker_count>10) & (c1_pressure_cooker_count<.))
	replace c1_pressure_cooker_count=.z if ((c1_pressure_cooker_count>10) & (c1_pressure_cooker_count<.))
	//Assigning missing value to pressure cooker resale value if it is more than Rs 2000/unit or less than Rs 50/ unit
	replace c1_pressure_cooker_count=.z if ((c1_pressure_cooker_resale_value/c1_pressure_cooker_count>2000) & (c1_pressure_cooker_resale_value<.)) | (c1_pressure_cooker_resale_value/c1_pressure_cooker_count<50)
	replace c1_pressure_cooker_resale_value=.z if ((c1_pressure_cooker_resale_value/c1_pressure_cooker_count>2000) & (c1_pressure_cooker_resale_value<.)) | (c1_pressure_cooker_resale_value/c1_pressure_cooker_count<50)
	//Assigning missing value to utensil count if it is more than 100/
	replace c1_utensil_resale_value=.z if ((c1_utensil_count>100) & (c1_utensil_count<.))
	replace c1_utensil_count=.z if ((c1_utensil_count>100) & (c1_utensil_count<.))
	//Assigning missing value to utensil resale value if it is more than Rs 100/unit or less than Rs 1/unit
	replace c1_utensil_count=.z if ((c1_utensil_resale_value/c1_utensil_count>100) & (c1_utensil_resale_value<.)) | (c1_utensil_resale_value/c1_utensil_count<1)
	replace c1_utensil_resale_value=.z if ((c1_utensil_resale_value/c1_utensil_count>100) & (c1_utensil_resale_value<.)) |	(c1_utensil_resale_value/c1_utensil_count<1)
	foreach j in `cooking_asset_woth' {
			capture histogram c1_`j'_count, freq
			capture graph export "c1_`j'_count.png", replace
			capture histogram c1_`j'_resale_value, freq
			capture graph export "c1_`j'_resale_value.png", replace			
	}
	
	//Assigning missing value to television count if it is more than 10
	replace c2_television_resale_value=.z if ((c2_television_count>10) & (c2_television_count<.))
	replace c2_television_count=.z if ((c2_television_count>10) & (c2_television_count<.))
	//Assigning missing value to television resale value if it is more than Rs 20000/unit	or less than Rs 500/unit
	replace c2_television_count=.z if ((c2_television_resale_value/c2_television_count>20000) & (c2_television_resale_value<.))	| (c2_television_resale_value/c2_television_count<500)
	replace c2_television_resale_value=.z if ((c2_television_resale_value/c2_television_count>20000) & (c2_television_resale_value<.))	| (c2_television_resale_value/c2_television_count<500)
	foreach j in `entertainment_asset_woth' {
			capture histogram c2_`j'_count, freq
			capture graph export "c2_`j'_count.png", replace
			capture histogram c2_`j'_resale_value, freq
			capture graph export "c2_`j'_resale_value.png", replace			
	}

	//Assigning missing value to almirah count if it is more than 10
	replace c3_almirah_resale_value=.z if ((c3_almirah_count>10) & (c3_almirah_count<.))
	replace c3_almirah_count=.z if ((c3_almirah_count>10) & (c3_almirah_count<.))
	//Assigning missing value to almirah resale value if it is more than Rs 15000/unit	
	replace c3_almirah_count=.z if ((c3_almirah_resale_value/c3_almirah_count>15000) & (c3_almirah_resale_value<.))		
	replace c3_almirah_resale_value=.z if ((c3_almirah_resale_value/c3_almirah_count>15000) & (c3_almirah_resale_value<.))		
	//Assigning missing value to bed count if it is more than 25
	replace c3_bed_resale_value=.z if ((c3_bed_count>25) & (c3_bed_count<.))
	replace c3_bed_count=.z if ((c3_bed_count>25) & (c3_bed_count<.))
	//Assigning missing value to almirah resale value if it is more than Rs 15000/unit or less than Rs 50/ unit	
	replace c3_bed_count=.z if ((c3_bed_resale_value/c3_bed_count>15000) & (c3_bed_resale_value<.))	| (c3_bed_resale_value/c3_bed_count<50) 
	replace c3_bed_resale_value=.z if ((c3_bed_resale_value/c3_bed_count>15000) & (c3_bed_resale_value<.)) | (c3_bed_resale_value/c3_bed_count<50) 
	//Assigning missing value to bulb & cfl count if it is more than 25
	replace c3_bulb_cfl_resale_value=.z if ((c3_bulb_cfl_count>25) & (c3_bulb_cfl_count<.))
	replace c3_bulb_cfl_count=.z if ((c3_bulb_cfl_count>25) & (c3_bulb_cfl_count<.))
	//Assigning missing value to bulb & cfl resale value if it is more than Rs 150/unit	 or less than Rs 1/unit
	replace c3_bulb_cfl_count=.z if ((c3_bulb_cfl_resale_value/c3_bulb_cfl_count>150) & (c3_bulb_cfl_resale_value<.)) |	(c3_bulb_cfl_resale_value/c3_bulb_cfl_count<1)
	replace c3_bulb_cfl_resale_value=.z if ((c3_bulb_cfl_resale_value/c3_bulb_cfl_count>150) & (c3_bulb_cfl_resale_value<.)) |	(c3_bulb_cfl_resale_value/c3_bulb_cfl_count<1)
	//Assigning missing value to ceiling fan count if it is more than 15
	replace c3_ceiling_fan_resale_value=.z if ((c3_ceiling_fan_count>15) & (c3_ceiling_fan_count<.))
	replace c3_ceiling_fan_count=.z if ((c3_ceiling_fan_count>15) & (c3_ceiling_fan_count<.))
	//Assigning missing value to ceiling fan resale value if it is more than Rs 2000/unit or less than Rs 100/unit
	replace c3_ceiling_fan_count=.z if ((c3_ceiling_fan_resale_value/c3_ceiling_fan_count>2000) & (c3_ceiling_fan_resale_value<.))	|	(c3_ceiling_fan_resale_value/c3_ceiling_fan_count<100)
	replace c3_ceiling_fan_resale_value=.z if ((c3_ceiling_fan_resale_value/c3_ceiling_fan_count>2000) & (c3_ceiling_fan_resale_value<.)) | (c3_ceiling_fan_resale_value/c3_ceiling_fan_count<100)
	//Assigning missing value to electric iron count if it is more than 10 or resale value less than 50/unit
	replace c3_electric_iron_resale_value=.z if ((c3_electric_iron_count>10) & (c3_electric_iron_count<.)) | (c3_electric_iron_resale_value/c3_electric_iron_count)<50
	replace c3_electric_iron_count=.z if ((c3_electric_iron_count>10) & (c3_electric_iron_count<.)) | (c3_electric_iron_resale_value/c3_electric_iron_count)<50
	//Assigning missing value to immersion rod resale value if it is more than Rs 500/unit 	
	replace c3_immersion_rod_count=.z if ((c3_immersion_rod_resale_value/c3_immersion_rod_count>500) & (c3_immersion_rod_resale_value<.)) 
	replace c3_immersion_rod_resale_value=.z if ((c3_immersion_rod_resale_value/c3_immersion_rod_count>500) & (c3_immersion_rod_resale_value<.)) 
	foreach j in `appliance_asset_woth' {
			capture histogram c3_`j'_count, freq
			capture graph export "c3_`j'_count.png", replace
			capture histogram c3_`j'_resale_value, freq
			capture graph export "c3_`j'_resale_value.png", replace			
	}
	

	//Assigning missing value to bicycle count if it is more than 15
	replace c4_bicycle_resale_value=.z if ((c4_bicycle_count>15) & (c4_bicycle_count<.))
	replace c4_bicycle_count=.z if ((c4_bicycle_count>15) & (c4_bicycle_count<.))
	//Assigning missing value to bicycle resale value if it is more than Rs 3000/unit	or less than 100/unit
	replace c4_bicycle_count=.z if ((c4_bicycle_resale_value/c4_bicycle_count>3000) & (c4_bicycle_resale_value<.))	|	(c4_bicycle_resale_value/c4_bicycle_count<100)
	replace c4_bicycle_resale_value=.z if ((c4_bicycle_resale_value/c4_bicycle_count>3000) & (c4_bicycle_resale_value<.)) | (c4_bicycle_resale_value/c4_bicycle_count<100)
	//Assigning missing value to tractor resale value if it is more than Rs 500000/unit	
	replace c4_tractor_count=.z if ((c4_tractor_resale_value/c4_tractor_count>500000) & (c4_tractor_resale_value<.))		
	replace c4_tractor_resale_value=.z if ((c4_tractor_resale_value/c4_tractor_count>500000) & (c4_tractor_resale_value<.))
	//Assigning missing value to two-wheeler count if it is more than 10
	replace c4_two_wheeler_resale_value=.z if ((c4_two_wheeler_count>10) & (c4_two_wheeler_count<.))
	replace c4_two_wheeler_count=.z if ((c4_two_wheeler_count>15) & (c4_two_wheeler_count<.))
	//Assigning missing value to two-wheeler resale value if it is more than Rs 50000/unit	or less than 2000
	replace c4_two_wheeler_count=.z if ((c4_two_wheeler_resale_value/c4_two_wheeler_count>50000) & (c4_two_wheeler_resale_value<.))	|	(c4_two_wheeler_resale_value/c4_two_wheeler_count<2000)
	replace c4_two_wheeler_resale_value=.z if ((c4_two_wheeler_resale_value/c4_two_wheeler_count>50000) & (c4_two_wheeler_resale_value<.)) | (c4_two_wheeler_resale_value/c4_two_wheeler_count<2000)
	foreach j in `transport_asset_woth' {
			capture histogram c4_`j'_count, freq
			capture graph export "c4_`j'_count.png", replace
			capture histogram c4_`j'_resale_value, freq
			capture graph export "c4_`j'_resale_value.png", replace			
	}

	//Assigning missing value to hand pump count if it is more than 5
	replace c5_hand_pump_resale_value=.z if ((c5_hand_pump_count>5) & (c5_hand_pump_count<.))
	replace c5_hand_pump_count=.z if ((c5_hand_pump_count>5) & (c5_hand_pump_count<.))
	//Assigning missing value to hand pump resale value if it is more than Rs 15000/unit or less than 100 Rs/unit
	replace c5_hand_pump_count=.z if ((c5_hand_pump_resale_value/c5_hand_pump_count>15000) & (c5_hand_pump_resale_value<.))	| (c5_hand_pump_resale_value/c5_hand_pump_count<100)	
	replace c5_hand_pump_resale_value=.z if ((c5_hand_pump_resale_value/c5_hand_pump_count>15000) & (c5_hand_pump_resale_value<.)) | (c5_hand_pump_resale_value/c5_hand_pump_count<100)
	//Assigning missing value to mobile phone count if it is more than 10
	replace c5_mobile_phone_resale_value=.z if ((c5_mobile_phone_count>10) & (c5_mobile_phone_count<.))
	replace c5_mobile_phone_count=.z if ((c5_mobile_phone_count>10) & (c5_mobile_phone_count<.))
	//Assigning missing value to mobile phone resale value if it is more than Rs 15000/unit	or less than Rs 100/ unit
	replace c5_mobile_phone_count=.z if ((c5_mobile_phone_resale_value/c5_mobile_phone_count>15000) & (c5_mobile_phone_resale_value<.))	| (c5_mobile_phone_resale_value/c5_mobile_phone_count)<100
	replace c5_mobile_phone_resale_value=.z if ((c5_hand_pump_resale_value/c5_mobile_phone_count>15000) & (c5_mobile_phone_resale_value<.)) | (c5_mobile_phone_resale_value/c5_mobile_phone_count)<100
	//Assigning missing value to torch count if it is more than 10
	replace c5_torch_resale_value=.z if ((c5_torch_count>10) & (c5_torch_count<.))
	replace c5_torch_count=.z if ((c5_torch_count>10) & (c5_torch_count<.))
	//Assigning missing value to torch resale value if it is more than Rs 500/unit or less than Rs 5/unit	
	replace c5_torch_count=.z if ((c5_torch_resale_value/c5_torch_count>500) & (c5_torch_resale_value<.)) | (c5_torch_resale_value/c5_torch_count<5)	
	replace c5_torch_resale_value=.z if ((c5_torch_resale_value/c5_torch_count>500) & (c5_torch_resale_value<.)) | (c5_torch_resale_value/c5_torch_count<5)	
	//Assigning missing value to wall clock count if it is more than 10
	replace c5_wall_clock_resale_value=.z if ((c5_wall_clock_count>10) & (c5_wall_clock_count<.))
	replace c5_wall_clock_count=.z if ((c5_wall_clock_count>10) & (c5_wall_clock_count<.))
	//Assigning missing value to wall clock resale value if it is more than Rs 500/unit	or less than 10 /unit
	replace c5_wall_clock_count=.z if ((c5_wall_clock_resale_value/c5_wall_clock_count>500) & (c5_wall_clock_resale_value<.))	| (c5_wall_clock_resale_value/c5_wall_clock_count<10)	
	replace c5_wall_clock_resale_value=.z if ((c5_wall_clock_resale_value/c5_wall_clock_count>500) & (c5_wall_clock_resale_value<.)) | (c5_wall_clock_resale_value/c5_wall_clock_count<10)	
	//Assigning missing value to wrist watch count if it is more than 9
	replace c5_wrist_watch_resale_value=.z if ((c5_wrist_watch_count>9) & (c5_wrist_watch_count<.))
	replace c5_wrist_watch_count=.z if ((c5_wrist_watch_count>9) & (c5_wrist_watch_count<.))
	//Assigning missing value to wrist watch resale value if it is more than Rs 5000/unit or less than 10/unit
	replace c5_wrist_watch_count=.z if ((c5_wrist_watch_resale_value/c5_wrist_watch_count>5000) & (c5_wrist_watch_resale_value<.))	| (c5_wrist_watch_resale_value/c5_wrist_watch_count<10)
	replace c5_wrist_watch_resale_value=.z if ((c5_wrist_watch_resale_value/c5_wrist_watch_count>5000) & (c5_wrist_watch_resale_value<.)) | (c5_wrist_watch_resale_value/c5_wrist_watch_count<10)
	foreach j in `miscellaneous_asset_woth' {
			capture histogram c5_`j'_count, freq
			capture graph export "c5_`j'_count.png", replace
			capture histogram c5_`j'_resale_value, freq
			capture graph export "c5_`j'_resale_value.png", replace			
	}

	// Assigning missing value to number of torch batteries used per month if it is more than 60
	replace g4_battery_use_quantity=.z if ((g4_battery_use_quantity>60) & (g4_battery_use_quantity<.))
	// Assigning missing value to number of hours of inverter usage per month if it is more than 360 hours
	replace g4_invertor_use_quantity=.z if ((g4_invertor_use_quantity>360) & (g4_invertor_use_quantity<.))
	// Assigning missing value to number of liters of kerosene oil used per month for lighting if it is more than 20 liters
	replace g4_kerosene_use_quantity=.z if ((g4_kerosene_use_quantity>20) & (g4_kerosene_use_quantity<.))
	// Assigning missing value to number of hours of own solar panel usage per month if it is more than 240 hours
	replace g4_own_solar_use_quantity=.z if ((g4_own_solar_use_quantity>240) & (g4_own_solar_use_quantity<.))
	// Assigning missing value to number of hours of shared solar panel usage per month if it is more than 240 hours
	replace g4_shared_solar_use_quantity=.z if ((g4_shared_solar_use_quantity>240) & (g4_shared_solar_use_quantity<.))
	// Assigning missing value to unit price of torch battery if it is more than Rs 20
	replace g5_battery_unit_price=.z if ((g5_battery_unit_price>20) & (g5_battery_unit_price<.))
	// Assigning missing value to unit price of torch battery if it is more than Rs 20
	replace g5_candle_unit_price=.z if ((g5_candle_unit_price>20) & (g5_candle_unit_price<.))
	// Assigning missing value to unit price of kerosene if it is more than Rs 100 or less than Rs 2.
	replace g5_kerosene_unit_price=.z if ((g5_kerosene_unit_price>100) & (g5_kerosene_unit_price<.)) | g5_kerosene_unit_price<2
	// Assigning missing value to unit price of diesel if it is more than Rs 100
	replace g5_shared_genset_unit_price=.z if ((g5_shared_genset_unit_price>100) & (g5_shared_genset_unit_price<.))	
	// Assigning missing value to monthly expenditure on inverter if it is more than Rs 2000	
	replace g6_invertor_exp_month=.z if ((g6_invertor_exp_month>2000) & (g6_invertor_exp_month<.))
	// Assigning missing value to monthly expenditure on own solar panel if it is more than Rs 1000
	replace g6_own_solar_exp_month=.z if ((g6_own_solar_exp_month>1000) & (g6_own_solar_exp_month<.))
	// Assigning missing value to monthly expenditure on shared genset if it is more than Rs 5000
	replace g6_shared_genset_exp_month=.z if ((g6_shared_genset_exp_month>5000) & (g6_shared_genset_exp_month<.))
	foreach i in `energy_source' {
		histogram g4_`i'_use_quantity, freq
		graph export "g4_`i'_use_quantity.png", replace
		histogram g5_`i'_unit_price, freq
		graph export "g5_`i'_unit_price.png", replace
		histogram g6_`i'_exp_month, freq
		graph export "g6_`i'_exp_month.png", replace		
	}
	
	//Assigning missing value to bedroom bulb count var if it's greater than 4 per bedroom
	replace hb2_bulb_count= .z if (hb2_bulb_count/b8_bedroom_count> 4 & hb2_bulb_count/b8_bedroom_count< .)
	//Assigning missing value to bedroom cfl count var if it's greater than 4 per bedroom
	replace hb3_cfl_count= .z if (hb3_cfl_count/b8_bedroom_count> 4 & hb3_cfl_count/b8_bedroom_count< .)
	//Assigning missing value to bedroom tubelight count var if it's greater than 2 per bedroom	
	replace hb4_tubelight_count= .z if (hb4_tubelight_count/b8_bedroom_count> 2 & hb4_tubelight_count/b8_bedroom_count< .)
	//Assigning missing value to bedroom plug count var if it's greater than 5 per bedroom	
	replace hb5_plug_count= .z if (hb5_plug_count/b8_bedroom_count> 5 & hb5_plug_count/b8_bedroom_count< .)
	//Assigning missing value to kitchen bulb count var if it's greater than 2 per kitchen
	replace hk2_bulb_count= .z if (hk2_bulb_count/b8_kitchen_count> 2 & hk2_bulb_count/b8_kitchen_count< .)
	//Assigning missing value to kitchen cfl count var if it's greater than 2 per kitchen
	replace hk3_cfl_count= .z if (hk3_cfl_count/b8_kitchen_count> 2 & hk3_cfl_count/b8_kitchen_count< .)
	//Assigning missing value to kitchen tubelight count var if it's greater than 1 per kitchen
	replace hk4_tubelight_count= .z if (hk4_tubelight_count/b8_kitchen_count> 1 & hk4_tubelight_count/b8_kitchen_count< .)
	//Assigning missing value to kitchen plug count var if it's greater than 3 per kitchen	
	replace hk5_plug_count= .z if (hk5_plug_count/b8_kitchen_count> 3 & hk5_plug_count/b8_kitchen_count< .)
	//Assigning missing value to livingarea bulb count var if it's greater than 2 per livingarea
	replace hl2_bulb_count= .z if (hl2_bulb_count/b8_living_count> 4 & hl2_bulb_count/b8_living_count< .)
	//Assigning missing value to livingarea cfl count var if it's greater than 2 per livingarea
	replace hl3_cfl_count= .z if (hl3_cfl_count/b8_living_count> 4 & hl3_cfl_count/b8_living_count< .)
	//Assigning missing value to livingarea tubelight count var if it's greater than 1 per livingarea
	replace hl4_tubelight_count= .z if (hl4_tubelight_count/b8_living_count> 2 & hl4_tubelight_count/b8_living_count< .)
	//Assigning missing value to livingarea plug count var if it's greater than 5 per livingarea
	replace hl5_plug_count= .z if (hl5_plug_count/b8_living_count> 5 & hl5_plug_count/b8_living_count< .)
	//Assigning missing value to toilet bulb count var if it's greater than 2 per toilet
	replace ht2_bulb_count= .z if (ht2_bulb_count/b8_toilet_count> 2 & ht2_bulb_count/b8_toilet_count< .)
	//Assigning missing value to toilet cfl count var if it's greater than 2 per toilet
	replace ht3_cfl_count= .z if (ht3_cfl_count/b8_toilet_count> 2 & ht3_cfl_count/b8_toilet_count< .)
	//Assigning missing value to toilet tubelight count var if it's greater than 1 per toilet
	replace ht4_tubelight_count= .z if (ht4_tubelight_count/b8_toilet_count> 1 & ht4_tubelight_count/b8_toilet_count< .)
	//Assigning missing value to toilet plug count var if it's greater than 3 per toilet	
	replace ht5_plug_count= .z if (ht5_plug_count/b8_toilet_count> 3 & ht5_plug_count/b8_toilet_count< .)
	foreach i in `room_type' {
		local r=substr("`i'",1,1)
		histogram h`r'2_bulb_count_`i', freq
		graph export "h`r'2_bulb_count_`i'.png", replace
		histogram h`r'3_cfl_count_`i', freq
		graph export "h`r'3_cfl_count_`i'.png", replace		
		histogram h`r'4_tubelight_count_`i', freq
		graph export "h`r'4_tubelight_count_`i'.png", replace
		histogram h`r'5_plug_count_`i', freq
		graph export "h`r'5_plug_count_`i'.png", replace		
	}
	

	gen exp_m=.
	foreach i in `exp_head' {
		replace exp_m = j1_`i'_exp_lastmonth if !missing(j1_`i'_exp_lastmonth)
	}
	
	gen inc_m=.
	foreach i in `income_src' {
		replace inc_m = j6_`i'_inc_monthly if !missing(j6_`i'_inc_monthly)
	}
	foreach i in `exp_head' {
		histogram j1_`i'_exp_lastmonth, freq
		graph export "j1_`i'_exp_lastmonth.png", replace
	}
	
	foreach i in `income_src' {
		histogram j6_`i'_inc_annual, freq
		graph export "j6_`i'_inc_annual.png", replace
		histogram j6_`i'_inc_monthly, freq
		graph export "j6_`i'_inc_monthly.png", replace		
	}

	
* SAVING CLEANED DATA

	cd "`WORKING_DATA'"
	save CUMULATIVE_HH_RECONCILED_07May2015_CLEANED, replace
	
