/*****************************************************************************************
Project: BEP

Purpose: Baseline area business survey data checking outliers and dropping observations 

Author:  Azhar Hussain

Date  :  15 March, 2015
******************************************************************************************/



* INCLUDING MACROS

	include locals_biz.do


* DROPPING INSIGNIFICANT OBSERVATIONS

	drop if _duplicate_survey==.
	drop if _duplicate_parent_key==1
	drop in 90
	local per 0.05
	

* CHECKING OUTLIERS USING WINSOR

	foreach var in `outlier_var' {
		capture rename `var' `var'_r
		capture winsor `var'_r, gen(`var') p(`per')
		summarize `var'
		capture return list
		tab `var' if (`var'<=(r(mean)-3*r(sd)) | `var'>=(r(mean)+3*r(sd)))
	}
	
	
	foreach i1 of numlist 1/28 {
		capture rename b1_tot_wages`i1' b1_tot_wages`i1'_r
		capture winsor b1_tot_wages`i1'_r, gen(b1_tot_wages`i1') p(`per')
		summarize b1_tot_wages`i1'
		capture return list
		tab b1_tot_wages`i1' if (b1_tot_wages`i1'<=(r(mean)-3*r(sd)) | b1_tot_wages`i1'>=(r(mean)+3*r(sd)))
	}

	foreach i2 of numlist 1/10 {
		capture rename b2_tot_wages`i2' b2_tot_wages`i2'_r
		capture winsor b2_tot_wages`i2'_r, gen(b2_tot_wages`i2') p(`per')
		capture noisily summarize b2_tot_wages`i2'
		capture return list
		capture noisily tab b2_tot_wages`i2' if (b2_tot_wages`i2'<=(r(mean)-3*r(sd)) | b2_tot_wages`i2'>=(r(mean)+3*r(sd)))
	}

	foreach i3 of numlist 1/2 {
		capture rename b3_tot_wages`i3' b3_tot_wages`i3'_r
		capture winsor b3_tot_wages`i3'_r, gen(b3_tot_wages`i3') p(`per')
		summarize b3_tot_wages`i3'
		capture return list
		tab b3_tot_wages`i3' if (b3_tot_wages`i3'<=(r(mean)-3*r(sd)) | b3_tot_wages`i3'>=(r(mean)+3*r(sd)))
	}
	foreach i4 of numlist 1/1 {
		capture rename b4_tot_wages`i4' b4_tot_wages`i4'_r
		capture winsor b4_tot_wages`i4'_r, gen(b4_tot_wages`i4') p(`per')
		summarize b4_tot_wages`i4'
		capture return list
		tab b4_tot_wages`i4' if (b4_tot_wages`i4'<=(r(mean)-3*r(sd)) | b4_tot_wages`i4'>=(r(mean)+3*r(sd)))
	}

	foreach i5 of numlist 1/12 {
		capture rename b5_tot_wages`i5' b5_tot_wages`i5'_r
		capture winsor b5_tot_wages`i5'_r, gen(b5_tot_wages`i5') p(`per')
		summarize b5_tot_wages`i5'
		capture return list
		tab b5_tot_wages`i5' if (b5_tot_wages`i5'<=(r(mean)-3*r(sd)) | b5_tot_wages`i5'>=(r(mean)+3*r(sd)))
	}

	foreach i6 of numlist 1/2 {
		capture rename b6_tot_wages`i6' b6_tot_wages`i6'_r
		capture winsor b6_tot_wages`i6'_r, gen(b6_tot_wages`i6') p(`per')
		summarize b6_tot_wages`i6'
		capture return list
		tab b6_tot_wages`i6' if (b6_tot_wages`i6'<=(r(mean)-3*r(sd)) | b6_tot_wages`i6'>=(r(mean)+3*r(sd)))
	}
	
	foreach i of numlist 1/9 {
		foreach x in `elec_equip' | `nonelec_equip' | `vehicle' | `furniture' {
			capture rename c`i'_`x'_sale c`i'_`x'_sale_r
			capture winsor c`i'_`x'_sale_r, gen(c`i'_`x'_sale) p(`per')
			capture noisily summarize c`i'_`x'_sale
			capture return list
			capture noisily tab c`i'_`x'_sale if (c`i'_`x'_sale<=(r(mean)-3*r(sd)) | c`i'_`x'_sale>=(r(mean)+3*r(sd)))
		}
	}
	
	foreach j of numlist 1/7 {
		foreach y in `inventory' {
			capture rename d`j'_`y'_val d`j'_`y'_val_r
			capture winsor d`j'_`y'_val_r, gen(d`j'_`y'_val) p(`per')
			capture noisily summarize d`j'_`y'_val
			capture return list
			capture noisily tab d`j'_`y'_val if (d`j'_`y'_val<=(r(mean)-3*r(sd)) | d`j'_`y'_val>=(r(mean)+3*r(sd)))
		}
	}
	
	foreach var in `out_var' {
		capture rename `var' `var'_r
		capture winsor `var'_r, gen(`var') p(`per')
		capture noisily summarize `var'
		capture return list
		capture noisily tab `var' if (`var'<=(r(mean)-3*r(sd)) | `var'>=(r(mean)+3*r(sd)))
	}
	
	foreach b in `exp_head' {
		capture rename g27_`b'_exp g27_`b'_exp_r
		capture winsor g27_`b'_exp_r, gen(g27_`b'_exp) p(`per')
		capture noisily summarize g27_`b'_exp
		capture return list
		capture noisily tab g27_`b'_exp if (g27_`b'_exp<=(r(mean)-3*r(sd)) | g27_`b'_exp>=(r(mean)+3*r(sd)))
	}
	
