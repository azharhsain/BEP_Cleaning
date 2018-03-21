/*****************************************************************
Project: BEP

Purpose: Baseline market business survey data variables' recoding

Author:  Azhar Hussain

Date  :  20 March, 2015
******************************************************************/



* RECODING VARIABLES
	
	foreach var in satisfactory_answer int_lang loan_type interest_rate_type lastmonth_income timeperiod lastmonth_profit complaint_resolve ///
	complaint_lodge bill_payment_location bill_availability bill_month bill_payment meter_noncomplaint meter_complaint_location meter_location ///
	grid_billing solar_owner genset_shared_exp_unit genset_exp genset_unit switchon_allday miss_val builtup_unit land_unit proprietor ///
	workshop_type service_type retail_type district owner {
		ds, has(vallabel `var')
		local i = `i'+1
		local var`i' `r(varlist)'
		recode `var`i'' (-101=.b) (-103=.c) (-104=.d)
	}
	ds, has(vallabel yesno)
	foreach var in `r(varlist)' {
		recode `var' (2=0) (-101=.b) (-103=.c) (-104=.d)
	}
	ds, has(vallabel yesnooth)
	foreach var in `r(varlist)' {
		recode `var' (2=0) (-101=.b) (-103=.c) (-104=.d)
	}
