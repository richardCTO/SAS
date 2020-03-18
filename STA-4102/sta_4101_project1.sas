/* SAS options */
options nodate nonumber;
options validvarname = any;

/* this line of code reads in the physical excel file from the pc */
libname myxlsx xlsx "\\Client\A$\Documents\SAS\R4102\dat_file\DataFor_PROJECT_1.xlsx";

/* the next 3 lines saves the excel file permanently as PROJECT_1
If you you wanted to save the new dataset on the pc as PROJECT_1 you 
could replace the line: data PROJECT_1; with: 
data PROJECT_1 "\\Client\A$\Documents\SAS\PROJECT_1", where this:
"\\Client\A$\Documents\SAS\ is your directory and PROJECT_1 
is the name you want it to save as in the directory */
data PROJECT_1;
	set myxlsx.sheet1;
run;

* The following code randomly selects 2 observations from the first clinic 
with stage I cancer;
data temp_2_I;
	set PROJECT_1;
	x = ranuni(0);
if clinic_name = 'CLINIC 1' and cancer_stage = 'Stage I';	

proc sort data = temp_2_I;
	by x;
run;

data clinic_1_2_I;
	set temp_2_I(obs = 2);
run;

proc print data = clinic_1_2_I;
	title '2 Randomly Secelected Patients with Stage I Cancer from Clinic 1';
run;