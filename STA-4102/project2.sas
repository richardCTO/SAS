proc format;
	value symptf	1 = 'Headache'
		            2 = 'Nausea'
		            3 = 'Seizures'
		            4 = 'Fever'
                    5 = 'Fatigue';
libname myxldata xlsx "\\Client\A$\SAS\STA-4102\dat_file\Project2.xlsx";
                    
data Project2;
	set myxldata.DATA;
run;

proc sort data = Project2;
	by id_no symptom_no;
run;

data temp1;
    array sympts[5] sympt1-sympt5;
	retain sympt1-sympt5;
	set Project2;
by id_no;

if first.id_no then do i = 1 to 5;
	sympts[i] = .;
end;

sympts[symptom_no] = symptom_no;
if sympt1 & sympt2 & sympt5 & sympt3 = . & sympt4 = . then disease = 1;
    else disease = 0;
if last.id_no then output;

format sympt1-sympt5 symptf.;

keep id_no sympt1-sympt5 disease;

run;

proc print data= temp1;
title 'Tabulation of the Data - ONE RECORD PER PATIENT';
	var id_no sympt1-sympt5 disease;
run;

proc freq data= temp1;
    tables disease;
run;
