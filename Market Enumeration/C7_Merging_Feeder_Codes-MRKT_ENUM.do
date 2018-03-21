/***************************************************************************
Project: BEP

Purpose: Baseline market business enumeration data cleaning master .do file

Author:  Azhar Hussain

Date  :  13 April, 2015
****************************************************************************/



* SETTING DIRECTORY

	cd "`INPUT_DATA'"
	
	
* MERGING FEEDER CODES IN THE ENUMERATION DATA

	insheet using "Market_ID.xls", n
	generate feeder_id=substr(market_id,1,8)
	merge 1:m 
