*************************************************************************************
EXAMPLE:	Suppose the data set contains a mix of 2-digit and 4-digit years. Reading such dates using
			proper INFORMATs
1. In the following SAS program, note that some DATES have been entered with a 2-digit year and
   other with a 4-digit year.
2. In order to READ all dates correctly, use the informat, DATE9.
3. To PRINT all dates in the format mm/dd/yyyy, use the following format statement,
	FORMAT DEPARTURE_DATE MMDDYY10.;
* 4. Name of this program is EXAMPLE12A.SAS
**************************************************************************************;
options yearcutoff=1920;			
	*	Note the use of YEARCUTOFF = 1920;

data example12a;
	input country $ 1 - 12 @13 departure_date date9. nights;
	format departure_date mmddyy10.;
	datalines;

Japan       13may2000  8
Greece      17oct99   12
New Zealand 03feb2014 16
Brazil      28feb2015  8
Venezuela   10nov00    9
Italy       25apr2001  8
USSR        03jun1997 14
Switzerland 14jan2001  9
Australia   24oct98   12
Ireland     27mar2015  7
;
run;

***************************************************;
proc print data=example12a;
   title 'Dates Using the DATE9. Informat';
   title2 'Printed as 4-Digit Calendar Dates';
   format Departure_Date mmddyy10.;
run;
**************************************************;
