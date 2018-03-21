/**********************************************************************
Project: BEP

Purpose: Baseline market business survey data cleaning master .do file

Author:  Azhar Hussain

Date  :  02 April, 2015
***********************************************************************/



* DEFINING LOCALS

	// Asset list for non-electricity equipment
	local nonelec_equip calculator weight metalcontainer plasticcontainer clock purifier crate tyre gascooker gascylinder utensil sewing ///
	bottlemachine hairdress bicycletool autotool carpentarytool pump other
	
	// Asset list for electricity equipment
	local elec_equip bulb tubelight fan aircooler roomheater desktop laptop refrigerator elecweight cardswipe airconditioner elecpurifier ///
	insectcatcher motor drill hairdrier scanner printer oven elecgrill coldstorage elecmill elecsaw other
	
	// Vehicle list for business
	local vehicle cycle cart barrow bike car lorry van other
	
	// Furniture list for business
	local furniture almirah shelve desk chair woodbox showcase other
	
	// Inventory list for business
	local inventory perish_refrigerated perish_nonrefrigerated snack_refrigerated snack_nonrefrigerated meat_refrigerated meat_nonrefrigerated ///
	dairy_refrigerated dairy_nonrefrigerated cigarette spice food chemical cosmetic medicine shoe jewel polythene paper packingmaterial ///
	grain wood metal processedgrain woodproduct metalproduct salefuel productionfuel other
	
	// Asset list for non-electricity equipment(without other)
	local nonelec_equip_woth calculator weight metalcontainer plasticcontainer clock purifier crate tyre gascooker gascylinder utensil sewing ///
	bottlemachine hairdress bicycletool autotool carpentarytool pump
	
	// Asset list for electricity equipment(without other)
	local elec_equip_woth bulb tubelight fan aircooler roomheater desktop laptop refrigerator elecweight cardswipe airconditioner elecpurifier ///
	insectcatcher motor drill hairdrier scanner printer oven elecgrill coldstorage elecmill elecsaw
	
	// Vehicle list for business (without other)
	local vehicle_woth cycle cart barrow bike car lorry van
	
	// Furniture list for business (without other)
	local furniture_woth almirah shelve desk chair woodbox showcase
	
	// Inventory list for business (without other)
	local inventory_woth perish_refrigerated perish_nonrefrigerated snack_refrigerated snack_nonrefrigerated meat_refrigerated meat_nonrefrigerated ///
	dairy_refrigerated dairy_nonrefrigerated cigarette spice food chemical cosmetic medicine shoe jewel polythene paper packingmaterial ///
	grain wood metal processedgrain woodproduct metalproduct salefuel productionfuel

	// Variable List for Outliers
	local outlier_var a5_rent a10_sale a13_customers e8_genset_cost e9_diesel_cost e10_genset_shared_people e11_genset_shared_cost ///
	e12_genset_shared_exp_amount e15_solar_cost e17_solar_shared_cost e18_solar_shared_exp f12_lineman_pay g37_loan_interest_perannum ///
	g37_loan_interest_permonth e9_genset_exp_litre e9_genset_exp_rupee

	// Expenditure Head List
	local exp_head cellphone employeesalary landrent loaninterest machinerent maintenance material miscellaneous rawmaterial tax watergasfuel

	// Variable List for Outlier
	local out_var g1_ret_lastday_sale g2_ret_lastmonth_sale g3_ser_lastday_revenue g4_ser_lastmonth_revenue g5_wor_lastday_sale ///
	g6_wor_lastmonth_sale g7_retser_lastday_retsale g8_retser_lastmonth_retsale g9_retser_lastday_serrev g10_retser_lastmonth_serrev ///
	g11_retwor_lastday_retsale g12_retwor_lastmonth_retsale g13_retwor_lastday_worksale g14_retwor_lastmonth_worksale g15_serwor_lastday_serrev ///
	g16_serwor_lastmonth_serrev g17_serwor_lastday_worksale g18_serwor_lastmonth_worksale g19_retserwor_lastday_retsale ///
	g20_retserwor_lastmonth_retsale g21_retserwor_lastday_serrev g22_retserwor_lastmonth_serrev g23_retserwor_lastday_worksale ///
	g24_retserwor_lastmonth_worksale g26_income_rent_int_amount g28_lastmonth_profit_amount g29b_other_timeperiod_income g30_lastmonth_income ///
	g32_rawmaterial_credit_lastmonth g33_supplier_credit_owe g35_bankaccount_money g37_loan_amount g37_loan_outstanding_bal m5_number_of_people
	
	// List of Other People During Interview
	local people none spouse child5plus child5minus adult_emp adult observer

	// List of Factors Determining electricity Supply
	local elec_supply_factor youpaybill allpaybill activ_rep no_reason other
	
	// List of Maintenance Related Complaint
	local maintenance_complaint meter transformer high_vol low_volt supply_freq other

	// List of Factors Determining electricity Supply (without other)
	local elec_supply_factor_woth youpaybill allpaybill activ_rep no_reason
	
	// List of Maintenance Related Complaint (without other)
	local maintenance_complaint_woth meter transformer high_vol low_volt supply_freq
	
	// List of Reasons for No Electricity
	local no_elec_reason no_conn no_line no_power no_afford no_need other
	
	// List of Affordable Electricity source
	local affordable_elec_src grid genset solar other

	// List of Reasons for No Electricity (without other)
	local no_elec_reason_woth no_conn no_line no_power no_afford no_need
	
	// List of Affordable Electricity Source (without other)
	local affordable_elec_src_woth grid genset solar
