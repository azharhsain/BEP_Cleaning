/*****************************************************************************************
*Project: BEP

*Purpose: Baseline market business survey data checking outliers and dropping or changeing observations 

*Author:  Kyle Onda

*Date  :  13 July, 2015
******************************************************************************************/



* OPENING COMMANDS:

	clear
	set more off
	pause on
	version 12.0

	

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
	
	
****SECTION A, E, F*****

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
	
	/*
	foreach var in `outlier_var' {
		histogram `var', freq
		graph export "`var'.png", replace
	}*/	

	
****SECTION B******
	foreach i1 of numlist 1/28 {
		//Assigning missing value to total monthly wage if it is greater than Rs 15,000
		*histogram b1_tot_wages`i1', freq
		*graph export "b1_tot_wages`i1'.png", replace
		replace b1_tot_wages`i1'=.z if b1_tot_wages`i1'>15000
		replace b1_man_days`i1'=.z if b1_tot_wages`i1'>15000
		
	}
	foreach i2 of numlist 1/10 {
		*histogram b2_tot_wages`i2', freq
		*graph export "b2_tot_wages`i2'.png", replace
		replace b2_tot_wages`i2'=.z if b2_tot_wages`i2'>15000
		replace b2_man_days`i2'=.z if b2_tot_wages`i2'>15000
	}
	foreach i3 of numlist 1/2 {
		*histogram b3_tot_wages`i3', freq
		*graph export "b3_tot_wages`i3'.png", replace
		replace b3_tot_wages`i3'=.z if b3_tot_wages`i3'>15000
		replace b3_man_days`i3'=.z if b3_tot_wages`i3'>15000
		
	}
	foreach i4 of numlist 1/1 {
		*histogram b4_tot_wages`i4', freq
		*graph export "b4_tot_wages`i4'.png", replace
		replace b4_tot_wages`i4'=.z if b4_tot_wages`i4'>15000
		replace b4_man_days`i4'=.z if b4_tot_wages`i4'>15000
	}
	foreach i5 of numlist 1/12 {
		*histogram b5_tot_wages`i5', freq
		*graph export "b5_tot_wages`i5'.png", replace
		replace b5_tot_wages`i5'=.z if b5_tot_wages`i5'>15000
		replace b5_man_days`i5'=.z if b5_tot_wages`i5'>15000
	}
	foreach i6 of numlist 1/2 {
		*histogram b6_tot_wages`i6', freq
		*graph export "b6_tot_wages`i6'.png", replace
		replace b6_tot_wages`i6'=.z if b6_tot_wages`i6'>15000
		replace b6_man_days`i6'=.z if b6_tot_wages`i6'>15000
	}
	

***SECTION G*****	
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

	
	

	
***SECION C*****


* LOOP THE FOLLOWING STEPS
* 1. Generate a row total of the number and total resale value of assets over sections c1-c9
* 2. Generate variable for average value of each asset (rowtotal resale value/ rowtotal number owned)
* 3. Generate scatter plots for each asset (average resale value vs. number owned) for each business type


	

	local assets airconditioner aircooler autotool battery bicycletool blacksmithtool ///
	bottlemachine bulb cage calculator camera cardswipe carpentarytool cfl clock coldstorage crate cuttingtool ///
	desktop drill elecgrill elecmill elecpurifier elecsaw electrictool elecweight emerlight fan genset gascooker ///
	gascylinder glasscontainer grinder grindingequip hairdress hairdrier insectcatcher ///
	inverter lamp kiosk laptop led measuretape medicalequip metalcontainer metalware mirror noneleciron ///
	motor nutcracker oven photostat plasticcontainer plasticware polishmachine pump printer purifier radio ///
	refrigerator roomheater scanner sewing shoetool shovel soundsys stabilizer stove television torch tubelight ///
	tyre utensil weight weldingequip woodcontainer autorickshaw barrow bike car cart cycle lorry pedalrickshaw ///
	tractor van almirah bed bench chair counter desk dresstable shelve showcase sofa stool woodbox woodshop

	outsheet _district_id _feeder_id _business_id using biz_outliers_c.csv if _business_id==1600 , comma replace
	set graphics off

	foreach x of local assets{
		qui egen c_`x'_own=rowtotal(*_`x'_own)
		qui gen c_`x'_zerodum=(c_`x'_own==0)
		
		qui replace c_`x'_own=. if c_`x'_zerodum==1
		qui egen c_`x'_sale=rowtotal(c**_`x'_sale), missing
		qui replace c_`x'_sale=. if c_`x'_sale==0
		
		gen c_`x'_AV=c_`x'_sale/c_`x'_own
		egen nmiss=rownonmiss(c_`x'_AV)

		gen ln_c_`x'_AV=log(c_`x'_AV) if sum(nmiss)>0
		*set graphics off
		*dotplot ln_c_`x'_AV if sum(nmiss)>0
		*capture graph export ln_c_`x'_AV.eps, replace
		

		
		*scatter c_`x'_AV c_`x'_own, by(_retail_type) ylabel(,labsize(vsmall))
		*capture graph export `x'_scatter_retail.eps,  replace
		
		*scatter c_`x'_AV c_`x'_own, by(_workshop_type) ylabel(,labsize(vsmall))
		*capture graph export `x'_scatter_workshop.eps, replace
		
		*scatter c_`x'_AV c_`x'_own, by(_service_type) ylabel(,labsize(vsmall))
		*capture graph export `x'_scatter_service.eps,  replace
		
		
		drop nmiss
		}

		

		
	
*******
*Set outliers to missing based on visual inspection, graphics in file 
*"`DROPBOX_ROOT'/Data/Survey/Baseline/Output/Outlier-BIZ_MRKT/C_outliers.pdf
*Outliers coded in same directory, file BIZ-MARKET_C_OUTLIERS.xlsc

	local y own sale AV
	foreach x of local y{
		//set to missing if average air conditioner value less than 1000
		replace c_airconditioner_`x'=.z if c_airconditioner_AV<=1000
		//set to missing if Mills have more than 20 and restaurants and tea stalls have more than 25 bicycle tools
		replace c_bicycletool_`x'=.z if (_workshop_type==301 & c_bicycletool_own>=20) | (_service_type==213 & c_bicycletool_own>=25)
		//set to missing if average value of blacksmith tool is more than 50000 or if Dry Cleaner has more than 15 
		replace c_blacksmithtool_`x'=.z if c_blacksmithtool_AV>=50000 | (_service_type==203 & c_blacksmithtool_own>=15)
		//set to missing if metal workshop has a bottlemachine with average resale value >=50000
		replace c_bottlemachine_`x'=.z if _workshop_type==302 & c_bottlemachine_AV>=50000
		//set to missing if carpentry tool has average value >6000
		replace c_carpentarytool_`x'=.z if c_carpentarytool_AV>6000
		//set to missing if crate has average value greater >=8000
		replace c_crate_`x'=.z if c_crate_AV>=8000
		//set to missing if shoe store has cutting tool with average value >=8000 or wood workshop has cutting tool greater than 100000
		replace c_cuttingtool_`x'=.z if (_retail_type==106 & c_cuttingtool_AV>=8000) | (_workshop_type==303 & c_cuttingtool_AV>=100000)
		//set to missing if desktop average value <=5000
		replace c_desktop_`x'=.z if c_desktop_AV<=5000
		//set to missing if electric grill average value >=10000
		replace c_elecgrill_`x'=.z if c_elecgrill_AV>=10000
		//set to missing if electric saw average value >= 10000
		replace c_elecsaw_`x'=.z if c_elecsaw_AV>=10000
		//set to missing if elecweight average value >= 10000
		replace c_elecweight_`x'=.z if c_elecweight_AV>=10000
		//set to missing if fan average value>=5000 or <=100  or if tent shop has more than 250
		replace c_fan_`x'=.z if c_fan_AV>=5000 
		//set to missing if tent shop has more than 250 or if average  value <=1000
		replace c_genset_`x'=.z if c_genset_AV<=1000 | (_service_type==218 & c_genset_own>=250)
		//set to missing if gascylnfer has average value <=5000
		replace c_gascylinder_`x'=.z if c_gascylinder_AV<=5000
		//set to missing if wholesale grain has more than 60 lamps
		replace c_lamp_`x'=.z if _retail_type==103 & c_lamp_own>=60
		//set to missing is kiosk ownerd >=6
		replace c_kiosk_`x'=.z if c_kiosk_own>=6
		//set to missing if laptop average value <=2000
		replace c_laptop_`x'=.z if c_laptop_AV<=2000
		//set to missing if measure has averagevalue >=500
		replace c_measuretape_`x'=.z if c_measuretape_AV>=500
		//set to missing if average value of medical equipment in a watch shop >=5000
		replace c_medicalequip_`x'=.z if c_medicalequip_AV>=5000 & _retail_type==127
		//set to missing if nutcracker average value >=20000
		replace c_nutcracker_`x'=.z if c_nutcracker_AV>=20000
		//set to missing if oven if average value is <1000 or >= 20000
		replace c_oven_`x'=.z if c_oven_AV<1000 | c_oven_AV >=20000
		//set to missing if polish machine owned > 50
		replace c_polishmachine_`x'=.z if c_polishmachine_own>50
		//set to missing if scanner if average value >=30000
		replace c_scanner_`x'=.z if c_scanner_AV>=30000
		//set to missing if average value sewing is greater than 5000 for auto repair shop
		replace c_sewing_`x'=.z if c_sewing_AV>=5000 & _service_type==211
		// set to missing if number owned is greater than 100 for general store or tent shop
		replace c_soundsys_`x'=.z if c_soundsys_own>=100 & (_retail_type==102 | _service_type==218)
		//set to missing if stabilizer AV >=8000
		replace c_stabilizer_`x'=.z if c_stabilizer_AV>=8000
		//set to missing if stove number >= 500 and biz type is tent shop
		replace c_stove_`x'=.z if c_stove_own>=500 & _service_type==218
		//set to missing if is a bag/box shop and AV>3000 or is a bicycle repair shop and number is >5000
		replace c_tyre_`x'=.z if (_retail_type==121 & c_tyre_AV>=3000) | (_retail_type==218 & c_tyre_own>=5000)
		//set to missing id utensil average value >=5000
		replace c_utensil_`x'=.z if c_utensil_AV>=5000
		//set to missing if dry cleaner has welding equip AV >1000
		replace c_weldingequip_`x'=.z if _service_type==203 & c_weldingequip_AV>1000
		//set to missing if barrow average value >=6000
		replace c_barrow_`x'=.z if c_barrow_AV>=6000
		//set to missing if bike average value >=60000
		replace c_bike_`x'=.z if c_bike_AV>=60000
		//set to missing if car average value >=500000
		replace c_car_`x'=.z if c_car_AV>=500000
		//set to missing if tractor average value >=500000
		replace c_tractor_`x'=.z if c_tractor_AV >=500000
		//set to missing if van average value <=15000
		replace c_van_`x'=.z if c_van_AV<=15000
		//set to missing if almirah average value>=50000
		replace c_almirah_`x'=.z if c_almirah_AV >=50000
		//set to missing if bed average value >=15000
		replace c_bed_`x'=.z if c_bed_AV >=15000
		//set to missing if bench average value >=5000
		replace c_bench_`x'=.z if c_bench_AV>=5000
		//set to missing if counter count >5
		replace c_counter_`x'=.z if c_counter_own>=5
		//set to missing if chair average value >5000
		replace c_chair_`x'=.z if c_chair_AV >=5000
		//set to missing if showcase count >=16
		replace c_showcase_`x'=.z if c_showcase_own >=16
		//set to missing if shelve average value>=10000 or count >=16
		replace c_shelve_`x'=.z if c_shelve_AV>=10000 | c_shelve_own >=16
		//set to missing if woodbox average balue >=10000 or count >15
		replace c_woodbox_`x'=.z if c_woodbox_AV >=10000 | c_woodbox_own >=15
		//set to missing if woodshop count >3
		replace c_woodshop_`x'=.z if c_woodshop_own >=3
	}



	foreach x of local assets{
		foreach i of numlist 1/7{
		capture confirm variable c`i'_`x'_own
				if  _rc!=0{
					display "no variable"
		} 
		else {
		replace c`i'_`x'_own=.z if c_`x'_own==.z 
		replace c`i'_`x'_sale=.z if c_`x'_own==.z 
			}
		}
	}



***********SECTION D******************	

* LOOP THE FOLLOWING STEPS
* 1. Generate a row total resale value of assets over sections d1-d7
* 2. Generate lognormal quantile plots for each aggregated resale value
* 3. Generate boxplots by business type for each aggregated resale value
	
	
		
	local inventory agrimaterial alcohol automobile beetel_tobacco chemical cigarette coal cotton constructmaterial ///
	 perish_refrigerated perish_nonrefrigerated snack_refrigerated snack_nonrefrigerated meat_refrigerated meat_nonrefrigerated ///
	 garment hardware house_decor jewel optical processedgrain stationery  tailormaterial tyre_tube woodproduct worshipmaterial ///
		dairy_refrigerated dairy_nonrefrigerated spice food cosmetic medicine shoe polythene paper packingmaterial ///
		grain wood metal  metalproduct salefuel productionfuel utensil wastematerial ///
		elec_item mobile toy 
		
		
	foreach x of local inventory{
			egen d_`x'_val=rowtotal(d**_`x'_val)
			replace d_`x'_val=.z if d_`x'_val==0
			if sum(d_`x'_val)>=. {
					display "no variable"
				
				
			}
			else  {
	/*
			qui qlognorm (d`i'_`x'_val)
			qui graph export qplot_d`i'_`x'_val.png, replace
			
			graph box d`i'_`x'_val, over(_retail_type, label(labsize(tiny))) nofill 
			qui graph export d_`x'_val_retail.png, replace
			
			graph box d`i'_`x'_val, over(_service_type, label(labsize(tiny))) nofill 
			qui graph export d_`x'_val_service.png, replace
			
			graph box d`i'_`x'_val, over(_workshop_type, label(labsize(tiny))) nofill
			qui graph export d_`x'_val_workshop.png, replace
	*/
		}
	}



//SET APPROPRIATE OUTLIERS TO MISSING. Refer to D_MKT_BIZ_BOXPLOTS.pdf and qplots-D-MKT-BIZ.pdf (lognormal distribution check) in output.
		
	//Set to missing if agrimatrial value >=500000
	foreach i of numlist 1/7{
		capture confirm variable d`i'_agrimaterial_val
		
		if _rc!=0{
		display "no variable"
		} 
		else {

		replace d`i'_agrimaterial_val=.y if d`i'_agrimaterial_val==0
		replace d`i'_agrimaterial_val=.z if d`i'_agrimaterial_val>=500000
		}
	}



	//set to missing if alcohol value over 300000
	foreach i of numlist 1/7{
		capture confirm variable d`i'_alcohol_val
		
		if _rc!=0{
		display "no variable"
		} 
		else {

		replace d`i'_alcohol_val=.y if d`i'_alcohol_val==0
		replace d`i'_alcohol_val=.z if d`i'_alcohol_val>300000
		}
	}

	//set to missing if automobile value Lless than 1000
	foreach i of numlist 1/7{
		capture confirm variable d`i'_automobile_val
		
		if _rc!=0{
		display "no variable"
		} 
		else {

		replace d`i'_automobile_val=.y if d`i'_automobile_val==0
		replace d`i'_automobile_val=.z if d`i'_automobile_val<=1000
		}
	}

	//set to missing if chemical value greater than 100000

	foreach i of numlist 1/7{
		capture confirm variable d`i'_chemical_val
		
		if _rc!=0{
		display "no variable"
		} 
		else {

		replace d`i'_chemical_val=.y if d`i'_chemical_val==0
		replace d`i'_chemical_val=.z if d`i'_chemical_val>=100000
		}
	}


	//set to missing if construction material greater than 500000

	foreach i of numlist 1/7{
		capture confirm variable d`i'_constructmaterial_val
		
		if _rc!=0{
		display "no variable"
		} 
		else {

		replace d`i'_constructmaterial_val=.y if d`i'_constructmaterial_val==0
		replace d`i'_constructmaterial_val=.z if d`i'_constructmaterial_val>=500000
		}
	}

	//set to missing if norefrigerated perishables greater than 100000

	foreach i of numlist 1/7{
		capture confirm variable d`i'_perish_nonrefrigerated_val
		
		if _rc!=0{
		display "no variable"
		} 
		else {

		replace d`i'_perish_nonrefrigerated_val=.y if d`i'_perish_nonrefrigerated_val==0
		replace d`i'_perish_nonrefrigerated_val=.z if d`i'_perish_nonrefrigerated_val>=100000
		}
	}

	//set to missing if norefrigerated snacks greater than 100000

	foreach i of numlist 1/7{
		capture confirm variable d`i'_snack_nonrefrigerated_val
		
		if _rc!=0{
		display "no variable"
		} 
		else {

		replace d`i'_snack_nonrefrigerated_val=.y if d`i'_snack_nonrefrigerated_val==0
		replace d`i'_snack_nonrefrigerated_val=.z if d`i'_snack_nonrefrigerated_val>=100000
		}
	}

	//set to missing if garment greater than 5000000
	foreach i of numlist 1/7{
		capture confirm variable d`i'_garment_val
		
		if _rc!=0{
		display "no variable"
		} 
		else {

		replace d`i'_garment_val=.y if d`i'_garment_val==0
		replace d`i'_garment_val=.z if d`i'_garment_val>=5000000
		}
	}

	//set to missing if hardware greater than 400000
	foreach i of numlist 1/7{
		capture confirm variable d`i'_hardware_val
		
		if _rc!=0{
		display "no variable"
		} 
		else {

		replace d`i'_hardware_val=.y if d`i'_hardware_val==0
		replace d`i'_hardware_val=.z if d`i'_hardware_val>=400000
		}
	}


	//set to missing if jewel greater than 100000 and is kitchen utensil shop
	foreach i of numlist 1/7{
		capture confirm variable d`i'_jewel_val
		
		if _rc!=0{
		display "no variable"
		} 
		else {

		replace d`i'_jewel_val=.y if d`i'_jewel_val==0
		replace d`i'_jewel_val=.z if d`i'_jewel_val>=100000 & _retail_type==115
		}
	}

	//set to missing if stationary greater than 200000
	foreach i of numlist 1/7{
		capture confirm variable d`i'_stationary_val
		
		if _rc!=0{
		display "no variable"
		} 
		else {

		replace d`i'_stationary_val=.y if d`i'_stationary_val==0
		replace d`i'_stationary_val=.z if d`i'_stationary_val>=200000
		}
	}

	//set to missing if woodproduct greater than 1000000
	foreach i of numlist 1/7{
		capture confirm variable d`i'_woodproduct_val
		
		if _rc!=0{
		display "no variable"
		} 
		else {

		replace d`i'_woodproduct_val=.y if d`i'_woodproduct_val==0
		replace d`i'_woodproduct_val=.z if d`i'_woodproduct_val>=1000000
		}
	}



	//set to missing if spice greater than 40000
	foreach i of numlist 1/7{
		capture confirm variable d`i'_spice_val
		
		if _rc!=0{
		display "no variable"
		} 
		else {

		replace d`i'_spice_val=.y if d`i'_spice_val==0
		replace d`i'_spice_val=.z if d`i'_spice_val>=40000
		}
	}


	//set to missing if cosmetic greater than 300000
	foreach i of numlist 1/7{
		capture confirm variable d`i'_cosmetic_val
		
		if _rc!=0{
		display "no variable"
		} 
		else {

		replace d`i'_cosmetic_val=.y if d`i'_cosmetic_val==0
		replace d`i'_cosmetic_val=.z if d`i'_cosmetic_val>=300000
		}
	}

	//set to missing if grain greater than 400000
	foreach i of numlist 1/7{
		capture confirm variable d`i'_grain_val
		
		if _rc!=0{
		display "no variable"
		} 
		else {

		replace d`i'_grain_val=.y if d`i'_grain_val==0
		replace d`i'_grain_val=.z if d`i'_grain_val>=400000
		}
	}

	//set to missing if metal greater than 1000000
	foreach i of numlist 1/7{
		capture confirm variable d`i'_metal_val
		
		if _rc!=0{
		display "no variable"
		} 
		else {

		replace d`i'_metal_val=.y if d`i'_metal_val==0
		replace d`i'_metal_val=.z if d`i'_metal_val>=1000000
		}

		
	//set to missing if salefuel greater than 200000
	foreach i of numlist 1/7{
		capture confirm variable d`i'_salefuel_val
		
		if _rc!=0{
		display "no variable"
		} 
		else {

		replace d`i'_salefuel_val=.y if d`i'_salefuel_val==0
		replace d`i'_salefuel_val=.z if d`i'_salefuel_val>=200000
		}
	}


	//set to missing if elec item greater than 4000000
	foreach i of numlist 1/7{
		capture confirm variable d`i'_elecitem_val
		
		if _rc!=0{
		display "no variable"
		} 
		else {

		replace d`i'_elecitem_val=.y if d`i'_elecitem_val==0
		replace d`i'_elecitem_val=.z if d`i'_elecitem_val>=4000000
		}
	}





set graphics on
	
* SAVING CLEANED DATA

	cd "`WORKING_DATA'"
	save CUMULATIVE_BIZ_MRKT_RECONCILED_18JULY2015_CLEANED, replace


