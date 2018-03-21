/***************************************************************
Project: BEP

Purpose: Baseline business enumeration data variables' dropping

Author:  Azhar Hussain

Date  :  09 April, 2015
****************************************************************/



* DROPPING VARIABLES WITH NO OBSERVATIONS

	//No observations
	
	
	//Redundant data
	drop district market surveyor code surveyor_code_data supervisor_code_data screen_1town_name screen_1village_name total_shops_enumeration date ///
	enumerator_rank date
	
	//Data not useful for analysis
	drop key date_list remarks mergeMapping setofscreen_3 mergeEnumeration mergeMapData dup_rank totalshops screen_1tolla_name village pos ///
	count_enum

