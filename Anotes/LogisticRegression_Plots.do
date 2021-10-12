// Linear probability and logit models

cd "P:\Apprenticeship\summer16\mkaparakis\logit"

clear
capture log close


use "../../../DATA/mroz", clear


// or get  odds ratio e^(B) you can get this using logit command with or option

logistic inlf nwifeinc educ exper expersq age kidslt6 kidsge6
	est store model3
	margins, at( kidslt6=(0/3) (mean) _all)
		marginsplot

	margins, at(edu=(5(5)20) (mean) _all)
		marginsplot

	margins, at(edu=(5(5)20) kidslt6=(0/3) (mean) _all )
		marginsplot


estat classification
log close

//  end
