/* SAS options */
options nodate nonumber;
options validvarname = any;

/*  gives numerical values to each symptom */
proc format;
	value symptom_nof	
        1 = 'Headache'
		2 = 'Nausea'
		3 = 'Seizures'
		4 = 'Fever'
        5 = 'Fatigue'
    ;

/* this line of code reads in the physical excel file from the pc */
libname myxlsx xlsx "\\Client\A$\SAS\STA-4102\dat_file\Project2.xlsx";

/*  sets the excel file to a temp file called Project2*/                   
data Project2;
	set myxlsx.DATA;
run;
/*  sorts the data by id number and symptom number*/
proc sort data = Project2;
	by id_no symptom_no;
run;

/*   creates the columns symptom1 through symptom5*/
data temp1;
    array symptoms[5] symptom1-symptom5;
	retain symptom1-symptom5;
	set Project2;
by id_no;

if first.id_no then do i = 1 to 5;
	symptoms[i] = .;
end;

symptoms[symptom_no] = symptom_no;

/*  the following 2 lines only selcets individuals 
    with headaches, nausea, and fatigue */
if symptom1 & symptom2 & symptom5 & symptom3 = . & symptom4 = . then disease = 1;
    else disease = 0;

if last.id_no then output;

/*  keep new data*/
format symptom1-symptom5 symptom_nof.;
keep id_no symptom1-symptom5 disease;
run;

/*  print all of the sorted data, one entry per individual*/
proc print data = temp1;
title 'Reorganization of the Data - ONE RECORD PER PATIENT';
	var id_no symptom1-symptom5 disease;
run;

/*  print the number and proportion of individuals with disease X*/
proc freq data = temp1;
title 'Number & Proportion of individuals with Disease X';
    tables disease;
run;
