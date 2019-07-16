/*Base library*/
libname summer 'D:\Data\Summer_Data';

/*Creates a data set with new variable funded_investors. Value set to 0 if not funded fully by investors, 1 if fully funded by investors*/
data summer.invested;
set summer.info_new;
funded_investors = 1;
if funded_amnt_inv-funded_amnt < 0 then funded_investors=0;
/*Verifies table generated correctly  *keep funded_amnt funded_amnt_inv funded_investors;*/
run;


/*Macros of interval and categorical variables with multicollinear variables removed */
%let interval_mc_removed = dti delinq_2yrs inq_last_6mths  mths_since_last_record
	open_acc pub_rec revol_bal revol_util collections_12_mths_ex_med acc_now_delinq;
%let categorical_mc_removed = grade emp_length home_ownership verification_status;


/*Logistic regression modelling prediction of fully funded by investors*/
proc logistic data=summer.invested;
	class &categorical_mc_removed;
	model funded_investors = &interval_mc_removed &categorical_mc_removed/ selection=stepwise slentry=.05;
run;

/*A logistic regression on loan standing and sub_grade*/
proc logistic data=info_train;
class sub_grade;
model isGood = sub_grade;
run;
/*Group C4 and C5 into a new group C3*/
data info_valid2;
	set info_valid;
	if sub_grade = 'C4' then sub_grade='C3';
	if sub_grade = 'C5' then sub_grade='C3';
run;
/*apply logistic model to the validating dataset*/
proc logistic data=info_valid2;
class sub_grade;
model isGood = sub_grade;
run;


data info_valid2;
	set info_valid;
	if sub_grade = 'C4' then sub_grade='C3';
	if sub_grade = 'C5' then sub_grade='C3';
run;
