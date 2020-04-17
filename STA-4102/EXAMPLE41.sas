*******************************************************************;
*	Another example of the use of RETAIN and ARRAY statements.
 
*	The department of mathematics at a university wants to promote
	the professor depending on the grant money they have received from
	4 agencies: NIH (1), ACS (2), NSF (3) and HRSA (4).

*	The data set has 6 professors and 4 funding agencies. 

*	The data set has multiple records for each professor.

*	The GOAL of this program is to combine the multiple records
	into ONE record for each professor using ARRAY and RETAIN statements;

*	For the FIRST professor, the newly created data set will have his record as
		1	NIH	ACS	.	HRSA

	For the SECOND professor, the newly created data set will have his record as
		2	NIH	.	NSF	HRSA

		and . . . . so on;

*	EXAMPLE41.SAS
********************************************************************; 
proc format;
	value mem_numf	1 = 'NIH'
					2 = 'ACS'
					3 = 'NSF'
					4 = 'HRSA';
data example41;						
	input professor_id funding_agency $ mem_num;
datalines;
1 NIH 1
1 ACS 2
1 HRSA 4
2 NIH 1
2 NSF 3
2 HRSA 4
3 ACS 2
3 NSF 3
3 HRSA 4
4 NIH 1
4 ACS 2
4 NSF 3
4 HRSA 4
5 ACS 2
5 HRSA 4
6 NIH 1
6 ACS 2
6 NSF 3
6 HRSA 4
;

proc sort data=example41;
	by professor_id mem_num;
run;

proc print data= example41;
run;

data temp1;

	array agency[4] fund_agency1-fund_agency4;
	retain fund_agency1-fund_agency4;
	set example41;
by professor_id;

if first.professor_id then do i= 1 to 4;
					agency[i]=.;
		     	 end;

			agency[mem_num] = mem_num;
			if last.professor_id then output;

format fund_agency1-fund_agency4 mem_numf.;

keep professor_id fund_agency1-fund_agency4;

run;

proc print data=temp1;
title 'Tabulation of the Result- ONE RECORD PER PROFESSOR';
	var professor_id fund_agency1-fund_agency4;
run;	
