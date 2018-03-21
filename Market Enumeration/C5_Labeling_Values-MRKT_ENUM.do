/***********************************************************
Project: BEP

Purpose: Baseline household survey data variables' renaming

Author:  Azhar Hussain

Date  :  10 April, 2015
************************************************************/


	
* LABELING VALUES

	// Defining labels
	label define yesno 1 "Yes" 0 "No"
	label define retail_type 101 "Departmental Store" 102 "General Store" 103 "Grains Wholesale" 104 "Drug Store" 105 "Garment Store" 106 "Shoe Store" ///
	107 "House Décor" 108 "Jewellers" 109 "Fruit and Vegetable Seller" 110 "Sports Shop" 111 "Bicycle Store" 112 "Electronics Store" ///
	113 "Sweets Shop" 114 "Paan/Cigarette Shop" 115 "Kitchen Utensils Shop" 116 "Mobile Shop" 117 "Agriculture Seed/Chemical Shop" ///
	118 "Hardware Shop" 119 "Wine Shop" 120 "Auto Parts/Spares Shop" 121 "Bag/Box Shop" 122 "Cement/Concrete Shop" 123 "Book Store" ///
	124 "Meat Shop" 125 "Cosmetics Shop" 126 "Milk Shop" 127 "Watch Shop" 199 "Others"
	label define service_type 201 "Restaurant/ Dhaba" 202 "Hotel" 203 "Dry Cleaner" 204 "Tailor" 205 "Fruit Juice Stall" 206 "Private Clinic" ///
	207 "Beauty Parlour/Haircut Salon" 208 "Print Shop/ Photocopiers" 209 "Locksmith" 210 "Watch Repair" 211 "Automobile repair" 212 "Bicycle Repair" ///
	213 "Tea stall/Cold-drink Shop" 214 "Cyber Café" 215 "Weighing Center" 216 "Electronic Repair" 217 "Photo Studio" 218 "Tent Shop" ///
	219 "Optician" 299 "Others"
	label define workshop_type 301 "Grain Mill" 302 "Metal workshop" 303 "Woodwork" 304 "Biscuit Factory" 305 "Soap Factory" 399 "Others"
	
	// Attaching labels
	label values _pilot_market dup_enum enum_first_shop hq_market non_elec_market shop_active shop_open_seen yesno
	label values retail_type retail_type
	label values service_type service_type
	label values workshop_type workshop_type
	