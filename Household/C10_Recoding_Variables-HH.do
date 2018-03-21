/***********************************************************
Project: BEP

Purpose: Baseline household survey data variables' recoding

Author:  Azhar Hussain

Date  :  28 April, 2015
************************************************************/



* RECODING VARIABLES
	
	foreach var in district gender education relation house_owner house_type roof_type area_unit land_extra buy_time religion mgnrega genset_unit ///
	genset_exp genset_shared_exp_unit gen_solar_owner meter_complaint_location meter_noncomplaint meter_location conn_type single_phase_meter ///
	three_phase_meter bill_month bill_availability bill_freq month bill_not_received_action bill_payment_location distance time pro_rating ///
	complaint_lodge complaint_resolve miss_val mother_tongue safety_rating local_org org_meet neigh_meet inc_src int_lang satisfactory_answer {
		ds, has(vallabel `var')
		local i = `i'+1
		local var`i' `r(varlist)'
		recode `var`i'' (-101=.b) (-103=.c) (-104=.d) (-105=.e) (-106=.g)
	}
	ds, has(vallabel yesno)
	foreach var in `r(varlist)' {
		recode `var' (2=0) (-101=.b) (-103=.c) (-104=.d)
	}
	ds, has(vallabel yesnooth)
	foreach var in `r(varlist)' {
		recode `var' (2=0) (-101=.b) (-103=.c) (-104=.d)
	}

	drop max_*
