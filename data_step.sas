libname summer "D:\Data\Summer_Data";
libname extra "D:\Data\extra_info_m";

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
