/***********************************************************
Project: BEP

Purpose: Baseline household survey data variables' dropping

Author:  Azhar Hussain

Date  :  11 February, 2015
************************************************************/



* DEFINING MACROS

	// Appliance List (without other)
	local appliance_woth fan_ceil fan_table air_cool air_ac tele_vis comp_desk comp_lap trans_radio mob_phn heater_room air_blow geysers rods ///
	purifiers toasters grind elec_iron sew_machine wash_machine
	
	// Appliance List
	local appliance other fan_ceil fan_table air_cool air_ac tele_vis comp_desk comp_lap trans_radio mob_phn heater_room air_blow geysers rods ///
	purifiers toasters grind elec_iron sew_machine wash_machine

	// Long Appliance List (without other)
	local appliance_long_woth fan_ceil fan_table air_cool air_ac tele_vis comp_desk comp_lap trans_radio mob_phn heater_room air_blow geysers rods ///
	purifiers toasters grind elec_iron sew_machine wash_machine refrigerator emer_light inverter
	
	// Long Appliance List
	local appliance_long fan_ceil fan_table air_cool air_ac tele_vis comp_desk comp_lap trans_radio mob_phn heater_room air_blow geysers rods ///
	purifiers toasters grind elec_iron sew_machine wash_machine refrigerator emer_light inverter other
	
	// Cooking Asset List (without other)
	local cooking_asset_woth mud_chulah smokeless_chulah kerosene_stove lpg_stove utensil pressure_cooker toaster mixer_grinder microwave_oven
	
	// Cooking Asset List
	local cooking_asset mud_chulah smokeless_chulah kerosene_stove lpg_stove utensil pressure_cooker toaster mixer_grinder microwave_oven other
	
	// Entertainment Asset List (without other)
	local entertainment_asset_woth camera television desktop laptop radio
	
	// Entertainment Asset List
	local entertainment_asset camera television desktop laptop radio other

	// Appliances Asset List (without other)
	local appliance_asset_woth almirah bed nonelec_sew_mach elec_sew_mach air_cooler air_conditioner heater electric_iron washing_machine water_purifier ///
	immersion_rod geyser ceiling_fan table_fan bulb_cfl tube_light refrigerator
	
	// Appliances Asset List
	local appliance_asset almirah bed nonelec_sew_mach elec_sew_mach air_cooler air_conditioner heater electric_iron washing_machine water_purifier ///
	immersion_rod geyser ceiling_fan table_fan bulb_cfl tube_light refrigerator other

	// Transport Asset List (without other)
	local transport_asset_woth bicycle two_wheeler tractor four_wheeler animal_cart
	
	// Transport Asset List
	local transport_asset bicycle two_wheeler tractor four_wheeler animal_cart other

	// Miscellaneous Asset List (without other)
	local miscellaneous_asset_woth wall_clock wrist_watch torch hand_pump landline_phone mobile_phone
	
	// Miscellaneous Asset List
	local miscellaneous_asset wall_clock wrist_watch torch hand_pump landline_phone mobile_phone other
	
	// Energy Source List
	local energy_source kerosene battery candle own_solar shared_solar own_bio_genset own_die_genset shared_genset invertor

	// Expenditure Head List
	local exp_head food toiletry maintenance medical education travel phonebill festival occupation elecbill fuel insurance saving servant other

	// Expenditure Head List (without other)
	local exp_head_woth food toiletry maintenance medical education travel phonebill festival occupation elecbill fuel insurance saving servant
	
	// Income Source List
	local income_src agri pension business job industry transport construction remittance rent_dividend forest_product

	// Family Member List
	local hh_member male female child
	
	// Room Type
	local room_type bedroom livingarea kitchen toilet
	
	// List of Animals
	local animal cow buffalo bullock goat chicken horsedonkey pig sheep other
	
	// List of Animals (without other)
	local animal_woth cow buffalo bullock goat chicken horsedonkey pig sheep

	// List of Local Politics Items
	local local_politic vote_local_election vote_state_election communicate_govt_rep attend_protest
	
	// List of Power Theft Reason
	local power_theft_reason diff_caught low_penal other
	
	// List of Power Theft Method
	local power_theft_method meter_tamper hooking bribing_officials other
	
	// List of Power Theft Reason (without other)
	local power_theft_reason_woth diff_caught low_penal
	
	// List of Power Theft Method (without other)
	local power_theft_method_woth meter_tamper hooking bribing_officials

	// List of Other People During Interview
	local people none spouse child5plus child5minus adult_emp adult observer

	// List of Reasons for No Electricity
	local no_elec_reason no_conn no_line no_power no_afford no_need new_conn other
	
	// List of Affordable Electricity source
	local affordable_elec_src grid genset solar other

	// List of Reasons for No Electricity (without other)
	local no_elec_reason_woth no_conn no_line no_power no_afford no_need new_conn
	
	// List of Affordable Electricity Source (without other)
	local affordable_elec_src_woth grid genset solar
	
	// List of Factors Determining electricity Supply
	local elec_supply_factor power_gen you_paybill all_paybill activ_rep no_reason discom_prox sys_maint public_aware discom_priv urban_prox other
	
	// List of Maintenance Related Complaint
	local maintenance_complaint meter transformer high_vol low_volt supply_freq bill_issue conductor other
	
	// List of Factors Determining electricity Supply (without other)
	local elec_supply_factor_woth power_gen you_paybill all_paybill activ_rep no_reason discom_prox sys_maint public_aware discom_priv urban_prox
	
	// List of Maintenance Related Complaint (without other)
	local maintenance_complaint_woth meter transformer high_vol low_volt supply_freq bill_issue conductor

	// List of Occupation of Household Members
	local occupation crop_cultivation sharecropping dairy poultry petty_shop agri_labor nonagri_labor rickshaw_puller auto_driver ///
	house_help security_guard artisan organized_trade cons_contractor realestate_agent student govt_service salaried_work ngo_worker ///
	home_industry migrant_worker unemployed idle homemaker retired priest

	// List of Social Categories (without other)
	local social_cat_woth general sch_caste sch_tribe obc ebc

	// List of Social Categories
	local social_cat general sch_caste sch_tribe obc ebc other
	
	// List of Hindu Castes
	local hindu_caste brahmin bhumihar rajput kayasth lohai bania naai dhobi chamar paswan chaudhary majhi rajvanshi kurmi yadav laala ///
	kahar koiri	kumhar kanu pasi badhai dombha mallah sunar teli musahar turha bhar gond lunia mali nat dhanuk kewat tiar harijan tanti ///
	tattama gaderia jogi rajwar dosadh kalwar khatri chaupal santhal mochi chik banjara godhi rawat other
	
	// List of Muslim Castes
	local muslim_caste syed sheikh khan pathan ansari julaha mallick kasaai dhunia rangrez pamaria chik nat darzi rayeen thakurai ///
	dafali nadaf dhobi churihar qureshi shah pathan	ansari sain hawari abdal malakar shershahbadia mirasi jat safi nalband other

	// List of Hindu Castes (without other)
	local hindu_caste_woth brahmin bhumihar rajput kayasth lohai bania naai dhobi chamar paswan chaudhary majhi rajvanshi kurmi yadav laala ///
	kahar koiri	kumhar kanu pasi badhai dombha mallah sunar teli musahar turha bhar gond lunia mali nat dhanuk kewat tiar harijan tanti ///
	tattama gaderia jogi rajwar dosadh kalwar khatri chaupal santhal mochi chik banjara godhi rawat
	
	// List of Muslim Castes (without other)
	local muslim_caste_woth syed sheikh khan pathan ansari julaha mallick kasaai dhunia rangrez pamaria chik nat darzi rayeen thakurai ///
	dafali nadaf dhobi churihar qureshi shah pathan	ansari sain hawari abdal malakar shershahbadia mirasi jat safi nalband

	// List of Ways of Payment of Bills in PSS or to Franchisee (without other)
	local pay_way_woth bill_collector deposit_site
	
	// List of Ways of Payment of Bills in PSS or to Franchisee
	local pay_way bill_collector deposit_site other

	// List of Sources of Advertisement 
	local adv_src radio newspaper television word_of_mouth other
	
	// List of Sources of Advertisement (without other)
	local adv_src_woth radio newspaper television word_of_mouth

	// List of Variable for Checking Outliers
	local outlier_var b2_rent b5_house_area_value_sqft b7_building_area_value_sqft b10_land_extra_value_sqft d5_bpl_red_card_count ///
	i11_org_meet_duration_day d5_bpl_yellow_card_count d8_mgnrega_workdays_count i14_gridelec_percent i18_meter_tamper_percent ///
	i21_hooking_penal_percent i22_bribe_percent i13_neighbor_interact_time_day i19_meter_tamper_penal_percent i20_hooking_percent ///
	j2_high_exp_lastyear_value j4_low_exp_lastyear_value j8_high_inc_lastyear_value j10_low_inc_lastyear_value j12_earn_lastmonth ///
	e9_genset_exp_monthly e10_genset_shared_people e11_genset_shared_cost_amount e12_genset_shared_exp_monthly i23_bribe_penal_percent ///
	e17_solar_shared_cost e18_solar_shared_exp e49_franchise_pss_distance_val_m e50_franchise_pss_time_value_min f25_complaint_resolve_day ///
	e6_genset_capacity_kW e8_genset_cost d5_bpl_green_card_count e9_diesel_cost
	
	// List of BPL Cards
	local bpl_card red yellow green
