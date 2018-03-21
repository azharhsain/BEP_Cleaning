/***********************************************************
Project: BEP

Purpose: Baseline household survey data variables' dropping

Author:  Azhar Hussain

Date  :  11 February, 2015
************************************************************/



* DROPPING VARIABLES WITH NO OBSERVATIONS

	//// Section - 0 [General Information]
	//No observations
	drop grps2vv_mar_id grps2market_idvil_mark_id grp4vst_1_date grp5vst_2_date grp6vst_3_date
	//Redundant data
	drop area_id end_date submission_date supervisor_code_list start_date
	//Data not useful for analysis
	drop survey_tracking_date response survey_start_date today report_dt devicephonenum grps2hh_num grp2panchayat_name grp2block_name _merge ///
	grp8starting_time setofconsent_1hh_details stat_code1 stat_code_oth survey_mins survey_mins_adj surveyor_code_list grp4date1 grp5date2 grp6date3
	
	//// Section - A [Information about family members of the household]
	//No observations
	drop grp13id* grp*info* consent_1info* grp13age0 grp13sex0 grp13relation0 grp13literate0 grp13atten_sch0 ///
	grp13occupation0 occupation_oth0
	//Data not useful for analysis
	drop mergeHHRoster
	
	//// Section - B [Information about house and other resources]
	
	//// Section - C [Information about household assets]
	drop consent_1acinfo47 consent_1almirahinfo42 consent_1bulbinfo56 consent_1caminfo35 consent_1carinfo62 consent_1cartinfo63 ///
	consent_1ceil_faninfo54 consent_1cell_phninfo70 consent_1clockinfo65 consent_1compinfo37 consent_1cookerinfo31 consent_1coolerinfo46 ///
	consent_1cycleinfo59 consent_1elec_sew_machinfo45 consent_1geyserinfo53 consent_1grp14info19 consent_1grp15info21 consent_1grp20info22 ///
	consent_1grp21info23 consent_1grp66_1info72 consent_1grp66_1info73 consent_1heaterinfo48 consent_1ironinfo49 ///
	consent_1keroseneinfo28 consent_1land_lineinfo69 consent_1laptopinfo38 consent_1lpginfo29 consent_1mixerinfo33 consent_1mud_chulainfo26 ///
	consent_1oth_specify1info34_1 consent_1oth_specify2info39_1 consent_1oth_specify3info57_1 consent_1oth_specify4info63_1 ///
	consent_1oth_specify5info70_1 consent_1oveninfo34 consent_1pumpinfo68 consent_1purifierinfo51 consent_1radioinfo39 ///
	consent_1refrigeratorinfo58 consent_1rodinfo52 consent_1scooterinfo60 consent_1sew_machinfo44 consent_1sleep_bedinfo43 ///
	consent_1smokelessinfo27 consent_1tab_faninfo55 consent_1toasterinfo32 consent_1torchinfo67 consent_1tractorinfo61 consent_1tubeinfo57 ///
	consent_1tvinfo36 consent_1utensilinfo30 consent_1wash_machinfo50 consent_1watchinfo66	
	
	//// Section - D [Information about the family]
	
	//// Section - E [Inforation about electricity sources, metering and billing situation of the household]
	//No observations
	drop consent_1e5_to_e54e20_to_e54e20i cons_billed consent_1e5_to_e54e20_to_e54grp8 v401
	//Data not useful for analysis
	drop flag_elec_grid100 flag_elec_any100 flag_elec_grid flag_elec_any
	
	//// Section - F [Information about electricity supply situation]
	//No observations
	drop consent_1e5_to_e54e20_to_e54grp9 v425 v414 consent_1e5_to_e54e20_to_e54f5in v422 consent_1e5_to_e54e20_to_e54f14_ v436
	//Redundant data
	drop consent_1e5_to_e54e20_to_e54f3_7 consent_1e5_to_e54e20_to_e54f3_1 consent_1e5_to_e54e20_to_e54f3_5 v412
	
	//// Section - G [Information about different energy sources used in the household]
	//No observations
	drop consent_1secgsection_g consent_1secgkerokerosen consent_1secgbatterytorch consent_1secgcandlescandles consent_1secgsolarpanel ///
	consent_1secgpanelpanel_share consent_1secgbiogenbio_gen consent_1secgdiesgendiesel_gen consent_1secggen_sharedgen_share consent_1secginvertinvert ///
	consent_1secgnone 
	
	//// Section - H [Information about apliances used in the household]
	//No observations
	drop consent_1h_secelect_device*_* consent_1h_secfan_ceil*ceil_fans consent_1h_secfan_table*tab_fans consent_1h_secair_cool*coolers ///
	consent_1h_secair_ac*ac_air consent_1h_sectele_vis*tv consent_1h_seccomp_desk*desk_com consent_1h_seccomp_lap*lap_comp consent_1h_sectrans_radio*radio_ ///
	consent_1h_secmob_phn*phn_mob consent_1h_secheater_room*room_h consent_1h_secair_blow*air_blowe consent_1h_secgeysers*geyser consent_1h_secrods*rod ///
	consent_1h_secpurifiers*pur_wate consent_1h_sectoasters*toaster consent_1h_secgrind*grinds consent_1h_secelec_iron*irons ///
	consent_1h_secsew_machine*mach_s consent_1h_secwash_machine*mach_ consent_1h_secsection_hintro_h consent_1h_secsection_hintro_h1 ///
	consent_1h_secsection_hbed consent_1h_secelec_appliancehb7_ consent_1h_secfan_ceil1device1 consent_1h_secfan_table1device2 ///
	consent_1h_secair_cool1device3 consent_1h_secair_ac1device4 consent_1h_sectele_vis1device5 consent_1h_seccomp_desk1device6 ///
	consent_1h_seccomp_lap1device7 consent_1h_sectrans_radio1device consent_1h_secmob_phn1device9 consent_1h_secheater_room1device ///
	consent_1h_secair_blow1device11 consent_1h_secgeysers1device12 consent_1h_secrodsdevice13 consent_1h_secpurifiers1device14 ///
	consent_1h_sectoasters1device15 consent_1h_secgrind1device16 consent_1h_secelec_iron1device17 consent_1h_secsew_machine1device ///
	consent_1h_secwash_machine1devic consent_1h_seckitchenskitchen consent_1h_secelec_appliance1hk7 consent_1h_secliving_arealiv_are ///
	consent_1h_sectoiletstoilet consent_1h_secelec_appliance3ht7 consent_1h_secelec_appliance2hd7 v638 v736 v833 consent_1h_secelect_devicegeyser ///
	consent_1h_secelect_devicegrinda consent_1h_secelect_deviceheater consent_1h_secelect_devicepurifi consent_1h_secelect_devicetoaste ///
	consent_1h_secelect_device1geyse consent_1h_secelect_device1grind consent_1h_secelect_device1heate consent_1h_secelect_device1purif ///
	consent_1h_secelect_device1rods2 consent_1h_secelect_device1toast consent_1h_secelect_device1trans consent_1h_secelect_device2geyse ///
	consent_1h_secelect_device2grind consent_1h_secelect_device2heate consent_1h_secelect_device2purif consent_1h_secelect_device2rods4 ///
	consent_1h_secelect_device2toast consent_1h_secelect_device2trans consent_1h_secelect_device3appli consent_1h_secelect_device3geyse ///
	consent_1h_secelect_device3grind consent_1h_secelect_device3heate consent_1h_secelect_device3purif consent_1h_secelect_device3rods6 ///
	consent_1h_secelect_device3toast consent_1h_secelect_device3trans 
	//Data not useful for analysis
	drop key* setof* rate*_rating* _mergebulb_rating _mergebulb_rating1 _mergebulb_rating2 _mergebulb_rating3 _mergecfl_rating _mergecfl_rating1 ///
	_mergecfl_rating2 _mergecfl_rating3 _mergetube_rating _mergetube_rating1 _mergetube_rating2 _mergetube_rating3 consent_1h_secbulb_rating*_count ///
	consent_1h_seccfl_rating*_count consent_1h_sectube_rating*_count v722 h_avg_use_kbulb_rating13 h_avg_use_kbulb_rating14 ///
	h_spec_watt_kbulb_rating13 h_spec_watt_kbulb_rating14
	
	//// Section - I [Information related to the neighborhood]
	//No observations
	drop consent_1seciintro_isection_i consent_1seciintro_isoc_cohes consent_1seciqi4_to_qi9involve consent_1secii9_to_i10instruct ///
	consent_1secii14electric consent_1secjsec_k consent_1l_note secll1_to_l4section_l
	
	//// Section - J [Information about income and expenditure of household]
	//No observations
	drop consent_1secjagricultureinc_src_ consent_1secjpension_incinc_src_ consent_1secjsmall_businessinc_s consent_1secjprofessioninc_src_c ///
	consent_1secjsmall_factoryinc_sr consent_1secjtransportationinc_s consent_1secjconstructioninc_src consent_1secjremitremittance ///
	consent_1secjrentdividend consent_1secjforestfores_based consent_1secjothersoth_income consent_1secjk2inc_contd consent_1secjothersmontly_income ///
	consent_1secjothersannual_income
	
	//// Section - K [Information about the daily activities of the household members]
	//No observations
	drop consent_1section_kwak1activity consent_1section_kwak1k_section consent_1section_kwak1note_k1 consent_1section_kwak2note_k2 ///
	consent_1section_kwake31note_k3
	
	//// Section - L [Reading test for children]
	//No observations
	drop consent_1mem_*det_*mem_code* consent_1mem_*det_*mem_name* consent_1mem_*letters_*alphabe* consent_1mem_*words_*word* consent_1mem_*para_*para* ///
	consent_1mem_*story_*story*
	//Data not useful for analysis
	drop consent_1name* consent_1age* consent_1count*

	//// Section - M [Interviewer’s Notes]
	