data example19;
input id section GPA;
datalines;
1 1 2.5 
2 1 2.5
3 1 2.5
4 1 3.5
5 1 3.5
6 1 3.5
7 1 3.5
8 1 3.6
9 1 3.7
10 1 4.0
11 1 3.8
12 1 3.8
13 1 3.7
14 1 4.0
15 1 3.6
16 1 4.0
17 2 2.5
18 2 2.5
19 2 3.5
20 2 3.5
21 2 3.5
22 2 3.5
23 2 3.6
24 2 4.0
25 2 3.9
;
run;
*********************************************************************************;
* The following three SAS statements create a data set called TEMPP by taking
only those records from the original data set EXAMPLE19 that belong to
Section 1 because of IF statement, IF SECTION = 1;

data tempp;
	set example19;
if section=1;		
*********************************************************************************;
*The following segment creates a SAS data set by name S1_GPA2_5 for SECTION 1.
 S1_GPA2_5 contains the 2 randomly selected records for GPA = 2.5 from Section 1;
*********************************************************************************;
data temp1;
	set tempp;
		
if gpa=2.5;		
	x = ranuni(0);
output;	

*	TEMP1 contains only those records from TEMPP that have a value of 2.5 for GPA.

 	Each of these records is now assigned a random number stored in the variable X
	generated using RANUNI.

	Note that the OUTPUT statement is responsible for retaining each record as it
	is read. To understand this, run the program without using the OUTPUT statement
	and again, using the OUTPUT statement to see the effect of OUTPUT;

proc sort data=temp1;
	by x;
run;

data S1_GPA2_5;
	set temp1 (obs=2);
run;
*	Data set S1_GPA2_5 contains only 2 records that were randomly selected from TEMP1.
	NOTE the use of OBS=2 in the SET statement.
		Summary of what the program has done so far:
1.	Created TEMPP that has only those records that belong to Section 1.
2.	TEMP1 contains only those records from TEMPP that have GPA=2.5 and each record in TEMP1
	has been assigned a random number.
3.	Date set, S1_GPA2_5,has now 2 records that were randomly selected from TEMP1.

Thus, we have the data set called S1_GPA2_5 that has 2 randomly selected records with GPA=2.5
from Section 1; 
**************************************************************************;
*	Note:
	We do exactly same as above for 2 other levels of GPA for SECTION 1.
	Then, repeat it for SECTION 2.
*************************************************************************;
*	The following segment is for GPA = 3.5 and create a SAS data set called S1_GPA3_5.;
data temp2;
	set tempp;
		if gpa=3.5;
		x = ranuni(0);
	output;

proc sort data=temp2;
	by x; 
run;

data S1_GPA3_5;
	set temp2 (obs=3);
run;
		*Similarly, the above 11 SAS statements create a data setccalled S1_GPA3_5
		that has 3 randomly selected records with GPA=3.5 from Section 1;
***********************************************************;
*	The following segment is for GPA > 3.5 and create a SAS data set called S1_GPA_GT3_5;
data temp3;
	set tempp;
if gpa gt 3.5;
	x = ranuni(0);
	output;

proc sort data=temp3;
	by x; 
run;

data S1_GPA_GT3_5;
	set temp3 (obs=5);
run;
	* Similarly the above 11 SAS statements create a data set called S1_GPA_GT3_5
	that has 5 randomly selected records with GPA > 3.5 from Section 1;
**************************************************************;
*	The following three SAS statements create a data set called FOR_SECTION1
	that has 10 records (2 from S1_GPA2_5, 3 from S1_GPA3_5 and 5 from S1_GPA_GT3_5)
	for Section 1;

data FOR_SECTION1;	
	set s1_gpa2_5 s1_gpa3_5 s1_gpa_gt3_5;
run;
****************************************************************;

*	PROGRAM FOR SECTION 2
****************************************************************;
data tempp;
	set example19;
if section=2;		* Creates a dataset for SECTION 2;
*****************************************************************;
	* The following segment is for GPA = 2.5;
data temp1;
	set tempp;
if gpa=2.5;
	x = ranuni(0);
	output;

proc sort data=temp1;
	by x;
run;

data s2_gpa2_5;
	set temp1 (obs=2);
run;
*********************************************;
* The following segment is for GPA = 3.5;
data temp2;
	set tempp;
if gpa=3.5;
	x = ranuni(0);
	output;

proc sort data=temp2;
	by x; 
run;

data s2_gpa3_5;
	set temp2 (obs=3);
run;
*********************************************;
* The following segment is for GPA > 3.5;
data temp3;
	set tempp;
if gpa gt 3.5;
	x = ranuni(0);
	output;

proc sort data=temp3;
	by x; 
run;

data s2_gpa_gt3_5;
	set temp3 (obs=5);
run;
**************************************************************;
data for_section2;	
		* This creates one datafile for SECTION 2 with
        randomly chosen records for all 3 levels of of GPA;
	set s2_gpa2_5 s2_gpa3_5 s2_gpa_gt3_5;
run;
****************************************************************;
*	The following SAS statements create a data set called FINAL.SAS7BDAT
	that has a total of 20 records (10 records for Section 1 and 10 records
	for Section 2).;
data final;
	set for_section1 for_section2;		
run;
***************************************************************;
proc print data=final;
	title 'Tabulation of randomy selected records';
	title2 'For each of the 3 levels of GPA';
	title3 'For Sections 1 and 2';
run;
**************************************************************;
