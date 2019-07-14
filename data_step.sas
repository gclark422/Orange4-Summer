libname summer "D:\Data\Summer_Data";
libname extra "D:\Data\extra_info_m";

/* Big macro variable with all interval variables */
%let interval = loan_amnt funded_amnt funded_amnt_inv int_rate installment annual_inc 
dti delinq_2yrs inq_last_6mths mths_since_last_delinq mths_since_last_delinq mths_since_last_record
open_acc pub_rec revol_bal revol_util total_acc out_prncp out_prncp_inv total_pymnt total_pymnt_inv 
total_rec_prncp total_rec_int total_rec_late_fee recoveries collection_recovery_fee last_pymnt_amnt
collections_12_mths_ex_med acc_now_delinq tot_coll_amt tot_cur_bal total_rev_hi_lim;

/* a more refined list of interval variables */
%let smallint = annual_inc dti delinq_2yrs mths_since_last_delinq 
mths_since_last_record open_acc pub_rec revol_bal revol_util total_acc out_prncp total_pymnt  
total_rec_prncp total_rec_int total_rec_late_fee recoveries acc_now_delinq;

/* all categorical variables */
%let categorical = term grade sub_grade emp_title emp_length home_ownership verification_status loan_status pymnt_plan
purpose title zip_code addr_state inital_list_status mths_since_last_major_derog application_type annual_inc_joint 
dti_joint verification_status_joint;

/*
	Importing the merged dataset into the SUMMER.MERGE library
*/
proc import datafile="D:\Data\df_merge.csv"
	out=summer.merge
	DBMS=CSV
	replace;
run;

/*
	Creating the new cleaned dataset
*/
data summer.info_new(drop= url desc mths_since_last_major_derog policy_code application_type annual_inc_joint dti_joint verification_status_joint inq_last_12m total_cu_tl inq_fi all_util max_bal_bc open_rv_24 open_rv_12m il_util total_bal_il mths_since_rcnt_il 
		 open_il_24m open_il_12m open_il_6m open_acc_6m);
	set summer.merge;
	where loan_status not like "%Does not meet%";
	if funded_amnt_inv - funded_amnt < 0 then 
		funded_investors=0;
	else
		do;
		funded_investors=1;
	end;
run;

/*
	80-20 split of the data into training and validation
*/
data info_train info_valid;
	set summer.info_new;
	call streaminit(34035);
	random = RAND("Uniform");
	if random <= 0.2 then output info_valid;
	else output info_train;
run;

/*
	Creating a new dataset called good_or_bad with a new column called isGood that is 1 if loan status is "fully paid", 0 if loan status is 
	charged off or default and missing otherwise
*/
data summer.good_or_bad;
	set summer.info_new;
	if find(loan_status, "fully","i") ge 1 then
		isGood = 1;
	else if find(loan_status, "charged", "i") ge 1 or
			find(loan_status, "Default", "i") ge 1 then
		isGood = 0;
	else do;
		isGood=.;
	end;
run;
