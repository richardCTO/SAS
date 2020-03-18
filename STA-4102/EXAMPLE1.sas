*Example 1: Reading Data values separated by spaces (no missing values);

options nodate nonumber;


	*OPTIONS is a SAS key word. NODATE and NONUMBER in OPTIONS statement are to
	avoid printing dates and page numbers on the output;

data example1;			*EXAMPLE1.SAS (example of LIST input);

input name $ id $ gender $ height weight center drug $ changescore;
*********************************************************************************************
*Two restrictions are placed:
First, variable values must be separated by one or more blanks.
Second, there must be as many values in each line of data as there are variable names in the
INPUT statement. 

As an example: John 123 male 59 155 1 placebo 17
Note that each data value is separated by at least one blank space and there are altogether
8 pieces of data on each line, matching 8 variables listed in the INPUT statement.;
*******************************************************************************************;
label
	height = "Height of the participant"
	weight = "Weight of the participant"
	center = "Study center number"
	drug = "Treatment: Drug or Placebo"
	changescore = "change score";
******************************************************************************************************
*LABEL statement:	Each label can have up to 256 characters. It goes right after the INPUT statement.
	Note that LABEL statement begins with the key word LABEL, followed by the variable name and its
	description enclosed in single or double quotes. Also note that the semicolon goes at the end of
	the last variable with its description.;
*****************************************************************************************************;
datalines;
John 123 male 59 155 1 placebo 17
Wallis 221 female 52 101 1 drug 23
Peterson 323 male 65 210 2 placebo 14
Wu 105 female 55 120 2 placebo 6
Sanders 143 male 60 175 2 drug 9
;
proc print data=example1;
	title 'Tabulation of data from EXAMPLE1 data set';
*************************************************************************************************;
*		TITLE statement begins with the key word TITLE followed by at least one blank space and
		the text for the title enclosed again in either single or double quotes.
		There can be as many TITLE statements in any SAS program as one needs.
		It is a good practice to have TITLE s for each SAS PROCEDURE.
		For the second title, the syntax is, for example: title2 �Whatever the text you want to put here�;
*		For the third title, the syntax is, for example: Title3 �Whatever the text you want to put here�; 
*		and so on;
*********************************************************************************************;
run;	

proc means data=example1 maxdec=2;
	var height weight changescore;
	title 'Output from the Procedure MEANS';
run;	

proc freq data=example1;
	title Frequency distribution of the categorical variables;
tables drug center;
run;

* The following statements read only observations 2 through 4;
data temp;
	set example1 (firstobs=2 obs=4);
Run;

*********************************************************************************************
SET is another SAS key word. The purpose of this is to create a temporary SAS data set using an existing SAS data set. 
That is, basically making a copy of an existing SAS data set and calling it by another name.

In here, we are using an existing SAS data set called EXAMPLE1 & making a copy of it and 
calling it TEMP. This way I am working with the copy of the original file and keeping the
original data set intact.

Suppose we want to read the observations 2 through 4, then we use: FIRSTOBS=2 OBS=4; *as part of the SET statement as shown above.

Note that the SAS data set, TEMP, has only 3 observations proc print data=temp;
****************************************************************************************;
title Tabulation of data from observation 2 through 4;
run;
