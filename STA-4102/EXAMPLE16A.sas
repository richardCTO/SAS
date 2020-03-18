***************************************************************
The following program converts character DATE values to numeric data
so that the data set can be SORTED by the DATE;
******************************************************************;
data one;					
	input date $10.;
datalines;
12/10/2014
10/12/2006
02/03/2015
01/07/2007
;
proc sort data=one;
by date;
run;

Proc print data=one;
Run;
*************************************************************************
The dates are entered as CHARACTER values. If the data set is sorted
By the variable, DATE, it will not be sorted.

Convert this character date values into numeric date values as follows
************************************************************************;
data two;
	set one;
newdate = input (date, mmddyy10.);

proc sort data=two;
	by newdate;
run;

proc print data = two;
	var date;
run; 
