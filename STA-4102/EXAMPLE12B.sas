****************************************************************************
EXAMPLE:	Suppose the data set contains DATES entered in both American and
			Non-American formats.
1.	Multi-center clinical trials involving USA and other countries are common and hence,
	the dates collected are in different formats (American and non-American)
2.  The following program converts Non-American format into American format

	3.	Suppose we have dates entered in American and Non-American format,
  		for example, in a multi-center clinical trials.

	4.	First, we READ the two datasets separately, and then use SET statement to
  		combine them into a single file which will have dates in the AMERICAN
  		format.
5. Name of the program is EXAMPLE12B.SAS
*********************************************************************;
data one; 
			* DATES are entered in AMERICAN Format; 
input id age dob mmddyy6.;
format dob mmddyy10.;
datalines;
1 23 123106
2 45 011068
3 52 031055
4 12 073096
;
run;
data two; 
			* DATES are entered in EUROPEAN Format;
input id age dob ddmmyy6.; 
format dob mmddyy10.;
datalines;
5 32 100355
6 29 200165
7 42 301082
8 33 120652
; 
run;

data final;	
				* FINAL date set is created by add the two files ONE and TWO;
	set one two; 
				* Note the use of SET statement here to add two files into FINAL;
run;

proc print data=final;
run;
******************************************************************;
