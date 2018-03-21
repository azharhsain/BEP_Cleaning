/*******************************************************************
Project: BEP

Purpose: Baseline household survey variables' skip pattern checking

Author:  Azhar Hussain

Date  :  27 April, 2015
********************************************************************/



* DROPPING INSIGNIFICANT OBSERVATIONS

	drop if _duplicate_survey==.
	drop if _duplicate_parent_key==1


* CHECKING SKIP PATTERNS

	//// Section - 0 [General Information]
	
	//// Section - A [Information about family members of the household]
	
	//// Section - B [Information about house and other resources]
	assert (b1_house_own==2) + (b2_rent!=.) !=1
	assert (b6_land_cover==1) + (b7_building_area_value==.) !=1
	assert (b10_land_extra_value==.) if (b9_land_extra==4)!=0
	assert (b10_land_extra_value==.) if (b9_land_extra==5)!=0
	capture noisily assert (b11_livestock_own==1) + !missing(b12_animals_list) !=1
	
	//// Section - C [Information about household assets]
	
	//// Section - D [Information about the family]
	assert (d1_religion==1) + !missing(d3a_hindu_caste) !=1
	assert (d1_religion==2) + !missing(d3b_muslim_caste) !=1
	assert (d4_bpl_family==1) + !missing(d5_bpl_card) !=1
	assert (d7_mgnrega_job==2) + missing(d8_mgnrega_workdays_count) !=1
	assert missing(d10_no_more_workdays_reason) if (d9_more_workdays_want==2)!=0
	assert !missing(d10_no_more_workdays_reason) if (d9_more_workdays_want==1)!=0
	
	//// Section - E [Inforation about electricity sources, metering and billing situation of the household]
	assert (e1_elec_any==1) + (e2_elec_past==.)!=1
	assert (e2_elec_past!=.) + (e5_elec_genset==.)!=1
	assert missing(e4_elec_source) + (e5_elec_genset!=.) !=1
	assert (e5_elec_genset==1) + (e7_genset_shared!=.)!=1
	assert (e6_genset_capacity==.) if (e5_elec_genset==2) !=0
	assert (e6_genset_capacity!=.) if (e5_elec_genset==1) !=0	
	assert (e8_genset_cost==.) if (e7_genset_shared==2) !=0
	assert (e8_genset_cost!=.) if (e7_genset_shared==1) !=0	
	assert (e10_genset_shared_people==.) if (e9_genset_exp!=.) !=0
	assert (e14_solar_owner==.) if (e13_elec_solar==2) !=0
	assert (e14_solar_owner!=.) if (e13_elec_solar==1) !=0
	assert (e15_solar_cost==.) if (e14_solar_owner==2) !=0
	assert (e15_solar_cost!=.) if (e14_solar_owner==1) !=0	
	assert (e16_solar_shared==.) if (e15_solar_cost!=.) !=0
	assert (e17_solar_shared_cost!=.) + (e16_solar_shared==1) !=1
	assert (e20_metered_consumer==.) if (e19_elec_grid==2) !=0
	assert (e20_metered_consumer!=.) if (e19_elec_grid==1) !=0
	assert (e21_meter_functional==.) if (e20_metered_consumer==2) !=0
	assert (e21_meter_functional!=.) if (e20_metered_consumer==1) !=0
	assert missing(e22_meter_damage_date) if (e21_meter_functional==1) !=0
	assert !missing(e22_meter_damage_date) if (e21_meter_functional==2) !=0
	assert missing(e24_meter_complaint_location) if (e23_meter_complaint==2) !=0
	assert !missing(e24_meter_complaint_location) if (e23_meter_complaint==1) !=0
	assert missing(e25_meter_noncomplaint) if !missing(e24_meter_complaint_location) !=0
	assert (e27_meter_outside_readibility==.) if (e26_meter_location==1) !=0
	assert (e27_meter_outside_readibility!=.) if (e26_meter_location==2) !=0
	assert (e32_three_phase_meter!=.) + (e30_connection_type==2) !=1
	assert (e31_single_phase_meter==.) if (e30_connection_type==-103) !=0
	assert (e32_three_phase_meter==.) if (e30_connection_type==-103) !=0
	assert (e34_consumers_billed==.) if (e33_consumers_receive_bill==2) !=0
	assert (e34_consumers_billed!=.) if (e33_consumers_receive_bill==1) !=0
	assert (e35_consumers_bill_month==.) if (e34_consumers_billed==-103) !=0
	assert missing(e37_bill_consumer_number) if (e36_bill_availability==3) !=0
	assert missing(e37_bill_consumer_number) if (e36_bill_availability==2) !=0
	assert !missing(e37_bill_consumer_number) if (e36_bill_availability==1) !=0
	capture noisily assert (e38_know_consumer_number==.) if !missing(e37_bill_consumer_number) !=0
	assert missing(e38_ask_consumer_number) if (e38_know_consumer_number==2) !=0
	assert !missing(e38_ask_consumer_number) if (e38_know_consumer_number==1) !=0
	assert (e40_wrong_billing_month==.) if (e39_correct_billing==1) !=0
	assert (e40_wrong_billing_month!=.) if (e39_correct_billing==2) !=0
	assert (e44_last_bill_pay_amount==.) if (e43_last_bill_pay_lastmonth==-100) !=0
	assert (e44_last_bill_pay_amount!=.) if (e43_last_bill_pay_lastmonth==-103) !=0
	assert !missing(e47_bill_pay_pss_type) + (e46_bill_pay_location==1) !=1
	assert !missing(e48_bill_pay_franchise_type) + (e46_bill_pay_location==2) !=1
	assert missing(e48_bill_pay_franchise_type) if !missing(e47_bill_pay_pss_type) !=0
	assert (e49_franchise_pss_distance_val!=.) if regexm(e48_bill_pay_franchise_type, "^2") !=0
	assert (e49_franchise_pss_distance_val!=.) if regexm(e47_bill_pay_pss_type, "^2") !=0	

	//// Section - F [Information about electricity supply situation]
	assert (f4_power_outage_day_count==.) if (f3_power_outage_lastmonth==2) !=0
	assert (f4_power_outage_day_count!=.) if (f3_power_outage_lastmonth==1) !=0
	assert (f8_voltage_drop_day_count==.) if (f7_voltage_drop_lastmonth==2) !=0
	assert (f8_voltage_drop_day_count!=.) if (f7_voltage_drop_lastmonth==1) !=0
	assert missing(f10_advertisement_source) if (f9_energy_advertisement==2) !=0
	assert !missing(f10_advertisement_source) if (f9_energy_advertisement==1) !=0
	assert (f12_avail_ots==.) if (f11_know_ots_scheme==2) !=0
	assert (f12_avail_ots!=.) if (f11_know_ots_scheme==1) !=0
	assert missing(f19_neighbour_hour_change_reason) if (f18_elec_neighbour_hour_change==2) !=0
	assert !missing(f19_neighbour_hour_change_reason) if (f18_elec_neighbour_hour_change==1) !=0
	assert missing(f21_maintenance_complaint_reason) if (f20_maintenance_complaint==2) !=0
	assert !missing(f21_maintenance_complaint_reason) if (f20_maintenance_complaint==1) !=0
	assert (f23_main_complaint_lodge_who==.) if (f22_maintenance_complaint_lodge==2) !=0
	assert (f23_main_complaint_lodge_who!=.) if (f22_maintenance_complaint_lodge==1) !=0
	assert (f24_lineman_pay==.) if (f23_main_complaint_lodge_who==1) !=0
	assert (f24_lineman_pay==.) if (f23_main_complaint_lodge_who==2) !=0
	assert (f24_lineman_pay!=.) if (f23_main_complaint_lodge_who==3) !=0
	assert (f24_lineman_pay!=.) if (f23_main_complaint_lodge_who==-102) !=0
	
	//// Section - G [Information about different energy sources used in the household]
	
	//// Section - H [Information about apliances used in the household]
	assert (hb1_have_elec_bedroom==.) + (hb0_have_bedroom==2) !=1
	assert (hb2_bulb_count_bedroom!=.) + (hb1_have_elec_bedroom==1) !=1
	assert (hk1_have_elec_kitchen==.) + (hk0_have_kitchen==2) !=1
	assert (hk2_bulb_count_kitchen!=.) + (hk1_have_elec_kitchen==1) !=1
	assert (hl1_have_elec_livingarea==.) + (hl0_have_livingarea==2) !=1
	assert (hl2_bulb_count_livingarea!=.) + (hl1_have_elec_livingarea==1) !=1
	assert (ht1_have_elec_toilet==.) + (ht0_have_toilet==2) !=1
	assert (ht2_bulb_count_toilet!=.) + (ht1_have_elec_toilet==1) !=1
	
	//// Section - I [Information related to the neighborhood]
	assert (i10_member_local_org==6) + (i11_org_meet_duration==.) !=1
	assert missing(i16_power_theft_reason) + (i15_power_theft_case==2) !=1
	assert (i18_meter_tamper_percent!=.) + regexm(i17_power_theft_method, "^1") !=1
	capture noisily assert (i20_hooking_percent!=.) + regexm(i17_power_theft_method, "2") !=1
	capture noisily assert (i22_bribe_percent!=.) + regexm(i17_power_theft_method, "3") !=1
	assert (i19_meter_tamper_penal==.) if (i18_meter_tamper_percent==0) !=0
	assert (i23_bribe_penal==.) if (i22_bribe_percent==0) !=0
	
	//// Section - J [Information about income and expenditure of household]
	assert (j8_high_inc_lastyear_value==.) + (j7_receive_regular_inc==1) !=1
	
	//// Section - K [Information about the daily activities of the household members]
	
	//// Section - L [Reading test for children]
	foreach i of numlist 1/10 {
		assert (l5_reader`i'_word_mistake==.) if (l4_reader`i'_letter_mistake==94)
		assert (l5_reader`i'_word_mistake==.) if (l4_reader`i'_letter_mistake==95)
		assert (l5_reader`i'_word_mistake==.) if (l4_reader`i'_letter_mistake>=5)
		assert (l6_reader`i'_sentence_mistake==.) if (l5_reader`i'_word_mistake>=5)
		assert (l7_reader`i'_paragraph_mistake==.) if (l6_reader`i'_sentence_mistake>=5)
	}
	
	//// Section - M [Interviewer’s Notes]
	assert !missing(m4_interview_other_name) + (m3_interview_lang_other==1) !=1
	
	
* FORCING CHANGES

	//// Section - 0 [General Information]
	
	//// Section - A [Information about family members of the household]
	
	//// Section - B [Information about house and other resources]
	// Surveyor has marked b11_livestock_own==1, but didn't enter any animal code in b12_animals_list
	replace b11_livestock_own=2 if missing(b12_animals_list)

	//// Section - C [Information about household assets]
	
	//// Section - D [Information about the family]

	//// Section - E [Inforation about electricity sources, metering and billing situation of the household]
	// Surveyor has entered skip codes in e37_bill_consumer_number
	replace e36_bill_availability=2 if e37_bill_consumer_number == "-101"
	replace e37_bill_consumer_number = "" if e37_bill_consumer_number == "-101"
	replace e36_bill_availability=2 if e37_bill_consumer_number == "-103"
	replace e37_bill_consumer_number = "" if e37_bill_consumer_number == "-103"
	replace e36_bill_availability=2 if e37_bill_consumer_number == "-104"
	replace e37_bill_consumer_number = "" if e37_bill_consumer_number == "-104"	
	
	//// Section - F [Information about electricity supply situation]
	
	
	//// Section - G [Information about different energy sources used in the household]
	
	
	//// Section - H [Information about apliances used in the household]
	
	
	//// Section - I [Information related to the neighborhood]
	
	
	//// Section - J [Information about income and expenditure of household]
	// Assigning No option to expenditure heads if lastmonth expenditure value is missing
	foreach i in `exp_head' {
		replace j1_`i'_exp_have = 2 if missing(j1_`i'_exp_lastmonth)
	}
	
	//// Section - K [Information about the daily activities of the household members]
	
	
	//// Section - L [Reading test for children]
	
	
	//// Section - M [Interviewer’s Notes]
	