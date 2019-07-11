/* Initialize summer library */
libname summer "D:\Data\Summer_Data";

/* Overview of merged data set */
proc contents data=summer.merge;
run;

/*Incomplete stepwise model for data set*/
proc glmselect data=merge_train plots=all ;
  STEPWISE: model SalePrice=&interval/selection=stepwise details=steps select=SL slstay=0.05 slentry=0.05;
  title "Stepwise Model Selection for SalePrice-SL 0.05";
  store out=glmameshousing3step;
run;

/*Exploration determining types of applications and loan amounts*/
proc freq data=summer.merge order=freq;
tables loan_amnt zip_code;
run;

/* Sorted frequency table of application type, descending */
proc freq data=summer.merge order=freq;
tables application_type;
run;

/*Distribution of loan amount*/
proc univariate data=summer.merge noprint;
    var loan_amnt;
    histogram loan_amnt / normal kernel;
    inset n mean std / position=ne;
    title "Loan Amount Distribution Analysis";
run;

/*Association of earliest credit line and revolving balance*/
proc sgscatter data=summer.merge;
    plot revol_bal*earliest_cr_line / reg;
    title "Association of Earliest Credit Line with Revolving Balance";
run;


/*Association of earliest credit line to total collection amount*/
proc sgscatter data=summer.merge;
    plot tot_coll_amt*earliest_cr_line / reg;
    title "Association of Earliest Credit Line with 75% or more credit usage";
run;

