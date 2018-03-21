/***********************************************************************************
Project: BEP

Purpose: Baseline household survey data checking outliers and dropping observations 

Author:  Azhar Hussain

Date  :  27 April, 2015
************************************************************************************/



* INCLUDING MACROS

	include locals_hh.do
	
	
* CHECKING OUTLIERS USING WINSOR

	foreach var of varlist `outlier_var' {
		histogram `var', name(hist_`var', replace)
		graph save "`var'.png", replace
	}
	
	/*foreach i1 of numlist 1/32 {
		capture rename a1_family_mem_age`i1' a1_family_mem_age`i1'_r
		capture winsor a1_family_mem_age`i1'_r, gen(a1_family_mem_age`i1') p(`per')
		summarize a1_family_mem_age`i1'
		capture return list
		tab a1_family_mem_age`i1' if (a1_family_mem_age`i1'<=(r(mean)-3*r(sd)) | a1_family_mem_age`i1'>=(r(mean)+3*r(sd)))
	}
	
	/*foreach i2 in bedroom living kitchen toilet {
		capture rename b8_`i2'_count b8_`i2'_count_r
		capture winsor b8_`i2'_count_r, gen(b8_`i2'_count) p(`per')
		summarize b8_`i2'_count
		capture return list
		tab b8_`i2'_count' if (b8_`i2'_count<=(r(mean)-3*r(sd)) | b8_`i2'_count>=(r(mean)+3*r(sd)))
	}*/	

	foreach i3 in `animal_woth' {
		capture rename b12_`i3'_count b12_`i3'_count_r
		capture winsor b12_`i3'_count_r, gen(b12_`i3'_count) p(`per')
		summarize b12_`i3'_count
		capture return list
		tab b12_`i3'_count if (b12_`i3'_count<=(r(mean)-3*r(sd)) | b12_`i3'_count>=(r(mean)+3*r(sd)))
	}
	
	foreach i of numlist 1/5 {
		foreach j in `cooking_asset' | `entertainment_asset' | `appliance_asset' | `transport_asset' | `miscellaneous_asset' {
			capture rename c`i'_`j'_count c`i'_`j'_count_r
			capture rename c`i'_`j'_resale_value c`i'_`j'_resale_value_r			
			capture winsor c`i'_`j'_count_r, gen(c`i'_`j'_count) p(`per')
			capture winsor c`i'_`j'_resale_value_r, gen(c`i'_`j'_resale_value) p(`per')
			capture summarize c`i'_`j'_count
			capture return list
			capture tab c`i'_`j'_count if (c`i'_`j'_count<=(r(mean)-3*r(sd)) | c`i'_`j'_count>=(r(mean)+3*r(sd)))
			capture summarize c`i'_`j'_resale_value
			capture return list
			capture tab c`i'_`j'_resale_value if (c`i'_`j'_resale_value<=(r(mean)-3*r(sd)) | c`i'_`j'_resale_value>=(r(mean)+3*r(sd)))
		}
	}

	foreach i in `energy_source' {
		capture rename g4_`i'_use_quantity g4_`i'_use_quantity_r
		capture rename g5_`i'_unit_price g5_`i'_unit_price_r
		capture rename g6_`i'_exp_month g6_`i'_exp_month_r		
		capture winsor g4_`i'_use_quantity_r, gen(g4_`i'_use_quantity) p(`per')
		capture winsor g5_`i'_unit_price_r, gen(g5_`i'_unit_price) p(`per')
		capture winsor g6_`i'_exp_month_r, gen(g6_`i'_exp_month) p(`per')
		capture summarize g4_`i'_use_quantity
		capture return list
		capture tab g4_`i'_use_quantity if (g4_`i'_use_quantity<=(r(mean)-3*r(sd)) | g4_`i'_use_quantity>=(r(mean)+3*r(sd)))
		capture summarize g5_`i'_unit_price
		capture return list
		capture tab g5_`i'_unit_price if (g5_`i'_unit_price<=(r(mean)-3*r(sd)) | g5_`i'_unit_price>=(r(mean)+3*r(sd)))
		capture summarize g6_`i'_exp_month
		capture return list
		capture tab g6_`i'_exp_month if (g6_`i'_exp_month<=(r(mean)-3*r(sd)) | g6_`i'_exp_month>=(r(mean)+3*r(sd)))
	}
	
	foreach i in `room_type' {
		local r=substr("`i'",1,1)
		capture rename h`r'2_bulb_count_`i' h`r'2_bulb_count_`i'_r
		capture rename h`r'3_cfl_count_`i' h`r'3_cfl_count_`i'_r
		capture rename h`r'4_tubelight_count_`i' h`r'4_tubelight_count_`i'_r
		capture rename h`r'5_plug_count_`i' h`r'5_plug_count_`i'_r
		capture winsor h`r'2_bulb_count_`i'_r, gen(h`r'2_bulb_count_`i') p(`per')
		capture winsor h`r'3_cfl_count_`i'_r, gen(h`r'3_cfl_count_`i') p(`per')
		capture winsor h`r'4_tubelight_count_`i'_r, gen(h`r'4_tubelight_count_`i') p(`per')
		capture winsor h`r'5_plug_count_`i'_r, gen(h`r'5_plug_count_`i') p(`per')
		summarize h`r'2_bulb_count_`i'
		capture return list
		tab h`r'2_bulb_count_`i' if (h`r'2_bulb_count_`i'<=(r(mean)-3*r(sd)) | h`r'2_bulb_count_`i'>=(r(mean)+3*r(sd)))
		summarize h`r'3_cfl_count_`i'
		capture return list
		tab h`r'3_cfl_count_`i' if (h`r'3_cfl_count_`i'<=(r(mean)-3*r(sd)) | h`r'3_cfl_count_`i'>=(r(mean)+3*r(sd)))
		summarize h`r'4_tubelight_count_`i'
		capture return list
		tab h`r'4_tubelight_count_`i' if (h`r'4_tubelight_count_`i'<=(r(mean)-3*r(sd)) | h`r'4_tubelight_count_`i'>=(r(mean)+3*r(sd)))		
		summarize h`r'5_plug_count_`i'
		capture return list
		tab h`r'5_plug_count_`i' if (h`r'5_plug_count_`i'<=(r(mean)-3*r(sd)) | h`r'5_plug_count_`i'>=(r(mean)+3*r(sd)))		
	}
	
	foreach i in `exp_head' {
		capture rename j1_`i'_exp_lastmonth j1_`i'_exp_lastmonth_r
		capture winsor j1_`i'_exp_lastmonth_r, gen(j1_`i'_exp_lastmonth) p(`per')
		summarize j1_`i'_exp_lastmonth
		capture return list
		tab j1_`i'_exp_lastmonth if (j1_`i'_exp_lastmonth<=(r(mean)-3*r(sd)) | j1_`i'_exp_lastmonth>=(r(mean)+3*r(sd)))
	}
	
	foreach i in `income_src' {
		capture rename j6_`i'_inc_annual j6_`i'_inc_annual_r
		capture rename j6_`i'_inc_monthly j6_`i'_inc_monthly_r
		capture winsor j6_`i'_inc_annual_r, gen(j6_`i'_inc_annual) p(`per')
		capture winsor j6_`i'_inc_monthly_r, gen(j6_`i'_inc_monthly) p(`per')
		summarize j6_`i'_inc_annual
		capture return list
		tab j6_`i'_inc_annual if (j6_`i'_inc_annual<=(r(mean)-3*r(sd)) | j6_`i'_inc_annual>=(r(mean)+3*r(sd)))
		summarize j6_`i'_inc_monthly
		capture return list
		tab j6_`i'_inc_monthly if (j6_`i'_inc_monthly<=(r(mean)-3*r(sd)) | j6_`i'_inc_monthly>=(r(mean)+3*r(sd)))
	}
	*/
