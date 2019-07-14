
/* Creating a new data set with a new variable funded_investors, which shows whether an observation was fully funded by investors */
data summer.fundedmerge;
set summer.merge;
funded_investors = "Fully Funded";
if funded_amnt_inv-funded_amnt < 0 then funded_investors="Not Fully Funded";
/*Verifies table generated correclty  *keep funded_amnt funded_amnt_inv funded_investors;*/
run;

/*Two Sample t-tests to test for differences between fully funded and not fully funded variables*/
proc ttest data=work.fundedmerge
alpha=.05 test=diff sides=2;
class funded_investors;
var loan_amnt;

run;


proc ttest ci=equal data=work.fundedmerge;
class funded_investors;
var funded_amnt;
run;

proc ttest ci=equal data=work.fundedmerge;
class funded_investors;
var funded_amnt_inv;
run;

proc ttest ci=equal data=work.fundedmerge;
class funded_investors;
var int_rate;
run;

proc ttest ci=equal data=work.fundedmerge;
class funded_investors;
var installment;
run;

proc ttest ci=equal data=work.fundedmerge;
class funded_investors;
var annual_inc;
run;

proc ttest ci=equal data=work.fundedmerge;
class funded_investors;
var dti;
run;

proc ttest ci=equal data=work.fundedmerge;
class funded_investors;
var delinq_2yrs;
run;

proc ttest ci=equal data=work.fundedmerge;
class funded_investors;
var inq_last_6mths;
run;

proc ttest ci=equal data=work.fundedmerge;
class funded_investors;
var mths_since_last_delinq;
run;

proc ttest ci=equal data=work.fundedmerge;
class funded_investors;
var mths_since_last_delinq;
run;

proc ttest ci=equal data=work.fundedmerge;
class funded_investors;
var mths_since_last_record;
run;

proc ttest ci=equal data=work.fundedmerge;
class funded_investors;
var open_acc;
run;

proc ttest ci=equal data=work.fundedmerge;
class funded_investors;
var pub_rec;
run;

proc ttest ci=equal data=work.fundedmerge;
class funded_investors;
var revol_bal;
run;

proc ttest ci=equal data=work.fundedmerge;
class funded_investors;
var revol_util;
run;

proc ttest ci=equal data=work.fundedmerge;
class funded_investors;
var total_acc;
run;

proc ttest ci=equal data=work.fundedmerge;
class funded_investors;
var out_prncp;
run;

proc ttest ci=equal data=work.fundedmerge;
class funded_investors;
var out_prncp_inv;
run;

proc ttest ci=equal data=work.fundedmerge;
class funded_investors;
var total_pymnt;
run;

proc ttest ci=equal data=work.fundedmerge;
class funded_investors;
var total_pymnt_inv;
run;

proc ttest ci=equal data=work.fundedmerge;
class funded_investors;
var total_rec_prncp;
run;

proc ttest ci=equal data=work.fundedmerge;
class funded_investors;
var total_rec_int;
run;

proc ttest ci=equal data=work.fundedmerge;
class funded_investors;
var total_rec_late_fee;
run;

proc ttest ci=equal data=work.fundedmerge;
class funded_investors;
var recoveries;
run;

proc ttest ci=equal data=work.fundedmerge;
class funded_investors;
var collection_recovery_fee;
run;

proc ttest ci=equal data=work.fundedmerge;
class funded_investors;
var last_pymnt_amnt;
run;

proc ttest ci=equal data=work.fundedmerge;
class funded_investors;
var collections_12_mths_ex_med;
run;

proc ttest ci=equal data=work.fundedmerge;
class funded_investors;
var acc_now_delinq;
run;

proc ttest ci=equal data=work.fundedmerge;
class funded_investors;
var tot_coll_amt;
run;


proc ttest ci=equal data=work.fundedmerge;
class funded_investors;
var tot_cur_bal;
run;

proc ttest ci=equal data=work.fundedmerge;
class funded_investors;
var total_rev_hi_lim;
run;