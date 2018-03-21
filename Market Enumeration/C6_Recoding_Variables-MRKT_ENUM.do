/*****************************************************************
Project: BEP

Purpose: Baseline market business survey data variables' recoding

Author:  Azhar Hussain

Date  :  10 April, 2015
******************************************************************/



* RECODING VARIABLES
	
	ds, has(vallabel yesno)
	foreach var in `r(varlist)' {
		recode `var' (2=0) (-101=.b) (-103=.c) (-104=.d)
	}
	