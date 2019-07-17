/*Step 1*/
/* create a list of macro variable, remove outliers, remove variables that have a large number of missing values, and remove collinearity */;

%let interval_mc_removed = dti delinq_2yrs inq_last_6mths  mths_since_last_record
	open_acc pub_rec revol_bal revol_util collections_12_mths_ex_med acc_now_delinq;
%let categorical_mc_removed = grade emp_length home_ownership verification_status;

/*Step 2*/
/* create a variable, funded_investors, that has 1 for funds fully invested and 0 for not funded and partially funded */;

proc logistic data=summer.invested;
	class &categorical_mc_removed;
	model funded_investors = &interval_mc_removed &categorical_mc_removed/ selection=stepwise slentry=.0002;
run;
/* p value adjusted based on sample size*/
 


/* Interpretation: automatically select variables that have significant impacts on investors’ decisions to fund loans, among which leading club is most interested in adjusting their credit rating system.*/

/*Step 3*/
/* create a variable, funded_investors, that has 1 for funds fully invested and 0 for not funded and partially funded */;
proc logistic data=summer.invested;
	class &categorical_mc_removed;
	model funded_investors = &interval_mc_removed &categorical_mc_removed/ selection=stepwise slentry=.0002;
run;




proc logistic data=summer.invested;
	class &categorical_mc_removed;
	model funded_investors = &interval_mc_removed &categorical_mc_removed/ selection=stepwise slentry=.0002;
run;




*/ Then we grouped C4 and C5 since they made up a significant portion of the data*/;

data testgroup2;
set info_train;
if sub_grade='C4' or sub_grade='C5' then c5=1;
else c5=0;
run;


/*Then we ran a logistic regression to see what variables were making them stand out */

proc logistic data=testgroup2 plots(only)=(effect oddsratio);
class &categorical_mc_removed1/ param=effect;
	model c5 = &interval_mc_removed &categorical_mc_removed1/ clodds=pl selection=stepwise slentry=.0002;
run;







