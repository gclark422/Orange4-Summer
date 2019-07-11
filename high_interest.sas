/* a more refined macro variable for interval variables */
%let refined = annual_inc dti delinq_2yrs mths_since_last_delinq mths_since_last_record open_acc pub_rec revol_bal revol_util total_acc out_prncp total_pymnt total_rec_prncp total_rec_int total_rec_late_fee recoveries acc_now_delinq;

/* Looking at the mean and SD */
proc means data=work.info_train;
	var int_rate;
run;

/* Looking at the histogram to see if anything pops out (spoiler: nothing does) */
proc univariate data=work.info_train;
	var int_rate;
	histogram int_rate/ normal kernel;
	inset n mean std / position=ne;
run;

/* Box plot to see if there are outliers - there are some */
proc sgplot data=work.info_train;
	vbox int_rate;
run;

/* Using this to find possible predictors*/
proc glmselect data=work.info_train plots=all;
	/* This line is so long because enterprise guide is garbage and crashes when i try to use macros */
	model int_rate=annual_inc delinq_2yrs mths_since_last_delinq mths_since_last_record open_acc pub_rec revol_bal revol_util total_acc out_prncp total_pymnt total_rec_late_fee recoveries acc_now_delinq
	/selection=forward 
	details=steps 
	select=SL 
	slentry=0.05;
	store out=info_glm;
run;

/* glm on some possbile predictors */
ods graphics on;
proc glm data=work.info_train plots=ALL;
	class grade;
	model int_rate = annual_inc|delinq_2yrs|grade;
run;
/* delinq_2yrs becomes unsignificant in type 3 SS */

/* a garbage scatter plot - all the scatter plots look like trash and show no obvious correlation */
proc sgscatter data=work.info_train;
	plot int_rate*annual_inc / reg;
run;

proc freq data=work.info_train;
	table total_rec_late_fee;

proc univariate data=work.info_train;
	where total_rec_late_fee > 0;
	var total_rec_late_fee;
	histogram total_rec_late_fee/ normal kernel;
	inset n mean std / position=ne;
run;