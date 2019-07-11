/* Big macro variable with all interval variables */
%let interval = loan_amnt funded_amnt funded_amnt_inv int_rate installment annual_inc 
	dti delinq_2yrs inq_last_6mths mths_since_last_delinq mths_since_last_delinq mths_since_last_record
	open_acc pub_rec revol_bal revol_util total_acc out_prncp out_prncp_inv total_pymnt total_pymnt_inv 
	total_rec_prncp total_rec_int total_rec_late_fee recoveries collection_recovery_fee last_pymnt_amnt
	collections_12_mths_ex_med acc_now_delinq tot_coll_amt tot_cur_bal total_rev_hi_lim;


data temp;
	set work.info_train;
	keep loan_status;
run;

proc freq data=work.temp;
run;

data loan_status_separated;
	set work.info_train;
	if find(loan_status, 'charged off','i') ge 1 or
	   find(loan_Status, 'Default','i') ge 1 	 or 
	   find(loan_status, 'late','i') ge 1 		 then
		do;
			Late=1;
			Paid=0;
			Current=0;
			output;
		end;
	else if find(loan_status, 'fully paid', 'i') ge 1 then
		do;
			Paid=1;
			Late=0;
			Current=0;
			output;
		end;
	else
		do;
			Late=0;
			Paid=0;
			Current=1;
			output;
	end;
run;

proc logisitic data=loan_status_separated;
model Late=&interval/ selection=stepwise slentry=0.05;
run;

proc logistic data=loan_status_separated;
model Paid=&interval/ selection=stepwise slentry=0.05;
run;

proc logistic data=loan_status_separated;
model Current=&interval/ selection=stepwise slentry=0.05;
run;


	