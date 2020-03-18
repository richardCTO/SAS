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

* 2 random observations from the 1st clinic with stage I cancer;
data clinic1_2;
	set PROJECT_1;
if clinic_name = 'CLINIC 1' & cancer_stage = 'Stage I';
proc surveyselect data = clinic1_2 noprint
	out = clinic1_2
	outorder = random
	method = srs
	sampsize = 2;
run;
proc print data = clinic1_2;
	title '2 Randomly Selected Patients with Stage I Cancer from Clinic 1';
run;

* 2 random observations from the 2nd clinic with stage I cancer;
data clinic2_2;
	set PROJECT_1;
if clinic_name = 'CLINIC 2' & cancer_stage = 'Stage I';
proc surveyselect data = clinic2_2 noprint
	out = clinic2_2
	outorder = random
	method = srs
	sampsize = 2;
run;
proc print data = clinic2_2;
	title '2 Randomly Selected Patients with Stage I Cancer from Clinic 2';
run;

* 2 random observations from the 3rd clinic with stage I cancer;
data clinic3_2;
	set PROJECT_1;
if clinic_name = 'CLINIC 3' & cancer_stage = 'Stage I';
proc surveyselect data = clinic3_2 noprint
	out = clinic3_2
	outorder = random
	method = srs
	sampsize = 2;
run;
proc print data = clinic3_2;
	title '2 Randomly Selected Patients with Stage I Cancer from Clinic 3';
run;

* 2 random observations from the 4th clinic with stage I cancer;
data clinic4_2;
	set PROJECT_1;
if clinic_name = 'CLINIC 4' & cancer_stage = 'Stage I';
proc surveyselect data = clinic4_2 noprint
	out = clinic4_2
	outorder = random
	method = srs
	sampsize = 2;
run;	
proc print data = clinic4_2;
	title '2 Randomly Selected Patients with Stage I Cancer from Clinic 4';
run;

* 2 random observations from the 5th clinic with stage I cancer;
data clinic5_2;
	set PROJECT_1;
if clinic_name = 'CLINIC 5' & cancer_stage = 'Stage I';
proc surveyselect data = clinic5_2 noprint
	out = clinic5_2
	outorder = random
	method = srs
	
	sampsize = 2;
run;	
proc print data = clinic5_2;
	title '2 Randomly Selected Patients with Stage I Cancer from Clinic 5';
run;

* 2 random observations from the 6th clinic with stage I cancer;
data clinic6_2;
	set PROJECT_1;
if clinic_name = 'CLINIC 6' & cancer_stage = 'Stage I';
proc surveyselect data = clinic6_2 noprint
	out = clinic6_2
	outorder = random
	method = srs
	sampsize = 2;
run;	
proc print data = clinic6_2;
	title '2 Randomly Selected Patients with Stage I Cancer from Clinic 6';
run;

* 2 random observations from the 7th clinic with stage I cancer;
data clinic7_2;
	set PROJECT_1;
if clinic_name = 'CLINIC 7' & cancer_stage = 'Stage I';
proc surveyselect data = clinic7_2 noprint
	out = clinic7_2
	outorder = random
	method = srs
	sampsize = 2;
run;	
proc print data = clinic7_2;
	title '2 Randomly Selected Patients with Stage I Cancer from Clinic 7';
run;

* 12 random observations from the 1st clinic with stage II cancer;
data clinic1_12;
	set PROJECT_1;
if clinic_name = 'CLINIC 1' & cancer_stage = 'Stage II';
proc surveyselect data = clinic1_12 noprint
	out = clinic1_12
	outorder = random
	method = srs
	sampsize = 12;
run;	
proc print data = clinic1_12;
	title '12 Randomly Selected Patients with Stage II Cancer from Clinic 1';
run;

* 12 random observations from the 2nd clinic with stage II cancer;
data clinic2_12;
	set PROJECT_1;
if clinic_name = 'CLINIC 2' & cancer_stage = 'Stage II';
proc surveyselect data = clinic2_12 noprint
	out = clinic2_12
	outorder = random
	method = srs
	sampsize = 12;
run;	
proc print data = clinic2_12;
	title '12 Randomly Selected Patients with Stage II Cancer from Clinic 2';
run;

* 12 random observations from the 3rd clinic with stage II cancer;
data clinic3_12;
	set PROJECT_1;
if clinic_name = 'CLINIC 3' & cancer_stage = 'Stage II';
proc surveyselect data = clinic3_12 noprint
	out = clinic3_12
	outorder = random
	method = srs
	sampsize = 12;
run;	
proc print data = clinic3_12;
	title '12 Randomly Selected Patients with Stage II Cancer from Clinic 3';
run;

* 12 random observations from the 4th clinic with stage II cancer;
data clinic4_12;
	set PROJECT_1;
if clinic_name = 'CLINIC 4' & cancer_stage = 'Stage II';
proc surveyselect data = clinic4_12 noprint
	out = clinic4_12
	outorder = random
	method = srs
	sampsize = 12;
run;	
proc print data = clinic4_12;
	title '12 Randomly Selected Patients with Stage II Cancer from Clinic 4';
run;

* 12 random observations from the 5th clinic with stage II cancer;
data clinic5_12;
	set PROJECT_1;
if clinic_name = 'CLINIC 5' & cancer_stage = 'Stage II';
proc surveyselect data = clinic5_12 noprint
	out = clinic5_12
	outorder = random
	method = srs
	sampsize = 12;
run;	
proc print data = clinic5_12;
	title '12 Randomly Selected Patients with Stage II Cancer from Clinic 5';
run;

* 12 random observations from the 6th clinic with stage II cancer;
data clinic6_12;
	set PROJECT_1;
if clinic_name = 'CLINIC 6' & cancer_stage = 'Stage II';
proc surveyselect data = clinic6_12 noprint
	out = clinic6_12
	outorder = random
	method = srs
	sampsize = 12;
run;	
proc print data = clinic6_12;
	title '12 Randomly Selected Patients with Stage II Cancer from Clinic 6';
run;

* 12 random observations from the 7th clinic with stage II cancer;
data clinic7_12;
	set PROJECT_1;
if clinic_name = 'CLINIC 7' & cancer_stage = 'Stage II';
proc surveyselect data = clinic7_12 noprint
	out = clinic7_12
	outorder = random
	method = srs
	sampsize = 12;
run;	
proc print data = clinic7_12;
	title '12 Randomly Selected Patients with Stage II Cancer from Clinic 7';
run;

* 25 random observations from the 1st clinic with stage III cancer;
data clinic1_25;
	set PROJECT_1;
if clinic_name = 'CLINIC 1' & cancer_stage = 'Stage III';
proc surveyselect data = clinic1_25 noprint
	out = clinic1_25
	outorder = random
	method = srs
	sampsize = 25;
run;	
proc print data = clinic1_25;
	title '25 Randomly Selected Patients with Stage III Cancer from Clinic 1';
run;

* 25 random observations from the 2nd clinic with stage III cancer;
data clinic2_25;
	set PROJECT_1;
if clinic_name = 'CLINIC 2' & cancer_stage = 'Stage III';
proc surveyselect data = clinic2_25 noprint
	out = clinic2_25
	outorder = random
	method = srs
	sampsize = 25;
run;	
proc print data = clinic2_25;
	title '25 Randomly Selected Patients with Stage III Cancer from Clinic 2';
run;

* 25 random observations from the 3rd clinic with stage III cancer;
data clinic3_25;
	set PROJECT_1;
if clinic_name = 'CLINIC 3' & cancer_stage = 'Stage III';
proc surveyselect data = clinic3_25 noprint
	out = clinic3_25
	outorder = random
	method = srs
	sampsize = 25;
run;	
proc print data = clinic3_25;
	title '25 Randomly Selected Patients with Stage III Cancer from Clinic 3';
run;

* 25 random observations from the 4th clinic with stage III cancer;
data clinic4_25;
	set PROJECT_1;
if clinic_name = 'CLINIC 4' & cancer_stage = 'Stage III';
proc surveyselect data = clinic4_25 noprint
	out = clinic4_25
	outorder = random
	method = srs
	sampsize = 25;
run;	
proc print data = clinic4_25;
	title '25 Randomly Selected Patients with Stage III Cancer from Clinic 4';
run;

* 25 random observations from the 5th clinic with stage III cancer;
data clinic5_25;
	set PROJECT_1;
if clinic_name = 'CLINIC 5' & cancer_stage = 'Stage III';
proc surveyselect data = clinic5_25 noprint
	out = clinic5_25
	outorder = random
	method = srs
	sampsize = 25;
run;	
proc print data = clinic5_25;
	title '25 Randomly Selected Patients with Stage III Cancer from Clinic 5';
run;

* 25 random observations from the 6th clinic with stage III cancer;
data clinic6_25;
	set PROJECT_1;
if clinic_name = 'CLINIC 6' & cancer_stage = 'Stage III';
proc surveyselect data = clinic6_25 noprint
	out = clinic6_25
	outorder = random
	method = srs
	sampsize = 25;
run;	
proc print data = clinic6_25;
	title '25 Randomly Selected Patients with Stage III Cancer from Clinic 6';
run;

* 25 random observations from the 7th clinic with stage III cancer;
data clinic7_25;
	set PROJECT_1;
if clinic_name = 'CLINIC 7' & cancer_stage = 'Stage III';
proc surveyselect data = clinic7_25 noprint
	out = clinic7_25
	outorder = random
	method = srs
	sampsize = 25;
run;	
proc print data = clinic7_25;
	title '25 Randomly Selected Patients with Stage III Cancer from Clinic 7';
run;