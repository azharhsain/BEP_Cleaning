/******************************************************************
Project: BEP

Purpose: Baseline area business survey data unit standardization

Author:  Azhar Hussain

Date  :  12 April, 2015
*******************************************************************/



* CONVERTING UNITS FOR STANDARDIZATION

	generate a6_land_size_sqft = a6_land_size
	replace a6_land_size_sqft=182.2*a6_land_size if a6_land_unit==1 //1 Dhoor = 182.2 Square Feet
	replace a6_land_size_sqft=3638.2*a6_land_size if a6_land_unit==2 //1 Kattha = 3638.2 Square Feet
	replace a6_land_size_sqft=9*a6_land_size if a6_land_unit==3 //1 Gaz = 9 Square Feet
	replace a6_land_size_sqft=107639*a6_land_size if a6_land_unit==5 //1 Hectare = 107639 Square Feet
	
	generate a8_builtup_size_sqft = a8_builtup_size
	replace a8_builtup_size_sqft=182.2*a8_builtup_size if a8_builtup_unit==1 //1 Dhoor = 182.2 Square Feet
	replace a8_builtup_size_sqft=3638.2*a8_builtup_size if a8_builtup_unit==2 //1 Kattha = 3638.2 Square Feet
	replace a8_builtup_size_sqft=17452*a8_builtup_size if a8_builtup_unit==3 //1 Bigha = 17452 Square Feet
	replace a8_builtup_size_sqft=10.764*a8_builtup_size if a8_builtup_unit==5 //1 Square Meter = 10;764 Square Feet
	capture replace a8_builtup_size_sqft=43560*a8_builtup_size if a8_builtup_unit==6 //1 Acre = 43560 Square Feet
	capture replace a8_builtup_size_sqft=107639*a8_builtup_size if a8_builtup_unit==7 //1 Hectare = 107639 Square Feet
	
	generate e6_genset_capacity_kW = e6_genset_capacity
	replace e6_genset_capacity_kW=0.7457*e6_genset_capacity if e6_genset_unit==1 //1HP = 0.7457kW
	
	generate e12_genset_shared_exp_monthly = e12_genset_shared_exp_amount
	replace e12_genset_shared_exp_monthly=4*e12_genset_shared_exp_amount if e12_genset_shared_exp_unit==1
	replace e12_genset_shared_exp_monthly=2*e12_genset_shared_exp_amount if e12_genset_shared_exp_unit==2

	generate e9_genset_exp_monthly = e9_genset_exp_rupee
	replace e9_genset_exp_monthly = e9_diesel_cost*e9_genset_exp_litre if e9_genset_exp==2
	