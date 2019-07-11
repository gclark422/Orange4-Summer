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
	keep loan_status Paid Late Current;
run;
	