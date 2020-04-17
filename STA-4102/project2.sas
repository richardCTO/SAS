/* SAS options */
options nodate nonumber;
options validvarname = any;

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
                    
data Project2;
	set myxlsx.DATA;
run;

proc sort data = Project2;
	by id_no symptom_no;
run;

data temp1;
    array symptoms[5] symptom1-symptom5;
	retain symptom1-symptom5;
	set Project2;
by id_no;

if first.id_no then do i = 1 to 5;
	symptoms[i] = .;
end;

symptoms[symptom_no] = symptom_no;
if symptom1 & symptom2 & symptom5 & symptom3 = . & symptom4 = . then disease = 1;
    else disease = 0;
if last.id_no then output;

format symptom1-symptom5 symptom_nof.;
keep id_no symptom1-symptom5 disease;
run;

proc print data = temp1;
title 'Reorganization of the Data - ONE RECORD PER PATIENT';
	var id_no symptom1-symptom5 disease;
run;

proc freq data = temp1;
title 'Number & Proportion of individuals with Disease X';
    tables disease;
run;
