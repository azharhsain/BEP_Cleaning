/**********************************************************************
Project: BEP

Purpose: Baseline market business survey data cleaning master .do file

Author:  Azhar Hussain

Date  :  27 March, 2015
***********************************************************************/



* OPENING COMMANDS:

	clear
	set more off
	pause on
	version 12.0
	cap log close
	

* AUTOMATED SELECTION OF ROOT PATH BASED ON USER

	if c(os) == "Windows" {
		cd "C:/Users/`c(username)'/Dropbox"
	}
	else if c(os) == "MacOSX" {
		cd "/Users/`c(username)'/Dropbox"
	}
	local DROPBOX `c(pwd)'
	if "`c(username)'" == "nryan" {
	local DROPBOX_ROOT "`DROPBOX'/Bihar Electrification Project"
	}
	else {
	local DROPBOX_ROOT "`DROPBOX'/Bihar Electrification Project"
	}


* SETTING PATH SHORTCUTS

	local INPUT_DATA  "`DROPBOX_ROOT'/Data/Survey/Baseline/Working Data"
	local WORKING_DATA  "`DROPBOX_ROOT'/Data/Survey/Baseline/Working Data"
	local CODE_FILE "`DROPBOX_ROOT'/Data/Survey/Baseline/Code/Cleaning/Market Business"
	
	
* READING WORKING DATA

	cd "`INPUT_DATA'"
	use CUMULATIVE_BIZ_MRKT_18Feb2015_WORKING

	cd "`CODE_FILE'"
	include locals_biz.do
	
	local per 0.01
	

* CHECKING OUTLIERS USING WINSOR

	foreach var in `outlier_var' {
		capture rename `var' `var'_raw
		capture winsor `var'_raw, gen(`var') p(`per')
		summarize `var'
		capture return list
		tab `var' if (`var'<=(r(mean)-3*r(sd)) | `var'>=(r(mean)+3*r(sd)))
	}
	pause
	
	foreach i1 of numlist 1/28 {
		capture rename b1_tot_wages`i1' b1_tot_wages`i1'_raw
		capture winsor b1_tot_wages`i1'_raw, gen(b1_tot_wages`i1') p(`per')
		summarize b1_tot_wages`i1'
		capture return list
		tab b1_tot_wages`i1' if (b1_tot_wages`i1'<=(r(mean)-3*r(sd)) | b1_tot_wages`i1'>=(r(mean)+3*r(sd)))
	}
	pause

	foreach i2 of numlist 1/10 {
		capture rename b2_tot_wages`i2' b2_tot_wages`i2'_raw
		capture winsor b2_tot_wages`i2'_raw, gen(b2_tot_wages`i2') p(`per')
		capture noisily summarize b2_tot_wages`i2'
		capture return list
		capture noisily tab b2_tot_wages`i2' if (b2_tot_wages`i2'<=(r(mean)-3*r(sd)) | b2_tot_wages`i2'>=(r(mean)+3*r(sd)))
	}
	pause

	foreach i3 of numlist 1/2 {
		capture rename b3_tot_wages`i3' b3_tot_wages`i3'_raw
		capture winsor b3_tot_wages`i3'_raw, gen(b3_tot_wages`i3') p(`per')
		summarize b3_tot_wages`i3'
		capture return list
		tab b3_tot_wages`i3' if (b3_tot_wages`i3'<=(r(mean)-3*r(sd)) | b3_tot_wages`i3'>=(r(mean)+3*r(sd)))
	}
	foreach i4 of numlist 1/1 {
		capture rename b4_tot_wages`i4' b4_tot_wages`i4'_raw
		capture winsor b4_tot_wages`i4'_raw, gen(b4_tot_wages`i4') p(`per')
		summarize b4_tot_wages`i4'
		capture return list
		tab b4_tot_wages`i4' if (b4_tot_wages`i4'<=(r(mean)-3*r(sd)) | b4_tot_wages`i4'>=(r(mean)+3*r(sd)))
	}
	pause

	foreach i5 of numlist 1/12 {
		capture rename b5_tot_wages`i5' b5_tot_wages`i5'_raw
		capture winsor b5_tot_wages`i5'_raw, gen(b5_tot_wages`i5') p(`per')
		summarize b5_tot_wages`i5'
		capture return list
		tab b5_tot_wages`i5' if (b5_tot_wages`i5'<=(r(mean)-3*r(sd)) | b5_tot_wages`i5'>=(r(mean)+3*r(sd)))
	}
	pause

	foreach i6 of numlist 1/2 {
		capture rename b6_tot_wages`i6' b6_tot_wages`i6'_raw
		capture winsor b6_tot_wages`i6'_raw, gen(b6_tot_wages`i6') p(`per')
		summarize b6_tot_wages`i6'
		capture return list
		tab b6_tot_wages`i6' if (b6_tot_wages`i6'<=(r(mean)-3*r(sd)) | b6_tot_wages`i6'>=(r(mean)+3*r(sd)))
	}
	pause
	
	foreach y1 in `retail_asset' {
		capture rename c1_`y1'_sale c1_`y1'_sale_raw
		capture winsor c1_`y1'_sale_raw, gen(c1_`y1'_sale) p(`per')
		capture noisily summarize c1_`y1'_sale
		capture return list
		capture noisily tab c1_`y1'_sale if (c1_`y1'_sale<=(r(mean)-3*r(sd)) | c1_`y1'_sale>=(r(mean)+3*r(sd)))
	}
	pause

	foreach y2 in `service_asset' {
		capture rename c2_`y2'_sale c2_`y2'_sale_raw
		capture winsor c2_`y2'_sale_raw, gen(c2_`y2'_sale) p(`per')
		capture noisily summarize c2_`y2'_sale
		capture return list
		capture noisily tab c2_`y2'_sale if (c2_`y2'_sale<=(r(mean)-3*r(sd)) | c2_`y2'_sale>=(r(mean)+3*r(sd)))
	}
	pause

	foreach y3 in `workshop_asset' {
		capture rename c3_`y3'_sale c3_`y3'_sale_raw
		capture winsor c3_`y3'_sale_raw, gen(c3_`y3'_sale) p(`per')
		capture noisily summarize c3_`y3'_sale
		capture return list
		capture noisily tab c3_`y3'_sale if (c3_`y3'_sale<=(r(mean)-3*r(sd)) | c3_`y3'_sale>=(r(mean)+3*r(sd)))
	}
	pause

	foreach y4 in `retail_asset'|`service_asset' {
		capture rename c4_`y4'_sale c4_`y4'_sale_raw
		capture winsor c4_`y4'_sale_raw, gen(c4_`y4'_sale) p(`per')
		capture noisily summarize c4_`y4'_sale
		capture return list
		capture noisily tab c4_`y4'_sale if (c4_`y4'_sale<=(r(mean)-3*r(sd)) | c4_`y4'_sale>=(r(mean)+3*r(sd)))
	}
	pause

	foreach y5 in `retail_asset'| `workshop_asset' {
		capture rename c5_`y5'_sale c5_`y5'_sale_raw
		capture winsor c5_`y5'_sale_raw, gen(c5_`y5'_sale) p(`per')
		capture noisily summarize c5_`y5'_sale
		capture return list
		capture noisily tab c5_`y5'_sale if (c5_`y5'_sale<=(r(mean)-3*r(sd)) | c5_`y5'_sale>=(r(mean)+3*r(sd)))
	}
	pause

	foreach y6 in `service_asset'| `workshop_asset' {
		capture rename c6_`y6'_sale c6_`y6'_sale_raw
		capture winsor c6_`y6'_sale_raw, gen(c6_`y6'_sale) p(`per')
		capture noisily summarize c6_`y6'_sale
		capture return list
		capture noisily tab c6_`y6'_sale if (c6_`y5'_sale<=(r(mean)-3*r(sd)) | c6_`y5'_sale>=(r(mean)+3*r(sd)))
	}
	pause

	foreach y7 in `retail_asset'| `service_asset'| `workshop_asset' {
		capture rename c7_`y7'_sale c7_`y7'_sale_raw
		capture winsor c7_`y7'_sale_raw, gen(c7_`y7'_sale) p(`per')
		capture noisily summarize c7_`y7'_sale
		capture return list
		capture noisily tab c7_`y7'_sale if (c7_`y7'_sale<=(r(mean)-3*r(sd)) | c7_`y7'_sale>=(r(mean)+3*r(sd)))
	}
	pause

	foreach z1 in `vehicle' {
		capture rename c8_`z1'_sale c8_`z1'_sale_raw
		capture winsor c8_`z1'_sale_raw, gen(c8_`z1'_sale) p(`per')
		summarize c8_`z1'_sale
		capture return list
		tab c8_`z1'_sale if (c8_`z1'_sale<=(r(mean)-3*r(sd)) | c8_`z1'_sale>=(r(mean)+3*r(sd)))
	}
	pause

	foreach z2 in `furniture' {
		capture rename c9_`z2'_sale c9_`z2'_sale_raw
		capture winsor c9_`z2'_sale_raw, gen(c9_`z2'_sale) p(`per')
		summarize c9_`z2'_sale
		capture return list
		tab c9_`z2'_sale if (c9_`z2'_sale<=(r(mean)-3*r(sd)) | c9_`z2'_sale>=(r(mean)+3*r(sd)))
	}
	pause
	
	foreach a1 in `retail_inventory' {
		capture rename d1_`a1'_val d1_`a1'_val_raw
		capture winsor d1_`a1'_val_raw, gen(d1_`a1'_val) p(`per')
		capture noisily summarize d1_`a1'_val
		capture return list
		capture noisily tab d1_`a1'_val if (d1_`a1'_val<=(r(mean)-3*r(sd)) | d1_`a1'_val>=(r(mean)+3*r(sd)))
	}
	pause

	foreach a2 in `service_inventory' {
		capture rename d2_`a2'_val d2_`a2'_val_raw
		capture winsor d2_`a2'_val_raw, gen(d2_`a2'_val) p(`per')
		capture noisily summarize d2_`a2'_val
		capture return list
		capture noisily tab d2_`a2'_val if (d2_`a2'_val<=(r(mean)-3*r(sd)) | d2_`a2'_val>=(r(mean)+3*r(sd)))
	}
	pause

	foreach a3 in `workshop_inventory' {
		capture rename d3_`a3'_val d3_`a3'_val_raw
		capture winsor d3_`a3'_val_raw, gen(d3_`a3'_val) p(`per')
		capture noisily summarize d3_`a3'_val
		capture return list
		capture noisily tab d3_`a3'_val if (d3_`a3'_val<=(r(mean)-3*r(sd)) | d3_`a3'_val>=(r(mean)+3*r(sd)))
	}
	pause

	foreach a4 in `retail_inventory'| `service_inventory' {
		capture rename d4_`a4'_val d4_`a4'_val_raw
		capture winsor d4_`a4'_val_raw, gen(d4_`a4'_val) p(`per')
		capture noisily summarize d4_`a4'_val
		capture return list
		capture noisily tab d4_`a4'_val if (d4_`a4'_val<=(r(mean)-3*r(sd)) | d4_`a4'_val>=(r(mean)+3*r(sd)))
	}
	pause

	foreach a5 in `retail_inventory'| `workshop_inventory' {
		capture rename d5_`a5'_val d5_`a5'_val_raw
		capture winsor d5_`a5'_val_raw, gen(d5_`a5'_val) p(`per')
		capture noisily summarize d5_`a5'_val
		capture return list
		capture noisily tab d5_`a5'_val if (d5_`a5'_val<=(r(mean)-3*r(sd)) | d5_`a5'_val>=(r(mean)+3*r(sd)))
	}
	pause

	foreach a6 in `service_inventory'| `workshop_inventory' {
		capture rename d6_`a6'_val d6_`a6'_val_raw
		capture winsor d6_`a6'_val_raw, gen(d6_`a6'_val) p(`per')
		capture noisily summarize d6_`a6'_val
		capture return list
		capture noisily tab d6_`a6'_val if (d6_`a6'_val<=(r(mean)-3*r(sd)) | d6_`a6'_val>=(r(mean)+3*r(sd)))
	}
	pause

	foreach a7 in `retail_inventory'| `service_inventory'| `workshop_inventory' {
		capture rename d7_`a7'_val d7_`a7'_val_raw
		capture winsor d7_`a7'_val_raw, gen(d7_`a7'_val) p(`per')
		capture noisily summarize d7_`a7'_val
		capture return list
		capture noisily tab d7_`a7'_val if (d7_`a7'_val<=(r(mean)-3*r(sd)) | d7_`a7'_val>=(r(mean)+3*r(sd)))
	}
	
	
	
/* CHECKING OUTLIERS ON THE BASIS OF DEVIATION FROM MEAN AND PRINTING TOP AND BOTTOM 10 OBSERVATIONS

	foreach var in `outlier_var' {
		gsort +`var'
		replace `var'=. if _n<=`per'*_N
		gsort -`var'
		replace `var'=. if _n<=`per'*_N
		summarize `var'
		return list
		tab `var' if (`var'<=(r(mean)-3*r(sd)) | `var'>=(r(mean)+3*r(sd)))
	}
/*	foreach i1 of numlist 1/28 {
		capture summarize b1_tot_wages`i1'
		capture return list
		tab b1_tot_wages`i1' if (b1_tot_wages`i1'<=(r(mean)-3*r(sd)) | b1_tot_wages`i1'>=(r(mean)+3*r(sd)))
	}
	foreach i2 of numlist 1/10 {
		capture summarize b2_tot_wages`i2'
		capture return list
		tab b2_tot_wages`i2' if (b2_tot_wages`i2'<=(r(mean)-3*r(sd)) | b2_tot_wages`i2'>=(r(mean)+3*r(sd)))
	}
	foreach i3 of numlist 1/2 {
		capture summarize b3_tot_wages`i3'
		capture return list
		tab b3_tot_wages`i3' if (b3_tot_wages`i3'<=(r(mean)-3*r(sd)) | b3_tot_wages`i3'>=(r(mean)+3*r(sd)))
	}
	foreach i4 of numlist 1/1 {
		capture summarize b4_tot_wages`i4'
		capture return list
		tab b4_tot_wages`i4' if (b4_tot_wages`i4'<=(r(mean)-3*r(sd)) | b4_tot_wages`i4'>=(r(mean)+3*r(sd)))
	}
	foreach i5 of numlist 1/12 {
		capture summarize b5_tot_wages`i5'
		capture return list
		tab b5_tot_wages`i5' if (b5_tot_wages`i5'<=(r(mean)-3*r(sd)) | b5_tot_wages`i5'>=(r(mean)+3*r(sd)))
	}
	foreach i6 of numlist 1/2 {
		capture summarize b6_tot_wages`i6'
		capture return list
		tab b6_tot_wages`i6' if (b6_tot_wages`i6'<=(r(mean)-3*r(sd)) | b6_tot_wages`i6'>=(r(mean)+3*r(sd)))
	}
	
	foreach y1 in `retail_asset' {
		capture summarize c1_`y1'_sale
		capture return list
		capture tab c1_`y1'_sale if (c1_`y1'_sale<=(r(mean)-3*r(sd)) | c1_`y1'_sale>=(r(mean)+3*r(sd)))
	}
	foreach y2 in `service_asset' {
		capture summarize c2_`y2'_sale
		capture return list
		tab c2_`y2'_sale if (c2_`y2'_sale<=(r(mean)-3*r(sd)) | c2_`y2'_sale>=(r(mean)+3*r(sd)))
	}
	foreach y3 in `workshop_asset' {
		capture summarize c3_`y3'_sale
		capture return list
		tab c3_`y3'_sale if (c3_`y3'_sale<=(r(mean)-3*r(sd)) | c3_`y3'_sale>=(r(mean)+3*r(sd)))
	}
	foreach y4 in `retail_asset'|`service_asset' {
		capture summarize c4_`y4'_sale
		capture return list
		tab c4_`y4'_sale if (c4_`y4'_sale<=(r(mean)-3*r(sd)) | c4_`y4'_sale>=(r(mean)+3*r(sd)))
	}
	foreach y5 in `retail_asset'| `workshop_asset' {
		capture summarize c5_`y5'_sale
		capture return list
		tab c5_`y5'_sale if (c5_`y5'_sale<=(r(mean)-3*r(sd)) | c5_`y5'_sale>=(r(mean)+3*r(sd)))
	}
	foreach y6 in `service_asset'| `workshop_asset' {
		capture summarize c6_`y6'_sale
		capture return list
		tab c6_`y6'_sale if (c6_`y5'_sale<=(r(mean)-3*r(sd)) | c6_`y5'_sale>=(r(mean)+3*r(sd)))
	}
	foreach y7 in `retail_asset'| `service_asset'| `workshop_asset' {
		capture summarize c7_`y7'_sale
		capture return list
		tab c7_`y7'_sale if (c7_`y7'_sale<=(r(mean)-3*r(sd)) | c7_`y7'_sale>=(r(mean)+3*r(sd)))
	}
	foreach z1 in `vehicle' {
		capture summarize c8_`z1'_sale
		capture return list
		tab c8_`z1'_sale if (c8_`z1'_sale<=(r(mean)-3*r(sd)) | c8_`z1'_sale>=(r(mean)+3*r(sd)))
	}
	foreach z2 in `furniture' {
		capture summarize c9_`z2'_sale
		capture return list
		tab c9_`z2'_sale if (c9_`z2'_sale<=(r(mean)-3*r(sd)) | c9_`z2'_sale>=(r(mean)+3*r(sd)))
	}
	
	foreach a1 in `retail_inventory' {
		capture summarize d1_`a1'_sale
		capture return list
		tab d1_`a1'_val if (d1_`a1'_val<=(r(mean)-3*r(sd)) | d1_`a1'_val>=(r(mean)+3*r(sd)))
	}
	foreach a2 in `service_inventory' {
		capture summarize d2_`a2'_sale
		capture return list
		tab d2_`a2'_val if (d2_`a2'_val<=(r(mean)-3*r(sd)) | d2_`a2'_val>=(r(mean)+3*r(sd)))
	}
	foreach a3 in `workshop_inventory' {
		capture summarize d3_`a3'_sale
		capture return list
		tab d3_`a3'_val if (d3_`a3'_val<=(r(mean)-3*r(sd)) | d3_`a3'_val>=(r(mean)+3*r(sd)))
	}
	foreach a4 in `retail_inventory'| `service_inventory' {
		capture summarize d4_`a4'_sale
		capture return list
		tab d4_`a4'_val if (d4_`a4'_val<=(r(mean)-3*r(sd)) | d4_`a4'_val>=(r(mean)+3*r(sd)))
	}
	foreach a5 in `retail_inventory'| `workshop_inventory' {
		capture summarize d5_`a5'_sale
		capture return list
		tab d5_`a5'_val if (d5_`a5'_val<=(r(mean)-3*r(sd)) | d5_`a5'_val>=(r(mean)+3*r(sd)))
	}
	foreach a6 in `service_inventory'| `workshop_inventory' {
		capture summarize d6_`a6'_sale
		capture return list
		tab d6_`a6'_val if (d6_`a6'_val<=(r(mean)-3*r(sd)) | d6_`a6'_val>=(r(mean)+3*r(sd)))
	}
	foreach a7 in `retail_inventory'| `service_inventory'| `workshop_inventory' {
		capture summarize d7_`a7'_sale
		capture return list
		tab d7_`a7'_val if (d7_`a7'_val<=(r(mean)-3*r(sd)) | d7_`a7'_val>=(r(mean)+3*r(sd)))
	}
	
/* SAVING WORKING DATA

	cd "`WORKING_DATA'"
	save CUMULATIVE_BIZ_MRKT_18Feb2015_WORKING, replace
