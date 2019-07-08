libname summer "D:\Data\Summer_Data";
libname extra "D:\Data\extra_info_m";

proc contents data=summer.loan_info;
run;

proc contents data=summer.extra_info;
run;

proc print data=summer.loan_info (obs=20);
run;

proc print data=summer.extra_info (obs=20);
run;

/*
	80-20 split of the data into training and validation
*/
data info_train info_valid;
	set summer.loan_info;
	call streaminit(34035);
	random = RAND("Uniform");
	if random <= 0.2 then output info_valid;
	else output info_train;
run;
