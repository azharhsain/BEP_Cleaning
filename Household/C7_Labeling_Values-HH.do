/********************************************************
Project: BEP

Purpose: Baseline household survey data values' labeling

Author:  Azhar Hussain

Date  :  08 April, 2015
*********************************************************/



* INCLUDING MACROS

	include locals_hh.do

	
* LABELING VALUES

	// Defining labels
	label define yesno 1 "Yes" 0 "No"
	label define district 1 "Ara" 2 "Buxar" 3 "Chapra" 4 "Katihar" 5 "Purnia" 6 "Siwan" 7 "Darbhanga" 8 "Patna"
	label define gender 1 "Male" 2 "Female"
	label define education 1 "Illiterate" 2 "Anganwadi" 3 "Below 5th Standard" 4 "5th Standard (Primary)" 5 "8th Standard (Middle)" ///
	6 "10th Standard (Secondary)" 7 "12th Standard (Senior Secondary)" 8 "Graduate or Above"
	label define relation 1 "Self" 2 "Spouse of Head" 3 "Married Child" 4 "Spouse of Married Child" 5 "Unmarried Child" ///
	6 "Grandchild" 7 "Parents/Parents-in-law" 8 "Siblings/Siblings-in-law" 9 "Other Relatives" 10 "Servant/Non-relatives"
	label define house_owner 1 "Owned by Self/Family" 2 "Rented" -102 "Others"
	label define house_type 1 "Kutchha" 2 "Pucca" 3 "Both Kutchha & Pucca"
	label define roof_type 1 "Concrete" 2 "Metal" 3 "Thatch" 4 "Tile" 5 "Cement Sheet" 6 "Asbestos" -102 "Others"
	label define area_unit 1 "Dhoor" 2 "Kathha" 3 "Bigha" 4 "Square Feet" 5 "Square Metre" 6 "Acre" 7 "Hectare" 8 "Dismil" -102 "Others"	
	label define land_extra 1 "Agri Land" 2 "Non-agri Land" 3 "Agri and Non-agri Land" 4 "No Extra Land" 5 "No Land"
	label define buy_time 1 "Last Month" 2 "Last 1-3 Months" 3 "Last 4-6 Months" 4 "Last 7-12 Months" 5 "More than 12 Months" -103 "Don't Know"
	label define religion 1 "Hinduism" 2 "Islam" 3 "Christianity" 4 "Sikhism" 5 "Jainism" 6 "Buddhism" 7 "Zoroastrianism" -102 "Others"
	label define mgnrega 1 "Worked 100 days and more wasn't allowed" 2 "No work under MGNREGA in Panchayat" 3 "Dissatisfaction" -102 "Others"
	label define genset_unit 1 "HP" 2 "kWh"
	label define yesnooth 1 "Yes" 0 "No" -102 "Others"
	label define genset_exp 1 "Rupees/month" 2 "Liters/month"
	label define genset_shared_exp_unit 1 "Weekly" 2 "Fortnightly" 3 "Monthly" -102 "Others"
	label define gen_solar_owner 1 "Own" 2 "Shared" -102 "Others"
	label define meter_complaint_location 1 "Energy Department/PSS" 2 "Meter Reader" 3 "Bill Collectors" 4 "Linesman" -102 "Others"
	label define meter_noncomplaint 1 "Getting Electricity without Payment" 2 "Getting Electricity with Flat Bill Payment" -102 "Others"
	label define meter_location 1 "Inside House" 2 "Outside House" 3 "Dismantled" -102 "Others"
	label define conn_type 1 "Single Phase" 2 "Three Phase"
	label define single_phase_meter 1 "Modern" 2 "RMC Switchgear" 3 "Allied" 4 "Mass Powertech" 5 "Maxwell" 6 "Nakoda" 7 "Sunstar"
	label define three_phase_meter 1 "Emco" 2 "Genus" 3 "Secure" 4 "Allied" 5 "Nakoda"
	label define bill_month 1 "1 Month Before Bill Date" 2 "2 Months Before Bill Date" 3 "Others" 4 "3-6 Months Before Bill Date" ///
	5 "6-12 Months Before Bill Date" 6 "More Than 1 Yr Before Bill Date"
	label define bill_availability 1 "Yes" 2 "No" 3 "Bill Copy Unavailable"
	replace e40_wrong_billing_month=-103 if e40_wrong_billing_month==14
	label define bill_freq 1 "Monthly" 2 "Once in 2 Months" 3 "Once in 3 Months" 4 "Less than Once in 3 Months" 5 "Never Received Bill" ///
	-102 "Others"
	label define month 1 "January" 2 "February" 3 "March" 4 "April" 5 "May" 6 "June" 7 "July" 8 "August" 9 "September" ///
	10 "October" 11 "November" 12 "December" 13 "Not Billed Regularly" -100 "Never Paid Bill"
	label define bill_not_received_action 1 "Check with PSS about dues and pay" 2 "Pay min consumption charge" ///
	3 "Pay amount other than min consumption charge" 4 "Don't Pay" 5 "New Connection" -102 "Others"
	label define bill_payment_location 1 "PSS/Discom Office" 2 "RRF Centre" 3 "Pay Online" 4 "Someone Else Submits My Bill"  ///
	5 "Don't Pay" -102 "Others"
	label define distance 1 "Metre" 2 "Kilometer"
	label define time 1 "Minute" 2 "Hour"
	label define pro_rating 1 "Very Professionally" 2 "Somewhat Professionally" 3 "Neither Professionally nor Improfessionally" ///
	4 "Somewhat Improfessionally" 5 "Very Improfessionally"
	label define complaint_lodge 1 "Energy Department/PSS" 2 "Meter Reader" 3 "Private Linesman" -102 "Others"
	label define complaint_resolve 1 "Given Number of Days" -100 "Complaint Never got Resolved"
	foreach i of numlist 1/10 {
		replace l4_reader`i'_letter_mistake=-105 if l4_reader`i'_letter_mistake==94
		replace l4_reader`i'_letter_mistake=-106 if l4_reader`i'_letter_mistake==95
		replace l5_reader`i'_word_mistake=-105 if l5_reader`i'_word_mistake==94
		replace l5_reader`i'_word_mistake=-106 if l5_reader`i'_word_mistake==95		
		replace l6_reader`i'_sentence_mistake=-105 if l6_reader`i'_sentence_mistake==94
		replace l6_reader`i'_sentence_mistake=-106 if l6_reader`i'_sentence_mistake==95		
		replace l7_reader`i'_paragraph_mistake=-105 if l7_reader`i'_paragraph_mistake==94
		replace l7_reader`i'_paragraph_mistake=-106 if l7_reader`i'_paragraph_mistake==95		
	}
	label define miss_val .b "Not Applicable" .c "Don't Know" .d "Don't Want to Say" .e "Illiterate" .g "Unavailable"
	label define miss_val -101 "" -103 "" -104 "" -105 "" -106 "", modify
	label define mother_tongue 1 "Hindi" 2 "English" 3 "Bhojpuri" 4 "Maithili" 5 "Magahi" 6 "Vajahi" 7 "Angika" 8 "Urdu" 9 "Surajpuri" ///
	10 "Bangla" 11 "Santali" 12 "Sadri" 13 "Khortha"  14 "Musasa" 15 "Kurukh" -102 "Others"
	label define safety_rating 1 "Very Safe" 2 "Safe" 3 "Neutral" 4 "Unsafe" 5 "Very Unsafe"
	label define local_org 1 "RWA" 2 "Mohalla Sabha" 3 "School Committee" 4 "Gram Parishad" 5 "PAC" 6 "None" ///
	7 "Local Religious Comm" 8 "LPS" -102 "Others"
	label define org_meet 1 "Days/Month" 2 "Months/Year" 3 "Once in _ Years"
	label define neigh_meet 1 "Days Ago" 2 "Months Ago" 3 "Years Ago"
	label define inc_src 11 "Cultivating Own's Land" 12 "Farm Labor" 13 "Cultivating Other's Land" 14 "Fishing" 15 "Animal Rearing" 16 "Chicken Rearing" ///
	17 "Horticulture" 21 "Govt Pension" 22 "Old Age Pension" 23 "Widow Pension" 31 "Vegetable/Fruit Shop" 32 "General Store" 33 "Betel Shop" ///
	34 "Clothing Store" 35 "Ice Cream Stall" 36 "Beauty Parlour" 37 "Tea Stall" 38 "Juice Stall" 39 "Tailor" 310 "Dry cleaner" 311 "Photostat Shop" ///
	312 "Cyber Cafe" 313 "Chemist" 314 "Other Retail" 41 "Doctor" 42 "Engineer" 43 "Lawyer" 44 "Medical Practitioner" 45 "Teacher" 46 "Govt. Job" ///
	47 "Health Worker" 48 "Money Lender" 49 "Private Job" 410 "Freelancer" 411 "Barber" 412 "Washerman" 413 "Priest" 414 "Servan/Cook" ///
	415 "Security Guard" 416 "Newspaper Delivery" 51 "Wheat Processing" 52 "Iron Welding" 53 "Wood Work" 54 "Terracotta Work" 55 "Sewing" ///
	56 "Factory Work" 57 "Mechanic" 58 "Goldsmith" 61 "Rickshaw Puller" 62 "Auto Driver" 63 "Boatman" 64 "Driver" 65 "Other Transport Worker" ///
	71 "Mason" 72 "Laborer" 73 "Other Construction Worker"
	label define int_lang 1 "Hindi" 2 "Vernacular"
	label define satisfactory_answer 1 "Very Satisfied" 2 "Satisfied" 3 "Not Satisfied"
		
	// Attaching labels
	label values _duplicate_parent_key _duplicate_survey _resp_questions _verbal_consent a5_family_mem_school* a6_mem*_occup_* b12_*_have c*_*_have ///
	d4_bpl_family d6_mgnrega_card d7_mgnrega_job d9_more_workdays_want e1_elec_any e2_elec_past e3_noelec_no_afford e3_noelec_no_conn ///
	e5_elec_genset e11_genset_shared_cost e12_genset_shared_exp e13_elec_solar e16_solar_shared e19_elec_grid e20_metered_consumer e21_meter_functional ///
	e23_meter_complaint e27_meter_outside_readibility e29_meter_read e33_consumers_receive_bill e34_consumers_billed e38_know_consumer_number ///
	e39_correct_billing e52_know_bill_collector_name f5_power_outage_expected f6_know_power_outage_reason f7_voltage_drop_lastmonth ///
	f9_energy_advertisement f11_know_ots_scheme f13_mobile_phone_access f14i_subs_bill_amount_alert f14ii_subs_pay_date_alert ///
	f14iii_subs_biller_visit_alert f15_elec_future_expect f18_elec_neighbour_hour_change f20_maintenance_complaint f22_maintenance_complaint_lodge ///
	g1_*_use h*_have_* h*_*_have i2_read_newspaper i4_vote_local_election i4_vote_state_election i4_communicate_govt_rep i4_attend_protest ///
	i12_festival_celebration i16_low_penal j1_*_exp_have j6_*_inc_have j7_receive_regular_inc k*_*_back_home k*_*_leave_home k*_*_sleep ///
	k*_*_wake_up m3_interview_lang_other m6_other_people_* m7_survey_satisfactory_answer _sur_answers f3_power_outage_lastmonth ///
	f12_avail_ots b6_land_cover b11_livestock_own i15_power_theft_case e52_know_bill_collector_name i15_power_theft_case yesno
	foreach z in `animal' {
		label values b12_`z'_have yesno
	}
	foreach z in `no_elec_reason' {
		label values e3_noelec_`z' yesno
	}
	foreach z in `affordable_elec_src' {
		label values e4_elec_src_`z' yesno
	}
	foreach z in `elec_supply_factor'  {
		label values f16_elec_supply_`z' yesno
	}
	foreach z in `elec_supply_factor' {
		label values f19_neigh_hr_`z' yesno
	}
	foreach z in `maintenance_complaint' {
		label values f21_maintenance_`z' yesno
	}
	foreach z in `people' {
		label values m6_other_people_`z' yesno
	}
	foreach z in `social_cat' {
		label values d2_soc_cat_`z' yesno
	}
	foreach z in `hindu_caste' {
		label values d3a_hin_caste_`z' yesno
	}
	foreach z in `muslim_caste' {
		label values d3b_mus_caste_`z' yesno
	}
	foreach z in `bpl_card' {
		label values d5_bpl_`z'_card_have yesno
	}
	foreach z in `pay_way' {
		label values e47_pss_`z' yesno
	}
	foreach z in `pay_way' {
		label values e48_franchise_`z' yesno
	}
	foreach z in `power_theft_reason' {
		label values i16_`z' yesno
	}	
	foreach z in `power_theft_method' {
		label values i17_`z' yesno
	}
	foreach z in `adv_src' {
		label values f10_adv_src_`z' yesno
	}
	
	label values i15_power_theft_case yesnooth
	
	label values b5_house_area_value b7_building_area_value b10_land_extra_value c*_*_resale_value d4_bpl_family d5_bpl_*_card_count ///
	e6_genset_capacity e29_meter_read e30_connection_type e31_single_phase_meter e32_three_phase_meter e34_consumers_billed ///
	e35_consumers_bill_month e41_bill_receive_frequency e42_bill_not_received_action e40_wrong_billing_month e43_last_bill_pay_lastmonth ///
	e44_last_bill_pay_amount e45_bill_pay_frequency e46_bill_pay_location e52_know_bill_collector_name f2_gridelec_* g4_*_use_quantity ///
	g5_*_unit_price g6_*_exp_month h*_*_*_rating i15_power_theft_case j1_*_exp_lastmonth j2_high_exp_lastyear_value j4_low_exp_lastyear_value ///
	j8_high_inc_lastyear_value j10_low_inc_lastyear_value j9_high_inc_lastyear_month j11_low_inc_lastyear_month j3_high_exp_lastyear_month ///
	j5_low_exp_lastyear_month k*_*_back_home k*_*_leave_home k*_*_sleep k*_*_wake_up l*_reader*_*_mistake _pin_code b8_other_count ///
	d5_bpl_yellow_card_count d5_bpl_red_card_count d5_bpl_green_card_count d10_no_more_workdays_reason i1_mother_tongue d1_religion ///
	e25_meter_noncomplaint e35_consumers_bill_month e42_bill_not_received_action i15_power_theft_case d4_bpl_family i15_power_theft_case miss_val
	label values _district_id district
	label values a2_family_mem_sex* gender
	label values a3_family_mem_relation* relation
	label values a4_family_mem_education* education
	label values b1_house_own house_owner
	label values b3_house_type house_type
	label values b4_roof_type roof_type
	label values b5_house_area_unit b7_building_area_unit b10_land_extra_unit area_unit
	label values b9_land_extra land_extra
	label values c*_*_buy_time buy_time
	label values d1_religion religion
	label values d10_no_more_workdays_reason mgnrega
	label values e6_genset_unit genset_unit
	label values e9_genset_exp genset_exp
	label values e12_genset_shared_exp_unit genset_shared_exp_unit
	label values e14_solar_owner e7_genset_shared gen_solar_owner
	label values e24_meter_complaint_location meter_complaint_location
	label values e25_meter_noncomplaint meter_noncomplaint
	label values e26_meter_location meter_location
	label values e30_connection_type conn_type
	label values e31_single_phase_meter single_phase_meter
	label values e32_three_phase_meter three_phase_meter
	label values e35_consumers_bill_month bill_month
	label values e36_bill_availability bill_availability
	label values e40_wrong_billing_month month
	label values e41_bill_receive_frequency e45_bill_pay_frequency bill_freq
	label values e42_bill_not_received_action bill_not_received_action
	label values e43_last_bill_pay_lastmonth j9_high_inc_lastyear_month j11_low_inc_lastyear_month j3_high_exp_lastyear_month ///
	j5_low_exp_lastyear_month month
	label values e46_bill_pay_location bill_payment_location
	label values e49_franchise_pss_distance_unit distance
	label values e50_franchise_pss_time_unit time
	label values e51_rationshop_owner_rating e53_bill_collector_rating e54_postoffice_clerk_rating pro_rating
	label values f23_main_complaint_lodge_who complaint_lodge
	label values f25_complaint_resolve complaint_resolve
	label values i1_mother_tongue mother_tongue
	label values i3_local_safety safety_rating
	label values i10_member_local_org local_org
	label values i11_org_meet_unit org_meet
	label values i13_neighbor_interact_unit neigh_meet
	label values j6_*_inc_src inc_src
	label values m2_interview_lang int_lang
	label values m7_survey_satisfactory_answer satisfactory_answer
	label values d4_bpl_family i15_power_theft_case yesno
