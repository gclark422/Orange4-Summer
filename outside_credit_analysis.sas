%let interval = loan_amnt funded_amnt_inv int_rate installment annual_inc 
	dti delinq_2yrs inq_last_6mths mths_since_last_delinq mths_since_last_record
	open_acc pub_rec revol_bal revol_util total_acc out_prncp out_prncp_inv total_pymnt total_pymnt_inv 
	total_rec_prncp total_rec_int total_rec_late_fee recoveries collection_recovery_fee last_pymnt_amnt
	collections_12_mths_ex_med acc_now_delinq tot_coll_amt tot_cur_bal total_rev_hi_lim;

proc freq data=summer.merge;
	tables loan_status;
run;

data loan_status_separated;
	set work.info_train;

	if find(loan_status, 'does not meet','i') ge 1 then
		do;
			does_not_meet = 1;
			does_meet = 0;
			output;
		end;
	else
		do;
			does_not_meet = 0;
			does_meet = 1;
			output;
		end;

	*	keep loan_status does_not_meet does_meet;
run;

data loan_status_separated2;
	set work.info_train;

	if find(loan_status, 'status:charged','i') ge 1 then
		do;
			charged = 1;
			paid = 0;
			output;
		end;
	else if find(loan_status, 'status:fully','i') ge 1 then
		do;
			charged = 0;
			paid = 1;
			output;
		end;

	*keep loan_status charged paid;
run;

proc logistic data=loan_status_separated2;
	model charged= int_rate funded_amnt_inv loan_amnt annual_inc delinq_2yrs open_acc funded_amnt dti 
		pub_rec total_acc total_rec_late_fee recoveries
		collection_recovery_fee last_pymnt_amnt/ selection=stepwise slentry=0.05;
run;

proc corr data=loan_status_separated2;
	var total_rec_int;
	with int_rate;
run;

proc logistic data=loan_status_separated2;
	model paid= int_rate funded_amnt_inv loan_amnt annual_inc delinq_2yrs open_acc funded_amnt dti 
		pub_rec total_acc total_rec_late_fee recoveries
		collection_recovery_fee last_pymnt_amnt/ selection=stepwise slentry=0.05;
run;

proc univariate data=loan_status_separated2;
	where paid=1;
	var int_rate funded_amnt_inv loan_amnt delinq_2yrs total_acc recoveries last_pymnt_amnt;
	histogram int_rate funded_amnt_inv loan_amnt delinq_2yrs total_acc recoveries last_pymnt_amnt;
run;