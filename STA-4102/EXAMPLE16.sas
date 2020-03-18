
****************************************************************;
* The following program converts CHARACTER DATA to NUMERIC DATA;
******************************************************************;

data one;
	input age $ height $ weight $;
datalines;
24 69 161
23 68 150
39 69 189
55 70 180
27 . 155
;
proc means data=one;
var age height weight;
run;							* These 3 statements do not produce the MEANS. WHY?;			
******************************************************************;
data two;
	set one;
nage=age*1;
nheight=height*1; 
nweight=weight*1; 
run;

proc print data=two;
	title 'Tabulation of data from NUMERIC data set';
run;
******************************************************************;
proc means data= two;
	var nage nheight nweight;
run; 		  					* These 3 statements DO produce the MEANS. WHY?;

******************************************************************************
This part of the syntax will be discussed after introducing the concept of
ARRAYs. Use of ARRAY statements to do the same thing as above
******************************************************************************;
data three;
	set one;

	array ex16a{3} age -- weight;
	array ex16b{3} nage nheight nweight;
		do i = 1 to 3;
			ex16b{i} = 1*ex16a{i};
		end;
	drop age height weight i;

proc means data=three;
run; 
*******************************************************************;
