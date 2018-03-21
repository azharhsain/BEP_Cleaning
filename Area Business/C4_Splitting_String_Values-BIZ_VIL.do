/********************************************************************
Project: BEP

Purpose: Baseline area business survey data string value splitting

Author:  Azhar Hussain

Date  :  15 April, 2015
*********************************************************************/



* INCLUDING MACROS

	include locals_biz.do

	
* SPLITTING STRING RESPPONSES OF MULTIPLE CHOICE QUESTIONS INTO SEPARATE BINARY RESPEONSES

	//// Section - C [Information about physical assets owned by the business]
	local i 1
	foreach z in retail service workshop retailservice retailworkshop serviceworkshop retailserviceworkshop {
		local j 101
		local k 201
		replace c`i'_`z'_asset = subinstr(c`i'_`z'_asset,"-102",".a",.)
		replace c`i'_`z'_asset = subinstr(c`i'_`z'_asset,"-101",".b",.)
		replace c`i'_`z'_asset = subinstr(c`i'_`z'_asset,"-103",".c",.)
		replace c`i'_`z'_asset = subinstr(c`i'_`z'_asset,"-104",".d",.)
		foreach a in `nonelec_equip_woth' {
			capture generate c`i'_`a'_have= regexm(c`i'_`z'_asset, "`j'")
			local j = `j'+1
		}
		foreach b in `elec_equip_woth' {
			capture generate c`i'_`b'_have= regexm(c`i'_`z'_asset, "`k'")
			local k = `k'+1
		}
		capture generate c`i'_other_have= regexm(c`i'_`z'_asset, ".a")
		local i = `i'+1
	}
	local l 301
	local m 401
	replace c9_furniture_asset = subinstr(c9_furniture_asset,"-102",".a",.)
	replace c9_furniture_asset = subinstr(c9_furniture_asset,"-101",".b",.)
	replace c9_furniture_asset = subinstr(c9_furniture_asset,"-103",".c",.)
	replace c9_furniture_asset = subinstr(c9_furniture_asset,"-104",".d",.)
	replace c8_vehicle_asset = subinstr(c8_vehicle_asset,"-102",".a",.)
	replace c8_vehicle_asset = subinstr(c8_vehicle_asset,"-101",".b",.)
	replace c8_vehicle_asset = subinstr(c8_vehicle_asset,"-103",".c",.)
	replace c8_vehicle_asset = subinstr(c8_vehicle_asset,"-104",".d",.)
	foreach c in `furniture_woth' {
		capture generate c9_`c'_have= regexm(c9_furniture_asset, "`l'")
		local l = `l'+1
	}
	foreach d in `vehicle_woth' {
		capture generate c8_`d'_have= regexm(c8_vehicle_asset, "`m'")
		local m = `m'+1
	}
	capture generate c9_other_have= regexm(c9_furniture_asset, ".a")
	capture generate c8_other_have= regexm(c8_vehicle_asset, ".a")
	
	//// Section - D [Information about inventory maintained by the business]
	local i 1
	foreach z in retail service workshop retailservice retailworkshop serviceworkshop retservwork {
		local j 111
		replace d`i'_`z'_inventory = subinstr(d`i'_`z'_inventory,"-102",".a",.)
		replace d`i'_`z'_inventory = subinstr(d`i'_`z'_inventory,"-101",".b",.)
		replace d`i'_`z'_inventory = subinstr(d`i'_`z'_inventory,"-103",".c",.)
		replace d`i'_`z'_inventory = subinstr(d`i'_`z'_inventory,"-104",".d",.)	
		foreach m in `inventory_woth' {
			capture generate d`i'_`m'_have= regexm(d`i'_`z'_inventory, "`j'")
			local j = `j'+1
		}
		capture generate d`i'_other_have= regexm(d`i'_`z'_inventory, ".a")
		local i = `i'+1
	}
	
	//// Section - E [Information about energy consumption by the business]
	local i 1
	replace e3_noelec_reason = subinstr(e3_noelec_reason,"-102",".a",.)
	replace e3_noelec_reason = subinstr(e3_noelec_reason,"-101",".b",.)
	replace e3_noelec_reason = subinstr(e3_noelec_reason,"-103",".c",.)
	replace e3_noelec_reason = subinstr(e3_noelec_reason,"-104",".d",.)
	foreach z in `no_elec_reason_woth' {
		capture generate e3_noelec_`z'= regexm(e3_noelec_reason, "`i'")
		local i = `i'+1
	}
	capture generate e3_noelec_other= regexm(e3_noelec_reason, ".a")
	
	local i 1
	replace e4_elec_source = subinstr(e4_elec_source,"-102",".a",.)
	replace e4_elec_source = subinstr(e4_elec_source,"-101",".b",.)
	replace e4_elec_source = subinstr(e4_elec_source,"-103",".c",.)
	replace e4_elec_source = subinstr(e4_elec_source,"-104",".d",.)
	foreach z in `affordable_elec_src_woth' {
		capture generate e4_elec_source_`z'= regexm(e4_elec_source, "`i'")
		local i = `i'+1
	}
	capture generate e4_elec_source_other= regexm(e4_elec_source, ".a")
	
	//// Section - F [Information about electricity supply situation]	
	local i 1
	replace f4_elec_supply_factor = subinstr(f4_elec_supply_factor,"-102",".a",.)
	replace f4_elec_supply_factor = subinstr(f4_elec_supply_factor,"-101",".b",.)
	replace f4_elec_supply_factor = subinstr(f4_elec_supply_factor,"-103",".c",.)
	replace f4_elec_supply_factor = subinstr(f4_elec_supply_factor,"-104",".d",.)
	foreach z in `elec_supply_factor_woth' {
		capture generate f4_elec_supply_`z'= regexm(f4_elec_supply_factor, "`i'")
		local i = `i'+1
	}
	capture generate f4_elec_supply_other= regexm(f4_elec_supply_factor, ".a")
	
	local i 1	
	replace f7_neighbour_hour_change_reason = subinstr(f7_neighbour_hour_change_reason,"-102",".a",.)
	replace f7_neighbour_hour_change_reason = subinstr(f7_neighbour_hour_change_reason,"-101",".b",.)
	replace f7_neighbour_hour_change_reason = subinstr(f7_neighbour_hour_change_reason,"-103",".c",.)
	replace f7_neighbour_hour_change_reason = subinstr(f7_neighbour_hour_change_reason,"-104",".d",.)
	foreach z in `elec_supply_factor_woth' {
		capture generate f7_neigh_hr_`z'= regexm(f7_neighbour_hour_change_reason, "`i'")
		local i = `i'+1
	}
	capture generate f7_neigh_hr_other= regexm(f7_neighbour_hour_change_reason, ".a")
	
	local i 1
	replace f9_maintenance_complaint_reason = subinstr(f9_maintenance_complaint_reason,"-102",".a",.)
	replace f9_maintenance_complaint_reason = subinstr(f9_maintenance_complaint_reason,"-101",".b",.)
	replace f9_maintenance_complaint_reason = subinstr(f9_maintenance_complaint_reason,"-103",".c",.)
	replace f9_maintenance_complaint_reason = subinstr(f9_maintenance_complaint_reason,"-104",".d",.)
	foreach z in `maintenance_complaint_woth' {
		capture generate f9_maintenance_`z'= regexm(f9_maintenance_complaint_reason, "`i'")
		local i = `i'+1
	}
	capture generate f9_maintenance_other= regexm(f9_maintenance_complaint_reason, ".a")
	
	//// Section - H [Interviewer’s Notes]
	local i 1
	foreach z in `people' {
		capture generate h6_other_people_`z'= regexm(h6_other_people, "`i'")
		local i = `i'+1
	}
	