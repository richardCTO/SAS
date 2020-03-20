options nodate nonumber;
 
libname my_file xlsx "\\Client\A$\Documents\SAS\STA-4102\dat_file\DataFor_PROJECT_1.xlsx";

data PROJECT_1;
	set my_file.sheet1;
run;

* The following code randomly selects 2 observations from the first clinic 
with stage I cancer;
data temp_2_I;
	set PROJECT_1;
if clinic_name = 'CLINIC 1';	

data temp_2_I;
	set temp_2_I;
		
if cancer_stage = 'Stage I';		
	x = ranuni(0);
output;	

proc sort data = temp_2_I;
	by x;
run;

data clinic_1_2_I;
	set temp_2_I(obs = 2);
run;

proc print data = clinic_1_2_I;
	title '2 Randomly Selected Patients with Stage I Cancer from Clinic 1';
run;

* The following code randomly selects 2 observations from the second clinic 
with stage I cancer;
data temp2_2_I;
	set PROJECT_1;
if clinic_name = 'CLINIC 2';	

data temp_2_I;
	set temp_2_I;
		
if cancer_stage = 'Stage I';		
	x = ranuni(0);
output;	

proc sort data = temp2_2_I;
	by x;
run;

data clinic_2_2_I;
	set temp2_2_I(obs = 2);
run;

proc print data = clinic_2_2_I;
	title '2 Randomly Selected Patients with Stage I Cancer from Clinic 2';
run;
* The following code randomly selects 2 observations from the third clinic 
with stage I cancer;
data temp3_2_I;
	set PROJECT_1;
if clinic_name = 'CLINIC 3';	

data temp3_2_I;
	set temp3_2_I;
		
if cancer_stage = 'Stage I';		
	x = ranuni(0);
output;	

proc sort data = temp3_2_I;
	by x;
run;

data clinic_3_2_I;
	set temp3_2_I(obs = 2);
run;

proc print data = clinic_3_2_I;
	title '2 Randomly Selected Patients with Stage I Cancer from Clinic 3';
run;

* The following code randomly selects 2 observations from the foruth clinic 
with stage I cancer;
data temp4_2_I;
	set PROJECT_1;
if clinic_name = 'CLINIC 4';	

data temp4_2_I;
	set temp4_2_I;
		
if cancer_stage = 'Stage I';		
	x = ranuni(0);
output;	

proc sort data = temp4_2_I;
	by x;
run;

data clinic_4_2_I;
	set temp4_2_I(obs = 2);
run;

proc print data = clinic_4_2_I;
	title '2 Randomly Selected Patients with Stage I Cancer from Clinic 4';
run;

* The following code randomly selects 2 observations from the fifth clinic 
with stage I cancer;
data temp5_2_I;
	set PROJECT_1;
if clinic_name = 'CLINIC 5';	

data temp5_2_I;
	set temp5_2_I;
		
if cancer_stage = 'Stage I';		
	x = ranuni(0);
output;	

proc sort data = temp5_2_I;
	by x;
run;

data clinic_5_2_I;
	set temp5_2_I(obs = 2);
run;

proc print data = clinic_5_2_I;
	title '2 Randomly Selected Patients with Stage I Cancer from Clinic 5';
run;

* The following code randomly selects 2 observations from the sixth clinic 
with stage I cancer;
data temp6_2_I;
	set PROJECT_1;
if clinic_name = 'CLINIC 6';	

data temp6_2_I;
	set temp6_2_I;
		
if cancer_stage = 'Stage I';		
	x = ranuni(0);
output;	

proc sort data = temp6_2_I;
	by x;
run;

data clinic_6_2_I;
	set temp6_2_I(obs = 2);
run;

proc print data = clinic_6_2_I;
	title '2 Randomly Selected Patients with Stage I Cancer from Clinic 6';
run;

* The following code randomly selects 2 observations from the seventh clinic 
with stage I cancer;
data temp7_2_I;
	set PROJECT_1;
if clinic_name = 'CLINIC 7';	

data temp7_2_I;
	set temp7_2_I;
		
if cancer_stage = 'Stage I';		
	x = ranuni(0);
output;	

proc sort data = temp7_2_I;
	by x;
run;

data clinic_7_2_I;
	set temp7_2_I(obs = 2);
run;

proc print data = clinic_7_2_I;
	title '2 Randomly Selected Patients with Stage I Cancer from Clinic 7';
run;

* The following code randomly selects 12 observations from the first clinic 
with stage II cancer;
 data temp_12_II;
	set PROJECT_1;
if clinic_name = 'CLINIC 1';	

data temp1_12_II;
	set temp_12_II;
if cancer_stage = 'Stage II';		
	x = ranuni(0);
output;	

proc sort data = temp1_12_II;
	by x;
run;

data clinic_1_12_II;
	set temp1_12_II(obs = 12);
run;

proc print data = clinic_1_12_II;
	title '12 Randomly Selected Patients with Stage II Cancer from Clinic 1';
run;

* The following code randomly selects 12 observations from the second clinic 
with stage II cancer;
 data temp2_12_II;
	set PROJECT_1;
if clinic_name = 'CLINIC 2';	

data temp2_12_II;
	set temp2_12_II;
if cancer_stage = 'Stage II';		
	x = ranuni(0);
output;	

proc sort data = temp2_12_II;
	by x;
run;

data clinic_2_12_II;
	set temp2_12_II(obs = 12);
run;

proc print data = clinic_2_12_II;
	title '12 Randomly Selected Patients with Stage II Cancer from Clinic 2';
run;

* The following code randomly selects 12 observations from the third clinic 
with stage II cancer;
 data temp3_12_II;
	set PROJECT_1;
if clinic_name = 'CLINIC 3';	

data temp3_12_II;
	set temp3_12_II;
if cancer_stage = 'Stage II';		
	x = ranuni(0);
output;	

proc sort data = temp3_12_II;
	by x;
run;

data clinic_3_12_II;
	set temp3_12_II(obs = 12);
run;

proc print data = clinic_3_12_II;
	title '12 Randomly Selected Patients with Stage II Cancer from Clinic 3';
run;

* The following code randomly selects 12 observations from the fourth clinic 
with stage II cancer;
 data temp4_12_II;
	set PROJECT_1;
if clinic_name = 'CLINIC 4';	

data temp4_12_II;
	set temp4_12_II;
if cancer_stage = 'Stage II';		
	x = ranuni(0);
output;	

proc sort data = temp4_12_II;
	by x;
run;

data clinic_4_12_II;
	set temp4_12_II(obs = 12);
run;

proc print data = clinic_4_12_II;
	title '12 Randomly Selected Patients with Stage II Cancer from Clinic 4';
run;

* The following code randomly selects 12 observations from the fifth clinic 
with stage II cancer;
 data temp5_12_II;
	set PROJECT_1;
if clinic_name = 'CLINIC 5';	

data temp5_12_II;
	set temp5_12_II;
if cancer_stage = 'Stage II';		
	x = ranuni(0);
output;	

proc sort data = temp5_12_II;
	by x;
run;

data clinic_5_12_II;
	set temp5_12_II(obs = 12);
run;

proc print data = clinic_5_12_II;
	title '12 Randomly Selected Patients with Stage II Cancer from Clinic 5';
run;

* The following code randomly selects 12 observations from the sixth clinic 
with stage II cancer;
 data temp6_12_II;
	set PROJECT_1;
if clinic_name = 'CLINIC 6';	

data temp6_12_II;
	set temp6_12_II;
if cancer_stage = 'Stage II';		
	x = ranuni(0);
output;	

proc sort data = temp6_12_II;
	by x;
run;

data clinic_6_12_II;
	set temp6_12_II(obs = 12);
run;

proc print data = clinic_6_12_II;
	title '12 Randomly Selected Patients with Stage II Cancer from Clinic 6';
run;

* The following code randomly selects 12 observations from the seventh clinic 
with stage II cancer;
 data temp7_12_II;
	set PROJECT_1;
if clinic_name = 'CLINIC 7';	

data temp7_12_II;
	set temp7_12_II;
if cancer_stage = 'Stage II';		
	x = ranuni(0);
output;	

proc sort data = temp7_12_II;
	by x;
run;

data clinic_7_12_II;
	set temp7_12_II(obs = 12);
run;

proc print data = clinic_1_12_II;
	title '12 Randomly Selected Patients with Stage II Cancer from Clinic 7';
run;
* The following code randomly selects 25 observations from the first clinic 
with stage III cancer;
data temp_25_III;
	set PROJECT_1;
if clinic_name = 'CLINIC 1';	

data temp1_25_III;
	set temp_25_III;
if cancer_stage = 'Stage III';		
	x = ranuni(0);
output;	

proc sort data = temp1_25_III;
	by x;
run;

data clinic_1_25_III;
	set temp1_25_III(obs = 25);
    *if temp1_25_III < 25
        set temp1_25_III(obs = max);
run;

proc print data = clinic_1_25_III;
	title '25 Randomly Selected Patients with Stage III Cancer from Clinic 1';
run;

* The following code randomly selects 25 observations from the second clinic 
with stage III cancer;
data temp2_25_III;
	set PROJECT_1;
if clinic_name = 'CLINIC 2';	

data temp2_25_III;
	set temp2_25_III;
if cancer_stage = 'Stage III';		
	x = ranuni(0);
output;	

proc sort data = temp2_25_III;
	by x;
run;

data clinic_2_25_III;
	set temp2_25_III(obs = 25);
    *if temp1_25_III < 25
        set temp1_25_III(obs = max);
run;

proc print data = clinic_2_25_III;
	title '25 Randomly Selected Patients with Stage III Cancer from Clinic 2';
run;

* The following code randomly selects 25 observations from the third clinic 
with stage III cancer;
data temp3_25_III;
	set PROJECT_1;
if clinic_name = 'CLINIC 3';	

data temp3_25_III;
	set temp3_25_III;
if cancer_stage = 'Stage III';		
	x = ranuni(0);
output;	

proc sort data = temp3_25_III;
	by x;
run;

data clinic_3_25_III;
	set temp3_25_III(obs = 25);
    *if temp1_25_III < 25
        set temp1_25_III(obs = max);
run;

proc print data = clinic_3_25_III;
	title '25 Randomly Selected Patients with Stage III Cancer from Clinic 3';
run;

* The following code randomly selects 25 observations from the fourth clinic 
with stage III cancer;
data temp4_25_III;
	set PROJECT_1;
if clinic_name = 'CLINIC 4';	

data temp4_25_III;
	set temp4_25_III;
if cancer_stage = 'Stage III';		
	x = ranuni(0);
output;	

proc sort data = temp4_25_III;
	by x;
run;

data clinic_4_25_III;
	set temp4_25_III(obs = 25);
    *if temp1_25_III < 25
        set temp1_25_III(obs = max);
run;

proc print data = clinic_4_25_III;
	title '25 Randomly Selected Patients with Stage III Cancer from Clinic 4';
run;

* The following code randomly selects 25 observations from the fifth clinic 
with stage III cancer;
data temp5_25_III;
	set PROJECT_1;
if clinic_name = 'CLINIC 5';	

data temp5_25_III;
	set temp5_25_III;
if cancer_stage = 'Stage III';		
	x = ranuni(0);
output;	

proc sort data = temp5_25_III;
	by x;
run;

data clinic_5_25_III;
	set temp5_25_III(obs = 25);
    *if temp1_25_III < 25
        set temp1_25_III(obs = max);
run;

proc print data = clinic_5_25_III;
	title '25 Randomly Selected Patients with Stage III Cancer from Clinic 5';
run;

* The following code randomly selects 25 observations from the sixth clinic 
with stage III cancer;
data temp6_25_III;
	set PROJECT_1;
if clinic_name = 'CLINIC 6';	

data temp6_25_III;
	set temp6_25_III;
if cancer_stage = 'Stage III';		
	x = ranuni(0);
output;	

proc sort data = temp6_25_III;
	by x;
run;

data clinic_6_25_III;
	set temp6_25_III(obs = 25);
    *if temp1_25_III < 25
        set temp1_25_III(obs = max);
run;

proc print data = clinic_6_25_III;
	title '25 Randomly Selected Patients with Stage III Cancer from Clinic 6';
run;

* The following code randomly selects 25 observations from the seventh clinic 
with stage III cancer;
data temp7_25_III;
	set PROJECT_1;
if clinic_name = 'CLINIC 7';	

data temp7_25_III;
	set temp7_25_III;
if cancer_stage = 'Stage III';		
	x = ranuni(0);
output;	

proc sort data = temp7_25_III;
	by x;
run;

data clinic_7_25_III;
	set temp7_25_III(obs = 25);
    *if temp1_25_III < 25
        set temp1_25_III(obs = max);
run;

proc print data = clinic_7_25_III;
	title '25 Randomly Selected Patients with Stage III Cancer from Clinic 7';
run;
