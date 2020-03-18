***************************************************************************
EXAMPLE21A.SAS

Following program does exactly same as what was done by EXAMPLE21.SAS except
that this one uses PROC TRANSPOSE
****************************************************************************;
* Use of PROC TRANSPOSE procedure to find the average number
  of days between the first and the last visit for each patient;
***************************************************************;
data example21A;
	input id visit date mmddyy10.;
	format date mmddyy10.;
datalines;
1 1 02/03/1998
1 2 02/03/2000
1 3 02/03/2002
1 4 02/03/2007
2 1 02/03/1996
2 2 02/03/1998
2 3 02/03/2000
2 4 02/03/2005
3 1 02/03/1991
3 2 02/03/1995
3 3 02/03/1999
3 4 02/03/2001
4 1 02/03/1989
4 2 02/03/1993
4 3 02/03/1995
4 4 02/03/1998
;
run;
************************************************;
data one;
	set example21a (keep = id date);
run;
		*	The above three statements creates a data set called ONE
			using the data for the variables ID and DATE from EXAMPLE21A;
proc sort data=one;
	by id;
run;
		*	The above three statements sort the data set ONE by ID;
proc transpose data=one out=two prefix = DATE_VISIT;
	by id;
run;
		*	The above three statements create a data set called TWO using
			the data set ONE by transposing all four dates for each person
			from ONE and putting them in 4 new columns (whose names are
			DATE_VISIT1, DATE_VISIT2, DATE_VISIT3 and DATE_VISIT4 because
			of the statement  prefix = DATE_VISIT) and thus, creates one
			record per person;
data final;
	set two(drop = _name_);

		*	The above two statements create a data file called FINAL
			from the data set, TWO created above in the PROC TRANSPOSE;
avg_num_days = (date_visit4 - date_visit1)/3;

		*	The above statement computes the number of days between the
			first date and the last date for each person and divides
			that number by 3 to get the average.;
run;

proc print data=final;
run; 
