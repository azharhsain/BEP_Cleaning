/***********************************************************
Project: BEP

Purpose: Baseline household survey data variables' renaming

Author:  Azhar Hussain

Date  :  06 April, 2015
************************************************************/



* INCLUDING MACROS

	include locals_hh.do

	
* LABELING VARIABLES

	//// Section - 0 [General Information]
	label variable _area_id "Area ID"
	label variable _pss_name "PSS Name"
	label variable _feeder_name "Feeder Name"
	label variable _area_name "Area Name"
	label variable _district_id "District ID"
	label variable _district_name "District Name"
	label variable _duplicate_parent_key "Duplicate parent keys (Yes/No)"
	label variable _duplicate_survey "Duplicate survey (Yes/No)"
	label variable _feeder_id "Feeder ID"
	label variable _household_id "Household ID"
	label variable _pin_code "Pin code"
	label variable _pss_id "PSS ID"
	label variable _resp_questions "Repsondent asking question (Yes/No)"
	label variable _sim_id "SIM card number"
	label variable _supervisor_code "Supervisor code"
	label variable _sur_answers "Surveyor giving answer (Yes/No)"
	label variable _survey_device_id "Tablet ID"
	label variable _survey_end_datetime "Survey end date & time combined"
	label variable _survey_metainstance_id "Meta-instance ID"
	label variable _survey_parent_id "Parent key"
	label variable _survey_start_datetime "Survey start date & time combined"
	label variable _survey_submission_datetime "Survey submission date & time combined"
	label variable _survey_subscriber_id "Subscriber ID"
	label variable _surveyor_code "Surveyor code"
	label variable _surveyor_name "Surveyor name"
	label variable _verbal_consent "Survey consent (Yes/No)"
	label variable _visit_number "Visit number for survey"
	label variable _gps_accuracy "GPS reading precision in meters"
	label variable _gps_altitude "GPS altitude reading"
	label variable _gps_latitude "GPS latitude reading"
	label variable _gps_longitude "GPS longitude reading"

	//// Section - A [Information about family members of the household]
	foreach i of numlist 1/32 {
		foreach z in `occupation' {
			label variable a6_mem`i'_occup_`z' "Occupation of family member#`i' includes `z' (Yes/No)"
		}
		label variable a6_mem`i'_occup_other "Occupation of family member#`i' includes other (Yes/No)"
		label variable a1_family_mem_age`i' "Age of family member#`i'"
		label variable a2_family_mem_sex`i' "Sex of family member#`i'"
		label variable a3_family_mem_relation`i' "Relation with respondent of family member#`i'"
		label variable a4_family_mem_education`i' "Education status of family member#`i'"
		label variable a5_family_mem_school`i' "Does family member#`i' go to school (Yes/No)"
		label variable a6_family_mem_occupation`i' "Occupation of family member#`i'"
		label variable a7_family_mem_occupation_other`i' "Unlisted occupation of family member#`i'"
	}
		label variable a_adult_female_count "Number of females in the household"
		label variable a_adult_male_count "Number of males in the household"
		label variable a_boy_count "Number of boys(<3yrs) in the household"
		label variable a_girl_count "Number of girls(<3yrs) in the household"
		
	//// Section - B [Information about house and other resources]
	label variable b1_house_own "Ownership of house"
	label variable b1_house_own_other "Unlisted ownership of house"
	label variable b2_rent "House rent"
	label variable b3_house_type "Type of house"
	label variable b4_roof_type "Type of roof in house"
	label variable b4_roof_type_other "Unlisted type of roof in house"
	label variable b5_house_area_unit "Total area of house compound (unit)"
	label variable b5_house_area_unit_other "Total area of house compound (unlisted unit)"
	label variable b5_house_area_value "Total area of house compound (value)"
	label variable b6_land_cover "Entire land covered with building (Yes/No)"
	label variable b7_building_area_unit "Area of building (unit)"
	label variable b7_building_area_unit_other "Area of building (unlisted unit)"
	label variable b7_building_area_value "Area of building (value)"
	label variable b8_bedroom_count "Number of bedrooms in house"
	label variable b8_kitchen_count "Number of kitchen in house"
	label variable b8_living_count "Number of living room in house"
	label variable b8_other_count "Number of unlisted rooms in house"
	label variable b8_toilet_count "Number of toilets in house"
	label variable b9_land_extra "Household having extra land"
	label variable b10_land_extra_unit "Area of extra land (unit)"
	label variable b10_land_extra_unit_other "Area of extra land (unlisted unit)"
	label variable b10_land_extra_value "Area of extra land (value)"
	label variable b11_livestock_own "Own livestock (Yes/No)"
	label variable b12_animals_list "List of animals in livestock"	
	label variable b12_animals_list_other "Unlisted animals in livestock"		
	foreach z in `animal_woth' {
		label variable b12_`z'_count "Number of `z' in livestock"
		label variable b12_`z'_have "Household has `z' in livestock (Yes/No)"
	}
	label variable b12_other_have "Household has `z' in livestock (Yes/No)"

	
	//// Section - C [Information about household assets]
	label variable c1_cooking_asset_list "List of cooking assets in the household"
	foreach i in `cooking_asset' {
		label variable c1_`i'_buy_time "Last buying time for `i'"
		label variable c1_`i'_count "Number of `i' in the household"
		label variable c1_`i'_resale_value "Resale value of `i'"
	}
	label variable c2_entertainment_asset_list "List of entertainment assets in the household"
	foreach j in `entertainment_asset' {
		label variable c2_`j'_buy_time "Last buying time for `j'"
		label variable c2_`j'_count "Number of `j' in the household"
		label variable c2_`j'_resale_value "Resale value of `j'"
	}
	label variable c3_appliance_asset_list "List of appliance assets in the household"
	foreach k in `appliance_asset' {
		label variable c3_`k'_buy_time "Last buying time for `k'"
		label variable c3_`k'_count "Number of `k' in the household"
		label variable c3_`k'_resale_value "Resale value of `k'"
	}
	label variable c4_transport_asset_list "List of transport assets in the household"
	foreach l in `transport_asset' {
		label variable c4_`l'_buy_time "Last buying time for `l'"
		label variable c4_`l'_count "Number of `l' in the household"
		label variable c4_`l'_resale_value "Resale value of `l'"
	}	
	label variable c5_miscellaneous_asset_list "List of miscellaneous assets in the household"
	foreach m in `miscellaneous_asset' {
		label variable c5_`m'_buy_time "Last buying time for `m'"
		label variable c5_`m'_count "Number of `m' in the household"
		label variable c5_`m'_resale_value "Resale value of `m'"
	}
	local i 1
	foreach z in cooking entertainment appliance transport miscellaneous {
		foreach a in ``z'_asset' {
			label variable c`i'_`a'_have "Household has `a' as `z'_asset (Yes/No)"
		}
		local i = `i'+1
	}
	
	//// Section - D [Information about the family]
	label variable d1_religion "Religion of household"
	label variable d1_religion_other "Unlisted religion of household"
	label variable d2_social_cat "List of social category of household"
	label variable d2_social_cat_other "Unlisted social category of household"
	label variable d3a_hindu_caste "List of Hindu religion caste"
	label variable d3a_hindu_caste_other "Unlisted Hindu religion caste"
	label variable d3b_muslim_caste "List of Muslim religion caste"
	label variable d3b_muslim_caste_other "Unlisted Muslim religion caste"
	label variable d4_bpl_family "BPL status of household (Yes/No)"
	label variable d5_bpl_card "List of BPL cards that household has"
	label variable d5_bpl_green_card_count "Number of green bpl card in household"
	label variable d5_bpl_red_card_count "Number of red bpl card in household"
	label variable d5_bpl_yellow_card_count "Number of yellow bpl card in household"
	label variable d6_mgnrega_card "MGNREGA job card availability (Yes/No)"
	label variable d7_mgnrega_job "Worked in MGNREGA job (Yes/No)"
	label variable d8_mgnrega_workdays_count "Number of days worked in MGNREGA"
	label variable d9_more_workdays_want "Wanted to work for more days in MGNREGA (Yes/No)"
	label variable d10_no_more_workdays_reason "Reason for not getting more work days under MGNREGA"
	label variable d10_no_more_work_reason_other "Unlisted reason for not getting more work days under MGNREGA"
	foreach z in `social_cat' {
		label variable d2_soc_cat_`z' "Social categories of household members include `z' (Yes/No)"
	}
	foreach z in `hindu_caste' {
		label variable d3a_hin_caste_`z' "Castes of household members include `z' (Yes/No)"
	}
	foreach z in `muslim_caste' {
		label variable d3b_mus_caste_`z' "Castes of household members include `z' (Yes/No)"
	}
	foreach z in `bpl_card' {
		label variable d5_bpl_`z'_card_have "Household has `z' BPL card (Yes/No)"
	}
	
	//// Section - E [Inforation about electricity sources, metering and billing situation of the household]
	label variable e1_elec_any "Electricity from any source (Yes/No)"
	label variable e2_elec_past "Electricity in the past (Yes/No)"
	label variable e3_noelec_reason "No electricity reason"
	label variable e3_noelec_reason_other "No electricity unlisted reason"
	label variable e4_elec_source "Affordable source of electricity"
	label variable e4_elec_source_other "Affordable unlisted source of electricity"
	label variable e5_elec_genset "Electricity from genset (Yes/No)"
	label variable e6_genset_capacity "Genset capacity (Value)"
	label variable e6_genset_unit "Genset capacity (Unit)"
	label variable e7_genset_shared "Ownership of genset"
	label variable e7_genset_shared_other "Unlisted ownership of genset"
	label variable e8_genset_cost "Private genset cost"
	label variable e9_diesel_cost "Cost of 1 litre diesel"
	label variable e9_genset_exp "Genset expenditure"
	label variable e9_genset_exp_litre "Genset expenditure in litre/month"
	label variable e9_genset_exp_rupee "Genset expenditure in rupee/month"
	label variable e10_genset_shared_people "Number of people sharing the genset"
	label variable e11_genset_shared_cost "Shared genset one-time cost (Yes/No)"
	label variable e11_genset_shared_cost_amount "Shared genset one-time cost (value)"
	label variable e12_genset_shared_exp "Shared genset regular expenditure (Yes/No)"	
	label variable e12_genset_shared_exp_amount "Shared genset regular expenditure (value)"
	label variable e12_genset_shared_exp_unit "Shared genset regular expenditure (unit)"
	label variable e12_genset_shared_exp_unit_other "Shared genset regular expenditure unlisted payment duration"
	label variable e13_elec_solar "Electricity from solar panel (Yes/No)"
	label variable e14_solar_owner "Ownership of solar panel"
	label variable e15_solar_cost "Private solar panel cost"
	label variable e16_solar_shared "One-time cost for shared solar panel (Yes/No)"
	label variable e17_solar_shared_cost "One-time cost for shared solar panel"
	label variable e18_solar_shared_exp "Solar panel monthly expenditure"
	label variable e19_elec_grid "Electricity from grid (Yes/No)"
	label variable e20_metered_consumer "Metered consumer (Yes/No)"
	label variable e21_meter_functional "Functional meter (Yes/No)"
	label variable e22_meter_damage_date "Meter damage date"
	label variable e23_meter_complaint "Meter damage complaint (Yes/No)"
	label variable e24_meter_complaint_location "Meter damage complaint location"
	label variable e24_meter_complaint_loc_other "Meter damage complaint unlisted location"
	label variable e25_meter_noncomplaint "Reason for no complain"
	label variable e25_meter_noncomplaint_other "Unlisted reason for no complain"
	label variable e26_meter_location "Meter location"
	label variable e26_meter_location_other "Unlisted meter location"
	label variable e27_meter_outside_readibility "Can meter located outside be read without entering house (Yes/No)"
	label variable e28_meter_installation_date "Meter Installation date"
	label variable e29_meter_read "Know last meter reading date (Yes/No)"
	label variable e29_meter_read_date "Last meter reading date"
	label variable e30_connection_type "Connection type in household"
	label variable e31_single_phase_meter "Model of single-phase meter installed in household"
	label variable e32_three_phase_meter "Model of three-phase meter installed in household"
	label variable e33_consumers_receive_bill "Ever received electricity bill (Yes/No)"
	label variable e34_consumers_billed "Know last date of receiving electricity bill (Yes/No)"
	label variable e34_consumers_billed_date "Last date of receiving electricity bill"
	label variable e35_consumers_bill_month "Duration for which the bill is applicable"
	label variable e35_consumers_bill_month_other "Unlisted duration for which the bill is applicable"
	label variable e36_bill_availability "Show bill copy"
	label variable e37_bill_consumer_number "Consumer number entered from bill"
	label variable e38_know_consumer_number "Know consumer number (Yes/No)"
	label variable e38_ask_consumer_number "Consumer number asked"
	label variable e39_correct_billing "Acknowelged with correct bill and receipt (Yes/No)"
	label variable e40_wrong_billing_month "Wrong billing month"
	label variable e40_wrong_billing_year "Wrong billing year"
	label variable e41_bill_receive_frequency "Bill receiving frequency"
	label variable e41_bill_receive_frequency_other "Unlisted bill receiving frequency"
	label variable e42_bill_not_received_action "Action taken for not receiving bill"
	label variable e42_bill_not_received_act_other "Unlisted action taken for not receiving bill"
	label variable e43_last_bill_pay_lastmonth "Last bill payment month"
	label variable e43_last_bill_pay_year "Last bill payment year"
	label variable e44_last_bill_pay_amount "Last bill payment amount"
	label variable e45_bill_pay_frequency "Average frequency of bill payment"
	label variable e45_bill_pay_frequency_other "Unlisted average frequency of bill payment"
	label variable e39_correct_billing "Acknowelged with correct bill and receipt (Yes/No)"
	label variable e40_wrong_billing_month "Wrong billing month"
	label variable e40_wrong_billing_year "Wrong billing year"
	label variable e41_bill_receive_frequency "Bill receiving frequency"
	label variable e41_bill_receive_frequency_other "Unlisted bill receiving frequency"
	label variable e42_bill_not_received_action "Action taken for not receiving bill"
	label variable e42_bill_not_received_act_other "Unlisted action taken for not receiving bill"
	label variable e43_last_bill_pay_lastmonth "Last bill payment month"
	label variable e43_last_bill_pay_year "Last bill payment year"
	label variable e44_last_bill_pay_amount "Last bill payment amount"
	label variable e45_bill_pay_frequency "Average frequency of bill payment"
	label variable e45_bill_pay_frequency_other "Unlisted average frequency of bill payment"
	label variable e46_bill_pay_location "Location where bill payment done"
	label variable e46_bill_pay_location_other "Unlisted location where bill payment done"
	label variable e47_bill_pay_pss_type "Mode of paying to PSS/discom outlet"
	label variable e47_bill_pay_pss_type_other "Unlisted mode of paying to PSS/discom outlet"
	label variable e48_bill_pay_franchise_type "Mode of paying to franchise"
	label variable e48_bill_pay_franch_type_other "Unlisted mode of paying to franchise"
	label variable e49_franchise_pss_distance_unit "Distance travelled to submit bills at outlet or franchise (unit)"
	label variable e49_franchise_pss_distance_val "Distance travelled to submit bills at outlet or franchise (value)"
	label variable e50_franchise_pss_time_unit "Time taken to reach outlet or franchise (unit)"
	label variable e50_franchise_pss_time_value "Time taken to reach outlet or franchise (value)"
	label variable e51_rationshop_owner_rating "Professional-level rating of rationshop dealer"
	label variable e52_bill_collector_name "Name of bill collector for household"
	label variable e52_know_bill_collector_name "Know bill collector name (Yes/No)"
	label variable e53_bill_collector_rating "Professional-level rating of bill colletor"
	label variable e54_postoffice_clerk_rating "Professional-level rating of post-office clerk"
	foreach z in `no_elec_reason' {
		label variable e3_noelec_`z' "Reason of absence of electricity in household includes `z' (Yes/No)"
	}	
	foreach z in `affordable_elec_src' {
		label variable e4_elec_src_`z' "Affordable sources of electricity for household includes `z' (Yes/No)"
	}
	foreach z in `pay_way' {
		label variable e47_pss_`z' "Modes of paying bill at the Outlet include `z'"
		label variable e48_franchise_`z' "Modes of paying bill to the Franchisee include `z'"
	}
	
	//// Section - F [Information about electricity supply situation]
	label variable f1_grid_elec_date "Start date of grid electricity connection"
	label variable f2_avg_gridelec_perday "Number of hours of electricity received perday"
	label variable f2_gridelec_5pmto11pm "Hours of electricity supplied during 5PM to 11PM"
	label variable f2_gridelec_7amto12pm "Hours of electricity supplied during 7AM to 12PM"
	label variable f2_gridelec_11pmto7am "Hours of electricity supplied during 11PM to 7AM"
	label variable f2_gridelec_12pmto5pm "Hours of electricity supplied during 12PM to 5PM"
	label variable f2_sum_of_slots "Number of hours of electricity received after summing up the slots"
	label variable f3_power_outage_lastmonth "Instances of unusual power outage in last month (Yes/No)"
	label variable f4_power_outage_day_count "Number of days on which power outage happened"
	label variable f4_power_outage_hour_count "Average length of power outage in hours"
	label variable f5_power_outage_expected "Power outage expected (Yes/No)"
	label variable f6_know_power_outage_reason "Know power outage reason (Yes/No)"
	label variable f7_voltage_drop_lastmonth "Instances of voltage drop in last month (Yes/No)"
	label variable f8_voltage_drop_day_count "Number of days on which voltage drop happened"
	label variable f8_voltage_drop_hour_count "Average length of voltage drop in hours"
	label variable f9_energy_advertisement "Heard/seen any advertisement from Energy Department (Yes/No)"
	label variable f10_advertisement_source "Source of advertisement from Energy Department"
	label variable f10_advertisement_source_other "Unlisted source of advertisement from Energy Department"
	label variable f11_know_ots_scheme "Know about the One Time Settlement Scheme (Yes/No)"
	label variable f12_avail_ots "Know someone who availed One Time Settlement Scheme (Yes/No)"
	label variable f13_mobile_phone_access "Respondent/adult having access to mobile phone (Yes/No)"
	label variable f14i_subs_bill_amount_alert "Like free subscription of SMS on energy consumption and bill dues (Yes/No)"
	label variable f14ii_subs_pay_date_alert "Like free subscription of SMS on payment due date (Yes/No)"
	label variable f14iii_subs_biller_visit_alert "Like free subscription of SMS on advance bill collector's visit information (Yes/No)"
	label variable f15_elec_future_expect "Future expectation for more hours of electricity (Yes/No)"
	label variable f16_elec_supply_factor "Electricity supply factors"
	label variable f16_elec_supply_factor_other "Unlisted electricity supply factors"
	label variable f17_elec_neighbour_hour "Number of hours of electricity supplied in area"
	label variable f18_elec_neighbour_hour_change "Change in the hours of electricity supply in area (Yes/No)"
	label variable f19_neigh_hr_change_reason_other "Unlisted reason for change of supply hours in village"
	label variable f19_neighbour_hour_change_reason "Reason for change of supply hours in village"
	label variable f20_maintenance_complaint "Maintenance related complaint (Yes/No)"
	label variable f21_main_complaint_reason_other "Unlisted maintenance complaint reason"
	label variable f21_maintenance_complaint_reason "Maintenance complaint reason"
	label variable f22_maintenance_complaint_lodge "Maintenance complaint lodge (Yes/No)"
	label variable f23_main_complaint_lodge_who "Maintenance complaint lodge person/location"
	label variable f23_complaint_lodge_who_other "Maintenance complaint lodge unlisted person/location"
	label variable f24_lineman_pay "Payment to lineman for maintenance"
	label variable f25_complaint_resolve "Complaint resolution"
	label variable f25_complaint_resolve_day "Number of day for complaint resolution"
	foreach z in `elec_supply_factor' {
		label variable f16_elec_supply_`z' "Most important factors determining electricity supply includes `z' (Yes/No)"
	}
	foreach z in `elec_supply_factor' {
		label variable f19_neigh_hr_`z' "Reasons behind the change of neighbourhood electricity supply includes `z' (Yes/No)"
	}
	foreach z in `maintenance_complaint' {
		label variable f21_maintenance_`z' "Reason for complaint is `z' (Yes/No)"
	}
	foreach z in `adv_src' {
		label variable  f10_adv_src_`z' "Sources of advertisement for Energy Dept include `z' (Yes/No)"
	}
	
	//// Section - G [Information about different energy sources used in the household]
	label variable g1_alternate_energy_src_list "List of alternate energy sources used in the household"
	foreach i in `energy_source' {
			label variable g1_`i'_use "Household use `i' as an alternative energy source (Yes/No)"
			label variable g2_`i'_use_hour "Number of hours/day for which `i' is used"
			label variable g3_`i'_use_day "Number of days/month for which `i' is used"
			label variable g4_`i'_use_quantity "Quantity of `i' used per month"
			label variable g5_`i'_unit_price "Unit price of `i'"
			label variable g6_`i'_exp_month "Monthly expenditure on `i'"
	}
	
	//// Section - H [Information about apliances used in the household]
	foreach i in `room_type' {
		local r=substr("`i'",1,1)
		label variable h`r'0_have_`i' "Have `i' in the household (Yes/No)"
		label variable h`r'1_have_elec_`i' "Have electricity in `i' (Yes/No)"
		label variable h`r'2_bulb_count_`i' "Number of bulb in `i'"
		label variable h`r'3_cfl_count_`i' "Number of cfl in `i'"
		label variable h`r'4_tubelight_count_`i' "Number of tubelight in `i'"
		label variable h`r'5_plug_count_`i' "Number of plug in `i'"
		local j 1
		while `j' <= max(max_bulb_`i', max_cfl_`i', max_tube_`i') {
			capture label variable h`r'6_`i'_bulb`j'_rating "Rating of `i' bulb#`j' in the household (W)"
			capture label variable h`r'6_`i'_bulb`j'_usage "Daily usage hours of `i' bulb#`j' in the household"
			capture label variable h`r'6_`i'_cfl`j'_rating "Rating of `i' cfl#`j' in the household (W)"
			capture label variable h`r'6_`i'_cfl`j'_usage "Daily usage hours of `i' cfl#`j' in the household"
			capture label variable h`r'6_`i'_tubelight`j'_rating "Rating of `i' tubelight#`j' in the household (W)"
			capture label variable h`r'6_`i'_tubelight`j'_usage "Daily usage hours of `i' tubelight#`j' in the household"
			local j = `j'+1
		}
		capture label variable h`r'7_appliance_plug_list "List of appliance plugged in `i'"
		capture label variable h`r'7_appliance_plug_list_other "List of unlisted appliance plugged in `i'"
		capture label variable h`r'8_appliance_unplug_list "List of appliance not plugged in `i'"
		capture label variable h`r'8_appliance_unplug_list_other "List of unlisted appliance not plugged in `i'"
		foreach k in `appliance_long' {
			capture label variable h`r'7_`k'_daily_usage "Daily usage hours of plugged `k' in `i'"
			capture label variable h`r'8_`k'_daily_usage "Daily usage hours of unplugged `k' in `i'"
			capture label variable h`r'7_`k'_have "Household has `k' as plugged appliance in `i' (Yes/No)"
			capture label variable h`r'8_`k'_have "Household has `k' as unplugged appliance in `i' (Yes/No)"			
		}
	}
	
	//// Section - I [Information related to the neighborhood]
	label variable i1_mother_tongue "Language spoken at home"
	label variable i1_mother_tongue_other "Unlisted language spoken at home"
	label variable i2_read_newspaper "Read local/national newspaper (Yes/No)"
	label variable i3_local_safety "Safety-level in the neighbourhood"
	label variable i4_local_politics_list "List of local politics parameters in which respondent has participated"
	label variable i5_vote_local_election_year "Year of voting in local election"
	label variable i6_vote_state_election_year "Year of voting in state election"
	label variable i7_interact_representative_year "Year of interacting with an elected government representative"
	label variable i8_attend_protest_year "Year of attending protest/march/demonstration"
	label variable i10_member_local_org "Membership of local organisation"
	label variable i10_member_local_org_other "Membership of unlisted local organisation"
	label variable i11_org_meet_duration "Frequency of organisation meetup (value)"
	label variable i11_org_meet_unit "Frequency of organisation meetup (unit)"
	label variable i12_festival_celebration "Assemble with neighbours for festival celebration (Yes/No)"
	label variable i13_neighbor_interact_time "Last interaction time with neighbour (value)"
	label variable i13_neighbor_interact_unit "Last interaction time with neighbour (unit)"
	label variable i14_gridelec_percent "Percentage of households in village having grid electricity connection"
	label variable i15_power_theft_case "Power theft cases in the village (Yes/No)"
	label variable i15_power_theft_case_other "Unlisted power theft cases in the village"
	label variable i16_power_theft_reason "Reason of power theft in the village"
	label variable i16_power_theft_reason_other "Unlisted reason of power theft in the village"
	label variable i17_power_theft_method "Power theft methods used in the village"
	label variable i17_power_theft_method_other "Unlisted power theft methods used in the village"
	label variable i18_meter_tamper_percent "Percentage of households in village involved in meter tampering"
	label variable i19_meter_tamper_penal "Number of households out of 10 penalized for meter tampering"
	label variable i20_hooking_percent "Percentage of households in village involved in hooking"
	label variable i21_hooking_penal "Number of households out of 10 penalized for hooking"
	label variable i22_bribe_percent "Percentage of households in village involved in bribing officials"
	label variable i23_bribe_penal "Number of households out of 10 penalized for bribing officials"
	foreach z in `local_politic' {
		label variable i4_`z' "Household member `z' as local politics participation (Yes/No)"
	}
	foreach z in `power_theft_reason' {
		label variable i16_`z' "Reasons for power theft in the neighbourhood includes `z' (Yes/No)"
	}
	foreach z in `power_theft_method' {
		label variable i17_`z' "Methods for power theft in the neighbourhood includes `z' (Yes/No)"
	}

	//// Section - J [Information about income and expenditure of household]
	label variable j1_expenditure_head_list "List of expenditure heads in the household"
	foreach i in `exp_head' {
		label variable j1_`i'_exp_have "Household expenditure head includes `i' (Yes/No)"
		label variable j1_`i'_exp_lastmonth "Last month expenditure on `i'"
	}
	label variable j2_high_exp_lastyear_value "Highest monthly expenditure in previous year (value)"
	label variable j3_high_exp_lastyear_month "Highest monthly expenditure in previous year (month)"
	label variable j4_low_exp_lastyear_value "Lowest monthly expenditure in previous year (value)"
	label variable j5_low_exp_lastyear_month "Lowest monthly expenditure in previous year (month)"
	label variable j6_income_source_list "List of sources of income in the household"
	foreach j in `income_src' {
		label variable j6_`j'_inc_have "Household income source includes `j' (Yes/No)"
		capture label variable j6_`j'_inc_src "Source of `j' income"
		label variable j6_`j'_inc_annual "Annual income from `j'"
		label variable j6_`j'_inc_monthly "Monthly income from `j'"
	}
	label variable j7_receive_regular_inc "Receive standard regular monthly income (Yes/No)"
	label variable j8_high_inc_lastyear_value "Highest monthly income in previous year (value)"
	label variable j9_high_inc_lastyear_month "Highest monthly income in previous year (month)"
	label variable j10_low_inc_lastyear_value "Lowest monthly income in previous year (value)"
	label variable j11_low_inc_lastyear_month "Lowest monthly income in previous year (month)"
	label variable j12_earn_lastmonth "Last month earning"	
	
	//// Section - K [Information about the daily activities of the household members]
	local i 1
	foreach j in `hh_member' {
		label variable k`i'_`j'_back_home "Know time when `j' member come back home from work (Yes/No)"
		label variable k`i'_`j'_back_home_time "Time when `j' member come back home from work"
		label variable k`i'_`j'_leave_home "Know time when `j' member leave home for work (Yes/No)"
		label variable k`i'_`j'_leave_home_time "Time when `j' member leave home for work"
		label variable k`i'_`j'_sleep "Know time when `j' member go to sleep (Yes/No)"
		label variable k`i'_`j'_sleep_time "Time when `j' member go to sleep"
		label variable k`i'_`j'_wake_up "Know time when `j' member wake up in morning (Yes/No)"
		label variable k`i'_`j'_wake_up_time "Time when `j' member wake up in morning"
		local i = `i'+1
	}
	
	//// Section - L [Reading test for children]
	label variable l_read_family_mem_count "Number of literate family members"
	foreach i of numlist 1/10 {
		label variable l4_reader`i'_letter_mistake "Number of letter mistakes committed by family member#`i'"
		label variable l5_reader`i'_word_mistake "Number of word mistakes committed by family member#`i'"
		label variable l6_reader`i'_sentence_mistake "Number of sentence mistakes committed by family member#`i'"
		label variable l7_reader`i'_paragraph_mistake "Number of paragraph mistakes committed by family member#`i'"
	}
	
	//// Section - M [Interviewer’s Notes]
	label variable m1_interview_end_time "Interview end time"
	label variable m2_interview_lang "Language used during interview"
	label variable m3_interview_lang_other "Unlisted language used during interview (Yes/No)"
	label variable m4_interview_other_name "Unlisted language used during interview"
	label variable m5_number_of_people "Number of people present during interview"
	label variable m6_other_people "People other than the respondent present during interview"
	label variable m7_survey_satisfactory_answer "Interviewer satisfaction with the responses (Yes/No)"
	label variable m8_survey_comment "Interviewer comments on the survey"
	foreach z in `people' {
		capture label variable m6_other_people_`z' "Other people present during the survey includes `z' (Yes/No)"
	}
