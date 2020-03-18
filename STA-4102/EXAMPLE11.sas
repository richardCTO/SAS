*****************************************************************
1. How to read data entered on multiple lines for each person
2. Sometimes we get the data set in which each person’s data may have been entered on multiple lines.
3. The following program illustrates how to read such data sets using SAS without having to reenter the data

4. Suppose we add a second line of data with two variables GENDER and WEIGHT,
   third line of data with SMOKE and DRINK, and the fourth line of data with the variable, HRATE.
   for each person.
5. Name of this program is EXAMPLE11.SAS
*******************************************************************; 
options nodate nonumber;       

data example11;
input name $ age birth $char12. sports $
	  admitday mmddyy8. dxdate mmddyy6. reldate date7.
/ gender  $ weight /  smoke $  drink $ / hrate ;

format admitday mmddyy10. dxdate mmddyy8. reldate date9.;
datalines;
Victor 47 Mar 10 1955 Baseball 3101955 031055 10mar55
Male 180
yes no 		
70
Julie  34 Jan 20 1968 Tennis 1201968 012068 20jan68
female 120
no no 
65
;
proc print data=example11;
	title 'Data Tabulation from EXAMPLE11 data set';
run;
*******************************************************************************
REMARKS:

1. The symbol, / (back-slash) tells SAS to go to the next line of the raw data before reading the next variable.

2. If there are 3 lines of data per observation, then there should be two /’s in the INPUT statement,
   and three /’s if 4 lines of data, and so on.
***************************************************************************;
 
