/**************************************************************
Project: BEP

Purpose: Baseline household survey data string value splitting

Author:  Azhar Hussain

Date  :  18 April, 2015
***************************************************************/



* INCLUDING MACROS

	include locals_hh.do

	
* SPLITTING STRING RESPPONSES OF MULTIPLE CHOICE QUESTIONS INTO SEPARATE BINARY RESPEONSES

	//// Section - A [Information about family members of the household]
	foreach i of numlist 1/32 {
		replace a6_family_mem_occupation`i' = subinstr(a6_family_mem_occupation`i',"-102",".a",.)
		replace a6_family_mem_occupation`i' = subinstr(a6_family_mem_occupation`i',"-101",".b",.)
		replace a6_family_mem_occupation`i' = subinstr(a6_family_mem_occupation`i',"-103",".c",.)
		replace a6_family_mem_occupation`i' = subinstr(a6_family_mem_occupation`i',"-104",".d",.)
		local j 1
		foreach z in `occupation' {
			capture generate a6_mem`i'_occup_`z' = regexm(a6_family_mem_occupation`i', "`j'")
			local j = `j'+1
		}
		capture generate a6_mem`i'_occup_other = regexm(a6_family_mem_occupation`i', ".a")
	}

	//// Section - B [Information about house and other resources]
	local i 1
	replace b12_animals_list = subinstr(b12_animals_list,"-102",".a",.)
	replace b12_animals_list = subinstr(b12_animals_list,"-101",".b",.)
	replace b12_animals_list = subinstr(b12_animals_list,"-103",".c",.)
	replace b12_animals_list = subinstr(b12_animals_list,"-104",".d",.)
	foreach z in `animal_woth' {
		capture generate b12_`z'_have = regexm(b12_animals_list, "`i'")
		local i = `i'+1
	}
	capture generate b12_other_have = regexm(b12_animals_list, ".a")
	
	//// Section - C [Information about household assets]
	//Cooking asset
	local i 1
	replace c1_cooking_asset = subinstr(c1_cooking_asset,"-102",".a",.)
	replace c1_cooking_asset = subinstr(c1_cooking_asset,"-88",".b",.)
	foreach a in `cooking_asset_woth' {
		capture generate c1_`a'_have= regexm(c1_cooking_asset, "`i'")
		local i = `i'+1
	}
	capture generate c1_other_have = regexm(c1_cooking_asset, ".a")
	capture generate c1_none_have = regexm(c1_cooking_asset, ".b")	

	//Entertainment asset
	local i 10
	replace c2_entertainment_asset = subinstr(c2_entertainment_asset,"-102",".a",.)
	replace c2_entertainment_asset = subinstr(c2_entertainment_asset,"-88",".b",.)
	foreach a in `entertainment_asset_woth' {
		capture generate c2_`a'_have= regexm(c2_entertainment_asset, "`i'")
		local i = `i'+1
	}
	capture generate c2_other_have = regexm(c2_entertainment_asset, ".a")
	capture generate c2_none_have = regexm(c2_entertainment_asset, ".b")
	
	//Appliance asset
	local i 15
	replace c3_appliance_asset = subinstr(c3_appliance_asset,"-102",".a",.)
	replace c3_appliance_asset = subinstr(c3_appliance_asset,"-88",".b",.)
	foreach a in `appliance_asset_woth' {
		capture generate c3_`a'_have= regexm(c3_appliance_asset, "`i'")
		local i = `i'+1
	}
	capture generate c3_other_have = regexm(c3_appliance_asset, ".a")
	capture generate c3_none_have = regexm(c3_appliance_asset, ".b")
	
	//Transport asset
	local i 31
	replace c4_transport_asset = subinstr(c4_transport_asset,"-102",".a",.)
	replace c4_transport_asset = subinstr(c4_transport_asset,"-88",".b",.)
	foreach a in `transport_asset_woth' {
		capture generate c4_`a'_have= regexm(c4_transport_asset, "`i'")
		local i = `i'+1
	}
	capture generate c4_other_have = regexm(c4_transport_asset, ".a")
	capture generate c4_none_have = regexm(c4_transport_asset, ".b")
	
	//Transport asset
	local i 36
	replace c5_miscellaneous_asset = subinstr(c5_miscellaneous_asset,"-102",".a",.)
	replace c5_miscellaneous_asset = subinstr(c5_miscellaneous_asset,"-88",".b",.)
	foreach a in `miscellaneous_asset_woth' {
		capture generate c5_`a'_have= regexm(c5_miscellaneous_asset, "`i'")
		local i = `i'+1
	}
	capture generate c5_other_have = regexm(c5_miscellaneous_asset, ".a")
	capture generate c5_none_have = regexm(c5_miscellaneous_asset, ".b")
	
	
	//// Section - D [Information about the family]
	local i 1
	replace d2_social_cat = subinstr(d2_social_cat,"-102",".a",.)
	replace d2_social_cat = subinstr(d2_social_cat,"-101",".b",.)
	replace d2_social_cat = subinstr(d2_social_cat,"-103",".c",.)
	replace d2_social_cat = subinstr(d2_social_cat,"-104",".d",.)
	foreach z in `social_cat_woth' {
		capture generate d2_soc_cat_`z' = regexm(d2_social_cat, "`i'")
		local i = `i'+1
	}
	capture generate d2_soc_cat_other = regexm(d2_social_cat, ".a")
	local i 1
	replace d3a_hindu_caste = subinstr(d3a_hindu_caste,"-102",".a",.)
	replace d3a_hindu_caste = subinstr(d3a_hindu_caste,"-101",".b",.)
	replace d3a_hindu_caste = subinstr(d3a_hindu_caste,"-103",".c",.)
	replace d3a_hindu_caste = subinstr(d3a_hindu_caste,"-104",".d",.)
	foreach z in `hindu_caste_woth' {
		capture generate d3a_hin_caste_`z' = regexm(d3a_hindu_caste, "`i'")
		local i = `i'+1
	}
	capture generate d3a_hin_caste_other = regexm(d3a_hindu_caste, ".a")
	local i 1
	replace d3b_muslim_caste = subinstr(d3b_muslim_caste,"-102",".a",.)
	replace d3b_muslim_caste = subinstr(d3b_muslim_caste,"-101",".b",.)
	replace d3b_muslim_caste = subinstr(d3b_muslim_caste,"-103",".c",.)
	replace d3b_muslim_caste = subinstr(d3b_muslim_caste,"-104",".d",.)
	foreach z in `muslim_caste_woth' {
		capture generate d3b_mus_caste_`z' = regexm(d3b_muslim_caste, "`i'")
		local i = `i'+1
	}
	capture generate d3b_mus_caste_other = regexm(d3b_muslim_caste, ".a")
	local i 1
	replace d5_bpl_card = subinstr(d5_bpl_card,"-102",".a",.)
	replace d5_bpl_card = subinstr(d5_bpl_card,"-101",".b",.)
	replace d5_bpl_card = subinstr(d5_bpl_card,"-103",".c",.)
	replace d5_bpl_card = subinstr(d5_bpl_card,"-104",".d",.)
	foreach z in `bpl_card' {
		capture generate d5_bpl_`z'_card_have = regexm(d5_bpl_card, "`i'")
		local i = `i'+1
	}
	
	
	//// Section - E [Inforation about electricity sources, metering and billing situation of the household]	
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
		capture generate e4_elec_src_`z'= regexm(e4_elec_source, "`i'")
		local i = `i'+1
	}
	capture generate e4_elec_src_other= regexm(e4_elec_source, ".a")
	local i 1
	replace e47_bill_pay_pss_type = subinstr(e47_bill_pay_pss_type,"-102",".a",.)
	replace e47_bill_pay_pss_type = subinstr(e47_bill_pay_pss_type,"-101",".b",.)
	replace e47_bill_pay_pss_type = subinstr(e47_bill_pay_pss_type,"-103",".c",.)
	replace e47_bill_pay_pss_type = subinstr(e47_bill_pay_pss_type,"-104",".d",.)
	replace e48_bill_pay_franchise_type = subinstr(e48_bill_pay_franchise_type,"-102",".a",.)
	replace e48_bill_pay_franchise_type = subinstr(e48_bill_pay_franchise_type,"-101",".b",.)
	replace e48_bill_pay_franchise_type = subinstr(e48_bill_pay_franchise_type,"-103",".c",.)
	replace e48_bill_pay_franchise_type = subinstr(e48_bill_pay_franchise_type,"-104",".d",.)
	foreach z in `pay_way_woth' {
		capture generate e47_pss_`z' = regexm(e47_bill_pay_pss_type, "`i'")
		capture generate e48_franchise_`z' = regexm(e48_bill_pay_franchise_type, "`i'")
		local i = `i'+1
	}
	capture generate e47_pss_other = regexm(e47_bill_pay_pss_type, ".a")
	capture generate e48_franchise_other = regexm(e48_bill_pay_franchise_type, ".a")
	
	
	//// Section - F [Information about electricity supply situation]	
	local i 0
	replace f16_elec_supply_factor = subinstr(f16_elec_supply_factor,"-102",".a",.)
	replace f16_elec_supply_factor = subinstr(f16_elec_supply_factor,"-101",".b",.)
	replace f16_elec_supply_factor = subinstr(f16_elec_supply_factor,"-103",".c",.)
	replace f16_elec_supply_factor = subinstr(f16_elec_supply_factor,"-104",".d",.)
	foreach z in `elec_supply_factor_woth' {
		capture generate f16_elec_supply_`z'= regexm(f16_elec_supply_factor, "`i'")
		local i = `i'+1
	}
	capture generate f16_elec_supply_other= regexm(f16_elec_supply_factor, ".a")
	local i 0
	replace f19_neighbour_hour_change_reason = subinstr(f19_neighbour_hour_change_reason,"-102",".a",.)
	replace f19_neighbour_hour_change_reason = subinstr(f19_neighbour_hour_change_reason,"-101",".b",.)
	replace f19_neighbour_hour_change_reason = subinstr(f19_neighbour_hour_change_reason,"-103",".c",.)
	replace f19_neighbour_hour_change_reason = subinstr(f19_neighbour_hour_change_reason,"-104",".d",.)
	foreach z in `elec_supply_factor_woth' {
		capture generate f19_neigh_hr_`z'= regexm(f19_neighbour_hour_change_reason, "`i'")
		local i = `i'+1
	}
	capture generate f19_neigh_hr_other= regexm(f19_neighbour_hour_change_reason, ".a")	
	local i 1	
	replace f21_maintenance_complaint_reason = subinstr(f21_maintenance_complaint_reason,"-102",".a",.)
	replace f21_maintenance_complaint_reason = subinstr(f21_maintenance_complaint_reason,"-101",".b",.)
	replace f21_maintenance_complaint_reason = subinstr(f21_maintenance_complaint_reason,"-103",".c",.)
	replace f21_maintenance_complaint_reason = subinstr(f21_maintenance_complaint_reason,"-104",".d",.)
	foreach z in `maintenance_complaint_woth' {
		capture generate f21_maintenance_`z'= regexm(f21_maintenance_complaint_reason, "`i'")
		local i = `i'+1
	}
	capture generate f21_maintenance_other= regexm(f21_maintenance_complaint_reason, ".a")
	local i 1
	replace f10_advertisement_source = subinstr(f10_advertisement_source,"-102",".a",.)
	replace f10_advertisement_source = subinstr(f10_advertisement_source,"-101",".b",.)
	replace f10_advertisement_source = subinstr(f10_advertisement_source,"-103",".c",.)
	replace f10_advertisement_source = subinstr(f10_advertisement_source,"-104",".d",.)
	foreach z in `adv_src_woth' {
		capture generate f10_adv_src_`z'= regexm(f10_advertisement_source, "`i'")
		local i = `i'+1
	}
	capture generate f10_adv_src_other= regexm(f10_advertisement_source, ".a")
	
	
	//// Section - G [Information about different energy sources used in the household]
	local i 1
	replace g1_alternate_energy_src_list = subinstr(g1_alternate_energy_src_list,"-88",".g",.)
	foreach z in `energy_source' {
		capture generate g1_`z'_use = regexm(g1_alternate_energy_src_list, "`i'")
		local i = `i'+1
	}

	
	//// Section - H [Information about apliances used in the household]
	
	foreach z in b k l t {
		local i 1
		replace h`z'7_appliance_plug_list = subinstr(h`z'7_appliance_plug_list,"-102",".a",.)
		replace h`z'7_appliance_plug_list = subinstr(h`z'7_appliance_plug_list,"-101",".b",.)
		replace h`z'7_appliance_plug_list = subinstr(h`z'7_appliance_plug_list,"-103",".c",.)
		replace h`z'7_appliance_plug_list = subinstr(h`z'7_appliance_plug_list,"-104",".d",.)
		replace h`z'8_appliance_unplug_list = subinstr(h`z'8_appliance_unplug_list,"-102",".a",.)
		replace h`z'8_appliance_unplug_list = subinstr(h`z'8_appliance_unplug_list,"-101",".b",.)
		replace h`z'8_appliance_unplug_list = subinstr(h`z'8_appliance_unplug_list,"-103",".c",.)
		replace h`z'8_appliance_unplug_list = subinstr(h`z'8_appliance_unplug_list,"-104",".d",.)
		foreach a in `appliance_long_woth' {
			capture generate h`z'7_`a'_have = regexm(h`z'7_appliance_plug_list, "`i'")
			capture generate h`z'8_`a'_have = regexm(h`z'8_appliance_unplug_list, "`i'")
			local i = `i'+1
		}
		capture generate h`z'7_other_have = regexm(h`z'7_appliance_plug_list, ".a")
		capture generate h`z'8_other_have = regexm(h`z'8_appliance_unplug_list, ".a")
	}
	
	
	//// Section - I [Information related to the neighborhood]
	local i 1
	foreach z in `local_politic' {
		capture generate i4_`z' = regexm(i4_local_politics_list, "`i'")
		local i = `i'+1
	}
	local i 1
	replace i16_power_theft_reason = subinstr(i16_power_theft_reason,"-102",".a",.)
	replace i16_power_theft_reason = subinstr(i16_power_theft_reason,"-101",".b",.)
	replace i16_power_theft_reason = subinstr(i16_power_theft_reason,"-103",".c",.)
	replace i16_power_theft_reason = subinstr(i16_power_theft_reason,"-104",".d",.)
	foreach z in `power_theft_reason_woth' {
		capture generate i16_`z' = regexm(i16_power_theft_reason, "`i'")
		local i = `i'+1
	}
	capture generate i16_other= regexm(i16_power_theft_reason, ".a")
	local i 1
	replace i17_power_theft_method = subinstr(i17_power_theft_method,"-102",".a",.)
	replace i17_power_theft_method = subinstr(i17_power_theft_method,"-101",".b",.)
	replace i17_power_theft_method = subinstr(i17_power_theft_method,"-103",".c",.)
	replace i17_power_theft_method = subinstr(i17_power_theft_method,"-104",".d",.)
	foreach z in `power_theft_method_woth' {
		capture generate i17_`z' = regexm(i17_power_theft_method, "`i'")
		local i = `i'+1
	}
	capture generate i17_other = regexm(i17_power_theft_method, ".a")
	
	
	//// Section - J [Information about income and expenditure of household]
	local i 1
	replace j1_expenditure_head_list = subinstr(j1_expenditure_head_list,"-102",".a",.)
	replace j1_expenditure_head_list = subinstr(j1_expenditure_head_list,"-101",".b",.)
	replace j1_expenditure_head_list = subinstr(j1_expenditure_head_list,"-103",".c",.)
	replace j1_expenditure_head_list = subinstr(j1_expenditure_head_list,"-104",".d",.)
	foreach z in `exp_head_woth' {
		capture generate j1_`z'_exp_have = regexm(j1_expenditure_head_list, "`i'")
		local i = `i'+1
	}
	capture generate j1_other_exp_have = regexm(j1_expenditure_head_list, ".a")
	local i 1
	foreach z in `income_src' {
		capture generate j6_`z'_inc_have = regexm(j6_income_source_list, "`i'")
		local i = `i'+1
	}

	
	//// Section - M [Interviewer’s Notes]
	local i 1
	foreach z in `people' {
		capture generate m6_other_people_`z'= regexm(m6_other_people, "`i'")
		local i = `i'+1
	}
	