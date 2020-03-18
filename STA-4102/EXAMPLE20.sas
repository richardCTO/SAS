********************************************************************************;
* This is an example in which we create two categorical variables (DUMMY variables)
  for each condition. That is the reason we need DO - - - -END statements.
                 EXAMPLE20.SAS;
***********************************************************************************;
options ps=55 ls=64 nodate nonumber; 	

proc format;
	value yesnof	1 = "Yes"
					0 = "No";

	value exptypef	1 = "Not Exposed"
					2 = "Previously exposed"
					3 = "Currently exposed";
******************************************************************
	An example of the use of IF-THEN/ELSE and DO-END statements
	to create two DUMMY variables for a variable that has 3 levels
******************************************************************;
data example20;
input id exp_type @@;	* Note the use of @@ symbol;
label
	exp_type = "Type of Exposure"
	prev_exp = "Previously exposed?"
	cur_exp = "Curently exposed?";
*****************************************************************************;
*	EXP_TYPE is the ORIGINAL variable that has 3 levels.

	We want to create two dummy variables (named PREV_EXP and CUR_EXP)
	based on the values of EXP_TYPE
	(PREV_EXP = Previously exposed and CUR_EXP = Currently exposed)

	CUR_EXP = 1			if a subject has EXP_TYPE = 3, otherwise CUR_EXP = 0

	PREV_EXP = 1		if a subject has EXP_TYPE = 2, otherwise PREV_EXP = 0

	CUR_EXP = 0 		if a subject has EXP_TYPE = 1
	and PREV_EXP = 0 

	CUR_EXP = . 		if a subject has EXP_TYPE = .
	and PREV_EXP = .
*****************************************************************************;
format	exp_type exptypef. prev_exp cur_exp yesnof.;

if exp_type =. then do;                       
                     	cur_exp=.;
                     	prev_exp=.;
                    end;
   else if exp_type = 2 then do;
                 		cur_exp=0;
                     	prev_exp=1;
                             end;
           else if exp_type = 3 then do;
                     	cur_exp=1;
                     	prev_exp=0;
                                     end;
                   else do;
                        cur_exp=0;
                        prev_exp=0;
                        end;
datalines;
1 1 2 1 3 1 4 1 5 1 6 . 7 1 8 1 9 1 10 1 11 2 12 2 13 2 14 . 15 2 16 2 17 . 18 2 19 2 20 2 21 3 22 . 23 . 24 3 25 3 26 3 27 3 28 3 29 3 30 3
;
****************************************************************;
proc print data=example20;
	title 'Tabulation of the data from EXAMPLE20 data set';
run;

proc freq data=example20;
	title 'Frequency Tabulation from EXAMPLE20 data set';
	tables exp_type prev_exp cur_exp;
run;
 
proc freq data=example20;
title 'Frequency Tabulation from EXAMPLE20 based on WHERE
 statement';
	tables exp_type;
	where (exp_type=2 or exp_type=3);
run;
***************************************************************;
data dataset1;
	set example20;
	if (exp_type = 2 or exp_type= 3);

proc freq data= dataset1;
	title 'Frequency Tabulation from DATASET1 data set';
	title2 'created based on SUBSETTING IF statement';
	tables exp_type;
run;
