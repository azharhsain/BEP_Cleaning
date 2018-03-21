/*****************************************************************************************
Project: BEP

Purpose: Baseline area business survey data insignificant and empty variables' dropping

Author:  Azhar Hussain

Date  :  11 February, 2015
*****************************************************************************************/


	
* DROPPING VARIABLES WITH NULL OR INSIGNIFICANT OBSERVATIONS
	
	//// Section - 0 [General Information]
	//No observations
	drop devicephonenum bg12resp_consent bg2grp1vil_mark_id bg2vv_mar_id bg4bus_info bg8intrv_begin bg8interv_start bg*intro* ///
	bg*date* bg*surv_vst_* bg*vst_*_date
	//Redundant data
	drop marketid surveyor_code_list supervisor_code_list survey_mins survey_start_date end_date submission_date start_date bg8time_start
	//Data not useful for analysis
	drop survey_tracking_date hh_business key* stat_code1 stat_code1_oth today report_dt response survey_mins_adj
	
	//// Section - A [Information about business premises]
	//No observations
	drop secaseca_note secabg20a11a11_operate
	
	//// Section - B [Information about employees]
	//No observations
	drop secbgrpb1sec_b secbgrpb1b1_male_work secbgrpb2b2_female_work secbb7b7_family_emp secbgrpb*b*_supervisory secbgrpb*b*_employee_oth b*_note*
	//Redundant data
	drop secbgrpb*b*_number
	//Data not useful for analysis
	drop _mergeb* setofb* setofsecbb*
	
	//// Section - C [Information about physical assets owned by the business]
	//No observations
	drop seccintro6 seccretail_asset_listasset_list_ secccalc1calc seccscale1weigh_scale seccelectric_scales1elec_scales1 seccmetal1metal_contain ///
	seccplastic1plastic seccclockk1clock seccpurfi1purifier seccdrink1drink secctube1tubes seccgas_cooker1cooker_gas1 seccgas_cylinder1cylinder_gas1 ///
	seccutensils1utensil1 seccbulb1elec_bulb secctube_light1tube_light seccfan1fan secccooler1cooler seccroom_heat1room_heat secccomp1_dcomputer ///
	secccomp1_llaptop seccrefri1refri secccard1card seccac1ac seccelectric1elec_purifier secccatcher1elec_catcher seccmotor1elec_motor ///
	seccelec_grill1elec_grill secccold_store1printers secccold_store2cold_storage seccserv_asset_listasset_list_se secccalc2calc seccscale2weigh_scale ///
	seccelectric_scales2elec_scales2 seccmetal2metal_container seccplastic2plastic_con seccclocks2clocks seccpurifier2purifiers seccdrink2drinks ///
	secctube2tubes1 secccookers1cookers secccylinders1cylinders seccutensil1utensil seccsew1sewing seccbottle1bottling secchair_tools1hair_tools ///
	seccrepair_tools1repairs seccauto_repair1auto_repair secccarpent_toolscarpentary_tool secchand_pumppumps seccbulb2elec_bulb2 secctube_light2tubes ///
	seccfan2fans secccooler2coolers seccbg93heaters seccbg94computers seccbg95laptops seccbg96frig seccbg98cards seccbg99acs seccbg100electri_purifier ///
	seccbg101electri_catcher seccbg102electri_motor seccbg103hair_drier seccbg104scanners seccbg105printers seccbg106ovens seccbg107grills seccbg108stores ///
	seccmanfact_asset_listasset_list seccbg126calculate seccbg127weight_scale seccbg142electric_scaless seccbg128metal_containers seccbg129plastic_container ///
	seccbg130clockss seccbg132purifiers seccdrinkk3drinks1 secctubes3tubes2 seccbottle2bottling1 seccbg133carpenter secchand_pump1pumps1 ///
	seccbg134electri_bulbs seccbg135tubess seccbg136fanss seccbg137coolerss seccbg138heaterss seccbg139computerss seccbg140laptopss seccbg141frigs ///
	seccbg143cardss seccbg144acss seccbg145electric_purifier seccbg146electric_catcher seccbg147electric_motorss seccbg148drills seccgrillsgrills1 ///
	seccbg149mills seccbg150elec_saws secclistasset1assetlist1 secccalculatorscalculate1 seccweight_scalesweight_scale1 seccelectric_scaleselectric_scal ///
	seccmetal_container1metal_contai seccplastic_containersplastic_co seccclock1clockss1 seccpurifiers2purifiers2_water seccdrink3drinks3_crates ///
	seccelec_insect_catcherelectric_ secctube3tubes2 secccookers2cookers1 secccylinders2cylinders1 seccutensil2utensil1 seccsew2sewing1 ///
	seccbottles2bottling1 secchair_tools3hair_tools3 seccrepair_tools3repairs3 seccauto_repair3auto_repair3 secctools_carpentcarpenter ///
	secchand_pump2pumps2 seccelectric_bulbs2electri_bulbs secctube_lights2tubess2 seccfans3fanss3 seccair_cooler1coolerss1 seccroom_heaters3heaterss3 ///
	secccomp_desktopcomputerss1 secccomp_laptoplaptopss1 seccfrig1frigs1 secccard_swipcardss1 seccair_conditioner1acss1 seccelec_water_purifier1electric ///
	secchair_driers3hair_driers3 seccscanner3scan3 seccprinter3printer3 seccovensovens1 seccgrills3grills3 seccdeep_freezefreeze1 ///
	seccasset_list_manufac_retlist_a secccalculators5calculate5 seccweight_scales5weight_scale5 seccelectric_scales5electric_sca ///
	seccmetal_container5metal_contai seccplastic_containers5plastic_c seccclocks5clockss5 seccpurifiers5purifiers5_water seccdrink5drinks5_crates ///
	secctube5tube5 secccookers5cooker5 secccylinders5cylinder5 seccutensils5utensil5 seccbottle5bottling5 secctools_carpent5carpenter5 ///
	secchand_pump5pumps5 seccelectric_bulbs5electri_bulbs secctube_light5tubess5 seccfans5fanss5 seccair_cooler5coolerss5 seccroom_heaters5heaterss5 ///
	secccomp_desktop5computerss5 secccomp_laptop5laptopss5 seccfrig5frigs5 secccard_swip5cardss5 seccair_conditioner5acss5 ///
	seccelec_water_purifier5electric seccelec_drills5elec_drill5 secchair_driers5hair_driers5 seccscanner5scan5 seccprinter5printers5 seccelec_grill5grill5 ///
	seccelec_mill5mill5 seccelec_saw5saw5 secclistasset3assetlist3 secccalculators6calculate6 seccweight_scales6weight_scale6 ///
	seccelectric_scales6electric_sca seccmetal_container6metal_contai seccplastic_containers6plastic_c seccclocks6clockss6 ///
	seccpurifiers6purifiers6_water seccdrink6drinks6_crates secctube6tubes6 secccookers6cooker6 secccylinders6cylinder6 seccutensils6utensil6 ///
	seccsew6sews6 seccbottle6bottling6 secchair_tools6hair_tool6 seccrepair_tools6repairs6 seccauto_repairs6auto_repair6 secctools_carpent6carpenter6 ///
	secchand_pump6pumps6 seccelectric_bulbs6electri_bulbs seccelectric_motor_supplyelectri secctube_light6tubess6 seccfans6fanss6 ///
	seccair_cooler6coolerss6 seccroom_heaters6heaterss6 secccomp_desktop6computerss6 secccomp_laptop6laptopss6 seccfrig6frigs6 secccard_swip6cardss6 ///
	seccair_conditioner6acss6 seccelec_water_purifier6electric secchair_driers6hair_driers6 seccscanner6scan6 seccprinter6printers6 seccoven6ovens6 ///
	seccelec_grill6grill6 seccfreeze6freezer6 seccelec_mill6mill6 seccsaws6saw6 seccasset_list2_manfac_retasset_ secccalculators7calculate7 ///
	seccweight_scale7weight_scale7 seccelectric_scales7electric_sca seccmetal_container7metal_contai seccplastic_containers7plastic_c seccclocks7clockss7 ///
	seccpurifiers7purifiers7_water seccdrink7drinks7_crates secctube7tubes7 secccookers7cooker7 secccylinders7cylinder7 seccutensils7utensil7 ///
	seccsew7sews7 seccbottle7bottling7 secchair_tools7hair_tool7 seccrepair_tools7repairs7 seccauto_repairs7auto_repair7 secctools_carpent7carpenter7 ///
	secchand_pump7pumps7 seccelectric_bulbs7electri_bulbs secctube_light7tubess7 seccfans7fanss7 seccair_cooler7coolerss7 seccroom_heaters7heaterss7 ///
	secccomp_desktop7computerss7 secccomp_laptop7laptopss7 seccfrig7frigs7 secccard_swip7cardss7 seccair_conditioner7acss7 seccelec_water_purifier7electric ///
	seccdrills7drill7 secchair_driers7hair_drier7 seccscanner7scan7 seccprinter7printers7 seccoven7ovens7 seccelec_grill7grill7 ///
	seccasset_list_all_businessasset seccbicyclesbicycle1 seccbullocksbullock1 seccwheelbarrowsbarrows1 seccmotorbikesbikes1 secccarscars1 ///
	secclorrieslorry1 seccminivansminivan1 seccalmirahsalmirah1 seccshelvesshelves1 secctablestables1 seccchairschairs1 seccwoodenboxwbox1 ///
	seccshowcasesshowcase1 v125 v214 v431 v505 v506 v509 v512 v550 v612 v613 v616 v619 v660 v734 v735 v738 v741 v785 v859 v860 v863 v866 ///
	seccelec_insect_catcher5electric seccelectric_motor_supply5electr seccelec_insect_catcher6electric seccelectric_motor_supply6electr ///
	seccelec_insect_catcher7electric seccelectric_motor_supply7electr
	
	//// Section - D [Information about inventory maintained by the business]
	//No observations
	drop secdintro7 secdbg169intro8 secdbg170perish_refrig1 secdbg171perish_refrig2 secdbg172snacks1 secdbg173snacks2 secdbg174meat1 secdbg175meat2 ///
	secdbg176dairy1 secdbg177dairy2 secdbg178cigarette1 secdbg179spic1 secdbg180foods1 secdbg183cosmetic1 secdbg181eggs1 secdbg184med1 secdbg185shoes1 ///
	secdbg186jewel1 secdbg188polyth1 secdbg189fuel1 secdutensilutensil1 secdgraingrain1 secdwoodwood1 secdmetalmetal1 secdprocessed_grainprocessed1 ///
	secdwood_productswood1 secdmetal_productsmetal1 secdfuelsfuel1 secdbg191intro9 secdbg192perish_refri3 secdbg193perish_refri4 secdbg194perish_refri5 ///
	secdbg195perish_refri6 secdbg196dairy3 secdbg197dairy4 secdbg198foods2 secdbg199eggs2 secdbg200cosmetic2 secdbg201med2 secdbg202paper2 ///
	secdbg203pckg2 secdbg204fuel2 secdbg205bic_repair secdbg207hair_dress secdbg2007grain2 secdbg209intro10 secdbg210grains3 secdbg211woods3 ///
	secdbg212metal3 secdbg213fuel3 secdbg2013metal3 secdbg2014process_grains3 secdbg2013metal3 secdbg2014process_grains3 secdbg2015wood_products3 ///
	secdbg2016metal_products3 secdbg2017fuels3 secdd_ret_servintro11 secdbg1700perish_refrig7 secdbg1711perish_refrig8 secdbg1722snacks7 ///
	secdbg1733snacks8 secdbg1744meat9 secdbg1755meat10 secdbg1766dairy10 secdbg1788cigarette12 secdbg1799spic12 secdbg1800foods13 secdbg1811eggs14 ///
	secdbg1844med12 secdbg1855shoes12 secdbg1866jewel12 secdbg1888polyth13 secdbg1899fuel14 secdutensil15sutensil15 secdgrain16sgrain16 ///
	secdwood16swood17 secdmetal18smetal18 secdprocessed_grain19sprocessed1 secdwood_products20wood20 secdmetal_products21metal21 secdfuels22fuel22 ///
	secdd_ret_mfgintro12 secdperish1perish_refrig7 secdperish2perish_refrig8 secdsnack1snacks7 secdsnack2snacks8 secdmeat1meat9 secdmeat2meat10 ///
	secddairy1dairy10 secddairy2dairy11 secdcigar1cigarette12 secdspic1spic12 secdfood1foods13 secdegg1eggs14 secdcosmetic1cosmetic15 secdmed1med12 ///
	secdshoe1shoes12 secdjewel1jewel12 secdpolythen1polyth13 secdfuel1fuel14 secdutensil16sutensil15 secdgrain17sgrain16 secdwood17swood17 ///
	secdmetal19smetal18 secdprocessed_grain20sprocessed1 secdwood_products21wood20 secdmetal_products22metal21 secdfuels24fuel23 secdd_serv_mfgintro13 ///
	secdperis1perish_refrig7 secdperis2perish_refrig8 secdsnac1snacks7 secdsnac2snacks8 secdmeatt1meat9 secdmeatt2meat10 secddai1dairy10 ///
	secddai2dairy11 secdcigar3cigarette12 secdspice3spic12 secdfood3foods13 secdegg3eggs14 secdcosmetic3cosmetic15 secdmed3med12 secdfuel3fuel14 ///
	secdutensil3utensil15 secdgrain3grain16 secdwood3wood17 secdmetal3metal18 secdprocessed_grain3processed19 secdwood_products3wood20 ///
	secdmetal_products3metal21 secdfuels3fuel23 secdd_ret_serv_mfgintro13 secdperish4perish_refrig7 secdperish5perish_refrig8 secdsnack5snacks7 ///
	secdsnack6snacks8 secdmeat7meat9 secdmeat8meat10 secddair7dairy10 secddairy8dairy11 secdcigar7cigarette12 secdspic7spic12 secdfood7foods13 ///
	secdegg7eggs14 secdcosmetic7cosmetic15 secdmed7med12 secdshoe7shoes12 secdjewel7jewel12 secdpolythen7polyth13 secdfuel7fuel14 secdutensil7utensil15 ///
	secdgrain7grain16 secdwood7wood17 secdmetal7metal18 secdprocessed_grain7processed19 secdwood_products7wood20 secdmetal_products7metal21 ///
	secdfuels7fuel22 secdfuel_for_prodfuel23 secdbg206auto_rep secdbg1777dairy11 secdbg1812cosmetic15 secdfuels23fuel22 v1100 v1156
	
	//// Section - E [Inforation about electricity sources, metering and billing situation]
	//No observations
	drop seceintro11 secebg220bg226intro12 secebg220bg226billingintro13 secebg220secff2_specify_hrs secebg220secff2f2_time_slots v1311 v1312
	//Data not useful for analysis
	drop flag_elec_rent flag_elec_grid100 flag_elec_any100 flag_elec_grid flag_elec_any
	
	//// Section - F [Information about electricity supply situation]
	//No observations
	drop secebg220secfbgf1note8 secebg220secfbgf1note9 secebg220secff2_tot secebg220secff4_to_f5note10 v1359 v1360
	//Redundant Data
	drop secebg220secffirst_slot secebg220secffourth_slot secebg220secfsecond_slot secebg220secfthird_slot
	
	//// Section - G [Information about expenditure, revenue and credit of the business]
	//No observations
	drop secgsection_g secgdet_revenue secgg_ret_busret_bus secgg_ser_busser_bus secgg_mfg_busmanufac_bus secgg_ret_serv_busret_serv_bus ///
	secgg_ret_mfg_busret_mfg_bus secgg_serv_mfg_busserv_mfg_bus secgg_ret_serv_mfg_busg_ret_serv secgask_all_busask_all_bus secgdet_exp_pdet_exp ///
	secgdet_exp_pnote15 secgg17a_to_g19det_cr_situation secgloan_detailsdet_loan
	
	//// Section - H [Interviewer’s Notes]
	//No observations
	drop sechh1_to_h4section_h
	