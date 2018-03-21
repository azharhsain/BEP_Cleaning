/*****************************************************************
Project: BEP

Purpose: Baseline market business survey data variables' renaming

Author:  Azhar Hussain

Date  :  28 February, 2015
******************************************************************/



* RENAMING VARIABLES

	//// Section - 0 [General Information]
	rename bg13questions _resp_questions
	rename bg13answer _sur_answers
	rename bg13verb_consent _verbal_consent
	rename village_id1 _district_id
	rename feeder _feeder_name
	rename pss _pss_name
	rename market _market_name
	rename village_id2 _pss_id
	rename village_id3 _feeder_id
	rename village_id4 _market_id
	rename bg3pin_code _pin_code
	rename bg4lat_gpsaccuracy _gps_accuracy
	rename visits _visit_number
	rename surveyor_name _surveyor_name 
	rename surveyorsuprv_name _supervisor_name
	rename surveyor_code _surveyor_code
	rename surveyorsuprv_code _supervisor_code
	rename secaq0sectors0_1 _shop_retail
	rename secaq0retail_sect _retail_type
	rename secaq0retail_sect_oth _retail_oth_type
	rename secaq0sectors0_2 _shop_service
	rename secaq0serv_sect _service_type
	rename secaq0serv_sect_oth _service_oth_type
	rename secaq0sectors0_3 _shop_workshop
	rename secaq0workshop_sect _workshop_type
	rename secaq0workshop_sect_oth _workshop_oth_type
	rename biz_id _business_id
	rename area_id _market_id_complete
	rename endtime _survey_end_datetime
	rename metainstanceid _survey_metainstance_id
	rename parent_key _survey_parent_id
	rename simid _sim_id
	rename starttime _survey_start_datetime
	rename submissiondate _survey_submission_datetime
	rename subscriberid _survey_subscriber_id
	rename deviceid _survey_device_id
	rename district _district_name
	rename dupIDs _duplicate_parent_key
	rename dupbiz _duplicate_survey
	rename bg4lat_gpslatitude _gps_latitude
	rename bg4lat_gpslongitude _gps_longitude
	rename bg4lat_gpsaltitude _gps_altitude
	
	//// Section - A [Information about business premises]
	rename secaa1_proper a1_proprietor
	rename secaa1_proper_oth a1_proprietor_oth
	rename secaa2_knowledge a2_knowledge
	rename secabg16a3_time a3_time
	rename secabg16a4_own a4_owner
	rename secaa4_own_oth a4_owner_oth
	rename secaa5_rent a5_rent
	rename secaa6a6_size_land a6_land_size
	rename secaa6a6_size a6_land_unit
	rename secaa6_oth a6_land_unit_oth
	rename secabg20a7_land a7_land_cover
	rename secabg20a8_grpa8_land a8_builtup_size
	rename secabg20a8_grpa8_unit a8_builtup_unit
	rename secabg20a8_oth a8_builtup_unit_oth
	rename secabg20a9_room a9_room
	rename secabg20a10_land a10_sale
	rename secabg20a11a11_morning a11_morning_time
	rename secabg20a11a11_afternoon a11_afternoon_time
	rename secabg20a11a11_lunch a11_lunch_hours
	rename secabg20a12_switch a12_switchon_allday
	rename secabg20a12_time a12_switchon_time
	rename secabg20a13_customers a13_customers
	rename secabg20a14_plan a14_customers_percent
	rename secabg20a15_mem a15_member_association

	//// Section - B [Information about employees]
	rename secbb1_count b1_male_worker
	rename secbb2_count b2_female_worker
	rename secbb3_count b3_male_supervisor
	rename secbb4_count b4_female_supervisor
	rename secbb5_count b5_male_oth
	rename secbb6_count b6_female_oth
	rename secbb7b7_number b7_unpaid_family_member
	
	//// Section - C [Information about physical assets owned by the business]
	rename seccretail_asset_listcr1_tools c1_retail_asset
	rename secccalc1own c1_calculator_own
	rename secccalc1sold c1_calculator_sale
	rename seccscale1ws_own c1_weight_own
	rename seccscale1ws_sold c1_weight_sale
	rename seccelectric_scales1elec_scale1_ c1_elecweight_own
	rename v127 c1_elecweight_sale
	rename seccmetal1mc_own c1_metalcontainer_own
	rename seccmetal1mc_sold c1_metalcontainer_sale
	rename seccplastic1ps_own c1_plasticcontainer_own
	rename seccplastic1ps_sold c1_plasticcontainer_sale
	rename seccclockk1clock_own c1_clock_own
	rename seccclockk1clock_sold c1_clock_sale
	rename seccpurfi1pur_own c1_purifier_own
	rename seccpurfi1pur_sold c1_purifier_sale
	rename seccdrink1drink_own c1_crate_own
	rename seccdrink1drink_sold c1_crate_sale
	rename secctube1tubes_own c1_tyre_own
	rename secctube1tubes_sold c1_tyre_sale
	rename seccgas_cooker1cookers_own c1_gascooker_own
	rename seccgas_cooker1cookers_sold c1_gascooker_sale
	rename seccgas_cylinder1cylinders_own c1_gascylinder_own
	rename seccgas_cylinder1cylinders_sold c1_gascylinder_sale
	rename seccutensils1utensils_own c1_utensil_own
	rename seccutensils1utensils_sold c1_utensil_sale
	rename seccbulb1bulb_own c1_bulb_own
	rename seccbulb1bulb_sold c1_bulb_sale
	rename secctube_light1tube_own c1_tubelight_own
	rename secctube_light1tube_sold c1_tubelight_sale
	rename seccfan1fan_own c1_fan_own
	rename seccfan1fan_sold c1_fan_sale
	rename secccooler1cooler_own c1_aircooler_own
	rename secccooler1cooler_sold c1_aircooler_sale
	rename seccroom_heat1heater_own c1_roomheater_own
	rename seccroom_heat1heater_sold c1_roomheater_sale
	rename secccomp1_dcomp_own c1_desktop_own
	rename secccomp1_dcomp_sold c1_desktop_sale
	rename secccomp1_llaptop_own c1_laptop_own
	rename secccomp1_llaptop_sold c1_laptop_sale
	rename seccrefri1refri_own c1_refrigerator_own
	rename seccrefri1refri_sold c1_refrigerator_sale
	rename secccard1card_own c1_cardswipe_own
	rename secccard1card_sold c1_cardswipe_sale
	rename seccac1ac_own c1_airconditioner_own
	rename seccac1ac_sold c1_airconditioner_sale
	rename seccelectric1elecpuri_own c1_elecpurifier_own
	rename seccelectric1elecpuri_sold c1_elecpurifier_sale
	rename secccatcher1catcher_own c1_insectcatcher_own
	rename secccatcher1catcher_sold c1_insectcatcher_sale
	rename seccmotor1motor_own c1_motor_own
	rename seccmotor1motor_sold c1_motor_sale
	rename seccelec_grill1grill_own c1_scanner_own
	rename seccelec_grill1grill_sold c1_scanner_sale
	rename secccold_store1printer_own c1_printer_own
	rename secccold_store1printer_sold c1_printer_sale
	rename secccold_store2storage_own c1_coldstorage_own
	rename secccold_store2storage_sold c1_coldstorage_sale
	rename seccoth_specify1oth c1_retail_asset_oth
	rename seccoth_specify1oth_own c1_other_own
	rename seccoth_specify1oth_sold c1_other_sale
	rename seccserv_asset_listcs1_machine c2_service_asset
	rename secccalc2cal_own c2_calculator_own
	rename secccalc2cal_sold c2_calculator_sale
	rename seccscale2weigh_own c2_weight_own
	rename seccscale2weigh_sold c2_weight_sale
	rename seccelectric_scales2elec_scale2_ c2_elecweight_own
	rename v216 c2_elecweight_sale
	rename seccmetal2mcon_own c2_metalcontainer_own
	rename seccmetal2mcon_sold c2_metalcontainer_sale
	rename seccplastic2plastic_own c2_plasticcontainer_own
	rename seccplastic2plastic_sold c2_plasticcontainer_sale
	rename seccclocks2clocks_own c2_clock_own
	rename seccclocks2clocks_sold c2_clock_sale
	rename seccpurifier2purifier_own c2_purifier_own
	rename seccpurifier2purifier_sold c2_purifier_sale
	rename seccdrink2drinks_own c2_crate_own
	rename seccdrink2drinks_sold c2_crate_sale
	rename secctube2tubes1_own c2_tyre_own
	rename secctube2tubes1_sold c2_tyre_sale
	rename secccookers1gas_own c2_gascooker_own
	rename secccookers1gas_sold c2_gascooker_sale
	rename secccylinders1cylinder_own c2_gascylinder_own
	rename secccylinders1cylinder_sold c2_gascylinder_sale
	rename seccutensil1utensil_own c2_utensil_own
	rename seccutensil1utensil_sold c2_utensil_sale
	rename seccsew1sewing_own c2_sewing_own
	rename seccsew1sewing_sold c2_sewing_sale
	rename seccbottle1bottling_own c2_bottlemachine_own
	rename seccbottle1bottling_sold c2_bottlemachine_sale
	rename secchair_tools1hairdress_own c2_hairdress_own
	rename secchair_tools1hairdress_sold c2_hairdress_sale
	rename seccrepair_tools1repairs_own c2_bicycletool_own
	rename seccrepair_tools1repairs_sold c2_bicycletool_sale
	rename seccauto_repair1repair_own c2_autotool_own
	rename seccauto_repair1repair_sold c2_autotool_sale
	rename secccarpent_toolscarpentary_own c2_carpentarytool_own
	rename secccarpent_toolscarpentary_sold c2_carpentarytool_sale
	rename secchand_pumppumps_own c2_pump_own
	rename secchand_pumppumps_sold c2_pump_sale
	rename seccbulb2bulb2_own c2_bulb_own
	rename seccbulb2bulb2_sold c2_bulb_sale
	rename secctube_light2tubess_own c2_tubelight_own
	rename secctube_light2tubess_sold c2_tubelight_sale
	rename seccfan2fans_own c2_fan_own
	rename seccfan2fans_sold c2_fan_sale
	rename secccooler2coolers_own c2_aircooler_own
	rename secccooler2coolers_sold c2_aircooler_sale
	rename seccbg93heaters_own c2_roomheater_own
	rename seccbg93heaters_sold c2_roomheater_sale
	rename seccbg94comps_own c2_desktop_own
	rename seccbg94comps_sold c2_desktop_sale
	rename seccbg95laptops_own c2_laptop_own
	rename seccbg95laptops_sold c2_laptop_sale
	rename seccbg96frig_own c2_refrigerator_own
	rename seccbg96frig_sold c2_refrigerator_sale
	rename seccbg98cards_own c2_cardswipe_own
	rename seccbg98cards_sold c2_cardswipe_sale
	rename seccbg99acs_own c2_airconditioner_own
	rename seccbg99acs_sold c2_airconditioner_sale
	rename seccbg100electri_own c2_elecpurifier_own
	rename seccbg100electri_sold c2_elecpurifier_sale
	rename seccbg101catchers_own c2_insectcatcher_own
	rename seccbg101catchers_sold c2_insectcatcher_sale
	rename seccbg102motors_own c2_motor_own
	rename seccbg102motors_sold c2_motor_sale
	rename seccbg103driers_own c2_hairdrier_own
	rename seccbg103driers_sold c2_hairdrier_sale
	rename seccbg104scanners_own c2_scanner_own
	rename seccbg104scanners_sold c2_scanner_sale
	rename seccbg105printers_own c2_printer_own
	rename seccbg105printers_sold c2_printer_sale
	rename seccbg106ovens_own c2_oven_own
	rename seccbg106ovens_sold c2_oven_sale
	rename seccbg107grills_own c2_elecgrill_own
	rename seccbg107grills_sold c2_elecgrill_sale
	rename seccbg108stores_own c2_coldstorage_own
	rename seccbg108stores_sold c2_coldstorage_sale
	rename seccbg109otherss c2_service_asset_oth
	rename seccbg109otherss_own c2_other_own
	rename seccbg109otherss_sold c2_other_sale
	rename seccmanfact_asset_listcm1_manufa c3_workshop_asset
	rename seccbg126calculate_own c3_calculator_own
	rename seccbg126calculate_sold c3_calculator_sale
	rename seccbg127weight_own c3_weight_own
	rename seccbg127weight_sold c3_weight_sale
	rename seccbg142scaless_own c3_elecweight_own
	rename seccbg142scaless_sold c3_elecweight_sale
	rename seccbg128metal_own c3_metalcontainer_own
	rename seccbg128metal_sold c3_metalcontainer_sale
	rename seccbg129plasticss_own c3_plasticcontainer_own
	rename seccbg129plasticss_sold c3_plasticcontainer_sale
	rename seccbg130clockss_own c3_clock_own
	rename seccbg130clockss_sold c3_clock_sale
	rename seccbg132purifiers_own c3_purifier_own
	rename seccbg132purifiers_sold c3_purifier_sale
	rename seccdrinkk3drinks1_own c3_crate_own
	rename seccdrinkk3drinks1_sold c3_crate_sale
	rename secctubes3tubes2_own c3_tyre_own
	rename secctubes3tubes2_sold c3_tyre_sale
	rename seccbottle2bottling1_own c3_bottlemachine_own
	rename seccbottle2bottling1_sold c3_bottlemachine_sale
	rename seccbg133carpentools_own c3_carpentarytool_own
	rename seccbg133carpentools_sold c3_carpentarytool_sale
	rename secchand_pump1pumps1_own c3_pump_own
	rename secchand_pump1pumps1_sold c3_pump_sale
	rename seccbg134bulbss_own c3_bulb_own
	rename seccbg134bulbss_sold c3_bulb_sale
	rename seccbg135tubesss_own c3_tubelight_own
	rename seccbg135tubesss_sold c3_tubelight_sale
	rename seccbg136fanss_own c3_fan_own
	rename seccbg136fanss_sold c3_fan_sale
	rename seccbg137coolerss_own c3_aircooler_own
	rename seccbg137coolerss_sold c3_aircooler_sale
	rename seccbg138heaterss_own c3_roomheater_own
	rename seccbg138heaterss_sold c3_roomheater_sale
	rename seccbg139compss_own c3_desktop_own
	rename seccbg139compss_sold c3_desktop_sale
	rename seccbg140laptopss_own c3_laptop_own
	rename seccbg140laptopss_sold c3_laptop_sale
	rename seccbg141frigs_own c3_refrigerator_own
	rename seccbg141frigs_sold c3_refrigerator_sale
	rename seccbg143cardss_own c3_cardswipe_own
	rename seccbg143cardss_sold c3_cardswipe_sale
	rename seccbg144acss_own c3_airconditioner_own
	rename seccbg144acss_sold c3_airconditioner_sale
	rename seccbg145electric_own c3_elecpurifier_own
	rename seccbg145electric_sold c3_elecpurifier_sale
	rename seccbg146catcherss_own c3_insectcatcher_own
	rename seccbg146catcherss_sold c3_insectcatcher_sale
	rename seccbg147motorss_own c3_motor_own
	rename seccbg147motorss_sold c3_motor_sale
	rename seccbg148drills_own c3_drill_own
	rename seccbg148drills_sold c3_drill_sale
	rename seccgrillsgrills1_own c3_elecgrill_own
	rename seccgrillsgrills1_sold c3_elecgrill_sale
	rename seccbg149mills_own c3_elecmill_own
	rename seccbg149mills_sold c3_elecmill_sale
	rename seccbg150saws_own c3_elecsaw_own
	rename seccbg150saws_sold c3_elecsaw_sale
	rename seccbg151oths c3_workshop_asset_oth
	rename seccbg151oths_own c3_other_own
	rename seccbg151oths_sold c3_other_sale
	rename secclistasset1cm1_manufacture c4_retailservice_asset
	rename secccalculatorscalculate1_own c4_calculator_own
	rename secccalculatorscalculate1_sold c4_calculator_sale
	rename seccweight_scalesweight_own1 c4_weight_own
	rename seccweight_scalesweight_sold1 c4_weight_sale
	rename seccelectric_scalesscaless_own1 c4_elecweight_own
	rename seccelectric_scalesscaless_sold1 c4_elecweight_sale
	rename seccmetal_container1metal_own1 c4_metalcontainer_own
	rename seccmetal_container1metal_sold1 c4_metalcontainer_sale
	rename seccplastic_containersplasticss_ c4_plasticcontainer_own
	rename v433 c4_plasticcontainer_sale
	rename seccclock1clockss_own1 c4_clock_own
	rename seccclock1clockss_sold1 c4_clock_sale
	rename seccpurifiers2purifiers_own2 c4_purifier_own
	rename seccpurifiers2purifiers_sold2 c4_purifier_sale
	rename seccdrink3drinks3_own c4_crate_own
	rename seccdrink3drinks3_sold c4_crate_sale
	rename secctube3tubes2_own c4_tyre_own
	rename secctube3tubes2_sold c4_tyre_sale
	rename secccookers2gas_own1 c4_gascooker_own
	rename secccookers2gas_sold1 c4_gascooker_sale
	rename secccylinders2cylinder_own1 c4_gascylinder_own
	rename secccylinders2cylinder_sold1 c4_gascylinder_sale
	rename seccutensil2utensil_own1 c4_utensil_own
	rename seccutensil2utensil_sold1 c4_utensil_sale
	rename seccsew2sewing_own1 c4_sewing_own
	rename seccsew2sewing_sold1 c4_sewing_sale
	rename seccbottles2bottling1_own c4_bottlemachine_own
	rename seccbottles2bottling1_sold c4_bottlemachine_sale
	rename secchair_tools3hairdress_own3 c4_hairdress_own
	rename secchair_tools3hairdress_sold3 c4_hairdress_sale
	rename seccrepair_tools3repairs_own3 c4_bicycletool_own
	rename seccrepair_tools3repairs_sold3 c4_bicycletool_sale
	rename seccauto_repair3repair_own3 c4_autotool_own
	rename seccauto_repair3repair_sold3 c4_autotool_sale
	rename secctools_carpentcarpentools_own c4_carpentarytool_own
	rename secctools_carpentcarpentools_sol c4_carpentarytool_sale
	rename secchand_pump2pumps2_own c4_pump_own
	rename secchand_pump2pumps2_sold c4_pump_sale
	rename seccelectric_bulbs2bulbss_own2 c4_bulb_own
	rename seccelectric_bulbs2bulbss_sold2 c4_bulb_sale
	rename secctube_lights2tubesss2_own c4_tubelight_own
	rename secctube_lights2tubesss2_sold c4_tubelight_sale
	rename seccfans3fanss_own3 c4_fan_own
	rename seccfans3fanss_sold3 c4_fan_sale
	rename seccair_cooler1coolerss_own1 c4_aircooler_own
	rename seccair_cooler1coolerss_sold1 c4_aircooler_sale
	rename seccroom_heaters3heaterss_own3 c4_roomheater_own
	rename seccroom_heaters3heaterss_sold3 c4_roomheater_sale
	rename secccomp_desktopcompss_own1 c4_desktop_own
	rename secccomp_desktopcompss_sold1 c4_desktop_sale
	rename secccomp_laptoplaptopss_own1 c4_laptop_own
	rename secccomp_laptoplaptopss_sold1 c4_laptop_sale
	rename seccfrig1frigs_own1 c4_refrigerator_own
	rename seccfrig1frigs_sold1 c4_refrigerator_sale
	rename secccard_swipcardss_own1 c4_cardswipe_own
	rename secccard_swipcardss_sold1 c4_cardswipe_sale
	rename seccair_conditioner1acss_own1 c4_airconditioner_own
	rename seccair_conditioner1acss_sold1 c4_airconditioner_sale
	rename v507 c4_elecpurifier_own
	rename v508 c4_elecpurifier_sale
	rename seccelec_insect_catchercatcherss c4_insectcatcher_own
	rename v511 c4_insectcatcher_sale
	rename seccelectric_motor_supplymotorss c4_motor_own
	rename v514 c4_motor_sale
	rename secchair_driers3driers3_own1 c4_hairdrier_own
	rename secchair_driers3driers3_sold1 c4_hairdrier_sale
	rename seccscanner3scan3_own1 c4_scanner_own
	rename seccscanner3scan3_sold1 c4_scanner_sale
	rename seccprinter3printer3_own1 c4_printer_own
	rename seccprinter3printer3_sold1 c4_printer_sale
	rename seccovensovens_own1 c4_oven_own
	rename seccovensovens_sold1 c4_oven_sale
	rename seccgrills3grills3_own c4_elecgrill_own
	rename seccgrills3grills3_sold c4_elecgrill_sale
	rename seccdeep_freezefreeze_own1 c4_coldstorage_own
	rename seccdeep_freezefreeze_sold1 c4_coldstorage_sale
	rename seccoths3_specifyoths3 c4_retailservice_asset_oth
	rename seccoths3_specifyoths_own3 c4_other_own
	rename seccoths3_specifyoths_sold3 c4_other_sale
	rename seccasset_list_manufac_retcm1_ma c5_retailworkshop_asset
	rename secccalculators5calculate5_own c5_calculator_own
	rename secccalculators5calculate5_sold c5_calculator_sale
	rename seccweight_scales5weight_own5 c5_weight_own
	rename seccweight_scales5weight_sold5 c5_weight_sale
	rename seccelectric_scales5scaless_own5 c5_elecweight_own
	rename seccelectric_scales5scaless_sold c5_elecweight_sale
	rename seccmetal_container5metal_own5 c5_metalcontainer_own
	rename seccmetal_container5metal_sold5 c5_metalcontainer_sale
	rename seccplastic_containers5plasticss c5_plasticcontainer_own
	rename v552 c5_plasticcontainer_sale
	rename seccclocks5clockss_own5 c5_clock_own
	rename seccclocks5clockss_sold5 c5_clock_sale
	rename seccpurifiers5purifiers_own5 c5_purifier_own
	rename seccpurifiers5purifiers_sold5 c5_purifier_sale
	rename seccdrink5drinks5_own c5_crate_own
	rename seccdrink5drinks5_sold c5_crate_sale
	rename secctube5tubes5_own c5_tyre_own
	rename secctube5tubes5_sold c5_tyre_sale
	rename secccookers5gas_own5 c5_gascooker_own
	rename secccookers5gas_sold5 c5_gascooker_sale
	rename secccylinders5cylinder_own5 c5_gascylinder_own
	rename secccylinders5cylinder_sold5 c5_gascylinder_sale
	rename seccutensils5utensil_own5 c5_utensil_own
	rename seccutensils5utensil_sold5 c5_utensil_sale
	rename seccbottle5bottling5_own c5_bottlemachine_own
	rename seccbottle5bottling5_sold c5_bottlemachine_sale
	rename secctools_carpent5carpentools_ow c5_carpentarytool_own
	rename secctools_carpent5carpentools_so c5_carpentarytool_sale
	rename secchand_pump5pumps5_own c5_pump_own
	rename secchand_pump5pumps5_sold c5_pump_sale
	rename seccelectric_bulbs5bulbss_own5 c5_bulb_own
	rename seccelectric_bulbs5bulbss_sold5 c5_bulb_sale
	rename secctube_light5tubesss5_own c5_tubelight_own
	rename secctube_light5tubesss5_sold c5_tubelight_sale
	rename seccfans5fanss_own5 c5_fan_own
	rename seccfans5fanss_sold5 c5_fan_sale
	rename seccair_cooler5coolerss_own5 c5_aircooler_own
	rename seccair_cooler5coolerss_sold5 c5_aircooler_sale
	rename seccroom_heaters5heaterss_own5 c5_roomheater_own
	rename seccroom_heaters5heaterss_sold5 c5_roomheater_sale
	rename secccomp_desktop5compss_own5 c5_desktop_own
	rename secccomp_desktop5compss_sold5 c5_desktop_sale
	rename secccomp_laptop5laptopss_own5 c5_laptop_own
	rename secccomp_laptop5laptopss_sold5 c5_laptop_sale
	rename seccfrig5frigs_own5 c5_refrigerator_own
	rename seccfrig5frigs_sold5 c5_refrigerator_sale
	rename secccard_swip5cardss_own5 c5_cardswipe_own
	rename secccard_swip5cardss_sold5 c5_cardswipe_sale
	rename seccair_conditioner5acss_own5 c5_airconditioner_own
	rename seccair_conditioner5acss_sold5 c5_airconditioner_sale
	rename v614 c5_elecpurifier_own
	rename v615 c5_elecpurifier_sale
	rename seccelec_insect_catcher5catchers c5_insectcatcher_own
	rename v618 c5_insectcatcher_sale
	rename seccelectric_motor_supply5motors c5_motor_own
	rename v621 c5_motor_sale
	rename seccelec_drills5elec5_own c5_drill_own
	rename seccelec_drills5elec5_sold c5_drill_sale
	rename secchair_driers5driers3_own5 c5_hairdrier_own
	rename secchair_driers5driers3_sold5 c5_hairdrier_sale
	rename seccscanner5scan5_own1 c5_scanner_own
	rename seccscanner5scan5_sold1 c5_scanner_sale
	rename seccprinter5printer5_own1 c5_printer_own
	rename seccprinter5printer5_sold1 c5_printer_sale
	rename seccelec_grill5grill_own5 c5_elecgrill_own
	rename seccelec_grill5grill_sold5 c5_elecgrill_sale
	rename seccelec_mill5mill_own5 c5_elecmill_own
	rename seccelec_mill5mill_sold5 c5_elecmill_sale
	rename seccelec_saw5saw_own5 c5_elecsaw_own
	rename seccelec_saw5saw_sold5 c5_elecsaw_sale
	rename seccoths3_specify5oths5 c5_retailworkshop_asset_oth
	rename seccoths3_specify5oths_own5 c5_other_own
	rename seccoths3_specify5oths_sold5 c5_other_sale
	rename secclistasset3cm1_manufacturedd c6_serviceworkshop_asset
	rename secccalculators6calculate6_own c6_calculator_own
	rename secccalculators6calculate6_sold c6_calculator_sale
	rename seccweight_scales6weight_own6 c6_weight_own
	rename seccweight_scales6weight_sold6 c6_weight_sale
	rename seccelectric_scales6scaless_own6 c6_elecweight_own
	rename seccelectric_scales6scaless_sold6 c6_elecweight_sale
	rename seccmetal_container6metal_own6 c6_metalcontainer_own
	rename seccmetal_container6metal_sold6 c6_metalcontainer_sale
	rename seccplastic_containers6plasticss c6_plasticcontainer_own
	rename v662 c6_plasticcontainer_sale
	rename seccclocks6clockss_own6 c6_clock_own
	rename seccclocks6clockss_sold6 c6_clock_sale
	rename seccpurifiers6purifiers_own6 c6_purifier_own
	rename seccpurifiers6purifiers_sold6 c6_purifier_sale
	rename seccdrink6drinks6_own c6_crate_own
	rename seccdrink6drinks6_sold c6_crate_sale
	rename secctube6tubes6_own c6_tyre_own
	rename secctube6tubes6_sold c6_tyre_sale
	rename secccookers6gas_own6 c6_gascooker_own
	rename secccookers6gas_sold6 c6_gascooker_sale
	rename secccylinders6cylinder_own6 c6_gascylinder_own
	rename secccylinders6cylinder_sold6 c6_gascylinder_sale
	rename seccutensils6utensil_own6 c6_utensil_own
	rename seccutensils6utensil_sold6 c6_utensil_sale
	rename seccsew6sew_own6 c6_sewing_own
	rename seccsew6sew_sold6 c6_sewing_sale
	rename seccbottle6bottling6_own c6_bottlemachine_own
	rename seccbottle6bottling6_sold c6_bottlemachine_sale
	rename secchair_tools6hairdress_own6 c6_hairdress_own
	rename secchair_tools6hairdress_sold6 c6_hairdress_sale
	rename seccrepair_tools6repairs_own6 c6_bicycletool_own
	rename seccrepair_tools6repairs_sold6 c6_bicycletool_sale
	rename seccauto_repairs6repair_own6 c6_autotool_own
	rename seccauto_repairs6repair_sold6 c6_autotool_sale
	rename secctools_carpent6carpentools_ow c6_carpentarytool_own
	rename secctools_carpent6carpentools_so c6_carpentarytool_sale
	rename secchand_pump6pumps6_own c6_pump_own
	rename secchand_pump6pumps6_sold c6_pump_sale
	rename seccelectric_bulbs6bulbss_own6 c6_bulb_own
	rename seccelectric_bulbs6bulbss_sold6 c6_bulb_sale
	rename secctube_light6tubesss6_own c6_tubelight_own
	rename secctube_light6tubesss6_sold c6_tubelight_sale
	rename seccfans6fanss_own6 c6_fan_own
	rename seccfans6fanss_sold6 c6_fan_sale
	rename seccair_cooler6coolerss_own6 c6_aircooler_own
	rename seccair_cooler6coolerss_sold6 c6_aircooler_sale
	rename seccroom_heaters6heaterss_own6 c6_roomheater_own
	rename seccroom_heaters6heaterss_sold6 c6_roomheater_sale
	rename secccomp_desktop6compss_own6 c6_desktop_own
	rename secccomp_desktop6compss_sold6 c6_desktop_sale
	rename secccomp_laptop6laptopss_own6 c6_laptop_own
	rename secccomp_laptop6laptopss_sold6 c6_laptop_sale
	rename seccfrig6frigs_own6 c6_refrigerator_own
	rename seccfrig6frigs_sold6 c6_refrigerator_sale
	rename secccard_swip6cardss_own6 c6_cardswipe_own
	rename secccard_swip6cardss_sold6 c6_cardswipe_sale
	rename seccair_conditioner6acss_own6 c6_airconditioner_own
	rename seccair_conditioner6acss_sold6 c6_airconditioner_sale
	rename v736 c6_elecpurifier_own
	rename v737 c6_elecpurifier_sale
	rename seccelec_insect_catcher6catchers c6_insectcatcher_own
	rename v740 c6_insectcatcher_sale
	rename seccelectric_motor_supply6motors c6_motor_own
	rename v743 c6_motor_sale
	rename secchair_driers6driers6_own c6_hairdrier_own
	rename secchair_driers6driers6_sold c6_hairdrier_sale
	rename seccscanner6scan6_own1 c6_scanner_own
	rename seccscanner6scan6_sold1 c6_scanner_sale
	rename seccprinter6printer6_own1 c6_printer_own
	rename seccprinter6printer6_sold1 c6_printer_sale
	rename seccoven6oven_own6 c6_oven_own
	rename seccoven6oven_sold6 c6_oven_sale
	rename seccelec_grill6grill_own6 c6_elecgrill_own
	rename seccelec_grill6grill_sold6 c6_elecgrill_sale
	rename seccfreeze6freeze_own6 c6_coldstorage_own
	rename seccfreeze6freeze_sold6 c6_coldstorage_sale
	rename seccelec_mill6mill_own6 c6_elecmill_own
	rename seccelec_mill6mill_sold6 c6_elecmill_sale
	rename seccsaws6saw_own6 c6_elecsaw_own
	rename seccsaws6saw_sold6 c6_elecsaw_sale
	rename seccoths3_specify6oths6 c6_serviceworkshop_asset_oth
	rename seccoths3_specify6oths_own6 c6_other_own
	rename seccoths3_specify6oths_sold6 c6_other_sale
	rename seccasset_list2_manfac_retcm1_ma c7_retailserviceworkshop_asset
	rename secccalculators7calculate7_own c7_calculator_own
	rename secccalculators7calculate7_sold c7_calculator_sale
	rename seccweight_scale7weight_own7 c7_weight_own
	rename seccweight_scale7weight_sold7 c7_weight_sale
	rename seccelectric_scales7scaless_own7 c7_elecweight_own
	rename seccelectric_scales7scaless_sold c7_elecweight_sale
	rename seccmetal_container7metal_own7 c7_metalcontainer_own
	rename seccmetal_container7metal_sold7 c7_metalcontainer_sale
	rename seccplastic_containers7plasticss c7_plasticcontainer_own
	rename v787 c7_plasticcontainer_sale
	rename seccclocks7clockss_own7 c7_clock_own
	rename seccclocks7clockss_sold7 c7_clock_sale
	rename seccpurifiers7purifiers_own7 c7_purifier_own
	rename seccpurifiers7purifiers_sold7 c7_purifier_sale
	rename seccdrink7drinks7_own c7_crate_own
	rename seccdrink7drinks7_sold c7_crate_sale
	rename secctube7tubes7_own c7_tyre_own
	rename secctube7tubes7_sold c7_tyre_sale
	rename secccookers7gas_own7 c7_gascooker_own
	rename secccookers7gas_sold7 c7_gascooker_sale
	rename secccylinders7cylinder_own7 c7_gascylinder_own
	rename secccylinders7cylinder_sold7 c7_gascylinder_sale
	rename seccutensils7utensil_own7 c7_utensil_own
	rename seccutensils7utensil_sold7 c7_utensil_sale
	rename seccsew7sew_own7 c7_sewing_own
	rename seccsew7sew_sold7 c7_sewing_sale
	rename seccbottle7bottling7_own c7_bottlemachine_own
	rename seccbottle7bottling7_sold c7_bottlemachine_sale
	rename secchair_tools7hairdress_own7 c7_hairdress_own
	rename secchair_tools7hairdress_sold7 c7_hairdress_sale
	rename seccrepair_tools7repairs_own7 c7_bicycletool_own
	rename seccrepair_tools7repairs_sold7 c7_bicycletool_sale
	rename seccauto_repairs7repair_own7 c7_autotool_own
	rename seccauto_repairs7repair_sold7 c7_autotool_sale
	rename secctools_carpent7carpentools_ow c7_carpentarytool_own
	rename secctools_carpent7carpentools_so c7_carpentarytool_sale
	rename secchand_pump7pumps7_own c7_pump_own
	rename secchand_pump7pumps7_sold c7_pump_sale
	rename seccelectric_bulbs7bulbss_own7 c7_bulb_own
	rename seccelectric_bulbs7bulbss_sold7 c7_bulb_sale
	rename secctube_light7tubesss7_own c7_tubelight_own
	rename secctube_light7tubesss7_sold c7_tubelight_sale
	rename seccfans7fanss_own7 c7_fan_own
	rename seccfans7fanss_sold7 c7_fan_sale
	rename seccair_cooler7coolerss_own7 c7_aircooler_own
	rename seccair_cooler7coolerss_sold7 c7_aircooler_sale
	rename seccroom_heaters7heaterss_own7 c7_roomheater_own
	rename seccroom_heaters7heaterss_sold7 c7_roomheater_sale
	rename secccomp_desktop7compss_own7 c7_desktop_own
	rename secccomp_desktop7compss_sold7 c7_desktop_sale
	rename secccomp_laptop7laptopss_own7 c7_laptop_own
	rename secccomp_laptop7laptopss_sold7 c7_laptop_sale
	rename seccfrig7frigs_own7 c7_refrigerator_own
	rename seccfrig7frigs_sold7 c7_refrigerator_sale
	rename secccard_swip7cardss_own7 c7_cardswipe_own
	rename secccard_swip7cardss_sold7 c7_cardswipe_sale
	rename seccair_conditioner7acss_own7 c7_airconditioner_own
	rename seccair_conditioner7acss_sold7 c7_airconditioner_sale
	rename v861 c7_elecpurifier_own
	rename v862 c7_elecpurifier_sale
	rename seccelec_insect_catcher7catchers c7_insectcatcher_own
	rename v865 c7_insectcatcher_sale
	rename seccelectric_motor_supply7motors c7_motor_own
	rename v868 c7_motor_sale
	rename seccdrills7drill7_own c7_drill_own
	rename seccdrills7drill7_sold c7_drill_sale
	rename secchair_driers7driers7_own c7_hairdrier_own
	rename secchair_driers7driers7_sold c7_hairdrier_sale
	rename seccscanner7scan7_own1 c7_scanner_own
	rename seccscanner7scan7_sold1 c7_scanner_sale
	rename seccprinter7printer7_own1 c7_printer_own
	rename seccprinter7printer7_sold1 c7_printer_sale
	rename seccoven7oven_own7 c7_oven_own
	rename seccoven7oven_sold7 c7_oven_sale
	rename seccelec_grill7grill_own7 c7_elecgrill_own
	rename seccelec_grill7grill_sold7 c7_elecgrill_sale
	rename seccoths3_specify7oths7 c7_retservwork_asset_oth
	rename seccoths3_specify7oths_own7 c7_other_own
	rename seccoths3_specify7oths_sold7 c7_other_sale
	rename seccasset_list_all_businesslist_ c8_vehicle_asset
	rename seccbicyclesbicycle1_own c8_cycle_own
	rename seccbicyclesbicycle1_sold c8_cycle_sale
	rename seccbullocksbullock1_own1 c8_cart_own
	rename seccbullocksbullock1_sold1 c8_cart_sale
	rename seccwheelbarrowsbarrows_own1 c8_barrow_own
	rename seccwheelbarrowsbarrows_sold1 c8_barrow_sale
	rename seccmotorbikesbike_own1 c8_bike_own
	rename seccmotorbikesbike_sold1 c8_bike_sale
	rename secccarscars_own1 c8_car_own
	rename secccarscars_sold1 c8_car_sale
	rename secclorrieslorry_own1 c8_lorry_own
	rename secclorrieslorry_sold1 c8_lorry_sale
	rename seccminivansminivan_own1 c8_van_own
	rename seccminivansminivan_sold1 c8_van_sale
	rename seccoths3_specify8oths8 c8_vehicle_asset_oth
	rename seccoths3_specify8oths_own8 c8_other_own
	rename seccoths3_specify8oths_sold8 c8_other_sale
	rename secclist_furnitures c9_furniture_asset
	rename seccalmirahsalmirah1_own c9_almirah_own
	rename seccalmirahsalmirah1_sold c9_almirah_sale
	rename seccshelvesshelves_own1 c9_shelve_own
	rename seccshelvesshelves_sold1 c9_shelve_sale
	rename secctablestables_own1 c9_desk_own
	rename secctablestables_sold1 c9_desk_sale
	rename seccchairschairs_own1 c9_chair_own
	rename seccchairschairs_sold1 c9_chair_sale
	rename seccwoodenboxwbox_own1 c9_woodbox_own
	rename seccwoodenboxwbox_sold1 c9_woodbox_sale
	rename seccshowcasesshowcase_own1 c9_showcase_own
	rename seccshowcasesshowcase_sold1 c9_showcase_sale
	rename seccoths3_specify9oths9 c9_furniture_asset_oth
	rename seccoths3_specify9oths_own9 c9_other_own
	rename seccoths3_specify9oths_sold9 c9_other_sale
	
	//// Section - D [Information about inventory maintained by the business]
	rename secdbg169dr1_value d1_retail_inventory
	rename secdbg170perish_refrig1_val d1_perish_refrigerated_val
	rename secdbg171perish_refrig2_val d1_perish_nonrefrigerated_val
	rename secdbg172snack1_val d1_snack_refrigerated_val
	rename secdbg173snack2_val d1_snack_nonrefrigerated_val
	rename secdbg174meat1_val d1_meat_refrigerated_val
	rename secdbg175meat2_val d1_meat_nonrefrigerated_val
	rename secdbg176dairy1_val d1_dairy_refrigerated_val
	rename secdbg177dairy2_val d1_dairy_nonrefrigerated_val
	rename secdbg178cigarette1_val d1_cigarette_val
	rename secdbg179spic1_val d1_spice_val
	rename secdbg180foods1_val d1_food_val
	rename secdbg181eggs1_val d1_chemical_val
	rename secdbg183cosmetic1_val d1_cosmetic_val
	rename secdbg184med1_val d1_medicine_val
	rename secdbg185shoes1_val d1_shoe_val
	rename secdbg186jewel1_val d1_jewel_val
	rename secdbg188polyth1_val d1_polythene_val
	rename secdbg189fuel1_val d1_paper_val
	rename secdutensilutensil1_val d1_packingmaterial_val
	rename secdgraingrain1_val d1_grain_val
	rename secdwoodwood1_val d1_wood_val
	rename secdmetalmetal1_val d1_metal_val
	rename secdprocessed_grainprocessed1_va d1_processedgrain_val
	rename secdwood_productswood1_val d1_woodproduct_val
	rename secdmetal_productsmetal1_val d1_metalproduct_val
	rename secdfuelsfuel1_val d1_salefuel_val
	rename secdbg190ors_spec1 d1_retailinventory_oth
	rename secdbg190ors_spec1_val d1_other_val
	rename secdbg191ds1_value1 d2_service_inventory
	rename secdbg192perish_refri3_val d2_perish_refrigerated_val
	rename secdbg193perish_refri4_val d2_perish_nonrefrigerated_val
	rename secdbg194perish_refri5_val d2_snack_refrigerated_val
	rename secdbg195perish_refri6_val d2_snack_nonrefrigerated_val
	rename secdbg196dairy3_val d2_meat_refrigerated_val
	rename secdbg197dairy4_val d2_meat_nonrefrigerated_val
	rename secdbg198foods2_val d2_dairy_refrigerated_val
	rename secdbg199eggs2_val d2_dairy_nonrefrigerated_val
	rename secdbg200cosmetic2_val d2_cigarette_val
	rename secdbg201med2_val d2_spice_val
	rename secdbg202paper2_val d2_food_val
	rename secdbg203pckg2_val d2_chemical_val
	rename secdbg204fuel2_val d2_cosmetic_val
	rename secdbg205bic_repair_val d2_medicine_val
	rename secdbg206auto_rep_val d2_paper_val
	rename secdbg207hair_dress_val d2_packingmaterial_val
	rename secdbg2007grain2_val d2_grain_val
	rename secdbg208ors_spec2 d2_serviceinventory_oth
	rename secdbg208ors_spec2_val d2_other_val
	rename secdbg209dm1_value2 d3_workshop_inventory
	rename secdbg210grains3_val d3_polythene_val
	rename secdbg211woods3_val d3_packingmaterial_val
	rename secdbg212metal3_val d3_grain_val
	rename secdbg213fuel3_val d3_wood_val
	rename secdbg2013metal3_val d3_metal_val
	rename secdbg2014process_grains3_val d3_processedgrain_val
	rename secdbg2015wood_products3_val d3_woodproduct_val
	rename secdbg2016metal_products3_val d3_metalproduct_val
	rename secdbg2017fuels3_val d3_productionfuel_val
	rename secdbg214ors_spec3 d3_workshopinventory_oth
	rename secdbg214ors_spec3_val d3_other_val
	rename secdd_ret_servdr1_value3 d4_retailservice_inventory
	rename secdbg1700perish_refrig7_val d4_perish_refrigerated_val
	rename secdbg1711perish_refrig8_val d4_perish_nonrefrigerated_val
	rename secdbg1722snack7_val d4_snack_refrigerated_val
	rename secdbg1733snack8_val d4_snack_nonrefrigerated_val
	rename secdbg1744meat9_val d4_meat_refrigerated_val
	rename secdbg1755meat10_val d4_meat_nonrefrigerated_val
	rename secdbg1766dairy10_val d4_dairy_refrigerated_val
	rename secdbg1777dairy11_val d4_dairy_nonrefrigerated_val
	rename secdbg1788cigarette12_val d4_cigarette_val
	rename secdbg1799spic12_val d4_spice_val
	rename secdbg1800foods13_val d4_food_val
	rename secdbg1811eggs14_val d4_chemical_val
	rename secdbg1812cosmetic15_val d4_cosmetic_val
	rename secdbg1844med12_val d4_medicine_val
	rename secdbg1855shoes12_val d4_shoe_val
	rename secdbg1866jewel12_val d4_jewel_val
	rename secdbg1888polyth13_val d4_polythene_val
	rename secdbg1899fuel14_val d4_paper_val
	rename secdutensil15sutensil15_val d4_packingmaterial_val
	rename secdgrain16sgrain16_val d4_grain_val
	rename secdwood16swood17_val d4_wood_val
	rename secdmetal18smetal18_val d4_metal_val
	rename v1102 d4_processedgrain_val
	rename secdwood_products20wood20_val d4_woodproduct_val
	rename secdmetal_products21metal21_val d4_metalproduct_val
	rename secdfuels22fuel22_val d4_salefuel_val
	rename secdbg1900ors_spec23 d4_retailserviceinventory_oth
	rename secdbg1900ors_spec23_val d4_other_val
	rename secdd_ret_mfgdr1_value4 d5_retailworkshop_inventory
	rename secdperish1perish_refrig7_val d5_perish_refrigerated_val
	rename secdperish2perish_refrig8_val d5_perish_nonrefrigerated_val
	rename secdsnack1snack7_val d5_snack_refrigerated_val
	rename secdsnack2snack8_val d5_snack_nonrefrigerated_val
	rename secdmeat1meat9_val d5_meat_refrigerated_val
	rename secdmeat2meat10_val d5_meat_nonrefrigerated_val
	rename secddairy1dairy10_val d5_dairy_refrigerated_val
	rename secddairy2dairy11_val d5_dairy_nonrefrigerated_val
	rename secdcigar1cigarette12_val d5_cigarette_val
	rename secdspic1spic12_val d5_spice_val
	rename secdfood1foods13_val d5_food_val
	rename secdegg1eggs14_val d5_chemical_val
	rename secdcosmetic1cosmetic15_val d5_cosmetic_val
	rename secdmed1med12_val d5_medicine_val
	rename secdshoe1shoes12_val d5_shoe_val
	rename secdjewel1jewel12_val d5_jewel_val
	rename secdpolythen1polyth13_val d5_polythene_val
	rename secdfuel1fuel14_val d5_paper_val
	rename secdutensil16sutensil15_val d5_packingmaterial_val
	rename secdgrain17sgrain16_val d5_grain_val
	rename secdwood17swood17_val d5_wood_val
	rename secdmetal19smetal18_val d5_metal_val
	rename v1158 d5_processedgrain_val
	rename secdwood_products21wood20_val d5_woodproduct_val
	rename secdmetal_products22metal21_val d5_metalproduct_val
	rename secdfuels23fuel22_val d5_salefuel_val
	rename secdfuels24fuel23_val d5_productionfuel_val
	rename secdbg1901ors_spec23 d5_retailworkshopinventory_oth
	rename secdbg1901ors_spec23_val d5_other_val
	rename secdd_serv_mfgdr1_value5 d6_serviceworkshop_inventory
	rename secdperis1perish_refrig7_val d6_perish_refrigerated_val
	rename secdperis2perish_refrig8_val d6_perish_nonrefrigerated_val
	rename secdsnac1snack7_val d6_snack_refrigerated_val
	rename secdsnac2snack8_val d6_snack_nonrefrigerated_val
	rename secdmeatt1meat9_val d6_meat_refrigerated_val
	rename secdmeatt2meat10_val d6_meat_nonrefrigerated_val
	rename secddai1dairy10_val d6_dairy_refrigerated_val
	rename secddai2dairy11_val d6_dairy_nonrefrigerated_val
	rename secdcigar3cigarette12_val d6_cigarette_val
	rename secdspice3spic12_val d6_spice_val
	rename secdfood3foods13_val d6_food_val
	rename secdegg3eggs14_val d6_chemical_val
	rename secdcosmetic3cosmetic15_val d6_cosmetic_val
	rename secdmed3med12_val d6_medicine_val
	rename secdfuel3fuel14_val d6_paper_val
	rename secdutensil3utensil15_val d6_packingmaterial_val
	rename secdgrain3grain16_val d6_grain_val
	rename secdwood3wood17_val d6_wood_val
	rename secdmetal3metal18_val d6_metal_val
	rename secdprocessed_grain3processed19_ d6_processedgrain_val
	rename secdwood_products3wood20_val d6_woodproduct_val
	rename secdmetal_products3metal21_val d6_metalproduct_val
	rename secdfuels3fuel23_val d6_productionfuel_val
	rename secdbg1902ors_spec23 d6_serviceworkshopinventory_oth
	rename secdbg1902ors_spec23_val d6_other_val
	rename secdd_ret_serv_mfgdr1_value7 d7_retservwork_inventory
	rename secdperish4perish_refrig7_val d7_perish_refrigerated_val
	rename secdperish5perish_refrig8_val d7_perish_nonrefrigerated_val
	rename secdsnack5snack7_val d7_snack_refrigerated_val
	rename secdsnack6snack8_val d7_snack_nonrefrigerated_val
	rename secdmeat7meat9_val d7_meat_refrigerated_val
	rename secdmeat8meat10_val d7_meat_nonrefrigerated_val
	rename secddair7dairy10_val d7_dairy_refrigerated_val
	rename secddairy8dairy11_val d7_dairy_nonrefrigerated_val
	rename secdcigar7cigarette12_val d7_cigarette_val
	rename secdspic7spic12_val d7_spice_val
	rename secdfood7foods13_val d7_food_val
	rename secdegg7eggs14_val d7_chemical_val
	rename secdcosmetic7cosmetic15_val d7_cosmetic_val
	rename secdmed7med12_val d7_medicine_val
	rename secdshoe7shoes12_val d7_shoe_val
	rename secdjewel7jewel12_val d7_jewel_val
	rename secdpolythen7polyth13_val d7_polythene_val
	rename secdfuel7fuel14_val d7_paper_val
	rename secdutensil7utensil15_val d7_packingmaterial_val
	rename secdgrain7grain16_val d7_grain_val
	rename secdwood7wood17_val d7_wood_val
	rename secdmetal7metal18_val d7_metal_val
	rename secdprocessed_grain7processed19_ d7_processedgrain_val
	rename secdwood_products7wood20_val d7_woodproduct_val
	rename secdmetal_products7metal21_val d7_metalproduct_val
	rename secdfuels7fuel22_val d7_salefuel_val
	rename secdfuel_for_prodfuel23_val d7_productionfuel_val
	rename secdbg1903ors_spec23 d7_retservworkinventory_oth
	rename secdbg1903ors_spec23_val d7_other_val
	
	//// Section - E [Information about energy consumption by the business]
	rename elec_any e1_elec_any
	rename secebg219bg219_1e2_have_elec e2_elec_past
	rename secebg219bg219_1e3_not_elec e3_noelec_reason
	rename secee3_oth e3_noelec_reason_oth
	rename secee4_source e4_elec_source
	rename secee4_oth e4_elec_source_oth
	rename elec_generator e5_elec_genset
	rename secebg220bg221e6_grpe6_capac e6_genset_capacity
	rename secebg220bg221e6_grpe6_unit e6_genset_unit
	rename secebg220bg221e7_shared e7_genset_shared
	rename secebg220bg221e7_oth e7_genset_shared_oth
	rename secebg220bg221bg222e8_purchase e8_genset_cost
	rename secebg220bg221bg222e9_spend e9_genset_exp
	rename secebg220bg221e9e9_rs_mon e9_genset_exp_rupee
	rename secebg220bg221e9e9_lt_mon e9_genset_exp_litre
	rename secebg220bg221e9e9_cost_ltr e9_diesel_cost
	rename secebg220bg221bg223e10_shared e10_genset_shared_people
	rename secebg220bg221bg223e11_pay e11_genset_shared_cost
	rename secebg220bg221bg223e12_pay e12_genset_shared_exp_amount
	rename secebg220bg221bg223e12_pay1 e12_genset_shared_exp_unit
	rename secebg220bg224e12_oth e12_genset_shared_exp_unit_oth
	rename elec_solar e13_elec_solar
	rename secebg220e14_to_e18e14_kind e14_solar_owner
	rename secebg220e14_to_e18e15_pay e15_solar_cost
	rename secebg220e14_to_e18e16_pay e16_solar_shared
	rename secebg220e14_to_e18e17_pay e17_solar_shared_cost
	rename secebg220e14_to_e18e18_spend e18_solar_shared_exp
	rename elec_grid e19_elec_grid
	rename elec_rent e20_grid_billing
	rename cons_metered e21_metered_consumer
	rename secebg220bg226e21_to_e27e22_loca e22_meter_location
	rename secebg220bg226e21_to_e27e22_oth e22_meter_location_oth
	rename secebg220bg226e21_to_e27e23_func e23_meter_functional
	rename secebg220bg226e21_to_e27e24_to_e e24_meter_damage_duration
	rename v1313 e25_meter_complaint
	rename v1314 e26_meter_complaint_location
	rename v1315 e26_meter_complaint_location_oth
	rename v1316 e27_meter_noncomplaint
	rename v1317 e27_meter_noncomplaint_oth
	rename cons_billed e28_consumers_billed
	rename secebg220bg226e28_datee28_dd_mm_ e28_consumers_bill_date
	rename secebg220bg226e29_to_e35e29_appl e29_consumers_bill_month
	rename secebg220bg226e29_to_e35e29_oth e29_consumers_bill_month_oth
	rename secebg220bg226e29_to_e35e30_unde e30_bill_availability
	rename secebg220bg226e29_to_e35e31_cons e31_bill_consumer_number
	rename secebg220bg226e29_to_e35e32_know e32_know_consumer_number
	rename secebg220bg226e29_to_e35e33_surv e33_ask_consumer_number
	rename secebg220bg226e29_to_e35e34_paid e34_bill_payment
	rename secebg220bg226e29_to_e35e34_date e34_bill_payment_last_date
	rename secebg220bg226e29_to_e35e35_pay e35_bill_payment_location
	rename secebg220bg226e29_to_e35e35_pay_ e35_bill_payment_location_oth
	
	//// Section - F [Information about electricity supply situation]
	rename secebg220secfbgf1f1_connec f1_grid_elec_date
	rename secebg220secff2_no_hrs f2_avg_gridelec_perday
	rename secebg220secff2time_slot1 f2_gridelec_7amto12pm
	rename secebg220secff2time_slot2 f2_gridelec_12pmto5pm
	rename secebg220secff2time_slot3 f2_gridelec_5pmto11pm
	rename secebg220secff2time_slot4 f2_gridelec_11pmto7am
	rename secebg220secff2_tot_avail f2_sum_of_slots
	rename secebg220secff4_to_f5f4_receive_ f3_elec_future_expect
	rename secebg220secff4_to_f5f5_factors f4_elec_supply_factor
	rename secebg220secff5_oth f4_elec_supply_factor_oth
	rename secebg220secff6_to_f7f6_hrs f5_elec_neighbour_hour
	rename secebg220secff6_to_f7f7_changed f6_elec_neighbour_hour_change
	rename secebg220secff8_reason f7_neighbour_hour_change_reason
	rename secebg220secff8_oth f7_neigh_hour_change_reason_oth
	rename secebg220secff9_maintain f8_maintenance_complaint
	rename secebg220secff10_to_f14f10_compl f9_maintenance_complaint_reason
	rename secebg220secff10_to_f14f10_oth f9_main_complaint_reason_oth
	rename secebg220secff10_to_f14f11_compl f10_maintenance_complaint_lodge
	rename secebg220secff10_to_f14f12_to_f1 f11_main_complaint_lodge_who
	rename v1358 f11_main_complaint_lodge_who_oth
	rename v1361 f12_lineman_pay
	rename v1362 f13_complaint_resolve
	rename v1363 f13_complaint_resolve_day
	
	//// Section - G [Information about expenditure, revenue and credit of the business]
	rename secgg_ret_busg1_sales g1_ret_lastday_sale
	rename secgg_ret_busg2_sales g2_ret_lastmonth_sale
	rename secgg_ser_busg3_revenue g3_ser_lastday_revenue
	rename secgg_ser_busg4_revenue g4_ser_lastmonth_revenue
	rename secgg_mfg_busg5_sales g5_wor_lastday_sale
	rename secgg_mfg_busg6_sales g6_wor_lastmonth_sale
	rename secgg_ret_serv_busg7_sales g7_retser_lastday_retsale
	rename secgg_ret_serv_busg8_sales g8_retser_lastmonth_retsale
	rename secgg_ret_serv_busg9_sales g9_retser_lastday_serrev
	rename secgg_ret_serv_busg10_sales g10_retser_lastmonth_serrev
	rename secgg_ret_mfg_busg11_sales g11_retwor_lastday_retsale
	rename secgg_ret_mfg_busg12_sales g12_retwor_lastmonth_retsale
	rename secgg_ret_mfg_busg13_sales g13_retwor_lastday_worksale
	rename secgg_ret_mfg_busg14_sales g14_retwor_lastmonth_worksale
	rename secgg_serv_mfg_busg15_sales g15_serwor_lastday_serrev
	rename secgg_serv_mfg_busg16_sales g16_serwor_lastmonth_serrev
	rename secgg_serv_mfg_busg17_sales g17_serwor_lastday_worksale
	rename secgg_serv_mfg_busg18_sales g18_serwor_lastmonth_worksale
	rename secgg_ret_serv_mfg_busg19_sales g19_retserwor_lastday_retsale
	rename secgg_ret_serv_mfg_busg20_sales g20_retserwor_lastmonth_retsale
	rename secgg_ret_serv_mfg_busg21_sales g21_retserwor_lastday_serrev
	rename secgg_ret_serv_mfg_busg22_sales g22_retserwor_lastmonth_serrev
	rename secgg_ret_serv_mfg_busg23_sales g23_retserwor_lastday_worksale
	rename secgg_ret_serv_mfg_busg24_sales g24_retserwor_lastmonth_worksale
	rename secgask_all_busg25_income g25_income_rent_int
	rename secgask_all_busg26_income g26_income_rent_int_amount
	rename secgdet_exp_ppurch_matl g27_material_exp
	rename secgdet_exp_ppurch_water g27_watergasfuel_exp
	rename secgdet_exp_ppurch_raw_matl g27_rawmaterial_exp
	rename secgdet_exp_pintr_paid g27_loaninterest_exp
	rename secgdet_exp_p1wages_sal g27_employeesalary_exp
	rename secgdet_exp_p1rent_machn g27_machinerent_exp
	rename secgdet_exp_p1rent_land g27_landrent_exp
	rename secgdet_exp_p1tele_cellphn g27_cellphone_exp
	rename secgdet_exp_p2taxes g27_tax_exp
	rename secgdet_exp_p2mainten_gen_rep g27_maintenance_exp
	rename secgdet_exp_p2oth_exp g27_miscellaneous_exp
	rename secgg16_income g28_lastmonth_profit
	rename secgprofit g28_lastmonth_profit_amount
	rename secgg17a_to_g19g17a_to_g17bg17a_ g29a_other_timeperiod
	rename secgg17a_to_g19g17a_to_g17bg17b_ g29b_other_timeperiod_income
	rename secgg17a_to_g19g18_income g30_lastmonth_income
	rename secgg19_purchase g31_rawmaterial_credit
	rename secgg20_to_g21g20_buy g32_rawmaterial_credit_lastmonth
	rename secgg20_to_g21g21_amt g33_supplier_credit_owe
	rename secgg22_bnk_acct g34_business_bankaccount
	rename secgg23_cur_amt g35_bankaccount_money
	rename secgloan_detailsg24_loans g36_outstanding_loan
	rename secgg25_det g37_loan_type
	rename secgdet_loan1g25_tot_amt g37_loan_amount
	rename secgdet_loan1g25_owe g37_loan_outstanding_bal
	rename secgdet_loan1g25_intr_rate g37_loan_interest_rate_type
	rename secgdet_loan1g25_per_annum g37_loan_interest_perannum
	rename secgdet_loan1g25_per_month g37_loan_interest_permonth
	
	//// Section - H [Interviewer’s Notes]
	rename sechh1_to_h4h1_intrv_end h1_interview_end_time
	rename sechh1_to_h4h2_lang h2_interview_lang
	rename sechh1_to_h4h3_oth_lang h3_interview_lang_oth
	rename sechh4_lang h4_interview_oth_name
	rename sechh5_to_h7h5_present h5_number_of_people
	rename sechh5_to_h7h6_others h6_other_people
	rename sechh5_to_h7h7_satisfy h7_survey_satisfactory_answer
	rename sechcmt_box h8_survey_comment

	
* RENAMING DISTRICT, PSS & FEEDER TO MATCH IMPLEMENTATION DATA

	// Renaming District
	replace _district_name="Saran" if _district_name=="CHAPRA"
	replace _district_name=upper(_district_name)
	
	// Renaming PSS
	replace _pss_name="A2Z " if _pss_name=="A2Z"
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
	replace e3_noelec_reason_oth=e3_noelec_reason_oth_n if !missing(e1_elec_any_n)
	replace e4_elec_source=e4_elec_source_n if !missing(e1_elec_any_n)
	tostring(e4_elec_source_oth_n), replace
	replace e4_elec_source_oth=e4_elec_source_oth_n if !missing(e1_elec_any_n)
	replace e5_elec_genset=e5_elec_genset_n if !missing(e1_elec_any_n)
	replace e6_genset_capacity=e6_genset_capacity_n if !missing(e1_elec_any_n)
	replace e6_genset_unit=e6_genset_unit_n if !missing(e1_elec_any_n)
	replace e7_genset_shared=e7_genset_shared_n if !missing(e1_elec_any_n)
	tostring(e7_genset_shared_oth_n), replace
	replace e7_genset_shared_oth=e7_genset_shared_oth_n if !missing(e1_elec_any_n)
	replace e8_genset_cost=e8_genset_cost_n if !missing(e1_elec_any_n)
	replace e9_diesel_cost=e9_diesel_cost_n if !missing(e1_elec_any_n)
	replace e9_genset_exp=e9_genset_exp_n if !missing(e1_elec_any_n)
	replace e9_genset_exp_litre=e9_genset_exp_litre_n if !missing(e1_elec_any_n)
	replace e9_genset_exp_rupee=e9_genset_exp_rupee_n if !missing(e1_elec_any_n)
	replace e10_genset_shared_people=e10_genset_shared_people_n if !missing(e1_elec_any_n)
	replace e11_genset_shared_cost=e11_genset_shared_cost_n if !missing(e1_elec_any_n)
	replace e12_genset_shared_exp_amount=e12_genset_shared_exp_amount_n if !missing(e1_elec_any_n)
	replace e12_genset_shared_exp_unit=e12_genset_shared_exp_unit_n if !missing(e1_elec_any_n)
	tostring(e12_genset_shared_exp_unit_oth_n), replace
	replace e12_genset_shared_exp_unit_oth=e12_genset_shared_exp_unit_oth_n if !missing(e1_elec_any_n)
	replace e13_elec_solar=e13_elec_solar_n if !missing(e1_elec_any_n)
	replace e14_solar_owner=e14_solar_owner_n if !missing(e1_elec_any_n)
	replace e15_solar_cost=e15_solar_cost_n if !missing(e1_elec_any_n)
	replace e16_solar_shared=e16_solar_shared_n if !missing(e1_elec_any_n)
	replace e17_solar_shared_cost=e17_solar_shared_cost_n if !missing(e1_elec_any_n)
	replace e18_solar_shared_exp=e18_solar_shared_exp_n if !missing(e1_elec_any_n)
	replace e19_elec_grid=e19_elec_grid_n if !missing(e1_elec_any_n)
	replace e20_grid_billing=e20_grid_billing_n if !missing(e1_elec_any_n)
	replace e21_metered_consumer=e21_metered_consumer_n if !missing(e1_elec_any_n)
	replace e22_meter_location=e22_meter_location_n if !missing(e1_elec_any_n)
	tostring(e22_meter_location_oth_n), replace
	replace e22_meter_location_oth=e22_meter_location_oth_n if !missing(e1_elec_any_n)
	replace e23_meter_functional=e23_meter_functional_n if !missing(e1_elec_any_n)
	replace e24_meter_damage_duration=e24_meter_damage_duration_n if !missing(e1_elec_any_n)
	replace e25_meter_complaint=e25_meter_complaint_n if !missing(e1_elec_any_n)
	replace e26_meter_complaint_location=e26_meter_complaint_location_n if !missing(e1_elec_any_n)
	tostring(e26_meter_complaint_loc_oth_n), replace
	replace e26_meter_complaint_location_oth=e26_meter_complaint_loc_oth_n if !missing(e1_elec_any_n)
	replace e27_meter_noncomplaint=e27_meter_noncomplaint_n if !missing(e1_elec_any_n)
	tostring(e27_meter_noncomplaint_oth_n), replace
	replace e27_meter_noncomplaint_oth=e27_meter_noncomplaint_oth_n if !missing(e1_elec_any_n)
	replace e28_consumers_billed=e28_consumers_billed_n if !missing(e1_elec_any_n)
	replace e28_consumers_bill_date=e28_consumers_bill_date_n if !missing(e1_elec_any_n)
	replace e29_consumers_bill_month=e29_consumers_bill_month_n if !missing(e1_elec_any_n)
	tostring(e29_consumers_bill_month_oth_n), replace
	replace e29_consumers_bill_month_oth=e29_consumers_bill_month_oth_n if !missing(e1_elec_any_n)
	replace e30_bill_availability=e30_bill_availability_n if !missing(e1_elec_any_n)
	replace e31_bill_consumer_number=e31_bill_consumer_number_n if !missing(e1_elec_any_n)
	replace e32_know_consumer_number=e32_know_consumer_number_n if !missing(e1_elec_any_n)
	replace e33_ask_consumer_number=e33_ask_consumer_number_n if !missing(e1_elec_any_n)
	replace e34_bill_payment=e34_bill_payment_n if !missing(e1_elec_any_n)
	replace e34_bill_payment_last_date=e34_bill_payment_last_date_n if !missing(e1_elec_any_n)
	replace e35_bill_payment_location=e35_bill_payment_location_n if !missing(e1_elec_any_n)
	tostring(e35_bill_payment_location_oth_n), replace
	replace e35_bill_payment_location_oth=e35_bill_payment_location_oth_n if !missing(e1_elec_any_n)
	replace f1_grid_elec_date=f1_grid_elec_date_n if !missing(e1_elec_any_n)
	replace f2_avg_gridelec_perday=f2_avg_gridelec_perday_n if !missing(e1_elec_any_n)
	replace f2_gridelec_7amto12pm=f2_gridelec_7amto12pm_n if !missing(e1_elec_any_n)
	replace f2_gridelec_12pmto5pm=f2_gridelec_12pmto5pm_n if !missing(e1_elec_any_n)
	replace f2_gridelec_5pmto11pm=f2_gridelec_5pmto11pm_n if !missing(e1_elec_any_n)
	replace f2_gridelec_11pmto7am=f2_gridelec_11pmto7am_n if !missing(e1_elec_any_n)
	replace f2_sum_of_slots=f2_sum_of_slots_n if !missing(e1_elec_any_n)
	replace f3_elec_future_expect=f3_elec_future_expect_n if !missing(e1_elec_any_n)
	replace f4_elec_supply_factor=f4_elec_supply_factor_n if !missing(e1_elec_any_n)
	replace f4_elec_supply_factor_oth=f4_elec_supply_factor_oth_n if !missing(e1_elec_any_n)
	replace f5_elec_neighbour_hour=f5_elec_neighbour_hour_n if !missing(e1_elec_any_n)
	replace f6_elec_neighbour_hour_change=f6_elec_neighbour_hour_change_n if !missing(e1_elec_any_n)
	replace f7_neighbour_hour_change_reason=f7_neigh_hour_change_reason_n if !missing(e1_elec_any_n)
	tostring(f7_neigh_hr_change_reason_oth_n), replace
	replace f7_neigh_hour_change_reason_oth=f7_neigh_hr_change_reason_oth_n if !missing(e1_elec_any_n)
	replace f8_maintenance_complaint=f8_maintenance_complaint_n if !missing(e1_elec_any_n)
	tostring(f9_main_complaint_reason_n), replace
	replace f9_main_complaint_reason_n="" if f9_main_complaint_reason_n== "."
	replace f9_maintenance_complaint_reason=f9_main_complaint_reason_n if !missing(e1_elec_any_n)
	tostring(f9_main_complaint_reason_oth_n), replace
	replace f9_main_complaint_reason_oth=f9_main_complaint_reason_oth_n if !missing(e1_elec_any_n)
	replace f10_maintenance_complaint_lodge=f10_main_complaint_lodge_n if !missing(e1_elec_any_n)
	replace f11_main_complaint_lodge_who=f11_main_complaint_lodge_who_n if !missing(e1_elec_any_n)
	replace f11_main_complaint_lodge_who_oth=f11_main_comp_lodge_who_oth_n if !missing(e1_elec_any_n)
	replace f12_lineman_pay=f12_lineman_pay_n if !missing(e1_elec_any_n)
	replace f13_complaint_resolve=f13_complaint_resolve_n if !missing(e1_elec_any_n)
	replace f13_complaint_resolve_day=f13_complaint_resolve_day_n if !missing(e1_elec_any_n)

	
* DROPPING BACKCHECK RECONCILIATION VARIABLES

	drop e*_*_n f*_*_n
