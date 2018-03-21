/**************************************************************
Project: BEP

Purpose: Baseline area business survey data values' labeling

Author:  Azhar Hussain

Date  :  10 March, 2015
***************************************************************/



* LABELING VALUES

	// Defining labels
	label define yesno 1 "Yes" 0 "No"
	label define district 1 "Ara" 2 "Buxar" 3 "Chapra" 4 "Katihar" 5 "Purnia" 6 "Siwan" 7 "Darbhanga" 8 "Patna"
	label define retail_type 101 "Departmental Store" 102 "General Store" 103 "Grains Wholesale" 104 "Drug Store" 105 "Garment Store" 106 "Shoe Store" ///
	107 "House Décor" 108 "Jewellers" 109 "Fruit and Vegetable Seller" 110 "Sports Shop" 111 "Bicycle Store" 112 "Electronics Store" ///
	113 "Sweets Shop" 114 "Paan/Cigarette Shop" 115 "Kitchen Utensils Shop" 116 "Mobile Shop" 117 "Agriculture Seed/Chemical Shop" ///
	118 "Hardware Shop" 119 "Wine Shop" 120 "Auto Parts/Spares Shop" 121 "Bag/Box Shop" 122 "Cement/Concrete Shop" 123 "Book Store" ///
	124 "Meat Shop" 125 "Cosmetics Shop" 126 "Milk Shop" 127 "Watch Shop" 199 "Others"
	label define service_type 201 "Restaurant/ Dhaba" 202 "Hotel" 203 "Dry Cleaner" 204 "Tailor" 205 "Fruit Juice Stall" 206 "Private Clinic" ///
	207 "Beauty Parlour/Haircut Salon" 208 "Print Shop/ Photocopiers" 209 "Locksmith" 210 "Watch Repair" 211 "Automobile repair" 212 "Bicycle Repair" ///
	213 "Tea stall/Cold-drink Shop" 214 "Cyber Café" 215 "Weighing Center" 216 "Electronic Repair" 217 "Photo Studio" 218 "Tent Shop" ///
	219 "Optician" 299 "Others"
	label define workshop_type 301 "Grain Mill" 302 "Metal workshop" 303 "Woodwork" 304 "Biscuit Factory" 305 "Soap Factory" 399 "Others"
	label define proprietor 1 "Self-Proprietorship" 2 "Family-Proprietorship" 3 "Employee" -102 "Others"
	label define land_unit 1 "Dhoor" 2 "Kattha" 3 "Gaz" 4 "Square Feet" 5 "Hectare" -102 "Others"
	label define builtup_unit 1 "Dhoor" 2 "Kattha" 3 "Bigha" 4 "Square Feet" 5 "Square Meter" 6 "Acre" 7 "Hectare" -102 "Others"
	label define miss_val .b "Not Applicable" -102 "Others" .c "Don't Know" .d "Don't Want to Say"
	label define miss_val -101 "" -103 "" -104 "", modify
	label define switchon_allday 1 "Whole Day" 2 "Time Given"
	label define genset_unit 1 "HP" 2 "kWh" 
	label define genset_exp 1 "Rupees/month" 2 "Liters/month"
	label define genset_shared_exp_unit 1 "Weekly" 2 "Fortnightly" 3 "Monthly" -102 "Others"
	label define genset_owner 1 "Private" 2 "Shared" -102 "Others"
	label define solar_owner 1 "Private" 2 "Shared"
	label define grid_billing 1 "Pay the Bill Separately" 2 "Bill Included in Rent"
	label define meter_location 1 "Inside Establishment" 2 "Outside Establishment" -102 "Others"
	label define meter_complaint_location 1 "Energy Department/PSS" 2 "Meter Reader" 3 "Bill Collectors" -102 "Others"
	label define meter_noncomplaint 1 "Getting Electricity without Payment" 2 "Getting Electricity with Flat Bill Payment" -102 "Others"
	label define bill_payment 1 "Given Date" -100 "Never Received Any Bill"
	label define bill_month 1 "1 Month Before Bill Date" 2 "2 Months Before Bill Date" 3 "Others"
	label define bill_availability 1 "Yes" 2 "No" 3 "Bill Copy Unavailable"
	label define bill_payment_location 1 "PSS/Discom Office" 2 "RRF Centre" 3 "Someone Else Submits My Bill" -102 "Others"
	label define complaint_lodge 1 "Energy Department/PSS" 2 "Meter Reader" 3 "Private Linesman" -102 "Others"
	label define complaint_resolve 1 "Given Number of Days" -100 "Complaint Never got Resolved"
	label define lastmonth_profit 1 "Given Rupees"
	label define timeperiod 1 "Yesterday" 2 "Last Week" 3 "Last 2 Weeks" 4 "Last Year" 5 "Other Period"
	label define lastmonth_income 1 "< 5,000" 2 "5,000-10,000" 3 "10,000-15,000" 4 "15,000-20,000" 5 "20,000-30,000" 6 "30,000-50,000" ///
	7 "50,000-1,00,000" 8 "> 1,00,000"
	label define interest_rate_type 1 "Per Annum" 2 "Per Month"
	label define loan_type 1 "Govt Bank" 2 "Private Bank" 3 "Microfinance Org" 4 "Money Lender" 5 "Family" 6 "Friends" 7 "Others"
	label define int_lang 1 "Hindi" 2 "Vernacular"
	label define satisfactory_answer 1 "Very Satisfied" 2 "Satisfied" 3 "Not Satisfied"
	label define owner 1 "Self-owned" 2 "Family-owned" 3 "Public Space(No rent)" -102 "Others"
	
	// Attaching labels
	label values _resp_questions _shop_retail _shop_service _shop_workshop _sur_answers _verbal_consent a2_knowledge a7_land_cover ///
	a15_member_association e1_elec_any e2_elec_past e13_elec_solar e16_solar_shared e19_elec_grid e21_metered_consumer e23_meter_functional ///
	e25_meter_complaint e32_know_consumer_number f3_elec_future_expect f6_elec_neighbour_hour_change f8_maintenance_complaint ///
	f10_maintenance_complaint_lodge g25_income_rent_int g31_rawmaterial_credit g34_business_bankaccount g36_outstanding_loan h3_interview_lang_oth ///
	_duplicate_parent_key _duplicate_survey e5_elec_genset c*_*_have d*_*_have yesno
	foreach z in no_conn no_line no_power no_afford no_need other {
		label values e3_noelec_`z' yesno
	}	
	foreach z in grid genset solar other {
		label values e4_elec_source_`z' yesno
	}
	foreach z in youpaybill allpaybill activ_rep no_reason {
		label values f4_elec_supply_`z' yesno
	}
	foreach z in youpaybill allpaybill activ_rep no_reason {
		label values f7_neigh_hr_`z' yesno
	}
	foreach z in meter transformer high_vol low_volt supply_freq {
		label values f9_maintenance_`z' yesno
	}
	foreach z in none spouse child5plus child5minus adult_emp adult observer {
		label values h6_other_people_`z' yesno
	}
	label values _district_id district
	label values _retail_type retail_type
	label values _service_type service_type
	label values _workshop_type workshop_type
	label values a1_proprietor proprietor
	label values a4_owner owner
	label values a6_land_unit land_unit
	label values a8_builtup_unit builtup_unit
	label values _pin_code a10_sale a5_rent b*_tot_wages* e9_genset_exp_litre e9_genset_exp_rupee e33_ask_consumer_number f2_gridelec_*to* ///
	g26_income_rent_int_amount g37_loan_interest_perannum g37_loan_interest_permonth g37_loan_outstanding_bal a8_builtup_size c*_*_sale g*_*_*_* d*_*_val ///
	e6_genset_capacity e8_genset_cost e11_genset_shared_cost e12_genset_shared_exp_amount e15_solar_cost e18_solar_shared_exp g37_loan_interest_perannum ///
	g37_loan_interest_permonth a6_land_size a12_switchon_allday e28_consumers_billed e34_bill_payment e29_consumers_bill_month e35_bill_payment_location ///
	g28_lastmonth_profit g29a_other_timeperiod miss_val
	label values a12_switchon_allday switchon_allday
	label values e6_genset_unit genset_unit
	label values e7_genset_shared genset_owner
	label values e9_genset_exp genset_exp
	label values e12_genset_shared_exp_unit genset_shared_exp_unit
	label values e14_solar_owner solar_owner
	label values e20_grid_billing grid_billing
	label values e22_meter_location meter_location
	label values e26_meter_complaint_location meter_complaint_location
	label values e27_meter_noncomplaint meter_noncomplaint
	label values e28_consumers_billed e34_bill_payment bill_payment
	label values e29_consumers_bill_month bill_month
	label values e30_bill_availability bill_availability
	label values e35_bill_payment_location bill_payment_location
	label values f11_main_complaint_lodge_who complaint_lodge
	label values f13_complaint_resolve complaint_resolve
	label values g28_lastmonth_profit lastmonth_profit
	label values g29a_other_timeperiod timeperiod
	label values g30_lastmonth_income lastmonth_income
	label values g37_loan_interest_rate_type interest_rate_type
	label values g37_loan_type loan_type
	label values h2_interview_lang int_lang
	label values h7_survey_satisfactory_answer satisfactory_answer
