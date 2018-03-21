/********************************************************************
Project: BEP

Purpose: Baseline area business survey date and time data cleaning

Author:  Azhar Hussain

Date  :  12 April, 2015
*********************************************************************/



* SEPARATING AND CONVERTING DATE AND TIME DATA FROM HUMAN READABLE FORMAT TO STATA INTERNAL FORMAT AND VICE VERSA

	// Variables with both date and time combined
	foreach i in _survey_end _survey_start _survey_submission {
		generate `i'_datetime_sif = Clock(`i'_datetime, "MDYhms")
		format `i'_datetime_sif %tC
		generate `i'_date = dofc(`i'_datetime_sif)
		format `i'_date %td
		generate `i'_hour = hhC(`i'_datetime_sif)
		generate `i'_min = mmC(`i'_datetime_sif)
		generate `i'_sec = ssC(`i'_datetime_sif)
	}

	// Variables with date	
	foreach j in e28_consumers_bill e34_bill_payment_last f1_grid_elec {
		generate `j'_date_sif = date(`j'_date, "MDY")
		format `j'_date_sif %td
		generate `j'_day = day(`j'_date_sif)
		generate `j'_month = month(`j'_date_sif)
		generate `j'_year = year(`j'_date_sif)		
	}

	// Variables with time
	foreach k in a3 a12_switchon h1_interview_end a11_morning a11_afternoon {
		generate `k'_time_sif = Clock(`k'_time, "hms")
		format `k'_time_sif %tC
		generate `k'_hour = hhC(`k'_time_sif)
		generate `k'_min = mmC(`k'_time_sif)
		generate `k'_sec = ssC(`k'_time_sif)	
	}
	