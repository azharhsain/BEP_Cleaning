/*****************************************************************
Project: BEP

Purpose: Baseline area business survey data variables' labeling

Author:  Azhar Hussain

Date  :  10 March, 2015
******************************************************************/



* INCLUDING MACROS

	include locals_biz.do

	
* LABELING VARIABLES

	//// Section - 0 [General Information]
	label variable _business_id "Business ID"
	label variable _district_id "District ID"
	label variable _district_name "District name"
	label variable _feeder_id "Feeder ID"
	label variable _gps_accuracy "GPS accuracy value"
	label variable _area_id "Area ID"
	label variable _area_id_complete "Complete area ID"
	label variable _pin_code "Pin code"
	label variable _pss_id "PSS ID"
	label variable _resp_questions "Repsondent asking question" 
	label variable _retail_oth_type "Other retail business type"
	label variable _retail_type "Retail business type"
	label variable _service_oth_type "Other service business type"
	label variable _service_type "Service business type"
	label variable _shop_retail "Retail business (Yes/No)"
	label variable _shop_service "Service business (Yes/No)"
	label variable _shop_workshop "Manufacturing business (Yes/No)"
	label variable _sim_id "SIM card number"
	label variable _supervisor_code "Supervisor code"
	label variable _supervisor_name "Supervisor name"
	label variable _sur_answers "Surveyor giving answer"
	label variable _survey_device_id "Tablet ID"
	label variable _survey_end_date "Survey end date"
	label variable _survey_end_datetime "Survey end date and time combined"
	label variable _survey_metainstance_id "Meta-instance ID"
	label variable _survey_parent_id "Parent key"
	label variable _survey_start_datetime "Survey start date & time combined"
	label variable _survey_submission_datetime "Survey submission date & time combined"
	label variable _survey_subscriber_id "Subscriber ID"
	label variable _surveyor_code "Surveyor code"
	label variable _surveyor_name "Surveyor name"
	label variable _verbal_consent "Survey consent (Yes/No)"
	label variable _visit_number "Visit number for survey"
	label variable _workshop_oth_type "Other manufacturing business type"
	label variable _workshop_type "Manufacturing business type"
	label variable _duplicate_parent_key "Duplicate parent keys (Y/N)" 
	label variable _duplicate_survey "Duplicate survey (Y/N)"
	
	//// Section - A [Information about business premises]
	label variable a1_proprietor "Proprietorship of business"
	label variable a1_proprietor_oth "Other proprietorship of business"
	label variable a2_knowledge "Respondent knowledgeable about business (Yes/No)"
	label variable a3_time "Knowledgeable person availability (Time)"
	label variable a4_owner "Proprietor owning premises of business"
	label variable a4_owner_oth "Other ownership of premises of business"
	label variable a5_rent "Monthly rent for premises"
	label variable a6_land_size "Total area of business compound (Value)"
	label variable a6_land_unit "Total area of business compound (Unit)"
	label variable a6_land_unit_oth "Total area of business compound (Other Unit)"
	label variable a7_land_cover "Entire land covered with buildings (Yes/No)"
	label variable a8_builtup_size "Total built-up area of business compound (Value)"
	label variable a8_builtup_unit "Total built-up area of business compound (Unit)"
	label variable a8_builtup_unit_oth "Total built-up area of business compound (Other Unit)"
	label variable a9_room "Total rooms in establishment"
	label variable a10_sale "Resale value of establishment"
	label variable a11_afternoon_time "Daily afternoon operating hours of business"
	label variable a11_lunch_hours "Daily lunch hours"
	label variable a11_morning_time "Daily morning operating hours of business"
	label variable a12_switchon_allday "Electricity switch-on time"
	label variable a12_switchon_time "Electricity switch-on (Time)"
	label variable a13_customers "Number of customers visiting business perday"
	label variable a14_customers_percent "Percentage of pre-planned visits perday"
	label variable a15_member_association "Member of commercial association (Yes/No)"
	
	//// Section - B [Information about employees]
	label variable b1_male_worker "Number of male workers employed"
	foreach x1 of numlist 1/28 {
		label variable b1_man_days`x1' "Number of man-days worked last month by male worker#`x1'"
		label variable b1_tot_wages`x1' "Total wage paid last month to male worker#`x1'"
	}
	label variable b2_female_worker "Number of female workers employed"
	foreach x2 of numlist 1/10 {
		label variable b2_man_days`x2' "Number of man-days worked last month by female worker#`x2'"
		label variable b2_tot_wages`x2' "Total wage paid last month to female worker#`x2'"
	}
	label variable b3_male_supervisor "Number of male supervisors employed"
	foreach x3 of numlist 1/2 {
		label variable b3_man_days`x3' "Number of man-days worked last month by male supervisor#`x3'"
		label variable b3_tot_wages`x3' "Total wage paid last month to male supervisor#`x3'"
	}
	label variable b4_female_supervisor "Number of female supervisors employed"
	foreach x4 of numlist 1/1 {
		label variable b4_man_days`x4' "Number of man-days worked last month by female supervisor#`x4'"
		label variable b4_tot_wages`x4' "Total wage paid last month to female supervisor#`x4'"
	}
	label variable b5_male_oth "Number of other male workers employed"
	foreach x5 of numlist 1/12 {
		label variable b5_man_days`x5' "Number of man-days worked last month by other male worker#`x5'"
		label variable b5_tot_wages`x5' "Total wage paid last month to other male worker#`x5'"
	}
	label variable b6_female_oth "Number of other female workers employed"
	foreach x6 of numlist 1/2 {
		label variable b6_man_days`x6' "Number of man-days worked last month by other female worker#`x6'"
		label variable b6_tot_wages`x6' "Total wage paid last month to other female worker#`x6'"
	}
	label variable b7_unpaid_family_member "Number of unpaid family members involved"
	
	//// Section - C [Information about physical assets owned by the business]
	label variable c1_retail_asset "List of items owned by different retail businesses"
	label variable c1_retail_asset_oth "List of unlisted items owned by different retail businesses"
	local i 1
	foreach z in retail service workshop retailservice retailworkshop serviceworkshop retailserviceworkshop vehicle furniture {
		foreach a in `nonelec_equip' {
			capture label variable c`i'_`a'_have "Business has `a' as non-electric equipment asset (Yes/No)"
		}
		foreach b in `elec_equip' {
			capture label variable c`i'_`b'_have "Business has `b' as electric equipment asset (Yes/No)"
		}
		foreach c in `furniture' {
			capture label variable c`i'_`c'_have "Business has `c' as furniture asset (Yes/No)"
		}
		foreach d in `vehicle' {
			capture label variable c`i'_`d'_have "Business has `d' as vehicle asset (Yes/No)"
		}
		local i = `i'+1
	}
	label variable c2_service_asset "List of items owned by different service businesses"
	label variable c2_service_asset_oth "List of unlisted items owned by different service businesses"
	label variable c3_workshop_asset "List of items owned by different workshop businesses"
	label variable c3_workshop_asset_oth "List of unlisted items owned by different workshop businesses"
	label variable c4_retailservice_asset "List of items owned by different retail-service businesses"
	label variable c4_retailservice_asset_oth "List of unlisted items owned by different retail-service businesses"
	label variable c5_retailworkshop_asset "List of items owned by different retail-workshop businesses"
	label variable c5_retailworkshop_asset_oth "List of unlisted items owned by different retail-workshop businesses"
	label variable c6_serviceworkshop_asset "List of items owned by different service-workshop businesses"
	label variable c6_serviceworkshop_asset_oth "List of unlisted items owned by different service-workshop businesses"
	label variable c7_retailserviceworkshop_asset "List of items owned by different retail-service-workshop businesses"
	label variable c7_retservwork_asset_oth "List of unlisted items owned by different retail-service-workshop businesses"
	label variable c8_vehicle_asset "List of vehicles owned by the businesses"
	label variable c8_vehicle_asset_oth "List of unlisted vehicles owned by the businesses"
	label variable c9_furniture_asset "List of vehicles owned by the businesses"
	label variable c9_furniture_asset_oth "List of unlisted vehicles owned by the businesses"
	foreach i of numlist 1/9 {
		foreach x in `elec_equip' `nonelec_equip' `vehicle' `furniture' {
			capture label variable c`i'_`x'_own "Number of `x' owned by the business"
			capture label variable c`i'_`x'_sale "Resale value of `x' owned by the business"
		}
	}
		
	//// Section - D [Information about inventory maintained by the business]
	label variable d1_retail_inventory "List of inventory items owned by different retail businesses"
	label variable d1_retailinventory_oth "List of unlisted inventory items owned by different retail businesses"
	label variable d2_service_inventory "List of inventory items owned by different service businesses"
	label variable d2_serviceinventory_oth "List of unlisted inventory items owned by different service businesses"
	label variable d3_workshop_inventory "List of inventory items owned by different workshop businesses"
	label variable d3_workshopinventory_oth "List of unlisted inventory items owned by different workshop businesses"
	label variable d4_retailservice_inventory  "List of inventory items owned by different retail-service businesses"
	label variable d4_retailserviceinventory_oth "List of unlisted inventory items owned by different retail-service businesses"
	label variable d5_retailworkshop_inventory "List of inventory items owned by different retail-workshop businesses"
	label variable d5_retailworkshopinventory_oth "List of unlisted inventory items owned by different retail-workshop businesses"
	label variable d6_serviceworkshop_inventory "List of inventory items owned by different service-workshop businesses"
	label variable d6_serviceworkshopinventory_oth "List of unlisted inventory items owned by different service-workshop businesses"
	label variable d7_retservwork_inventory "List of inventory items owned by different retail-service-workshop businesses"
	label variable d7_retservworkinventory_oth "List of unlisted inventory items owned by different retail-service-workshop businesses"
	local i 1
	foreach z in retail service workshop retailservice retailworkshop serviceworkshop retservwork {
		foreach m in `inventory' {
			capture label variable d`i'_`m'_have "Business has `m' as inventory (Yes/No)"
		}
		local i = `i'+1
	}
	foreach j of numlist 1/7 {
		foreach y in `inventory' {
			capture label variable d`j'_`y'_val "Value of `y' for business during visit"
		}
	}
	
	//// Section - E [Information about energy consumption by the business]
	label variable e1_elec_any "Electricity from any source (Yes/No)"
	label variable e2_elec_past "Electricity in the past (Yes/No)"
	label variable e3_noelec_reason "No electricity reason"
	label variable e3_noelec_reason_oth "No electricity unlisted reason"
	label variable e4_elec_source "Affordable source of electricity"
	label variable e4_elec_source_oth "Affordable unlisted source of electricity"
	label variable e5_elec_genset "Electricity from genset (Yes/No)"
	label variable e6_genset_capacity "Genset capacity (Value)"
	label variable e6_genset_unit "Genset capacity (Unit)"
	label variable e7_genset_shared "Ownership of genset"
	label variable e7_genset_shared_oth "Other ownership of genset"
	label variable e8_genset_cost "Private genset cost"
	label variable e9_diesel_cost "Cost of 1 litre diesel"
	label variable e9_genset_exp "Genset expenditure unit"
	label variable e9_genset_exp_litre "Genset expenditure in litre/month"
	label variable e9_genset_exp_rupee "Genset expenditure in rupee/month"
	label variable e10_genset_shared_people "Number of people sharing the genset"
	label variable e11_genset_shared_cost "Shared genset one-time cost"
	label variable e12_genset_shared_exp_amount "Shared genset regular expenditure"
	label variable e12_genset_shared_exp_unit "Shared genset regular expenditure payment duration"
	label variable e12_genset_shared_exp_unit_oth "Shared genset regular expenditure other payment duration"
	label variable e13_elec_solar "Electricity from solar panel (Yes/No)"
	label variable e14_solar_owner "Ownership of solar panel"
	label variable e15_solar_cost "Private solar panel cost"
	label variable e16_solar_shared "One-time cost for shared solar panel (Yes/No)"
	label variable e17_solar_shared_cost "One-time cost for shared solar panel"
	label variable e18_solar_shared_exp "Solar panel monthly expenditure"
	label variable e19_elec_grid "Electricity from grid (Yes/No)"
	label variable e20_grid_billing "Bill payment mode"
	label variable e21_metered_consumer "Metered consumer (Yes/No)"
	label variable e22_meter_location "Meter location"
	label variable e22_meter_location_oth "Unlisted meter location"
	label variable e23_meter_functional "Functional meter (Yes/No)"
	label variable e24_meter_damage_duration "Meter damage months"
	label variable e25_meter_complaint "Meter damage complaint (Yes/No)"
	label variable e26_meter_complaint_location "Meter damage complaint location"
	label variable e26_meter_complaint_location_oth "Meter damage complaint unlisted location"
	label variable e27_meter_noncomplaint "Reason for no complain"
	label variable e27_meter_noncomplaint_oth "Unlisted reason for no complain"
	label variable e28_consumers_bill_date "Last date on which bill received"
	label variable e28_consumers_billed "Bill received (Yes/No)"
	label variable e29_consumers_bill_month "Month duration for which bill received"
	label variable e29_consumers_bill_month_oth "Unlisted month duration for which bill received"
	label variable e30_bill_availability "Show bill copy"
	label variable e31_bill_consumer_number "Consumer number entered from bill"
	label variable e32_know_consumer_number "Know consumer number (Yes/No)"
	label variable e33_ask_consumer_number "Consumer number asked"
	label variable e34_bill_payment "Bill payment"
	label variable e34_bill_payment_last_date "Last date on which bill paid"
	label variable e35_bill_payment_location "Location where bill payment done"
	label variable e35_bill_payment_location_oth "Unlisted location where bill payment done"
	foreach z in `no_elec_reason' {
		label variable e3_noelec_`z' "Reason of absence of electricity in business includes `z' (Yes/No)"
	}	
	foreach z in `affordable_elec_src' {
		label variable e4_elec_source_`z' "Affordable sources of electricity for business includes `z' (Yes/No)"
	}
	
	//// Section - F [Information about electricity supply situation]
	label variable f1_grid_elec_date "Start date of grid electricity connection"
	label variable f2_avg_gridelec_perday "Number of hours of electricity received perday"
	label variable f2_gridelec_5pmto11pm "Hours of electricity supplied during 5PM to 11PM"
	label variable f2_gridelec_7amto12pm "Hours of electricity supplied during 7AM to 12PM"
	label variable f2_gridelec_11pmto7am "Hours of electricity supplied during 11PM to 7AM"
	label variable f2_gridelec_12pmto5pm "Hours of electricity supplied during 12PM to 5PM"
	label variable f2_sum_of_slots "Number of hours of electricity received after summing up the slots"
	label variable f3_elec_future_expect "Future expectation for more hours of electricity (Yes/No)"
	label variable f4_elec_supply_factor "Electricity supply factors"
	label variable f4_elec_supply_factor_oth "Unlisted electricity supply factors"
	label variable f5_elec_neighbour_hour "Number of hours of electricity supplied in area"
	label variable f6_elec_neighbour_hour_change "Chane in the hours of electricity supply in area (Yes/No)"
	label variable f7_neigh_hour_change_reason_oth "Unlisted reason for change of supply hours in village"
	label variable f7_neighbour_hour_change_reason "Reason for change of supply hours in village"
	label variable f8_maintenance_complaint "Maintenance related complaint (Yes/No)"
	label variable f9_main_complaint_reason_oth "Unlisted maintenance complaint reason"
	label variable f9_maintenance_complaint_reason "Maintenance complaint reason"
	label variable f10_maintenance_complaint_lodge "Maintenance complaint lodge (Yes/No)"
	label variable f11_main_complaint_lodge_who "Maintenance complaint lodge person/location"
	label variable f11_main_complaint_lodge_who_oth "Maintenance complaint lodge unlisted person/location"
	label variable f12_lineman_pay "Payment to lineman for maintenance"
	label variable f13_complaint_resolve "Complaint resolution"
	label variable f13_complaint_resolve_day "Number of day for complaint resolution"
	foreach z in `elec_supply_factor' {
		capture label variable f4_elec_supply_`z' "Most important factors determining electricity supply includes `z'"
	}
	foreach z in `elec_supply_factor' {
		capture label variable f7_neigh_hr_`z' "Reasons behind the change of neighbourhood electricity supply includes `z'"
	}
	foreach z in `maintenance_complaint' {
		capture label variable f9_maintenance_`z' "Reason for complaint is `z'"
	}
	
	//// Section - G [Information about expenditure, revenue and credit of the business]
	label variable g1_ret_lastday_sale "Last day retail sale for retail business"
	label variable g2_ret_lastmonth_sale "Last month retail sale for retail business"
	label variable g3_ser_lastday_revenue "Last day service revenue for service business"
	label variable g4_ser_lastmonth_revenue "Last month service revenue for service business"
	label variable g5_wor_lastday_sale "Last day workshop sale for workshop business"
	label variable g6_wor_lastmonth_sale "Last month workshop sale for workshop business"
	label variable g7_retser_lastday_retsale "Last day retail sale for retail-service business"
	label variable g8_retser_lastmonth_retsale "Last month retail sale for retail-service business"
	label variable g9_retser_lastday_serrev "Last day service revenue for retail-service business"
	label variable g10_retser_lastmonth_serrev "Last month service revenue for retail-service business"
	label variable g11_retwor_lastday_retsale "Last day retail sale for retail-workshop business"
	label variable g12_retwor_lastmonth_retsale "Last month retail sale for retail-workshop business"
	label variable g13_retwor_lastday_worksale "Last day workshop sale for retail-workshop business"
	label variable g14_retwor_lastmonth_worksale "Last month workshop sale for retail-workshop business"
	label variable g15_serwor_lastday_serrev "Last day service revenue for service-workshop business"
	label variable g16_serwor_lastmonth_serrev "Last month service revenue for service-workshop business"
	label variable g17_serwor_lastday_worksale "Last day workshop sale for service-workshop business"
	label variable g18_serwor_lastmonth_worksale "Last month workshop sale for service-workshop business"
	label variable g19_retserwor_lastday_retsale "Last day retail sale for retail-service-workshop business"
	label variable g20_retserwor_lastmonth_retsale "Last month retail sale for retail-service-workshop business"
	label variable g21_retserwor_lastday_serrev "Last day service revenue for retail-service-workshop business"
	label variable g22_retserwor_lastmonth_serrev "Last month service revenue for retail-service-workshop business"
	label variable g23_retserwor_lastday_worksale "Last day workshop sale for retail-service-workshop business"
	label variable g24_retserwor_lastmonth_worksale "Last month workshop sale for retail-service-workshop business"
	label variable g25_income_rent_int "Income generation from property rental and bank account interest (Yes/No)"
	label variable g26_income_rent_int_amount "Income generation from property rental and bank account interest (Value)"
	foreach b in `exp_head' {
		label variable g27_`b'_exp "Expenditure on `b' as part of business expenses"
	}
	label variable g28_lastmonth_profit "Last month profit"
	label variable g28_lastmonth_profit_amount "Last month profit amount"
	label variable g29a_other_timeperiod "Income after expenses (Time period)"
	label variable g29b_other_timeperiod_income "Income after expenses (Value)"
	label variable g30_lastmonth_income "Income after expenses for last month (Value)"
	label variable g31_rawmaterial_credit "Raw material purchase on credit (Yes/No)"
	label variable g32_rawmaterial_credit_lastmonth "Amount for raw material purchase on credit (Value)"
	label variable g33_supplier_credit_owe "Amount owed to suppliers for items purchased on credit"
	label variable g34_business_bankaccount "Bank account for business use (Yes/No)"
	label variable g35_bankaccount_money "Current money in bank account"
	label variable g36_outstanding_loan "Outstanding loan from any source (Yes/No)"
	label variable g37_loan_amount "Outstanding loan from any source (Value)"
	label variable g37_loan_interest_perannum "Outstanding loan interest per annum"
	label variable g37_loan_interest_permonth "Outstanding loan interest per month"
	label variable g37_loan_interest_rate_type "Outstanding loan interest rate charge type"
	label variable g37_loan_outstanding_bal "Outstanding loan pending balance"
	label variable g37_loan_type "Outstanding loan type"
	
	//// Section - H [Interviewer’s Notes]
	label variable h1_interview_end_time "Interview end time"
	label variable h2_interview_lang "Language used during interview"
	label variable h3_interview_lang_oth "Unlisted language used during interview (Yes/No)"
	label variable h4_interview_oth_name "Unlisted language used during interview"
	label variable h5_number_of_people "Number of people present during interview"
	label variable h6_other_people "People other than the respondent present during interview"
	label variable h7_survey_satisfactory_answer "Interviewer satisfaction with the responses (Yes/No)"
	label variable h8_survey_comment "Interviewer comments on the survey"
	foreach z in `people' {
		capture label variable h6_other_people_`z' "Other people present during the survey includes `z' (Yes/No)"
	}
