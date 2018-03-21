/***********************************************************
Project: BEP

Purpose: Baseline household survey data variables' renaming

Author:  Azhar Hussain

Date  :  30 March, 2015
************************************************************/



* INCLUDING MACROS

	include locals_hh.do
	
	
* RENAMING VARIABLES
	
	//// Section - 0 [General Information]
	rename parent_key _survey_parent_id
	rename submissiondate _survey_submission_datetime
	rename starttime _survey_start_datetime
	rename endtime _survey_end_datetime
	rename deviceid _survey_device_id
	rename subscriberid _survey_subscriber_id
	rename simid _sim_id
	rename have_ques _resp_questions
	rename grp12satis_ans _sur_answers
	rename grp12consent _verbal_consent
	rename hh_id _household_id
	rename village_id1 _district_id
	rename village_id2 _pss_id
	rename village_id3 _feeder_id
	rename village_id4 _area_id
	rename district _district_name
	rename pss _pss_name
	rename feeder _feeder_name
	rename area _area_name
	rename areaid _area_id_complete
	rename areatype _area_type
	rename grp2pin_code _pin_code
	rename visits _visit_number
	rename surveyor_name _surveyor_name
	rename surveyor_code _surveyor_code
	rename supervisor_code _supervisor_code
	rename metainstanceid _survey_metainstance_id
	rename duphh _duplicate_survey
	rename dupIDs _duplicate_parent_key
	rename grp3gps_latiaccuracy _gps_accuracy
	rename grp3gps_latialtitude _gps_altitude
	rename grp3gps_latilatitude _gps_latitude
	rename grp3gps_latilongitude _gps_longitude

	//// Section - A [Information about family members of the household]
	foreach i of numlist 1/32 {
		rename grp13age`i' a1_family_mem_age`i'
		rename grp13sex`i' a2_family_mem_sex`i'
		rename grp13relation`i' a3_family_mem_relation`i'
		rename grp13literate`i' a4_family_mem_education`i'
		rename grp13atten_sch`i' a5_family_mem_school`i'
		rename grp13occupation`i' a6_family_mem_occupation`i'
		rename occupation_oth`i' a7_family_mem_occupation_other`i'
	}
	rename consent_1grp14boy a_boy_count
	rename consent_1grp14girl a_girl_count
	rename num_adult_male a_adult_male_count
	rename num_adult_female a_adult_female_count

	//// Section - B [Information about house and other resources]
	rename consent_1grp15b1 b1_house_own
	rename consent_1b1_oth b1_house_own_other
	rename consent_1grp17b2 b2_rent
	rename consent_1grp17b3 b3_house_type
	rename consent_1grp17b4 b4_roof_type
	rename consent_1grp18b4_oth b4_roof_type_other
	rename consent_1grp18b5 b5_house_area_value
	rename consent_1grp18b5_unit b5_house_area_unit
	rename consent_1b5_unit_oth b5_house_area_unit_other
	rename consent_1b6 b6_land_cover
	rename consent_1grp19b7_num b7_building_area_value
	rename consent_1grp19b7_unit b7_building_area_unit
	rename consent_1b7_unit_oth b7_building_area_unit_other
	rename consent_1grp20b8_bedroom b8_bedroom_count
	rename consent_1grp20b8_living_area b8_living_count
	rename consent_1grp20b8_kitchen b8_kitchen_count
	rename consent_1grp20b8_toilet b8_toilet_count
	rename consent_1grp20b8_oth b8_other_count
	rename consent_1grp21b9_land b9_land_extra
	rename consent_1grp22b10_land_size b10_land_extra_value
	rename consent_1grp22b10_unit b10_land_extra_unit
	rename consent_1b10_unit_oth b10_land_extra_unit_other
	rename consent_1b11_own b11_livestock_own
	rename consent_1grp23b12 b12_animals_list
	rename consent_1grp23b12_cow b12_cow_count
	rename consent_1grp23b12_bufflow b12_buffalo_count
	rename consent_1grp23b12_bullock b12_bullock_count
	rename consent_1grp23b12_goat b12_goat_count
	rename consent_1grp23b12_chicken b12_chicken_count
	rename consent_1grp23b12_horse b12_horsedonkey_count
	rename consent_1grp23b12_pig b12_pig_count
	rename consent_1b12_oth b12_animals_list_other
	
	//// Section - C [Information about household assets]
	rename consent_1c_cook c1_cooking_asset_list
	rename consent_1mud_chulac1_1 c1_mud_chulah_count
	rename consent_1mud_chulac1_2 c1_mud_chulah_buy_time
	rename consent_1mud_chulac1_3 c1_mud_chulah_resale_value
	rename consent_1smokelessc2_1 c1_smokeless_chulah_count
	rename consent_1smokelessc2_2 c1_smokeless_chulah_buy_time
	rename consent_1smokelessc2_3 c1_smokeless_chulah_resale_value
	rename consent_1kerosenec3_1 c1_kerosene_stove_count
	rename consent_1kerosenec3_2 c1_kerosene_stove_buy_time
	rename consent_1kerosenec3_3 c1_kerosene_stove_resale_value
	rename consent_1lpgc4_1 c1_lpg_stove_count
	rename consent_1lpgc4_2 c1_lpg_stove_buy_time
	rename consent_1lpgc4_3 c1_lpg_stove_resale_value
	rename consent_1utensilc5_1 c1_utensil_count
	rename consent_1utensilc5_2 c1_utensil_buy_time
	rename consent_1utensilc5_3 c1_utensil_resale_value
	rename consent_1cookerc6_1 c1_pressure_cooker_count
	rename consent_1cookerc6_2 c1_pressure_cooker_buy_time
	rename consent_1cookerc6_3 c1_pressure_cooker_resale_value
	rename consent_1toasterc7_1 c1_toaster_count
	rename consent_1toasterc7_2 c1_toaster_buy_time
	rename consent_1toasterc7_3 c1_toaster_resale_value
	rename consent_1mixerc8_1 c1_mixer_grinder_count
	rename consent_1mixerc8_2 c1_mixer_grinder_buy_time
	rename consent_1mixerc8_3 c1_mixer_grinder_resale_value
	rename consent_1ovenc9_1 c1_microwave_oven_count
	rename consent_1ovenc9_2 c1_microwave_oven_buy_time
	rename consent_1ovenc9_3 c1_microwave_oven_resale_value
	rename consent_1oth_specify1oth_specify c1_other_count
	rename v139 c1_other_buy_time
	rename v140 c1_other_resale_value
	rename consent_1c_entertain c2_entertainment_asset_list
	rename consent_1camc10_1 c2_camera_count
	rename consent_1camc10_2 c2_camera_buy_time
	rename consent_1camc10_3 c2_camera_resale_value
	rename consent_1tvc11_1 c2_television_count
	rename consent_1tvc11_2 c2_television_buy_time
	rename consent_1tvc11_3 c2_television_resale_value
	rename consent_1compc12_1 c2_desktop_count
	rename consent_1compc12_2 c2_desktop_buy_time
	rename consent_1compc12_3 c2_desktop_resale_value
	rename consent_1laptopc13_1 c2_laptop_count
	rename consent_1laptopc13_2 c2_laptop_buy_time
	rename consent_1laptopc13_3 c2_laptop_resale_value
	rename consent_1radioc14_1 c2_radio_count
	rename consent_1radioc14_2 c2_radio_buy_time
	rename consent_1radioc14_3 c2_radio_resale_value
	rename consent_1oth_specify2oth_specify c2_other_count
	rename v164 c2_other_buy_time
	rename v165 c2_other_resale_value
	rename consent_1c_furniture c3_appliance_asset_list
	rename consent_1almirahc15_1 c3_almirah_count
	rename consent_1almirahc15_2 c3_almirah_buy_time
	rename consent_1almirahc15_3 c3_almirah_resale_value
	rename consent_1sleep_bedc16_1 c3_bed_count
	rename consent_1sleep_bedc16_2 c3_bed_buy_time
	rename consent_1sleep_bedc16_3 c3_bed_resale_value
	rename consent_1sew_machc17_1 c3_nonelec_sew_mach_count
	rename consent_1sew_machc17_2 c3_nonelec_sew_mach_buy_time
	rename consent_1sew_machc17_3 c3_nonelec_sew_mach_resale_value
	rename consent_1elec_sew_machc18_1 c3_elec_sew_mach_count
	rename consent_1elec_sew_machc18_2 c3_elec_sew_mach_buy_time
	rename consent_1elec_sew_machc18_3 c3_elec_sew_mach_resale_value
	rename consent_1coolerc19_1 c3_air_cooler_count
	rename consent_1coolerc19_2 c3_air_cooler_buy_time
	rename consent_1coolerc19_3 c3_air_cooler_resale_value
	rename consent_1acc20_1 c3_air_conditioner_count
	rename consent_1acc20_2 c3_air_conditioner_buy_time
	rename consent_1acc20_3 c3_air_conditioner_resale_value
	rename consent_1heaterc21_1 c3_heater_count
	rename consent_1heaterc21_2 c3_heater_buy_time
	rename consent_1heaterc21_3 c3_heater_resale_value
	rename consent_1ironc22_1 c3_electric_iron_count
	rename consent_1ironc22_2 c3_electric_iron_buy_time
	rename consent_1ironc22_3 c3_electric_iron_resale_value
	rename consent_1wash_machc23_1 c3_washing_machine_count
	rename consent_1wash_machc23_2 c3_washing_machine_buy_time
	rename consent_1wash_machc23_3 c3_washing_machine_resale_value
	rename consent_1purifierc24_1 c3_water_purifier_count
	rename consent_1purifierc24_2 c3_water_purifier_buy_time
	rename consent_1purifierc24_3 c3_water_purifier_resale_value
	rename consent_1rodc25_1 c3_immersion_rod_count
	rename consent_1rodc25_2 c3_immersion_rod_buy_time
	rename consent_1rodc25_3 c3_immersion_rod_resale_value
	rename consent_1geyserc26_1 c3_geyser_count
	rename consent_1geyserc26_2 c3_geyser_buy_time
	rename consent_1geyserc26_3 c3_geyser_resale_value
	rename consent_1ceil_fanc27_1 c3_ceiling_fan_count
	rename consent_1ceil_fanc27_2 c3_ceiling_fan_buy_time
	rename consent_1ceil_fanc27_3 c3_ceiling_fan_resale_value
	rename consent_1tab_fanc28_1 c3_table_fan_count
	rename consent_1tab_fanc28_2 c3_table_fan_buy_time
	rename consent_1tab_fanc28_3 c3_table_fan_resale_value
	rename consent_1bulbc29_1 c3_bulb_cfl_count
	rename consent_1bulbc29_2 c3_bulb_cfl_buy_time
	rename consent_1bulbc29_3 c3_bulb_cfl_resale_value
	rename consent_1tubec30_1 c3_tube_light_count
	rename consent_1tubec30_2 c3_tube_light_buy_time
	rename consent_1tubec30_3 c3_tube_light_resale_value
	rename consent_1refrigeratorc31_1 c3_refrigerator_count
	rename consent_1refrigeratorc31_2 c3_refrigerator_buy_time
	rename consent_1refrigeratorc31_3 c3_refrigerator_resale_value
	rename consent_1oth_specify3oth_specify c3_other_count
	rename v237 c3_other_buy_time
	rename v238 c3_other_resale_value
	rename consent_1c_trans c4_transport_asset_list
	rename consent_1cyclec31_cycle_have c4_bicycle_count
	rename consent_1cyclec31_cycle_buy c4_bicycle_buy_time
	rename consent_1cyclec31_cycle_total_pa c4_bicycle_resale_value
	rename consent_1scooterc32_1 c4_two_wheeler_count
	rename consent_1scooterc32_2 c4_two_wheeler_buy_time
	rename consent_1scooterc32_3 c4_two_wheeler_resale_value
	rename consent_1tractorc33_1 c4_tractor_count
	rename consent_1tractorc33_2 c4_tractor_buy_time
	rename consent_1tractorc33_3 c4_tractor_resale_value
	rename consent_1carc34_1 c4_four_wheeler_count
	rename consent_1carc34_2 c4_four_wheeler_buy_time
	rename consent_1carc34_3 c4_four_wheeler_resale_value
	rename consent_1cartc35_1 c4_animal_cart_count
	rename consent_1cartc35_2 c4_animal_cart_buy_time
	rename consent_1cartc35_3 c4_animal_cart_resale_value
	rename consent_1oth_specify4oth_specify c4_other_count
	rename v262 c4_other_buy_time
	rename v263 c4_other_resale_value
	rename consent_1c_items c5_miscellaneous_asset_list
	rename consent_1clockc36_1 c5_wall_clock_count
	rename consent_1clockc36_2 c5_wall_clock_buy_time
	rename consent_1clockc36_3 c5_wall_clock_resale_value
	rename consent_1watchc37_1 c5_wrist_watch_count
	rename consent_1watchc37_2 c5_wrist_watch_buy_time
	rename consent_1watchc37_3 c5_wrist_watch_resale_value
	rename consent_1torchc38_1 c5_torch_count
	rename consent_1torchc38_2 c5_torch_buy_time
	rename consent_1torchc38_3 c5_torch_resale_value
	rename consent_1pumpc39_1 c5_hand_pump_count
	rename consent_1pumpc39_2 c5_hand_pump_buy_time
	rename consent_1pumpc39_3 c5_hand_pump_resale_value
	rename consent_1land_linec40_1 c5_landline_phone_count
	rename consent_1land_linec40_2 c5_landline_phone_buy_time
	rename consent_1land_linec40_3 c5_landline_phone_resale_value
	rename consent_1cell_phnc41_1 c5_mobile_phone_count
	rename consent_1cell_phnc41_2 c5_mobile_phone_buy_time
	rename consent_1cell_phnc41_3 c5_mobile_phone_resale_value
	rename consent_1oth_specify5oth_specify c5_other_count
	rename v291 c5_other_buy_time
	rename v292 c5_other_resale_value

	//// Section - D [Information about the family]
	rename consent_1d1 d1_religion
	rename consent_1d1_oth d1_religion_other
	rename consent_1category d2_social_cat
	rename consent_1category_oth d2_social_cat_other
	rename consent_1d3a d3a_hindu_caste
	rename consent_1d3a_oth d3a_hindu_caste_other
	rename consent_1d3b d3b_muslim_caste
	rename consent_1d3b_oth d3b_muslim_caste_other
	rename consent_1d4_bpl d4_bpl_family
	rename consent_1grp70d5_info d5_bpl_card
	rename consent_1grp70d5_red d5_bpl_red_card_count
	rename consent_1grp70d5_yellow d5_bpl_yellow_card_count
	rename consent_1grp70d5_green d5_bpl_green_card_count
	rename consent_1grp70d6 d6_mgnrega_card
	rename consent_1grp70d7 d7_mgnrega_job
	rename consent_1grp71d8 d8_mgnrega_workdays_count
	rename consent_1grp71d9 d9_more_workdays_want
	rename consent_1d10 d10_no_more_workdays_reason
	rename consent_1d9_oth d10_no_more_work_reason_other

	//// Section - E [Inforation about electricity sources, metering and billing situation of the household]
	rename elec_any e1_elec_any
	rename consent_1e2_to_e4grp73e2 e2_elec_past
	rename consent_1e2_to_e4grp73e3_reason e3_noelec_reason
	rename consent_1e2_to_e4e3_reason_oth e3_noelec_reason_other
	rename consent_1e2_to_e4e4 e4_elec_source
	rename consent_1e2_to_e4e4_oth e4_elec_source_other
	rename elec_generator e5_elec_genset
	rename consent_1e5_to_e54e6_to_e12e6_gr e6_genset_capacity
	rename v323 e6_genset_unit
	rename consent_1e5_to_e54e6_to_e12e7 e7_genset_shared
	rename consent_1e5_to_e54e6_to_e12e7_ot e7_genset_shared_other
	rename consent_1e5_to_e54e6_to_e12e8_to e8_genset_cost
	rename v327 e9_genset_exp
	rename consent_1e5_to_e54e6_to_e12e9_gr e9_genset_exp_rupee
	rename v329 e9_genset_exp_litre
	rename v330 e9_diesel_cost
	rename consent_1e5_to_e54e6_to_e12grp77 e10_genset_shared_people
	rename v332 e11_genset_shared_cost
	rename consent_1e5_to_e54e6_to_e12e11_g e11_genset_shared_cost_amount
	rename consent_1e5_to_e54e6_to_e12e12_d e12_genset_shared_exp
	rename consent_1e5_to_e54e6_to_e12e12e1 e12_genset_shared_exp_amount
	rename v336 e12_genset_shared_exp_unit
	rename consent_1e5_to_e54e6_to_e12e12_u e12_genset_shared_exp_unit_other
	rename elec_solar e13_elec_solar
	rename consent_1e5_to_e54e14_to_e18e14 e14_solar_owner
	rename consent_1e5_to_e54e14_to_e18e15 e15_solar_cost
	rename consent_1e5_to_e54e14_to_e18e16 e16_solar_shared
	rename consent_1e5_to_e54e14_to_e18e17 e17_solar_shared_cost
	rename consent_1e5_to_e54e14_to_e18e18 e18_solar_shared_exp
	rename elec_grid e19_elec_grid
	rename cons_metered e20_metered_consumer
	rename consent_1e5_to_e54e20_to_e54e21 e21_meter_functional
	rename consent_1e5_to_e54e20_to_e54e22 e22_meter_damage_date
	rename consent_1e5_to_e54e20_to_e54e23 e23_meter_complaint
	rename consent_1e5_to_e54e20_to_e54e24 e24_meter_complaint_location
	rename consent_1e5_to_e54e20_to_e54e24_ e24_meter_complaint_loc_other
	rename consent_1e5_to_e54e20_to_e54e25 e25_meter_noncomplaint
	rename consent_1e5_to_e54e20_to_e54e25_ e25_meter_noncomplaint_other
	rename consent_1e5_to_e54e20_to_e54e26 e26_meter_location
	rename consent_1e5_to_e54e20_to_e54e26_ e26_meter_location_other
	rename consent_1e5_to_e54e20_to_e54e27 e27_meter_outside_readibility
	rename consent_1e5_to_e54e20_to_e54e28 e28_meter_installation_date
	rename consent_1e5_to_e54e20_to_e54e29 e29_meter_read
	rename consent_1e5_to_e54e20_to_e54e29_ e29_meter_read_date
	rename consent_1e5_to_e54e20_to_e54e30 e30_connection_type
	rename consent_1e5_to_e54e20_to_e54e31 e31_single_phase_meter
	rename consent_1e5_to_e54e20_to_e54e32 e32_three_phase_meter
	rename v364 e33_consumers_receive_bill
	rename v365 e34_consumers_billed
	rename consent_1e5_to_e54e20_to_e54e34_ e34_consumers_billed_date
	rename consent_1e5_to_e54e20_to_e54e35 e35_consumers_bill_month
	rename consent_1e5_to_e54e20_to_e54e35_ e35_consumers_bill_month_other
	rename consent_1e5_to_e54e20_to_e54e36 e36_bill_availability
	rename consent_1e5_to_e54e20_to_e54e37 e37_bill_consumer_number
	rename consent_1e5_to_e54e20_to_e54e38 e38_know_consumer_number
	rename consent_1e5_to_e54e20_to_e54e37_ e38_ask_consumer_number
	rename consent_1e5_to_e54e20_to_e54e39 e39_correct_billing
	rename consent_1e5_to_e54e20_to_e54e40 e40_wrong_billing_month
	rename consent_1e5_to_e54e20_to_e54e39_ e40_wrong_billing_year
	rename consent_1e5_to_e54e20_to_e54e41 e41_bill_receive_frequency
	rename consent_1e5_to_e54e20_to_e54e41_ e41_bill_receive_frequency_other
	rename consent_1e5_to_e54e20_to_e54e42 e42_bill_not_received_action
	rename consent_1e5_to_e54e20_to_e54e42_ e42_bill_not_received_act_other
	rename consent_1e5_to_e54e20_to_e54e43 e43_last_bill_pay_lastmonth
	rename consent_1e5_to_e54e20_to_e54e43_ e43_last_bill_pay_year
	rename v382 e44_last_bill_pay_amount
	rename v383 e45_bill_pay_frequency
	rename v384 e45_bill_pay_frequency_other
	rename v385 e46_bill_pay_location
	rename v386 e46_bill_pay_location_other
	rename v387 e47_bill_pay_pss_type
	rename v388 e47_bill_pay_pss_type_other
	rename v389 e48_bill_pay_franchise_type
	rename v390 e48_bill_pay_franch_type_other
	rename v391 e49_franchise_pss_distance_val
	rename v392 e49_franchise_pss_distance_unit
	rename v393 e50_franchise_pss_time_value
	rename v394 e50_franchise_pss_time_unit
	rename v395 e51_rationshop_owner_rating
	rename v396 e52_know_bill_collector_name
	rename v397 e52_bill_collector_name
	rename v398 e53_bill_collector_rating
	rename v399 e54_postoffice_clerk_rating

	//// Section - F [Information about electricity supply situation]
	rename consent_1e5_to_e54e20_to_e54f1 f1_grid_elec_date
	rename v404 f2_avg_gridelec_perday
	rename v407 f2_gridelec_5pmto11pm
	rename v405 f2_gridelec_7amto12pm
	rename v408 f2_gridelec_11pmto7am
	rename v406 f2_gridelec_12pmto5pm
	rename consent_1e5_to_e54e20_to_e54f3_t f2_sum_of_slots
	rename consent_1e5_to_e54e20_to_e54f3 f3_power_outage_lastmonth
	rename consent_1e5_to_e54e20_to_e54f5f4 f4_power_outage_day_count
	rename v418 f4_power_outage_hour_count
	rename consent_1e5_to_e54e20_to_e54f6_t f5_power_outage_expected
	rename v420 f6_know_power_outage_reason
	rename v421 f7_voltage_drop_lastmonth
	rename v423 f8_voltage_drop_day_count
	rename v424 f8_voltage_drop_hour_count
	rename v426 f9_energy_advertisement
	rename consent_1e5_to_e54e20_to_e54f10 f10_advertisement_source
	rename consent_1e5_to_e54e20_to_e54f10_ f10_advertisement_source_other
	rename consent_1e5_to_e54e20_to_e54f11 f11_know_ots_scheme
	rename consent_1e5_to_e54e20_to_e54f12 f12_avail_ots
	rename consent_1e5_to_e54e20_to_e54f13 f13_mobile_phone_access
	rename v433 f14i_subs_bill_amount_alert
	rename v434 f14ii_subs_pay_date_alert
	rename v435 f14iii_subs_biller_visit_alert
	rename v437 f15_elec_future_expect
	rename v438 f16_elec_supply_factor
	rename consent_1e5_to_e54e20_to_e54f16_ f16_elec_supply_factor_other
	rename v440 f17_elec_neighbour_hour
	rename v441 f18_elec_neighbour_hour_change
	rename consent_1e5_to_e54e20_to_e54f19 f19_neighbour_hour_change_reason
	rename consent_1e5_to_e54e20_to_e54f19_ f19_neigh_hr_change_reason_other
	rename consent_1e5_to_e54e20_to_e54f20 f20_maintenance_complaint
	rename v445 f21_maintenance_complaint_reason
	rename v446 f21_main_complaint_reason_other
	rename v447 f22_maintenance_complaint_lodge
	rename v448 f23_main_complaint_lodge_who
	rename v449 f23_complaint_lodge_who_other
	rename v450 f24_lineman_pay
	rename v451 f25_complaint_resolve
	rename v452 f25_complaint_resolve_day

	//// Section - G [Information about different energy sources used in the household]
	rename consent_1secgg_alternate g1_alternate_energy_src_list
	rename consent_1secgkerokero_hrs g2_kerosene_use_hour
	rename consent_1secgkerokero_days g3_kerosene_use_day
	rename consent_1secgkerokero_quantity g4_kerosene_use_quantity
	rename consent_1secgkerokero_price g5_kerosene_unit_price
	rename consent_1secgkerokero_exp g6_kerosene_exp_month
	rename consent_1secgbatterytor_hrs g2_battery_use_hour
	rename consent_1secgbatterytor_days g3_battery_use_day
	rename consent_1secgbatterytor_quantity g4_battery_use_quantity
	rename consent_1secgbatterytor_price g5_battery_unit_price
	rename consent_1secgbatterytor_exp g6_battery_exp_month
	rename consent_1secgcandlescand_hrs g2_candle_use_hour
	rename consent_1secgcandlescand_days g3_candle_use_day
	rename consent_1secgcandlescand_quant g4_candle_use_quantity
	rename consent_1secgcandlescand_price g5_candle_unit_price
	rename consent_1secgcandlescand_exp g6_candle_exp_month
	rename consent_1secgsolarpan1_hrs g2_own_solar_use_hour
	rename consent_1secgsolarpan1_days g3_own_solar_use_day
	rename consent_1secgsolarpan1_quant g4_own_solar_use_quantity
	rename consent_1secgsolarpan1_price g5_own_solar_unit_price
	rename consent_1secgsolarpan1_exp g6_own_solar_exp_month
	rename consent_1secgpanelpan2_hrs g2_shared_solar_use_hour
	rename consent_1secgpanelpan2_days g3_shared_solar_use_day
	rename consent_1secgpanelpan2_quant g4_shared_solar_use_quantity
	rename consent_1secgpanelpan2_price g5_shared_solar_unit_price
	rename consent_1secgpanelpan2_exp g6_shared_solar_exp_month
	rename consent_1secgbiogengen1_hrs g2_own_bio_genset_use_hour
	rename consent_1secgbiogengen1_days g3_own_bio_genset_use_day
	rename consent_1secgbiogengen1_quant g4_own_bio_genset_use_quantity
	rename consent_1secgbiogengen1_price g5_own_bio_genset_unit_price
	rename consent_1secgbiogengen1_exp g6_own_bio_genset_exp_month
	rename consent_1secgdiesgengen2_hrs g2_own_die_genset_use_hour
	rename consent_1secgdiesgengen2_days g3_own_die_genset_use_day
	rename consent_1secgdiesgengen2_quant g4_own_die_genset_use_quantity
	rename consent_1secgdiesgengen2_price g5_own_die_genset_unit_price
	rename consent_1secgdiesgengen2_exp g6_own_die_genset_exp_month
	rename consent_1secggen_sharedshare_hrs g2_shared_genset_use_hour
	rename consent_1secggen_sharedshare_day g3_shared_genset_use_day
	rename consent_1secggen_sharedshare_qua g4_shared_genset_use_quantity
	rename consent_1secggen_sharedshare_pri g5_shared_genset_unit_price
	rename consent_1secggen_sharedshare_exp g6_shared_genset_exp_month
	rename consent_1secginvertinvert_hrs g2_invertor_use_hour
	rename consent_1secginvertinvert_days g3_invertor_use_day
	rename consent_1secginvertinvert_quant g4_invertor_use_quantity
	rename consent_1secginvertinvert_price g5_invertor_unit_price
	rename consent_1secginvertinvert_exp g6_invertor_exp_month
		
	//// Section - H [Information about apliances used in the household]
	// Bedroom
	rename consent_1h_secsection_hhb0_have hb0_have_bedroom
	rename consent_1h_sechb1_elec hb1_have_elec_bedroom
	rename consent_1h_sechb2_bulb hb2_bulb_count_bedroom
	rename consent_1h_sechb3_tube hb3_cfl_count_bedroom
	rename consent_1h_sechb4_cfl hb4_tubelight_count_bedroom
	rename consent_1h_sechb5_plug hb5_plug_count_bedroom
	rename consent_1h_secelec_applianceappl hb7_appliance_plug_list
	local i 528
	while `i'<567 {
		foreach var in `appliance' {
			rename v`i' hb7_`var'_daily_usage
			local i = `i'+2
		}
	}
	rename consent_1h_secelect_deviceappli3 hb7_appliance_plug_list_other
	rename v568 hb8_appliance_unplug_list
	rename consent_1h_secother_dev4oth_dev4 hb8_appliance_unplug_list_other
	rename consent_1h_secrodsavg_use_hr consent_1h_secrods1avg_use_hr
	foreach var in `appliance_woth' {
		rename consent_1h_sec`var'1avg_u* hb8_`var'_daily_usage
	}
	rename consent_1h_secother_dev4avg_use_ hb8_other_daily_usage
	egen max_bulb_bedroom=max(hb2_bulb_count_bedroom)
	egen max_cfl_bedroom=max(hb3_cfl_count_bedroom)
	egen max_tube_bedroom=max(hb4_tubelight_count_bedroom)
	local j 1
	while `j'<=max_bulb_bedroom {
		rename h_spec_watt_bbulb_rating`j' hb6_bedroom_bulb`j'_rating
		rename h_avg_use_bbulb_rating`j' hb6_bedroom_bulb`j'_usage
		local j = `j'+1
	}
	local k 1
	while `k'<=max_cfl_bedroom {
		rename h_spec_watt_bcfl_rating`k' hb6_bedroom_cfl`k'_rating
		rename h_avg_use_bcfl_rating`k' hb6_bedroom_cfl`k'_usage
		local k = `k'+1
	}
	local l 1
	while `l'<=max_tube_bedroom {
		rename h_spec_watt_btube_rating`l' hb6_bedroom_tubelight`l'_rating
		rename h_avg_use_btube_rating`l' hb6_bedroom_tubelight`l'_usage
		local l = `l'+1
	}
	// Kitchen
	rename consent_1h_seckitchenshk0_have hk0_have_kitchen
	rename consent_1h_sechk1_elec hk1_have_elec_kitchen
	rename consent_1h_sechk2_bulb hk2_bulb_count_kitchen
	rename consent_1h_sechk3_cfl hk3_cfl_count_kitchen
	rename consent_1h_sechk4_tube hk4_tubelight_count_kitchen
	rename consent_1h_sechk5_plug hk5_plug_count_kitchen
	rename consent_1h_secelec_appliance1app hk7_appliance_plug_list
	local i 625
	while `i'<664 {
		foreach var in `appliance' {
			rename v`i' hk7_`var'_daily_usage
			local i = `i'+2
		}
	}
	rename  consent_1h_secelect_device1appli  hk7_appliance_plug_list_other
	rename v665 hk8_appliance_unplug_list
	rename consent_1h_secother_dev3oth_dev3 hk8_appliance_unplug_list_other
	foreach var in `appliance_woth' {
		rename consent_1h_sec`var'3avg_u* hk8_`var'_daily_usage
	}
	rename consent_1h_secother_dev3avg_use_ hk8_other_daily_usage
	egen max_bulb_kitchen=max(hk2_bulb_count_kitchen)
	egen max_cfl_kitchen=max(hk3_cfl_count_kitchen)
	egen max_tube_kitchen=max(hk4_tubelight_count_kitchen)
	local j 1
	while `j'<=max_bulb_kitchen {
		rename h_spec_watt_kbulb_rating1`j' hk6_kitchen_bulb`j'_rating
		rename h_avg_use_kbulb_rating1`j' hk6_kitchen_bulb`j'_usage
		local j = `j'+1
	}
	local k 1
	while `k'<=max_cfl_kitchen {
		rename h_spec_watt_kcfl_rating1`k' hk6_kitchen_cfl`k'_rating
		rename h_avg_use_kcfl_rating1`k' hk6_kitchen_cfl`k'_usage
		local k = `k'+1
	}
	local l 1
	while `l'<=max_tube_kitchen {
		rename h_spec_watt_ktube_rating1`l' hk6_kitchen_tubelight`l'_rating
		rename h_avg_use_ktube_rating1`l' hk6_kitchen_tubelight`l'_usage
		local l = `l'+1
	}
	// Living area
	rename consent_1h_secliving_areahd0_hav hl0_have_livingarea
	rename consent_1h_sechd1_elec hl1_have_elec_livingarea
	rename consent_1h_sechd2_bulb hl2_bulb_count_livingarea
	rename consent_1h_sechd3_cfl hl3_cfl_count_livingarea
	rename consent_1h_sechd4_tube hl4_tubelight_count_livingarea
	rename consent_1h_sechd5_plug hl5_plug_count_livingarea
	rename consent_1h_secelec_appliance2app hl7_appliance_plug_list
	local i 723
	while `i'<762 {
		foreach var in `appliance' {
			rename v`i' hl7_`var'_daily_usage
			local i = `i'+2
		}
	}
	rename consent_1h_secelect_device2appli hl7_appliance_plug_list_other
	rename v763 hl8_appliance_unplug_list
	rename consent_1h_secother_dev1oth_dev1 hl8_appliance_unplug_list_other
	foreach var in `appliance_woth' {
		rename consent_1h_sec`var'5avg_u* hl8_`var'_daily_usage
	}
	rename consent_1h_secother_dev1avg_use_ hl8_other_daily_usage
	egen max_bulb_livingarea=max(hl2_bulb_count_livingarea)
	egen max_cfl_livingarea=max(hl3_cfl_count_livingarea)
	egen max_tube_livingarea=max(hl4_tubelight_count_livingarea)
	local j 1
	while `j'<=max_bulb_livingarea {
		rename h_spec_watt_lbulb_rating2`j' hl6_livingarea_bulb`j'_rating
		rename h_avg_use_lbulb_rating2`j' hl6_livingarea_bulb`j'_usage
		local j = `j'+1
	}
	local k 1
	while `k'<=max_cfl_livingarea {
		rename h_spec_watt_lcfl_rating2`k' hl6_livingarea_cfl`k'_rating
		rename h_avg_use_lcfl_rating2`k' hl6_livingarea_cfl`k'_usage
		local k = `k'+1
	}
	local l 1
	while `l'<=max_tube_livingarea {
		rename h_spec_watt_ltube_rating2`l' hl6_livingarea_tubelight`l'_rating
		rename h_avg_use_ltube_rating2`l' hl6_livingarea_tubelight`l'_usage
		local l = `l'+1
	}
	// Toilet
	rename consent_1h_sectoiletsht0_have ht0_have_toilet
	rename consent_1h_secht1_elec ht1_have_elec_toilet
	rename consent_1h_secht2_bulb ht2_bulb_count_toilet
	rename consent_1h_secht3_cfl ht3_cfl_count_toilet
	rename consent_1h_secht4_tube ht4_tubelight_count_toilet
	rename consent_1h_secht5_plug ht5_plug_count_toilet
	rename consent_1h_secelec_appliance3app ht7_appliance_plug_list
	local i 820
	while `i'<859 {
		foreach var in `appliance' {
			rename v`i' ht7_`var'_daily_usage
			local i = `i'+2
		}
	}
	rename v860 ht8_appliance_unplug_list
	rename consent_1h_secother_devoth_dev ht8_appliance_unplug_list_other
	foreach var in `appliance_woth' {
		rename consent_1h_sec`var'7avg_u* ht8_`var'_daily_usage
	}
	rename consent_1h_secother_devavg_use_o ht8_other_daily_usage
	egen max_bulb_toilet=max(ht2_bulb_count_toilet)
	egen max_cfl_toilet=max(ht3_cfl_count_toilet)
	egen max_tube_toilet=max(ht4_tubelight_count_toilet)
	local j 1
	while `j'<=max_bulb_toilet {
		rename h_spec_watt_tbulb_rating3`j' ht6_toilet_bulb`j'_rating
		rename h_avg_use_tbulb_rating3`j' ht6_toilet_bulb`j'_usage
		local j = `j'+1
	}
	local k 1
	while `k'<=max_cfl_toilet {
		rename h_spec_watt_tcfl_rating3`k' ht6_toilet_cfl`k'_rating
		rename h_avg_use_tcfl_rating3`k' ht6_toilet_cfl`k'_usage
		local k = `k'+1
	}
	local l 1
	while `l'<=max_tube_toilet {
		rename h_spec_watt_ttube_rating3`l' ht6_toilet_tubelight`l'_rating
		rename h_avg_use_ttube_rating3`l' ht6_toilet_tubelight`l'_usage
		local l = `l'+1
	}
	
	//// Section - I [Information related to the neighborhood]
	rename consent_1seciintro_ii1_lang i1_mother_tongue
	rename consent_1secii1_oth i1_mother_tongue_other
	rename consent_1secii2_to_i3i2_choice i2_read_newspaper
	rename consent_1secii2_to_i3i3_safe i3_local_safety
	rename consent_1seciqi4_to_qi9qi4_i8 i4_local_politics_list
	rename consent_1seciqi4 i5_vote_local_election_year
	rename consent_1seciqi5 i6_vote_state_election_year
	rename consent_1seciqi7 i7_interact_representative_year
	rename consent_1seciqi8 i8_attend_protest_year
	rename consent_1secii9_to_i10i10_local i10_member_local_org
	rename consent_1secii10_text i10_member_local_org_other
	rename consent_1secii11i11_meet i11_org_meet_duration
	rename consent_1secii11i11_period i11_org_meet_unit
	rename consent_1secii12_to_i13i12_choic i12_festival_celebration
	rename consent_1secii12_to_i13i13_time i13_neighbor_interact_time
	rename consent_1secii12_to_i13i13_perio i13_neighbor_interact_unit
	rename consent_1secii14i14_have i14_gridelec_percent
	rename consent_1secii15_theft i15_power_theft_case
	rename consent_1secii15_oth i15_power_theft_case_other
	rename consent_1secii15_to_i23i16_theft i16_power_theft_reason
	rename consent_1secii15_to_i23i16_oth i16_power_theft_reason_other
	rename consent_1secii15_to_i23i17_tampe i17_power_theft_method
	rename consent_1secii15_to_i23i17_oth i17_power_theft_method_other
	rename consent_1secii15_to_i23i18_tampe i18_meter_tamper_percent
	rename consent_1secii15_to_i23i19_penal i19_meter_tamper_penal
	rename consent_1secii15_to_i23i20_hooki i20_hooking_percent
	rename consent_1secii15_to_i23i21_penal i21_hooking_penal
	rename consent_1secii15_to_i23i22_bribe i22_bribe_percent
	rename consent_1secii15_to_i23i23_penal i23_bribe_penal

	//// Section - J [Information about income and expenditure of household]
	rename consent_1secjk1_expj1 j1_expenditure_head_list
	rename consent_1secjk1_expexp1 j1_food_exp_lastmonth
	rename consent_1secjk1_expexp2 j1_toiletry_exp_lastmonth
	rename consent_1secjk1_expexp3 j1_maintenance_exp_lastmonth
	rename consent_1secjk1_expexp4 j1_medical_exp_lastmonth
	rename consent_1secjk1_expexp5 j1_education_exp_lastmonth
	rename consent_1secjk1_expexp6 j1_travel_exp_lastmonth
	rename consent_1secjk1_expexp7 j1_phonebill_exp_lastmonth
	rename consent_1secjk1_expexp8 j1_festival_exp_lastmonth
	rename consent_1secjk1_expexp9 j1_occupation_exp_lastmonth
	rename consent_1secjk1_expexp10 j1_elecbill_exp_lastmonth
	rename consent_1secjk1_expexp11 j1_fuel_exp_lastmonth
	rename consent_1secjk1_expexp12 j1_insurance_exp_lastmonth
	rename consent_1secjk1_expexp13 j1_saving_exp_lastmonth
	rename consent_1secjk1_expexp14 j1_servant_exp_lastmonth
	rename consent_1secjk1_expexp_oth j1_other_exp_lastmonth
	rename consent_1secjk2_to_k3k2_amount j2_high_exp_lastyear_value
	rename consent_1secjk2_to_k3k3_month j3_high_exp_lastyear_month
	rename consent_1secjk4_to_k5k4_amount j4_low_exp_lastyear_value
	rename consent_1secjk4_to_k5month_k5 j5_low_exp_lastyear_month
	rename consent_1secjtypes j6_income_source_list
	rename consent_1secjinc1_source j6_agri_inc_src
	rename consent_1secjagriculturemontly_i j6_agri_inc_monthly
	rename consent_1secjagricultureannual_i j6_agri_inc_annual
	rename consent_1secjinc2_source j6_pension_inc_src
	rename consent_1secjpension_incmontly_i j6_pension_inc_monthly
	rename consent_1secjpension_incannual_i j6_pension_inc_annual
	rename consent_1secjinc3_source j6_business_inc_src
	rename consent_1secjsmall_businessmontl j6_business_inc_monthly
	rename consent_1secjsmall_businessannua j6_business_inc_annual
	rename consent_1secjinc4_source j6_job_inc_src
	rename consent_1secjprofessionmontly_in j6_job_inc_monthly
	rename consent_1secjprofessionannual_in j6_job_inc_annual
	rename consent_1secjinc5_source j6_industry_inc_src
	rename consent_1secjsmall_factorymontly j6_industry_inc_monthly
	rename consent_1secjsmall_factoryannual j6_industry_inc_annual
	rename consent_1secjinc6_source j6_transport_inc_src
	rename consent_1secjtransportationmontl j6_transport_inc_monthly
	rename consent_1secjtransportationannua j6_transport_inc_annual
	rename consent_1secjinc7_source j6_construction_inc_src
	rename consent_1secjconstructionmontly_ j6_construction_inc_monthly
	rename consent_1secjconstructionannual_ j6_construction_inc_annual
	rename consent_1secjremitmontly_income j6_remittance_inc_monthly
	rename consent_1secjremitannual_income j6_remittance_inc_annual
	rename consent_1secjrentmontly_income j6_rent_dividend_inc_monthly
	rename consent_1secjrentannual_income j6_rent_dividend_inc_annual
	rename consent_1secjforestmontly_income j6_forest_product_inc_monthly
	rename consent_1secjforestannual_income j6_forest_product_inc_annual
	rename consent_1secjk2k2_regular j7_receive_regular_inc
	rename consent_1secjj8_to_j9k3_amount j8_high_inc_lastyear_value
	rename consent_1secjj8_to_j9k4_month j9_high_inc_lastyear_month
	rename consent_1secjk5_to_k6k5_low j10_low_inc_lastyear_value
	rename consent_1secjk5_to_k6k6_month j11_low_inc_lastyear_month
	rename consent_1secjk7_earn j12_earn_lastmonth
	
	//// Section - K [Information about the daily activities of the household members]
	rename consent_1section_kwak1wakeup1 k1_male_wake_up
	rename consent_1section_kgive1 k1_male_wake_up_time
	rename consent_1section_kleav1work1 k1_male_leave_home
	rename consent_1section_kgive2 k1_male_leave_home_time
	rename consent_1section_kbac1come1 k1_male_back_home
	rename consent_1section_kgive3 k1_male_back_home_time
	rename consent_1section_ksleep11sl k1_male_sleep
	rename consent_1section_kgive4 k1_male_sleep_time
	rename consent_1section_kwak2wakeup2 k2_female_wake_up
	rename consent_1section_kgive5 k2_female_wake_up_time
	rename consent_1section_kleav2work2 k2_female_leave_home
	rename consent_1section_kgive6 k2_female_leave_home_time
	rename consent_1section_kbac2come2 k2_female_back_home
	rename consent_1section_kgive7 k2_female_back_home_time
	rename consent_1section_ksleep21sl1 k2_female_sleep
	rename consent_1section_kgive8 k2_female_sleep_time
	rename consent_1section_kwake31wakeup3 k3_child_wake_up
	rename consent_1section_kgive9 k3_child_wake_up_time
	rename consent_1section_kleave31work3 k3_child_leave_home
	rename consent_1section_kgive10 k3_child_leave_home_time
	rename consent_1section_kback31come3 k3_child_back_home
	rename consent_1section_kgive11 k3_child_back_home_time
	rename consent_1section_ksleep31sl3 k3_child_sleep
	rename consent_1section_kgive12 k3_child_sleep_time
	
	//// Section - L [Reading test for children]
	rename consent_1tot_memb l_read_family_mem_count
	foreach i of numlist 1/10 {
		rename consent_1mem_`i'letters_`i'mist* l4_reader`i'_letter_mistake
		rename consent_1mem_`i'words_`i'mist* l5_reader`i'_word_mistake
		rename consent_1mem_`i'para_`i'mist* l6_reader`i'_sentence_mistake
		rename consent_1mem_`i'story_`i'mist* l7_reader`i'_paragraph_mistake
	}
	
	//// Section - M [Interviewer’s Notes]
	rename secll1_to_l4l1 m1_interview_end_time
	rename secll1_to_l4l2 m2_interview_lang
	rename secll1_to_l4l3 m3_interview_lang_other
	rename secll5_to_l7l4 m4_interview_other_name
	rename secll5_to_l7l5 m5_number_of_people
	rename secll5_to_l7l6 m6_other_people
	rename secll5_to_l7l7 m7_survey_satisfactory_answer
	rename seclcmt_box m8_survey_comment
	
	
* RENAMING DISTRICT, PSS & FEEDER TO MATCH IMPLEMENTATION DATA

	// Renaming District
	replace _district_name="Saran" if _district_name=="CHAPRA"
	replace _district_name="Purnea" if _district_name=="PURNIA"
	replace _district_name=upper(_district_name)
	
	// Renaming PSS
	replace _pss_name="A2Z" if _pss_name=="A2Z"
	replace _pss_name="AKHGAW" if _pss_name=="AKHGAW"
	replace _pss_name="BARHARA" if _pss_name=="BARHARA"
	replace _pss_name="BIHIYA" if _pss_name=="BIHIYA"
	replace _pss_name="GARHANI" if _pss_name=="GARHANI"
	replace _pss_name="JAGDISHPUR" if _pss_name=="JAGDISHPUR"
	replace _pss_name="KOILWAR" if _pss_name=="KOILWAR"
	replace _pss_name="PIRO" if _pss_name=="PIRO"
	replace _pss_name="SAHAR" if _pss_name=="SAHAR"
	replace _pss_name="SAHPUR" if _pss_name=="SAHPUR"
	replace _pss_name="SANDESH" if _pss_name=="SANDESH"
	replace _pss_name="SARAIYA" if _pss_name=="SARAIYA"
	replace _pss_name="TARARI" if _pss_name=="TARARI"
	replace _pss_name="BRAHMPUR" if _pss_name=="BRAHMPUR"
	replace _pss_name="BUXAR TOWN" if _pss_name=="BUXAR TOWN"
	replace _pss_name="CHHOTKA DHANKAICH" if _pss_name=="CHHOTKA DHANKAICH"
	replace _pss_name="CHOUSA" if _pss_name=="CHOUSA"
	replace _pss_name="DUMRAON" if _pss_name=="DUMRAON"
	replace _pss_name="EKRASI" if _pss_name=="EKRASI"
	replace _pss_name="INDUSTRIAL" if _pss_name=="INDRUSTRIAL"
	replace _pss_name="ITHARI" if _pss_name=="ITHARI"
	replace _pss_name="MURAR" if _pss_name=="MURAR"
	replace _pss_name="NAWANAGAR" if _pss_name=="NAWANAGAR"
	replace _pss_name="NUWAON" if _pss_name=="NUWAON"
	replace _pss_name="PRUSHTOMPUR" if _pss_name=="PRUSHTOMPUR"
	replace _pss_name="SIMRI" if _pss_name=="SIMRI"
	replace _pss_name="Amnour" if _pss_name=="AMNOUR"
	replace _pss_name="Baniyapur" if _pss_name=="BANIYAPUR"
	replace _pss_name="Dariyapur" if _pss_name=="DARIYAPUR"
	replace _pss_name="Dighwara" if _pss_name=="DIGHWARA"
	replace _pss_name="Ekma" if _pss_name=="EKMA"
	replace _pss_name="Garakha" if _pss_name=="GARAKHA"
	replace _pss_name="Lahlladpur" if _pss_name=="LAHLADPUR"
	replace _pss_name="Manjhi" if _pss_name=="MANJHI"
	replace _pss_name="Marhaura" if _pss_name=="MARHORA"
	replace _pss_name="Masakrakh" if _pss_name=="MASRAKH"
	replace _pss_name="Panapur" if _pss_name=="PANAPUR"
	replace _pss_name="Parbhunath Nagar" if _pss_name=="PARBHUNATH NAGAR"
	replace _pss_name="Parsa" if _pss_name=="PARSA"
	replace _pss_name="Setalpur" if _pss_name=="SETALPUR"
	replace _pss_name="Sonpur" if _pss_name=="SONPUR"
	replace _pss_name="Taraiya" if _pss_name=="TARAIYA"
	replace _pss_name="Telpa" if _pss_name=="TELPA"
	replace _pss_name="Barsoi" if _pss_name=="BARSOI"
	replace _pss_name="Falka" if _pss_name=="FALKA"
	replace _pss_name="Korha" if _pss_name=="KORHA"
	replace _pss_name="Kursela" if _pss_name=="KURSELA"
	replace _pss_name="Mirchaibari" if _pss_name=="MIRCHAIBARI"
	replace _pss_name="Pranpur" if _pss_name=="PRANPUR"
	replace _pss_name="Sonaili" if _pss_name=="SONAILI"
	replace _pss_name="Amour" if _pss_name=="AMOUR"
	replace _pss_name="Baisa" if _pss_name=="BAISA"
	replace _pss_name="Banmankhi" if _pss_name=="BANMANKHI"
	replace _pss_name="Belgacchi" if _pss_name=="BELGACHHI"
	replace _pss_name="Dalkola" if _pss_name=="DALKOLHA"
	replace _pss_name="Dargah" if _pss_name=="DARGAH"
	replace _pss_name="Jalalgarh" if _pss_name=="JALALGARH"
	replace _pss_name="Maranga" if _pss_name=="MARANGA"
	replace _pss_name="Mirganj (Purnea)" if _pss_name=="MIRGANJ"
	replace _pss_name="Sondeep" if _pss_name=="SONDEEP"
	replace _pss_name="Zero Mile" if _pss_name=="ZERO MILE"
	replace _pss_name="Barhariya" if _pss_name=="BARHARIYA"
	replace _pss_name="Basantpur" if _pss_name=="BASANTPUR"
	replace _pss_name="Chainpur" if _pss_name=="CHAINPUR"
	replace _pss_name="Goriyakothi" if _pss_name=="GORIYAKOTHI"
	replace _pss_name="Mahrajganj" if _pss_name=="MAHARAJGANJ"
	replace _pss_name="Mairwa" if _pss_name=="MAIRWA"
	replace _pss_name="Panchrukhi" if _pss_name=="PANCHRUKHI"
	replace _pss_name="Raghunathpur" if _pss_name=="RAGHUNATHPUR"
	replace _pss_name="Siwan" if _pss_name=="SIWAN"
	replace _pss_name="Srinagar" if _pss_name=="SRINAGAR"
	replace _pss_name="Ahilaya Asthan" if _pss_name=="AHILYA ASTHAN"
	replace _pss_name="Anar" if _pss_name=="ANAR"
	replace _pss_name="Baheri" if _pss_name=="BAHERI"
	replace _pss_name="Gangwara" if _pss_name=="GANGWARA"
	replace _pss_name="Jail (Lahariasarai)" if _pss_name=="JAIL (LAHERIYASARAI)"
	replace _pss_name="Poria" if _pss_name=="PORIYA"
	replace _pss_name="Sanahpurdih" if _pss_name=="SANAHPURDIH"
	replace _pss_name="Dariyapur" if _pss_name=="DARIYAPUR"
	replace _pss_name="Dhanarua" if _pss_name=="DHANARUA"
	replace _pss_name="Bakhtiyarpur" if _pss_name=="BAKHTIYARPUR"
	replace _pss_name="Barh" if _pss_name=="BARH"
	replace _pss_name="Belchi" if _pss_name=="BELCHI"
	replace _pss_name="Bhusaula" if _pss_name=="BHUSAULA"
	replace _pss_name="Bihari Bigha" if _pss_name=="BIHARI BIGHA"
	replace _pss_name="Daniyama" if _pss_name=="DANIYAMA"
	replace _pss_name="Fatuha" if _pss_name=="FATUHA"
	replace _pss_name="Khusrupur" if _pss_name=="FATUHA RURAL (KHUSRUPUR)"
	replace _pss_name="Hathidah" if _pss_name=="HATHIDAH"
	replace _pss_name="Mokama" if _pss_name=="MOKAMA"
	replace _pss_name="Neora" if _pss_name=="NEORA"
	replace _pss_name="Pandarak" if _pss_name=="PANDARAK"
	replace _pss_name="Sabalpur" if _pss_name=="SABALPUR"
	replace _pss_name="Airforce" if _pss_name=="AIRFORCE"
	replace _pss_name="Bihta Old" if _pss_name=="BIHTA OLD"
	replace _pss_name="Bikram" if _pss_name=="BIKRAM"
	replace _pss_name="Kanpa" if _pss_name=="KANPA"
	replace _pss_name="Kuda Nawada" if _pss_name=="KUDA NAWADA"
	replace _pss_name="Lala Bhadsara" if _pss_name=="LALA BHADSARA"
	replace _pss_name="MANER" if _pss_name=="MANER"
	replace _pss_name="Masaurhi New" if _pss_name=="MASAURHI NEW"
	replace _pss_name="Masaurhi Old" if _pss_name=="MASAURHI OLD"
	replace _pss_name="Naubatpur" if _pss_name=="NAUBATPUR"
	replace _pss_name="Paliganj" if _pss_name=="PALIGANJ"
	replace _pss_name="Pareo" if _pss_name=="PAREO"
	replace _pss_name="Sampatchak" if _pss_name=="SAMPATCHAK"
	replace _pss_name="Sherpur" if _pss_name=="SHERPUR"
	replace _pss_name=upper(_pss_name)
	
	// Renaming Feeder
	replace _feeder_name="ASNI" if _feeder_name=="ASNI"
	replace _feeder_name="KARISATH" if _feeder_name=="KARISATH"
	replace _feeder_name="UDWANT NAGAR" if _feeder_name=="UDWANT NAGAR"
	replace _feeder_name="FEDER N0-1" if _feeder_name=="FEDER N0-1"
	replace _feeder_name="FEDER N0-2" if _feeder_name=="FEDER N0-2"
	replace _feeder_name="FEDER N0-3" if _feeder_name=="FEDER N0-3"
	replace _feeder_name="FEDER N0-4" if _feeder_name=="FEDER N0-4"
	replace _feeder_name="Feeder-1" if _feeder_name=="FEEDER-1"
	replace _feeder_name="Feeder-2" if _feeder_name=="FEEDER-2"
	replace _feeder_name="Feeder-3" if _feeder_name=="FEEDER-3"
	replace _feeder_name="Feeder-4" if _feeder_name=="FEEDER-4"
	replace _feeder_name="Rural" if _feeder_name=="RURAL"
	replace _feeder_name="T0WN" if _feeder_name=="T0WN"
	replace _feeder_name="AGIYAW" if _feeder_name=="AGIYAW"
	replace _feeder_name="Charpokhari" if _feeder_name=="CHARPOKHARI"
	replace _feeder_name="Garhani" if _feeder_name=="GARHANI"
	replace _feeder_name="Kasap" if _feeder_name=="KASAP"
	replace _feeder_name="Rural" if _feeder_name=="RURAL"
	replace _feeder_name="Town" if _feeder_name=="TOWN"
	replace _feeder_name="Chandi" if _feeder_name=="CHANDI"
	replace _feeder_name="Dhandiha" if _feeder_name=="DHANDIHA"
	replace _feeder_name="Rural" if _feeder_name=="RURAL"
	replace _feeder_name="Urban" if _feeder_name=="URBAN"
	replace _feeder_name="Rural" if _feeder_name=="RURAL"
	replace _feeder_name="T0WN" if _feeder_name=="T0WN"
	replace _feeder_name="AGIYAW" if _feeder_name=="AGIYAW"
	replace _feeder_name="BAHUWARA" if _feeder_name=="BAHUWARA"
	replace _feeder_name="KHAIRA" if _feeder_name=="KHAIRA"
	replace _feeder_name="SAHAR" if _feeder_name=="SAHAR"
	replace _feeder_name="Banahi" if _feeder_name=="BANAHI"
	replace _feeder_name="Rural" if _feeder_name=="RURAL"
	replace _feeder_name="Town" if _feeder_name=="TOWN"
	replace _feeder_name="Rural" if _feeder_name=="RURAL"
	replace _feeder_name="Town" if _feeder_name=="TOWN"
	replace _feeder_name="Dhobaha" if _feeder_name=="DHOBAHA"
	replace _feeder_name="SARAIYA" if _feeder_name=="SARAIYA"
	replace _feeder_name="Bihta" if _feeder_name=="BIHITA"
	replace _feeder_name="Chakiya" if _feeder_name=="CHAKIYA"
	replace _feeder_name="KARATH" if _feeder_name=="KARATH"
	replace _feeder_name="N0NAR" if _feeder_name=="N0NAR"
	replace _feeder_name="BRAHMPUR" if _feeder_name=="BRAHMPUR"
	replace _feeder_name="RAGHUNATHPUR" if _feeder_name=="RAGHUNATHPUR"
	replace _feeder_name="RAJPUR" if _feeder_name=="RAJPUR"
	replace _feeder_name="RURAL" if _feeder_name=="RURAL"
	replace _feeder_name="D.K.COLLAGE" if _feeder_name=="D.K.COLLAGE"
	replace _feeder_name="DHANKAICH" if _feeder_name=="DHANKAICH"
	replace _feeder_name="CHOUSA" if _feeder_name=="CHOUSA"
	replace _feeder_name="GOLA" if _feeder_name=="GOLA"
	replace _feeder_name="BHOJPUR" if _feeder_name=="BHOJPUR"
	replace _feeder_name="DUMRAON TOWN" if _feeder_name=="DUMRAON TOWN"
	replace _feeder_name="RURAL" if _feeder_name=="RURAL"
	replace _feeder_name="VARUNA" if _feeder_name=="VARUNA"
	replace _feeder_name="EKRASI" if _feeder_name=="EKRASI"
	replace _feeder_name="MURAR II" if _feeder_name=="MURAR II"
	replace _feeder_name="DALSAGAR" if _feeder_name=="DALSAGAR"
	replace _feeder_name="DHANSOI" if _feeder_name=="DHANSOI"
	replace _feeder_name="ITHARI" if _feeder_name=="ITHARI"
	replace _feeder_name="KHOKHA" if _feeder_name=="KHOKHA"
	replace _feeder_name="MURAR" if _feeder_name=="MURAR"
	replace _feeder_name="AATHER" if _feeder_name=="AATHER"
	replace _feeder_name="NARVODAY" if _feeder_name=="NARVODAY"
	replace _feeder_name="NAWANAGAR" if _feeder_name=="NAWANAGAR"
	replace _feeder_name="RANA" if _feeder_name=="RANA"
	replace _feeder_name="BRAHMPUR" if _feeder_name=="BRAHMPUR"
	replace _feeder_name="KATHAR" if _feeder_name=="KATHAR"
	replace _feeder_name="NUWAON" if _feeder_name=="NUWAON"
	replace _feeder_name="DHANSOI" if _feeder_name=="DHANSOI"
	replace _feeder_name="INDOR" if _feeder_name=="INDOR"
	replace _feeder_name="RAJPUR" if _feeder_name=="RAJPUR"
	replace _feeder_name="UNWASH" if _feeder_name=="UNWASH"
	replace _feeder_name="DULLAHPUR" if _feeder_name=="DULLAHPUR"
	replace _feeder_name="PADRI" if _feeder_name=="PADRI"
	replace _feeder_name="SIMRI" if _feeder_name=="SIMRI"
	replace _feeder_name="Amnour (Amnour)" if _feeder_name=="AMNOUR"
	replace _feeder_name="Maker" if _feeder_name=="MAKER"
	replace _feeder_name="Parshurampur" if _feeder_name=="PARSHURAMPUR"
	replace _feeder_name="Banoyapur" if _feeder_name=="BANOYAPUR"
	replace _feeder_name="Jantabazar (Baniyapur) / Sahajitpur" if _feeder_name=="JANTABAZAR (BANIYAPUR) / SAHAJITPUR"
	replace _feeder_name="Nagara" if _feeder_name=="NAGARA"
	replace _feeder_name="Dariyapu 2 / Devati" if _feeder_name=="DARIYAPU 2 / DEVATI"
	replace _feeder_name="Dariyapu 3 / Sundarpur" if _feeder_name=="DARIYAPU 3 / SUNDARPUR"
	replace _feeder_name="Dariyapu 4 / Dariyapur" if _feeder_name=="DARIYAPU 4 / DARIYAPUR"
	replace _feeder_name="Dariyapur 1 / Darihara / Darani" if _feeder_name=="DARIYAPUR 1 / DARIHARA / DARANI"
	replace _feeder_name="Dighwara (Dighwara)" if _feeder_name=="DIGHWARA"
	replace _feeder_name="Matihan" if _feeder_name=="MATIHAN"
	replace _feeder_name="Daudpur" if _feeder_name=="DAUDPUR"
	replace _feeder_name="Ekma" if _feeder_name=="EKMA"
	replace _feeder_name="Basant" if _feeder_name=="BASANT"
	replace _feeder_name="Garkha" if _feeder_name=="GARKHA"
	replace _feeder_name="Basahi" if _feeder_name=="BASAHI"
	replace _feeder_name="Jantabazar (Lahlladpur)" if _feeder_name=="JANTABAZAR (LAHLLADPUR)"
	replace _feeder_name="Iliyaspur" if _feeder_name=="ILIYASPUR"
	replace _feeder_name="Tajpur (Manjhi)" if _feeder_name=="TAJPUR (MANJHI)"
	replace _feeder_name="Amnaur (Marhaura)" if _feeder_name=="AMNAUR"
	replace _feeder_name="Isuapur" if _feeder_name=="ISUAPUR"
	replace _feeder_name="Marhuwara Town" if _feeder_name=="MARHUWARA TOWN"
	replace _feeder_name="Sivganj" if _feeder_name=="SIVGANJ"
	replace _feeder_name="Hanumanganj" if _feeder_name=="HANUMANGANJ"
	replace _feeder_name="Masarakh Rural" if _feeder_name=="MASARAKH RURAL"
	replace _feeder_name="Masarakh Urban" if _feeder_name=="MASARAKH URBAN"
	replace _feeder_name="Dubauli" if _feeder_name=="DUBAULI"
	replace _feeder_name="Panapur" if _feeder_name=="PANAPUR"
	replace _feeder_name="Totaha" if _feeder_name=="TOTAHA"
	replace _feeder_name="Khaira" if _feeder_name=="KHAIRA"
	replace _feeder_name="Naini" if _feeder_name=="NANI"
	replace _feeder_name="Anjani" if _feeder_name=="ANJANI"
	replace _feeder_name="Mirzapur" if _feeder_name=="MIRZAPUR"
	replace _feeder_name="Parsa" if _feeder_name=="PARSA"
	replace _feeder_name="Manpur" if _feeder_name=="MANPUR"
	replace _feeder_name="Setalpur" if _feeder_name=="SETALPUR"
	replace _feeder_name="Setalpur Kothi" if _feeder_name=="SETALPUR KOTHI"
	replace _feeder_name="Kharikha" if _feeder_name=="KHARIKHA"
	replace _feeder_name="Mela" if _feeder_name=="MELA"
	replace _feeder_name="Nayagaon" if _feeder_name=="NAYAGAON"
	replace _feeder_name="Ragistry" if _feeder_name=="RAGISTRY"
	replace _feeder_name="Taraiya" if _feeder_name=="TARAIYA"
	replace _feeder_name="Taraiya 1" if _feeder_name=="TARAIYA 1"
	replace _feeder_name="Taraiya 2" if _feeder_name=="TARAIYA 2"
	replace _feeder_name="Dighwara / Dariganj" if _feeder_name=="DARIGANJ"
	replace _feeder_name="Abadpur" if _feeder_name=="ABADPUR R"
	replace _feeder_name="Barsoi" if _feeder_name=="BARSOI U"
	replace _feeder_name="Railway (Barsoi)" if _feeder_name=="RAILWAY BARSOI U"
	replace _feeder_name="Salmari" if _feeder_name=="SALMARI R"
	replace _feeder_name="Sudhani" if _feeder_name=="SUDHANI R"
	replace _feeder_name="Bhangha" if _feeder_name=="BHANGHA U"
	replace _feeder_name="Bharsia" if _feeder_name=="BHARSIA R"
	replace _feeder_name="Falka Bazar" if _feeder_name=="FALKA BAZAR R"
	replace _feeder_name="Dedicated STW" if _feeder_name=="DEDICATED STW U"
	replace _feeder_name="Gerabari Bazar" if _feeder_name=="GERABARI BAZAR U"
	replace _feeder_name="Harda (Korha)" if _feeder_name=="HARDA (KORHA) R"
	replace _feeder_name="Kolasi" if _feeder_name=="KOLASI R"
	replace _feeder_name="Semapur" if _feeder_name=="SEMAPUR R"
	replace _feeder_name="Barari (Kursela)" if _feeder_name=="BARARI R"
	replace _feeder_name="Kursela" if _feeder_name=="KURSELA M"
	replace _feeder_name="Hasanganj" if _feeder_name=="HASANGANJ R"
	replace _feeder_name="Manihari" if _feeder_name=="MANIHARI R"
	replace _feeder_name="Bastaul" if _feeder_name=="BASTAUL R"
	replace _feeder_name="PHED Pranpur" if _feeder_name=="PHED PRANPURU"
	replace _feeder_name="Pranpur" if _feeder_name=="PRANPUR U"
	replace _feeder_name="Roshna" if _feeder_name=="ROSHNA R"
	replace _feeder_name="Bhogaon" if _feeder_name=="BHOGAON R"
	replace _feeder_name="Kumhari" if _feeder_name=="KUMHARI R"
	replace _feeder_name="Sonaili (Sonaili)" if _feeder_name=="SONAILI U"
	replace _feeder_name="Amour Rural" if _feeder_name=="AMOUR RURAL"
	replace _feeder_name="Amour Town" if _feeder_name=="AMOUR TOWN"
	replace _feeder_name="Gerwa" if _feeder_name=="GERWA"
	replace _feeder_name="Routa" if _feeder_name=="RAOUTA"
	replace _feeder_name="Amanpure" if _feeder_name=="AMANPURE"
	replace _feeder_name="Kharif" if _feeder_name=="KHARIF"
	replace _feeder_name="Sinabari" if _feeder_name=="SINABARI"
	replace _feeder_name="Banmankhi" if _feeder_name=="BANMANKHI"
	replace _feeder_name="Jankinagar" if _feeder_name=="JANKINAGAR"
	replace _feeder_name="Khajuri" if _feeder_name=="KHAJURI"
	replace _feeder_name="Rasadh" if _feeder_name=="RASADH"
	replace _feeder_name="Baisbaily" if _feeder_name=="BAISBAILY"
	replace _feeder_name="Baisee" if _feeder_name=="BAISI"
	replace _feeder_name="Belgacchi" if _feeder_name=="BELGACHHI"
	replace _feeder_name="Barsoyi" if _feeder_name=="BARSOI"
	replace _feeder_name="Milikpur" if _feeder_name=="MILIKPUR"
	replace _feeder_name="Bela (Dargah)" if _feeder_name=="BELA"
	replace _feeder_name="Dargah" if _feeder_name=="DARGAH"
	replace _feeder_name="Jhalari (Dargah)" if _feeder_name=="JHALARI"
	replace _feeder_name="Rupauli" if _feeder_name=="RUPAULI"
	replace _feeder_name="Garhbanaily" if _feeder_name=="GARHBANAILY"
	replace _feeder_name="Jalalgarh" if _feeder_name=="JALALGARH"
	replace _feeder_name="Kasba" if _feeder_name=="KASBA"
	replace _feeder_name="Srinagar (Jalalgarh)" if _feeder_name=="SRINAGAR"
	replace _feeder_name="Champanagar" if _feeder_name=="CHAMPANAGAR"
	replace _feeder_name="Harda (Maranga)" if _feeder_name=="HARDA"
	replace _feeder_name="Sonaily (Maranga)" if _feeder_name=="SONAILY"
	replace _feeder_name="Baheliya Asthan" if _feeder_name=="BAHELIYA ASTHAN"
	replace _feeder_name="Champawati" if _feeder_name=="CHAMPAWATI"
	replace _feeder_name="Chandwa" if _feeder_name=="CHANDWA"
	replace _feeder_name="Dhamdaha" if _feeder_name=="DHAMDAHA"
	replace _feeder_name="Mirganj (Purnea)" if _feeder_name=="MIRGANJ"
	replace _feeder_name="Bhawanipur" if _feeder_name=="BHAWANIPUR"
	replace _feeder_name="Jabey" if _feeder_name=="JABEY"
	replace _feeder_name="Sondeep" if _feeder_name=="SONDEEP"
	replace _feeder_name="Dagarua" if _feeder_name=="DAGARUA"
	replace _feeder_name="Zero Mile" if _feeder_name=="ZERO MILE"
	replace _feeder_name="Chari" if _feeder_name=="CHARI"
	replace _feeder_name="Jamo" if _feeder_name=="JAMO"
	replace _feeder_name="Lakri" if _feeder_name=="LAKRI"
	replace _feeder_name="Basntpur" if _feeder_name=="BASANTPUR"
	replace _feeder_name="Bhagawanpur (Basantpur)" if _feeder_name=="BHAGAWANPUR (BASANTPUR)"
	replace _feeder_name="Bhopatpur" if _feeder_name=="BHOPATPUR"
	replace _feeder_name="Gopalpur (Basantpur)" if _feeder_name=="GOPALPUR (BASANTPUR)"
	replace _feeder_name="Barari (Chainpur)" if _feeder_name=="BARARI"
	replace _feeder_name="Hasanpura (Chainpur)" if _feeder_name=="HASANPURA (CHAINPUR)"
	replace _feeder_name="Sisawan" if _feeder_name=="SISAWAN"
	replace _feeder_name="Tari" if _feeder_name=="TARI"
	replace _feeder_name="Dumari" if _feeder_name=="DUMARI"
	replace _feeder_name="Goriyakopthi" if _feeder_name=="GORIYAKOTHI"
	replace _feeder_name="Musatafabad" if _feeder_name=="MUSATAFABAD"
	replace _feeder_name="Basantpur (Maharganj)" if _feeder_name=="BASANTPUR (MAHARGANJ)"
	replace _feeder_name="Dharaundra" if _feeder_name=="DHARAUNDRA"
	replace _feeder_name="Maharajganj" if _feeder_name=="MAHARAJGANJ"
	replace _feeder_name="Tarwara (Mahrajganj)" if _feeder_name=="TARWARA (MAHRAJGANJ)"
	replace _feeder_name="Darauli" if _feeder_name=="DARAULI"
	replace _feeder_name="Guthani" if _feeder_name=="GUTHANI"
	replace _feeder_name="Mairwa" if _feeder_name=="MAIRWA"
	replace _feeder_name="Titara" if _feeder_name=="TITARA"
	replace _feeder_name="Hasanpura (Panchrukhi)" if _feeder_name=="HASANPURA (PANCHRUKHI)"
	replace _feeder_name="Panchrukhi" if _feeder_name=="PANCHRUKHI"
	replace _feeder_name="Talkathu" if _feeder_name=="TALKATHU"
	replace _feeder_name="Tarwara (Panchrukhi)" if _feeder_name=="TARWARA (PANCHRUKHI)"
	replace _feeder_name="Amndar" if _feeder_name=="AMNDAR"
	replace _feeder_name="Raghunathpur" if _feeder_name=="RAGHUNATHPUR"
	replace _feeder_name="Andardhal / Konhara" if _feeder_name=="ANDARDHAL / KONHARA"
	replace _feeder_name="Barhariya (Siwan)" if _feeder_name=="BARHARIYA (SIWAN)"
	replace _feeder_name="Dhanauti" if _feeder_name=="DHANAUTI"
	replace _feeder_name="Jeradei" if _feeder_name=="JERADEI"
	replace _feeder_name="Kamtol" if _feeder_name=="KAMTOL"
	replace _feeder_name="Tekrar" if _feeder_name=="TEKRAR"
	replace _feeder_name="Anar" if _feeder_name=="ANAR"
	replace _feeder_name="Baheri (Anar)" if _feeder_name=="BAHERI"
	replace _feeder_name="Chandanpatti" if _feeder_name=="CHANDANPATTI"
	replace _feeder_name="Hayaghat" if _feeder_name=="HAYAGHAT"
	replace _feeder_name="Kapchahi" if _feeder_name=="KAPCHAHI"
	replace _feeder_name="Baheri" if _feeder_name=="BAHERI U"
	replace _feeder_name="Khangraitha" if _feeder_name=="KHANGRAITHA R"
	replace _feeder_name="Aerodram" if _feeder_name=="AERODRAM U"
	replace _feeder_name="Garharia" if _feeder_name=="GARHARIA U"
	replace _feeder_name="Kamtaul (Gangwara)" if _feeder_name=="KAMTAUL (GANGWARA) R"
	replace _feeder_name="Loam" if _feeder_name=="LOAM R"
	replace _feeder_name="Mithila" if _feeder_name=="MITHILA M"
	replace _feeder_name="Ramnagar" if _feeder_name=="RAMNAGAR R"
	replace _feeder_name="Shovan" if _feeder_name=="SHOVAN R"
	replace _feeder_name="Ekmi" if _feeder_name=="EKMI R"
	replace _feeder_name="Rural Jail" if _feeder_name=="RURAL JAIL M"
	replace _feeder_name="Bishanpur" if _feeder_name=="BISHANPUR R"
	replace _feeder_name="Dilahi" if _feeder_name=="DILAHI R"
	replace _feeder_name="Bharwara" if _feeder_name=="BHARWARA"
	replace _feeder_name="Jalley" if _feeder_name=="JALLEY"
	replace _feeder_name="Singhwara" if _feeder_name=="SINGHWARA"
	replace _feeder_name="Gadauli" if _feeder_name=="BEDOULI"
	replace _feeder_name="Dariyapur" if _feeder_name=="DARIYAPUR"
	replace _feeder_name="Bansbigaha" if _feeder_name=="BANSBIGAHA"
	replace _feeder_name="Deokuli (Town)" if _feeder_name=="DEOKULI (TOWN)"
	replace _feeder_name="Kolhachak" if _feeder_name=="KOLHACHAK"
	replace _feeder_name="Bakhtiyarpur" if _feeder_name=="BAKHTIYARPUR"
	replace _feeder_name="Duplicate (Bakhtiyarpur)" if _feeder_name=="DUPLICATE"
	replace _feeder_name="Rural (Bakhtiyarpur)" if _feeder_name=="RURAL"
	replace _feeder_name="Telmar" if _feeder_name=="TELMAR"
	replace _feeder_name="Malahi" if _feeder_name=="MALAHI"
	replace _feeder_name="Pandarakh" if _feeder_name=="PANDARAKH"
	replace _feeder_name="PHED (Barh)" if _feeder_name=="PHED"
	replace _feeder_name="Rural (Barh)" if _feeder_name=="RURAL"
	replace _feeder_name="Town (Barh)" if _feeder_name=="TOWN"
	replace _feeder_name="Ekdanga" if _feeder_name=="EKDANGA"
	replace _feeder_name="Gogiyari" if _feeder_name=="GOGIYARI"
	replace _feeder_name="Gopalpur" if _feeder_name=="GOPALPUR"
	replace _feeder_name="Mankoura" if _feeder_name=="MANKOURA"
	replace _feeder_name="Babhanpura" if _feeder_name=="BABHANPURA"
	replace _feeder_name="Hinduni" if _feeder_name=="HINDUNI"
	replace _feeder_name="Janipur" if _feeder_name=="JANIPUR"
	replace _feeder_name="Chaturbhujpur" if _feeder_name=="CHATURBHUJPUR"
	replace _feeder_name="Manikpur" if _feeder_name=="MANIKPUR"
	replace _feeder_name="Pokharpur" if _feeder_name=="POKHARPUR"
	replace _feeder_name="Rice (Bihari Bigha)" if _feeder_name=="RICE"
	replace _feeder_name="Daniyawa" if _feeder_name=="DANIYAWA"
	replace _feeder_name="Machariyawa" if _feeder_name=="MACHARIYAWA"
	replace _feeder_name="Budhuchak" if _feeder_name=="BUDHUCHAK"
	replace _feeder_name="Industrial (Fatuha)" if _feeder_name=="INDUSTRIAL"
	replace _feeder_name="Khusrupur (Fatuha)" if _feeder_name=="KHUSRUPUR"
	replace _feeder_name="Radio (Fatuha)" if _feeder_name=="RADIO"
	replace _feeder_name="Rural (Fatuha)" if _feeder_name=="RURAL"
	replace _feeder_name="Station (Fatuha)" if _feeder_name=="STATION"
	replace _feeder_name="Bakhtiyarpur" if _feeder_name=="BAKHTIYARPUR"
	replace _feeder_name="Khusrupur (Khusrupur)" if _feeder_name=="KHUSRUPUR"
	replace _feeder_name="Bata" if _feeder_name=="BATA"
	replace _feeder_name="Hathidah" if _feeder_name=="HATHIDAH"
	replace _feeder_name="Maranchi New" if _feeder_name=="MARACHI NEW"
	replace _feeder_name="Maranchi Old" if _feeder_name=="MARACHI OLD"
	replace _feeder_name="NTPC (Mokama)" if _feeder_name=="NTPC"
	replace _feeder_name="PHED (Mokama)" if _feeder_name=="PHED"
	replace _feeder_name="Road Side (Mokama)" if _feeder_name=="ROAD SIDE"
	replace _feeder_name="Town 1 (Mokama)" if _feeder_name=="TOWN 1"
	replace _feeder_name="Town 2 (Mokama)" if _feeder_name=="TOWN 2"
	replace _feeder_name="Co-Operative (Neora)" if _feeder_name=="CO-OPERATIVE"
	replace _feeder_name="Neora" if _feeder_name=="NEORA"
	replace _feeder_name="Pandarak" if _feeder_name=="PANDARAK"
	replace _feeder_name="Kothiya" if _feeder_name=="KOTHIYA"
	replace _feeder_name="Raibagh" if _feeder_name=="RAIBAGH"
	replace _feeder_name="Rural (Airforce)" if _feeder_name=="RURAL"
	replace _feeder_name="VCL (Airforce)" if _feeder_name=="VCL"
	replace _feeder_name="Bihta" if _feeder_name=="BIHTA"
	replace _feeder_name="CPWD (Bihta Old)" if _feeder_name=="CPWD"
	replace _feeder_name="Jeenpura" if _feeder_name=="JEENPURA"
	replace _feeder_name="Maner" if _feeder_name=="MANER"
	replace _feeder_name="Naubatpur (Bihta Old)" if _feeder_name=="NAUBATPUR"
	replace _feeder_name="Akhtiyarpur" if _feeder_name=="AKHTIYARPUR"
	replace _feeder_name="Bikram (Bikram)" if _feeder_name=="BIKRAM"
	replace _feeder_name="DinaBigha" if _feeder_name=="DINABIGHA"
	replace _feeder_name="Barah" if _feeder_name=="BARAH"
	replace _feeder_name="Bikram (Kanpa)" if _feeder_name=="BIKARAM"
	replace _feeder_name="Kanpa" if _feeder_name=="KANPA"
	replace _feeder_name="Co-Operative (Kuda Nawada)" if _feeder_name=="CO-OPERATIVE"
	replace _feeder_name="Pothi" if _feeder_name=="POTHI"
	replace _feeder_name="Punpun Bazaar" if _feeder_name=="PUNPUN BAZAAR"
	replace _feeder_name="Railway West (Kuda Nawada)" if _feeder_name=="RAILWAY WEST"
	replace _feeder_name="Bikram (Lala Bhadsara)" if _feeder_name=="BIKRAM"
	replace _feeder_name="Dulhin Bazaar" if _feeder_name=="DULHIN BAZAAR"
	replace _feeder_name="Lalbhadsara" if _feeder_name=="LALBHADSARA"
	replace _feeder_name="Masaurhi" if _feeder_name=="MASAURHI"
	replace _feeder_name="RAMBAGH" if _feeder_name=="RAMBAGH"
	replace _feeder_name="RURAL (MANER)" if _feeder_name=="RURAL"
	replace _feeder_name="SIMARI" if _feeder_name=="SIMARI"
	replace _feeder_name="TOWN (MANER)" if _feeder_name=="TOWN"
	replace _feeder_name="Chapour" if _feeder_name=="CHAPOUR"
	replace _feeder_name="Deowaria" if _feeder_name=="DEOWARIA"
	replace _feeder_name="Town (Masaurhi New)" if _feeder_name=="TOWN"
	replace _feeder_name="Dhanarua" if _feeder_name=="DHANARUA"
	replace _feeder_name="Nadaul" if _feeder_name=="NADAUL"
	replace _feeder_name="Nadwa" if _feeder_name=="NADWA"
	replace _feeder_name="Jaitipur" if _feeder_name=="JAITIPUR"
	replace _feeder_name="Naubatpur (Naubatpur)" if _feeder_name=="NAUBATPUR"
	replace _feeder_name="Banauli" if _feeder_name=="BANAULI"
	replace _feeder_name="Mahabalipur" if _feeder_name=="MAHABALIPUR"
	replace _feeder_name="Paliganj" if _feeder_name=="PALIGANJ"
	replace _feeder_name="Shigori" if _feeder_name=="SHIGORI"
	replace _feeder_name="Lai (Pareo)" if _feeder_name=="LAI"
	replace _feeder_name="Pareo" if _feeder_name=="PAREO"
	replace _feeder_name="Gaurichak Duplicate" if _feeder_name=="GAURICHAK DUPLICATE"
	replace _feeder_name="Gaurichak Main" if _feeder_name=="GAURICHAK MAIN"
	replace _feeder_name="Saudih" if _feeder_name=="SAUDIH"
	replace _feeder_name="Sono Gopalpur" if _feeder_name=="SONO GOPALPUR"
	replace _feeder_name="Byapur" if _feeder_name=="BYAPUR"
	replace _feeder_name="Sherpur" if _feeder_name=="SHERPUR"
	replace _feeder_name=upper(_feeder_name)


* REPLACING BACHCHECK RECONCILIATION ENTRIES FOR ALL THE APPLICABLE SURVEYS
	
	replace e1_elec_any=e1_elec_any_n if !missing(e1_elec_any_n)
	replace e2_elec_past=e2_elec_past_n if !missing(e1_elec_any_n)
	replace e3_noelec_reason=e3_noelec_reason_n if !missing(e1_elec_any_n)
	replace e3_noelec_reason_other=e3_noelec_reason_oth_n if !missing(e1_elec_any_n)
	replace e4_elec_source=e4_elec_source_n if !missing(e1_elec_any_n)
	replace e4_elec_source_other=e4_elec_source_oth_n if !missing(e1_elec_any_n)
	replace e5_elec_genset=e5_elec_genset_n if !missing(e1_elec_any_n)
	replace e6_genset_capacity=e6_genset_capacity_n if !missing(e1_elec_any_n)
	replace e6_genset_unit=e6_genset_unit_n if !missing(e1_elec_any_n)
	replace e7_genset_shared=e7_genset_shared_n if !missing(e1_elec_any_n)
	tostring(e7_genset_shared_oth_n), replace
	replace e7_genset_shared_other=e7_genset_shared_oth_n if !missing(e1_elec_any_n)  
	replace e8_genset_cost=e8_genset_cost_n if !missing(e1_elec_any_n)
	replace e9_genset_exp=e9_genset_exp_n if !missing(e1_elec_any_n)
	replace e9_genset_exp_rupee=e9_genset_exp_rupee_n if !missing(e1_elec_any_n)
	replace e9_genset_exp_litre=e9_genset_exp_litre_n if !missing(e1_elec_any_n)
	replace e9_diesel_cost=e9_diesel_cost_n if !missing(e1_elec_any_n)
	replace e10_genset_shared_people=e10_genset_shared_people_n if !missing(e1_elec_any_n)   
	replace e11_genset_shared_cost=e11_genset_shared_cost_n if !missing(e1_elec_any_n)
	replace e11_genset_shared_cost_amount=e11_genset_shared_cost_amount_n if !missing(e1_elec_any_n)    
	replace e12_genset_shared_exp=e12_genset_shared_exp_n if !missing(e1_elec_any_n)
	replace e12_genset_shared_exp_amount=e12_genset_shared_exp_amount_n if !missing(e1_elec_any_n)
	replace e12_genset_shared_exp_unit=e12_genset_shared_exp_unit_n if !missing(e1_elec_any_n)
	replace e12_genset_shared_exp_unit_other=e12_genset_shared_exp_unit_oth_n if !missing(e1_elec_any_n)
	replace e13_elec_solar=e13_elec_solar_n if !missing(e1_elec_any_n)
	replace e14_solar_owner=e14_solar_owner_n if !missing(e1_elec_any_n)
	replace e15_solar_cost=e15_solar_cost_n if !missing(e1_elec_any_n)
	replace e16_solar_shared=e16_solar_shared_n if !missing(e1_elec_any_n)
	replace e17_solar_shared_cost=e17_solar_shared_cost_n if !missing(e1_elec_any_n)
	replace e18_solar_shared_exp=e18_solar_shared_exp_n if !missing(e1_elec_any_n)
	replace e19_elec_grid=e19_elec_grid_n if !missing(e1_elec_any_n)
	replace e20_metered_consumer=e20_metered_consumer_n if !missing(e1_elec_any_n)
	replace e21_meter_functional=e21_meter_functional_n if !missing(e1_elec_any_n)
	replace e22_meter_damage_date=e22_meter_damage_date_n if !missing(e1_elec_any_n)
	replace e23_meter_complaint=e23_meter_complaint_n if !missing(e1_elec_any_n)
	tostring(e24_meter_complaint_loc_oth_n), replace
	replace e24_meter_complaint_loc_other=e24_meter_complaint_loc_oth_n if !missing(e1_elec_any_n)
	replace e24_meter_complaint_location= e24_meter_complaint_location_n if !missing(e1_elec_any_n)
	replace e25_meter_noncomplaint=e25_meter_noncomplaint_n if !missing(e1_elec_any_n)
	replace e25_meter_noncomplaint_other=e25_meter_noncomplaint_oth_n if !missing(e1_elec_any_n)
	replace e26_meter_location=e26_meter_location_n if !missing(e1_elec_any_n)
	replace e26_meter_location_other=e26_meter_location_oth_n if !missing(e1_elec_any_n)
	replace e27_meter_outside_readibility=e27_meter_outside_readibility_n if !missing(e1_elec_any_n)
	replace e28_meter_installation_date=e28_meter_installation_date_n if !missing(e1_elec_any_n)
	replace e29_meter_read= e29_meter_read_n if !missing(e1_elec_any_n)
	replace e29_meter_read_date= e29_meter_read_date_n if !missing(e1_elec_any_n)
	replace e30_connection_type=e30_connection_type_n if !missing(e1_elec_any_n)
	replace e31_single_phase_meter=e31_single_phase_meter_n if !missing(e1_elec_any_n)
	replace e32_three_phase_meter=e32_three_phase_meter_n if !missing(e1_elec_any_n)
	replace e33_consumers_receive_bill=e33_consumers_receive_bill_n if !missing(e1_elec_any_n)
	replace e34_consumers_billed= e34_consumers_billed_n if !missing(e1_elec_any_n)
	replace e34_consumers_billed_date= e34_consumers_billed_date_n if !missing(e1_elec_any_n)
	replace e35_consumers_bill_month=e35_consumers_bill_month_n if !missing(e1_elec_any_n)
	replace e35_consumers_bill_month_other=e35_consumers_bill_month_oth_n if !missing(e1_elec_any_n)
	replace e36_bill_availability=e36_bill_availability_n if !missing(e1_elec_any_n)
	replace e37_bill_consumer_number=e37_bill_consumer_number_n if !missing(e1_elec_any_n)
	replace e38_know_consumer_number=e38_know_consumer_number_n if !missing(e1_elec_any_n)
	tostring(e38_ask_consumer_number_n), replace
	replace e38_ask_consumer_number_n="" if e38_ask_consumer_number_n=="."
	replace e38_ask_consumer_number=e38_ask_consumer_number_n if !missing(e1_elec_any_n)
	replace e39_correct_billing=e39_correct_billing_n if !missing(e1_elec_any_n)
	replace e40_wrong_billing_month=e40_wrong_billing_month_n if !missing(e1_elec_any_n)
	replace e40_wrong_billing_year=e40_wrong_billing_year_n if !missing(e1_elec_any_n)
	replace e41_bill_receive_frequency=e41_bill_receive_frequency_n if !missing(e1_elec_any_n)
	replace e41_bill_receive_frequency_other=e41_bill_receive_frequency_oth_n if !missing(e1_elec_any_n)
	tostring(e42_bill_not_received_act_oth_n), replace
	replace e42_bill_not_received_action=e42_bill_not_received_action_n if !missing(e1_elec_any_n)
	replace e42_bill_not_received_act_other=e42_bill_not_received_act_oth_n if !missing(e1_elec_any_n)
	replace e43_last_bill_pay_lastmonth=e43_last_bill_pay_lastmonth_n if !missing(e1_elec_any_n)
	replace e43_last_bill_pay_year=e43_last_bill_pay_year_n if !missing(e1_elec_any_n)
	replace e44_last_bill_pay_amount=e44_last_bill_pay_amount_n if !missing(e1_elec_any_n)
	replace e45_bill_pay_frequency=e45_bill_pay_frequency_n if !missing(e1_elec_any_n)
	replace e45_bill_pay_frequency_other=e45_bill_pay_frequency_oth_n if !missing(e1_elec_any_n)
	replace e46_bill_pay_location=e46_bill_pay_location_n if !missing(e1_elec_any_n)
	tostring(e46_bill_pay_location_oth_n), replace
	replace e46_bill_pay_location_other=e46_bill_pay_location_oth_n if !missing(e1_elec_any_n)
	tostring(e47_bill_pay_pss_type_n), replace
	replace e47_bill_pay_pss_type_n="" if e47_bill_pay_pss_type_n=="."
	replace e47_bill_pay_pss_type=e47_bill_pay_pss_type_n if !missing(e1_elec_any_n)
	tostring(e47_bill_pay_pss_type_oth_n), replace
	replace e47_bill_pay_pss_type_other=e47_bill_pay_pss_type_oth_n if !missing(e1_elec_any_n)         
	tostring(e48_bill_pay_franchise_type_n), replace
	replace e48_bill_pay_franchise_type_n="" if e48_bill_pay_franchise_type_n=="."
	replace e48_bill_pay_franchise_type=e48_bill_pay_franchise_type_n if !missing(e1_elec_any_n)
	tostring(e48_bill_pay_franch_type_oth_n), replace
	replace e48_bill_pay_franch_type_other=e48_bill_pay_franch_type_oth_n if !missing(e1_elec_any_n)
	replace e49_franchise_pss_distance_val=e49_franchise_pss_distance_val_n if !missing(e1_elec_any_n)
	replace e49_franchise_pss_distance_unit=e49_franchise_pss_dist_unit_n if !missing(e1_elec_any_n)         
	replace e50_franchise_pss_time_value=e50_franchise_pss_time_value_n if !missing(e1_elec_any_n)
	replace e50_franchise_pss_time_unit=e50_franchise_pss_time_unit_n if !missing(e1_elec_any_n)
	replace e51_rationshop_owner_rating=e51_rationshop_owner_rating_n if !missing(e1_elec_any_n)         
	replace e52_know_bill_collector_name=e52_know_bill_collector_name_n if !missing(e1_elec_any_n)
	replace e52_bill_collector_name=e52_bill_collector_name_n if !missing(e1_elec_any_n)
	replace e53_bill_collector_rating=e53_bill_collector_rating_n if !missing(e1_elec_any_n)
	replace e54_postoffice_clerk_rating=e54_postoffice_clerk_rating_n if !missing(e1_elec_any_n)
	replace f1_grid_elec_date=f1_grid_elec_date_n if !missing(e1_elec_any_n)
	replace f2_avg_gridelec_perday=f2_avg_gridelec_perday_n if !missing(e1_elec_any_n)
	replace f2_gridelec_7amto12pm=f2_gridelec_7amto12pm_n if !missing(e1_elec_any_n)
	replace f2_gridelec_12pmto5pm=f2_gridelec_12pmto5pm_n if !missing(e1_elec_any_n)
	replace f2_gridelec_5pmto11pm=f2_gridelec_5pmto11pm_n if !missing(e1_elec_any_n)
	replace f2_gridelec_11pmto7am=f2_gridelec_11pmto7am_n if !missing(e1_elec_any_n)
	replace f2_sum_of_slots=f2_sum_of_slots_n if !missing(e1_elec_any_n)
	replace f3_power_outage_lastmonth=f3_power_outage_lastmonth_n if !missing(e1_elec_any_n)
	replace f4_power_outage_day_count=f4_power_outage_day_count_n if !missing(e1_elec_any_n)
	replace f4_power_outage_hour_count=f4_power_outage_hour_count_n if !missing(e1_elec_any_n)
	replace f5_power_outage_expected=f5_power_outage_expected_n if !missing(e1_elec_any_n)
	replace f6_know_power_outage_reason=f6_know_power_outage_reason_n if !missing(e1_elec_any_n)
	replace f7_voltage_drop_lastmonth=f7_voltage_drop_lastmonth_n if !missing(e1_elec_any_n)
	replace f8_voltage_drop_day_count=f8_voltage_drop_day_count_n if !missing(e1_elec_any_n)
	replace f8_voltage_drop_hour_count=f8_voltage_drop_hour_count_n if !missing(e1_elec_any_n)
	replace f9_energy_advertisement=f9_energy_advertisement_n if !missing(e1_elec_any_n)
	replace f10_advertisement_source=f10_advertisement_source_n if !missing(e1_elec_any_n)
	tostring(f10_advertisement_source_oth_n), replace
	replace f10_advertisement_source_other=f10_advertisement_source_oth_n if !missing(e1_elec_any_n)
	replace f11_know_ots_scheme=f11_know_ots_scheme_n if !missing(e1_elec_any_n)
	replace f12_avail_ots=f12_avail_ots_n if !missing(e1_elec_any_n)
	replace f13_mobile_phone_access=f13_mobile_phone_access_n if !missing(e1_elec_any_n)
	replace f14i_subs_bill_amount_alert=f14i_subs_bill_amount_alert_n if !missing(e1_elec_any_n)
	replace f14ii_subs_pay_date_alert=f14ii_subs_pay_date_alert_n if !missing(e1_elec_any_n)
	replace f14iii_subs_biller_visit_alert=f14iii_subs_biller_visit_alert_n if !missing(e1_elec_any_n)
	replace f15_elec_future_expect=f15_elec_future_expect_n if !missing(e1_elec_any_n)
	replace f16_elec_supply_factor=f16_elec_supply_factor_n if !missing(e1_elec_any_n)
	tostring(f16_elec_supply_factor_oth_n), replace
	replace f16_elec_supply_factor_other=f16_elec_supply_factor_oth_n if !missing(e1_elec_any_n)
	replace f17_elec_neighbour_hour=f17_elec_neighbour_hour_n if !missing(e1_elec_any_n)
	replace f18_elec_neighbour_hour_change=f18_elec_neighbour_hour_change_n if !missing(e1_elec_any_n)
	replace f19_neighbour_hour_change_reason=f19_neigh_hour_change_reason_n if !missing(e1_elec_any_n)
	tostring(f19_neigh_hr_change_reason_oth_n), replace
	replace f19_neigh_hr_change_reason_other=f19_neigh_hr_change_reason_oth_n if !missing(e1_elec_any_n)
	replace f20_maintenance_complaint=f20_maintenance_complaint_n if !missing(e1_elec_any_n)
	replace f21_maintenance_complaint_reason=f21_main_complaint_reason_n if !missing(e1_elec_any_n)
	tostring(f21_main_complaint_reason_oth_n), replace
	replace f21_main_complaint_reason_other=f21_main_complaint_reason_oth_n if !missing(e1_elec_any_n)
	replace f22_maintenance_complaint_lodge=f22_main_complaint_lodge_n if !missing(e1_elec_any_n)
	tostring(f23_complaint_lodge_who_oth_n), replace             
	replace f23_main_complaint_lodge_who=f23_main_complaint_lodge_who_n if !missing(e1_elec_any_n)
	replace f23_complaint_lodge_who_other=f23_complaint_lodge_who_oth_n if !missing(e1_elec_any_n)
	replace f24_lineman_pay=f24_lineman_pay_n if !missing(e1_elec_any_n)
	replace f25_complaint_resolve=f25_complaint_resolve_n if !missing(e1_elec_any_n)
	replace f25_complaint_resolve_day=f25_complaint_resolve_day_n if !missing(e1_elec_any_n)


* DROPPING BACKCHECK RECONCILIATION VARIABLES

	drop e*_*_n f*_*_n
