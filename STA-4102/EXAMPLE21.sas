*************************************************************;
* EXAMPLE21.SAS;
data example21;
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
***********************************************************;
*	Note that for each person there are 4 visit dates.

	For each person, we want to compute the number of days
		between Visit 1 Date and Visit 2 Date
		between Visit 2 Date and Visit 3 Date
	between Visit 3 Date and Visit 4 Date

	Then, take the average of these numbers. 

	I have shown the computation for one person above;
**********************************************************;
run;
 
data result;
	n = 0;
	 	*	The above line creates a variable n whose initial value is 0;

do until (last.id);
	set example21;
	by id date;
	if first.id then firstday = date;
	
		*	This statement takes the first date for each ID and puts it in the
			variable called FIRSTDAY;
n + 1;
end;
		*	The 4 statements that are between DO UNTIL (LAST.ID) and END are
			carried out for each person until the last record for each person
			is processed;

if n > 1 then avgdays = (date - firstday)/(n - 1);
drop n visit;
****************************************;
proc print data=result;
	title 'Tabulation of the results';
	format date firstday mmddyy10.;
run;
****************************************;
