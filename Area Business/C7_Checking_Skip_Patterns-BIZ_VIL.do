/*************************************************************************
Project: BEP

Purpose: Baseline area business survey variables' skip pattern checking

Author:  Azhar Hussain

Date  :  28 March, 2015
**************************************************************************/



* DROPPING INSIGNIFICANT OBSERVATIONS

	drop if _duplicate_survey==.
	drop if _duplicate_parent_key==1
	

* CHECKING SKIP PATTERNS

	//// Section - 0 [General Information]
	assert (_shop_retail==1) + (_retail_type!=.)!=1
	assert (_shop_service==1) + (_service_type!=.)!=1
	assert (_shop_workshop==1) + (_workshop_type!=.)!=1
	
	//// Section - A [Information about business premises]	
	assert (a1_proprietor!=1) + (a2_knowledge!=.)!=1
	assert (a2_knowledge==2) + !missing(a3_time)!=1
	assert (a4_owner!=1) + (a5_rent!=.)!=1
	assert (a7_land_cover==1) + (a8_builtup_size==.)!=1
	assert (a4_owner==2) + (a10_sale==.)!=1
	
	//// Section - B [Information about employees]
	foreach x1 of numlist 1/28 {
		capture noisily assert (b1_man_days`x1'==.) if (b1_male_worker==0) !=0
		capture noisily assert (b1_tot_wages`x1'==.) if (b1_male_worker==0) !=0
	}
	foreach x2 of numlist 1/10 {
		capture noisily assert (b2_man_days`x2'==.) if (b2_female_worker==0) !=0
		capture noisily assert (b2_tot_wages`x2'==.) if (b2_female_worker==0) !=0
	}
	foreach x3 of numlist 1/2 {
		capture noisily assert (b3_man_days`x3'==.) if (b3_male_supervisor==0) !=0
		capture noisily assert (b3_tot_wages`x3'==.) if (b3_male_supervisor==0) !=0
	}
	foreach x4 of numlist 1/1 {
		capture noisily assert (b4_man_days`x4'==.) if (b4_female_supervisor==0) !=0
		capture noisily assert (b4_tot_wages`x4'==.) if (b4_female_supervisor==0) !=0
	}
	label variable b5_male_oth "Number of other male workers employed"
	foreach x5 of numlist 1/12 {
		capture noisily assert (b5_man_days`x5'==.) if (b5_male_oth==0) !=0
		capture noisily assert (b5_tot_wages`x5'==.) if (b5_male_oth==0) !=0
	}
	label variable b6_female_oth "Number of other female workers employed"
	foreach x6 of numlist 1/2 {
		capture noisily assert (b6_man_days`x6'==.) if (b6_female_oth==0) !=0
		capture noisily assert (b6_tot_wages`x6'==.) if (b6_female_oth==0) !=0
	}
	
	//// Section - C [Information about physical assets owned by the business]

	//// Section - D [Information about inventory maintained by the business]
	
	//// Section - E [Information about energy consumption by the business]
	assert (e1_elec_any==1) + (e2_elec_past==.)!=1
	assert (e2_elec_past!=.) + (e5_elec_genset==.)!=1
	assert (e5_elec_genset==.) + !missing(e4_elec_source) !=1
	assert (e6_genset_capacity==.) if (e5_elec_genset==2) !=0
	assert (e6_genset_capacity!=.) if (e5_elec_genset==1) !=0
	assert (e8_genset_cost==.) if (e7_genset_shared==2) !=0
	assert (e8_genset_cost!=.) if (e7_genset_shared==1) !=0
	assert (e8_genset_cost!=.) if (e7_genset_shared==-102) !=0
	capture noisily assert (e10_genset_shared_people==.) if (e9_genset_exp!=.) !=0 // Problematic Obs: uuid:2ff35d75-f8f6-4c7d-a9e4-081f4f45b91b
	assert (e14_solar_owner==.) if (e13_elec_solar==2) !=0
	assert (e14_solar_owner!=.) if (e13_elec_solar==1) !=0	
	assert (e15_solar_cost==.) if (e14_solar_owner==2) !=0
	assert (e15_solar_cost!=.) if (e14_solar_owner==1) !=0
	assert (e16_solar_shared==.) if (e15_solar_cost!=.) !=0
	assert (e17_solar_shared_cost==.) if (e16_solar_shared==2) !=0
	assert (e17_solar_shared_cost!=.) if (e16_solar_shared==1) !=0
	assert (e20_grid_billing==.) if (e19_elec_grid==2) !=0
	assert (e20_grid_billing!=.) if (e19_elec_grid==1 & a4_owner==2) !=0	
	assert (e21_metered_consumer==.) if (e20_grid_billing==2) !=0
	assert (e21_metered_consumer!=.) if (e20_grid_billing==1) !=0
	assert (e22_meter_location==.) if (e21_metered_consumer==2) !=0
	assert (e22_meter_location!=.) if (e21_metered_consumer==1) !=0
	assert (e24_meter_damage_duration!=.) if (e23_meter_functional==2) !=0
	assert (e24_meter_damage_duration==.) if (e23_meter_functional==1) !=0
	assert (e26_meter_complaint_location==.) if (e25_meter_complaint==2) !=0
	assert (e26_meter_complaint_location!=.) if (e25_meter_complaint==1) !=0
	assert (e29_consumers_bill_month==.) if (e28_consumers_billed==2) !=0
	assert (e29_consumers_bill_month!=.) if (e28_consumers_billed==1) !=0
	assert missing(e31_bill_consumer_number) if (e30_bill_availability==2) !=0
	assert !missing(e31_bill_consumer_number) if (e30_bill_availability==1) !=0
	assert (e32_know_consumer_number==.) if !missing(e31_bill_consumer_number) !=0
	assert (e33_ask_consumer_number!=.) if (e32_know_consumer_number==1) !=0
	assert (e33_ask_consumer_number==.) if (e32_know_consumer_number==2) !=0
	assert (e35_bill_payment_location==.) if (e34_bill_payment==-100) !=0

	//// Section - F [Information about electricity supply situation]
	assert missing(f7_neighbour_hour_change_reason) if (f6_elec_neighbour_hour_change==2) !=0
	assert !missing(f7_neighbour_hour_change_reason) if (f6_elec_neighbour_hour_change==1) !=0
	assert missing(f9_maintenance_complaint_reason) if (f8_maintenance_complaint==2) !=0
	assert !missing(f9_maintenance_complaint_reason) if (f8_maintenance_complaint==1) !=0
	assert (f11_main_complaint_lodge_who==.) if (f10_maintenance_complaint_lodge==2) !=0
	assert (f11_main_complaint_lodge_who!=.) if (f10_maintenance_complaint_lodge==1) !=0
	assert (f12_lineman_pay==.) if (f11_main_complaint_lodge_who==1) !=0
	assert (f12_lineman_pay==.) if (f11_main_complaint_lodge_who==2) !=0
	assert (f12_lineman_pay!=.) if (f11_main_complaint_lodge_who==3) !=0
	assert (f12_lineman_pay!=.) if (f11_main_complaint_lodge_who==-102) !=0
	
	//// Section - G [Information about expenditure, revenue and credit of the business]
	assert (g3_ser_lastday_revenue==.) if (g2_ret_lastmonth_sale!=.) !=0
	assert (g5_wor_lastday_sale==.) if (g4_ser_lastmonth_revenue!=.) !=0
	assert (g7_retser_lastday_retsale==.) if (g6_wor_lastmonth_sale!=.) !=0
	assert (g11_retwor_lastday_retsale==.) if (g10_retser_lastmonth_serrev!=.) !=0
	assert (g15_serwor_lastday_serrev==.) if (g14_retwor_lastmonth_worksale!=.) !=0
	assert (g19_retserwor_lastday_retsale==.) if (g18_serwor_lastmonth_worksale!=.) !=0
	assert (g26_income_rent_int_amount==.) if (g25_income_rent_int==2) !=0
	assert (g26_income_rent_int_amount!=.) if (g25_income_rent_int==1) !=0
	assert (g28_lastmonth_profit_amount!=.) if (g28_lastmonth_profit==1) !=0
	assert (g28_lastmonth_profit_amount==.) if (g28_lastmonth_profit!=1) !=0
	assert (g29a_other_timeperiod==.) if (g28_lastmonth_profit==1) !=0
	assert (g29a_other_timeperiod==.) if (g28_lastmonth_profit==-104) !=0
	assert (g29a_other_timeperiod!=.) if (g28_lastmonth_profit==-103) !=0
	assert (g29b_other_timeperiod_income==.) if (g29a_other_timeperiod==-103) !=0 
	assert (g29b_other_timeperiod_income==.) if (g29a_other_timeperiod==-104) !=0
	assert (g29b_other_timeperiod_income!=.) if (g29a_other_timeperiod==1) !=0
	assert (g29b_other_timeperiod_income!=.) if (g29a_other_timeperiod==2) !=0
	assert (g29b_other_timeperiod_income!=.) if (g29a_other_timeperiod==3) !=0
	assert (g29b_other_timeperiod_income!=.) if (g29a_other_timeperiod==4) !=0
	assert (g29b_other_timeperiod_income!=.) if (g29a_other_timeperiod==5) !=0
	assert (g32_rawmaterial_credit_lastmonth==.) if (g31_rawmaterial_credit==2) !=0 
	assert (g32_rawmaterial_credit_lastmonth!=.) if (g31_rawmaterial_credit==1) !=0
	assert (g35_bankaccount_money==.) if (g34_business_bankaccount==2) !=0 
	assert (g35_bankaccount_money!=.) if (g34_business_bankaccount==1) !=0
	assert (g37_loan_amount==.) if (g36_outstanding_loan==2) !=0 
	assert (g37_loan_amount!=.) if (g36_outstanding_loan==1) !=0
	assert (g37_loan_interest_perannum!=.) if (g37_loan_interest_rate_type==1) !=0
	assert (g37_loan_interest_perannum==.) if (g37_loan_interest_rate_type!=1) !=0
	assert (g37_loan_interest_permonth!=.) if (g37_loan_interest_rate_type==2) !=0
	assert (g37_loan_interest_permonth==.) if (g37_loan_interest_rate_type!=2) !=0

	//// Section - H [Interviewer’s Notes]
	assert !missing(h4_interview_oth_name) + (h3_interview_lang_oth==1) !=1


* FORCING CHANGES

	//// Section - 0 [General Information]
	
	//// Section - A [Information about business premises]
	
	//// Section - B [Information about employees]
	// Sometimes surveyors mistakenly enter non-zero number in b1_male_worker which activates the roster, but re-enter 0 as correct value
	foreach i of numlist 1/28 {
		replace b1_man_days`i'=. if (b1_male_worker==0)
		replace b1_tot_wages`i'=. if (b1_male_worker==0)
	}
	foreach i of numlist 1/10 {
		replace b2_man_days`i'=. if (b2_female_worker==0)
		replace b2_tot_wages`i'=. if (b2_female_worker==0)
	}
	foreach i of numlist 1/2 {
		replace b3_man_days`i'=. if (b3_male_supervisor==0)
		replace b3_tot_wages`i'=. if (b3_male_supervisor==0)
	}
	foreach i of numlist 1/1 {
		replace b4_man_days`i'=. if (b4_female_supervisor==0)
		replace b4_tot_wages`i'=. if (b4_female_supervisor==0)
	}
	foreach i of numlist 1/12 {
		replace b5_man_days`i'=. if (b5_male_oth==0)
		replace b5_tot_wages`i'=. if (b5_male_oth==0)
	}
	foreach i of numlist 1/2 {
		replace b6_man_days`i'=. if (b6_female_oth==0)
		replace b6_tot_wages`i'=. if (b6_female_oth==0)
	}
	
	//// Section - C [Information about physical assets owned by the business]
	
	//// Section - D [Information about inventory maintained by the business]
	
	//// Section - E [Information about energy consumption by the business]
	// Surveyor has marked shared genset as private/other first and then filled entries
	foreach parent in uuid:17e8473a-c5d1-4ab7-8f96-bdaaf015846e uuid:1dd44207-2d22-4649-a46c-ff889e28553b uuid:28792900-bf19-49f5-bedb-f4b4e5570c26 {
		replace e7_genset_shared=2 if _survey_parent_id=="`parent'"
		replace e7_genset_shared_oth="" if _survey_parent_id=="`parent'"
		replace e8_genset_cost=. if _survey_parent_id=="`parent'"
		replace e9_genset_exp=. if _survey_parent_id=="`parent'"
		replace e9_genset_exp_rupee=. if _survey_parent_id=="`parent'"
	}
	
	//// Section - F [Information about electricity supply situation]
	
	//// Section - G [Information about expenditure, revenue and credit of the business]
	
	//// Section - H [Interviewer’s Notes]
