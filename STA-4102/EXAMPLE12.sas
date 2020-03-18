*******************************************************
*  EXAMPLE12.SAS;
data example;				
	input	@1 semesterstartdate mmddyy6.
			@8 date2 mmddyy8.
			@17 date3 date7.
			@25 date4 julian5.
			@31 date5 ddmmyy6.
			@38 date6 mmddyy8.
			@47 day 2.
			@50 month 2.
			@53 year 4.;
format SEMESTERSTARTDATE DATE2 - DATE5 mmddyy8. date6 mmddyy10.; 
					** This FORMAT statement is used to PRINT the DATES using a specified formats
					   such as mmddyy8, mmddyy10, or WORDDATE with “slashes”;
datalines;
102101 10/21/46 21oct46 46294 211046 10211946 17 09 1980
122502 12/25/96 25dec96 96360 251296 12251996 30 11 1982
122503 12/25/98 25dec98 96360 251296 12251899 25 12 1984
;
run;
proc print data=example;
	title 'Tabulation of data from EXAMPLE12 data set';
	title2 'Dates were read in a variety of formats';
run;
****************************************************;
data example12;
	set example;
*************** ASSIGNMENT statements to create new variables**************;
day1 = day(semesterstartdate);  
					** The newly created variable, DAY1, will contain only the DAY part of the variable SEMESTERSTARTDATE;

month1 = month(semesterstartdate);
					** The newly created variable, MONTH1, will contain only the MONTH part of the variable SEMESTERSTARTDATE;

year1 = year(semesterstartdate);
					* The newly created variable, YEAR1, will contain only the YEAR part of the variable SEMESTERSTARTDATE; 

Date_of_birth = mdy(month,day,year); 
					** This MDY function combines the three different variables, MONTH, DAY, and YEAR to form one single variable, DATE_OF_BIRTH;

age = (semesterstartdate - date_of_birth)/365.25;
					** This computes the age in years between DATE_OF_BIRTH & SEMESTERSTARTDATE, stores the age (with 4 decimal places) in the newly created variable, AGE1.
						(For example: AGE = 21.0924  for the first person in the data set);

age1 = yrdif(date_of_birth, semesterstartdate); 
					** This computes the age in years between DATE_OF_BIRTH & SEMESTERSTARTDATE, stores the age (with 4 decimal places) in the newly created variable, AGE1_A.
					(For example: AGE1 = 21.0932 for the first person in the data set);

integer_part_of_age1 = int(age1);
					** The INT function applied on the variable, AGE1, gives only the INTEGER part of the data and ignores the decimal part. This INTEGER part of the data will be stored in a newly created variable, INTEGER_PART_OF_AGE1.
					(For example: INTEGER_PART_OF_AGE1 = 21  for the first person in the data set);

age1_nearest_tenth = round(age1, 0.1 );
					** The ROUND function applied on the variable, AGE1, rounds off AGE1 to the nearest tenth and stores it in a newly created variable, AGE1_NEAREST_TENTH.
					(For example: AGE1_NEAREST_TENTH = 21.1 for the first person in the data set); 	

Age1_nearest_year = round(age1, 1 );

					** The ROUND function applied on the variable, AGE1, rounds off AGE1 to the nearest year and stores it in a newly created variable, AGE1_NEAREST_YEAR.
					(For example: AGE1_NEAREST_YEAR = 21  for the first person in the data set);
		
		* To compute age as of a specific date, say January 13, 2020, use the following SAS statement;

num_years = int (('13JAN20'D - semesterstartdate) / 365.25);

				** NUM_YEARS is the number years between a FIXED Date, January 13, 2020, and SEMESTERSTARTDATE, with only INTEGER part being stored in the newly created variable, NUM_YEARS.
				(For example: NUM_YEARS = 15 for the first person in the data set);

format SEMESTERSTARTDATE DATE2 - DATE5 mmddyy8. date6 mmddyy10. Date_of_birth worddate.; 
** This FORMAT statement is used to PRINT the DATES using a specified formats such as mmddyy8, mmddyy10, or WORDDATE with “slashes”;

proc print data=example12;
	title 'Tabulation of data from EXAMPLE12 data set';
	title2 'Dates were read in a variety of formats';
run;
