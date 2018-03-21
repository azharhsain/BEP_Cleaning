/************************************************************
Project: BEP

Purpose: Baseline household survey data unit standardization

Author:  Azhar Hussain

Date  :  28 April, 2015
*************************************************************/



* CONVERTING UNITS FOR STANDARDIZATION

	generate b5_house_area_value_sqft = b5_house_area_value
	label variable b5_house_area_value_sqft "Total area of house premises in sqft"
	generate b7_building_area_value_sqft = b7_building_area_value
	label variable b7_building_area_value_sqft "Area of building in sqft"
	generate b10_land_extra_value_sqft = b10_land_extra_value
	label variable b10_land_extra_value_sqft "Total extra land owned in sqft"
	
	replace b5_house_area_value_sqft = 182.2*b5_house_area_value if b5_house_area_unit==1 //1 Dhoor = 182.2 Square Feet
	replace b7_building_area_value_sqft = 182.2*b7_building_area_value if b7_building_area_unit==1
	replace b10_land_extra_value_sqft = 182.2*b10_land_extra_value if b10_land_extra_unit==1	
	
	replace b5_house_area_value_sqft = 3638.2*b5_house_area_value if b5_house_area_unit==2 //1 Kattha = 3638.2 Square Feet
	replace b7_building_area_value_sqft = 3638.2*b7_building_area_value if b7_building_area_unit==2
	replace b10_land_extra_value_sqft = 3638.2*b10_land_extra_value if b10_land_extra_unit==2
	
	replace b5_house_area_value_sqft = 17452*b5_house_area_value if b5_house_area_unit==3 //1 Bigha = 17452 Square Feet
	replace b7_building_area_value_sqft = 17452*b7_building_area_value if b7_building_area_unit==3
	replace b10_land_extra_value_sqft = 17452*b10_land_extra_value if b10_land_extra_unit==3	
	
	replace b5_house_area_value_sqft = 10.764*b5_house_area_value if b5_house_area_unit==5 //1 Square Meter = 10.764 Square Feet
	replace b7_building_area_value_sqft = 10.764*b7_building_area_value if b7_building_area_unit==5
	replace b10_land_extra_value_sqft = 10.764*b10_land_extra_value if b10_land_extra_unit==5	
	
	replace b5_house_area_value_sqft = 43560*b5_house_area_value if b5_house_area_unit==6 //1 Acre = 43560 Square Feet
	replace b7_building_area_value_sqft = 43560*b7_building_area_value if b7_building_area_unit==6
	replace b10_land_extra_value_sqft = 43560*b10_land_extra_value if b10_land_extra_unit==6	
	
	replace b5_house_area_value_sqft = 107639*b5_house_area_value if b5_house_area_unit==7 //1 Hectare = 107639 Square Feet
	replace b7_building_area_value_sqft = 107639*b7_building_area_value if b7_building_area_unit==7
	replace b10_land_extra_value_sqft = 107639*b10_land_extra_value if b10_land_extra_unit==7	

	replace b5_house_area_value_sqft = 435.6*b5_house_area_value if b5_house_area_unit==8 //1 Dismil = 435.6 Square Feet
	replace b7_building_area_value_sqft = 435.6*b7_building_area_value if b7_building_area_unit==8
	replace b10_land_extra_value_sqft = 435.6*b10_land_extra_value if b10_land_extra_unit==8
	
	generate e6_genset_capacity_kW = e6_genset_capacity
	label variable e6_genset_capacity_kW "Genset capacity in kW"
	replace e6_genset_capacity_kW = 0.7457*e6_genset_capacity if e6_genset_unit==1 //1HP = 0.7457kW
	
	generate e12_genset_shared_exp_monthly = e12_genset_shared_exp_amount
	label variable e12_genset_shared_exp_monthly "Shared genset monthly expenditure in Rs"
	replace e12_genset_shared_exp_monthly = 4*e12_genset_shared_exp_amount if e12_genset_shared_exp_unit==1 // 1 Month = 4 Weeks
	replace e12_genset_shared_exp_monthly = 2*e12_genset_shared_exp_amount if e12_genset_shared_exp_unit==2 // 1 Month = 2 Fortnights

	generate e9_genset_exp_monthly = e9_genset_exp_rupee
	label variable e9_genset_exp_monthly "Private genset monthly expenditure in Rs"	
	replace e9_genset_exp_monthly = e9_diesel_cost*e9_genset_exp_litre if e9_genset_exp==2 // Rupee/Month = Diesel Cost * Liter/Month
	
	generate e49_franchise_pss_distance_val_m = e49_franchise_pss_distance_val
	label variable e49_franchise_pss_distance_val_m "Distance travelled to reach PSS/Franchisee office in metre"	
	replace e49_franchise_pss_distance_val_m = 1000*e49_franchise_pss_distance_val if e49_franchise_pss_distance_unit == 2 // 1 KM = 1000 Metres
	
	generate e50_franchise_pss_time_value_min = e50_franchise_pss_time_value
	label variable e50_franchise_pss_time_value_min "Time taken to reach PSS/Franchisee office in minutes"	
	replace e50_franchise_pss_time_value_min = 60*e50_franchise_pss_time_value if e50_franchise_pss_time_unit == 2 // 1 Hour = 60 Minutes

	generate i11_org_meet_duration_day = i11_org_meet_duration
	label variable i11_org_meet_duration_day "Interval of organisation meetup in number of days"	
	replace i11_org_meet_duration_day = 30*i11_org_meet_duration if i11_org_meet_unit == 2 // 1 Month = 30 Days
	replace i11_org_meet_duration_day = 365*i11_org_meet_duration if i11_org_meet_unit == 3	// 1 Year = 365 Days
	
	generate i13_neighbor_interact_time_day = i13_neighbor_interact_time
	label variable i13_neighbor_interact_time_day "Interval of neighbourhood interaction in number of days"	
	replace i13_neighbor_interact_time_day = 30*i13_neighbor_interact_time if i13_neighbor_interact_unit == 2 // 1 Month = 30 Days
	replace i13_neighbor_interact_time_day = 365*i13_neighbor_interact_time if i13_neighbor_interact_unit == 3	// 1 Year = 365 Days


* DROPPING ASSOCIATED VARIABLES AFTER STANDARDIZATION AND KEEPING ONLY STANDARDIZED VARIABLE

	drop b5_house_area_unit b5_house_area_unit_other b5_house_area_value
	drop b7_building_area_unit b7_building_area_unit_other b7_building_area_value
	drop b10_land_extra_unit b10_land_extra_unit_other b10_land_extra_value
	drop e6_genset_capacity e6_genset_unit
	drop e12_genset_shared_exp_amount e12_genset_shared_exp_unit
	//drop e9_genset_exp_rupee e9_genset_exp_litre e9_diesel_cost
	drop e49_franchise_pss_distance_val e49_franchise_pss_distance_unit
	drop e50_franchise_pss_time_value e50_franchise_pss_time_unit
	drop i11_org_meet_duration i11_org_meet_unit
	drop i13_neighbor_interact_time i13_neighbor_interact_unit

