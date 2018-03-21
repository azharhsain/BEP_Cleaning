/**********************************************************************
Project: BEP

Purpose: Baseline market business enumeration data variables' renaming

Author:  Azhar Hussain

Date  :  09 April, 2015
***********************************************************************/



* RENAMING VARIABLES

	rename parent_key _enum_parent_id
	rename block _block_name
	rename town _town_name
	rename market_list _market_name
	rename district_list _district_name
	rename pss_list _pss_name
	rename feeder_list _feeder_name
	rename grampanchayat _grampanchayat_name
	rename hq hq_market
	rename nonelectrified non_elec_market
	rename pilotmarket _pilot_market
	rename shops enum_shop_count
	rename supervisor_name_list _supervisor_name
	rename supervisor_code_list _supervisor_code
	rename remarksifany remarks
	rename market_id _market_id
	rename feeder_id _feeder_id
	rename shopsshop_name shop_name
	rename shopsshop_floor shop_floor
	rename shopsshop_open shop_open_seen
	rename open_month shop_open_lastmonth
	rename phn_no _shop_phone_number
	rename sector shop_sector
	rename retail retail_type
	rename retail_oth retail_type_oth
	rename service service_type
	rename servc_oth service_type_oth
	rename workshop workshop_type
	rename workshop_oth workshop_type_oth
	rename submissiondate _submission_datetime
	rename starttime _start_datetime
	rename screen_1pin_gram_code _pin_code
	rename flag_active shop_active
	rename dup_ennum dup_enum
	rename surveyor_position surveyor_pos
	rename coordinate enum_coord_count
	rename first_shop enum_first_shop
	rename pos1 shop_pos
	rename num_enumeration enum_order
	rename num enum_start_number

	order _all, sequential
