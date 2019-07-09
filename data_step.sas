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
	80-20 split of the data into training and validation
*/
data info_train info_valid;
	set summer.merge;
	call streaminit(34035);
	random = RAND("Uniform");
	if random <= 0.2 then output info_valid;
	else output info_train;
run;
