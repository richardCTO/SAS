*************************************************************
1. The following program has the data as part of the program

2. Name of the program is EXAMPLE13C.SAS
*********************************************************************;
* The following program does NOT use FILENAME or INFILE statements
  to read the data. The data are entered as part of the SAS program.

* However, we use LIBNAME statement to create a permanent SAS data file

The following program creates a PERMANENT SAS data set by name

  SASDATAFILE_3 in the subdirectory, DAT_FILE;
**********************************************************************;
libname dat_file 'c:\dat_file\';
*****************************************************************;
data dat_file.sasdatafile_3; 

label		num = "Subjects ID"
			age = "Subjects age"
			sex = "Subjets Gender"
			race = "Subjects race"
			employ = "Does subject have employment? Yes or No"
			insuaran = "Does subject have insurance? Yes or No"
			dm = "Diabetes? Yes or No"
			ht = "Hypertension? Yes or No"
			chd ="CHD? Yes or No"
			hb = "Hemoglobin reading"
			wbc = "White Blood Cell"
			pl = "Platelet count"
			creat = "Creatinine";
input Num age sex $ race $ employ $ insuaran $ DM $ HT $ CHD $ Hb WBC PL Creat;
datalines;
1 40	M	B	N	N	N	N	N	14.9 3.2 220 0.9
2 47	M	B	N	Y	N	Y	N	9.9 11.4 148 5.7
3 47	M	B	N	Y	N	Y	N	8.7 3.4	294	0.8
4 37	M	W	N	N	N	N	N	16.7 9 231 0.6
5 45	M	W	N	Y	N	N	N	12.5 9.5 264 0.8
6 40	F	B	N	Y	N	N	N	8.4	5.1	308	0.7
7 24	F	B	N	Y	N	N	N	7.4	10.2 212 0.5
8 60	M	W	N	N	N	N	N	9.3	6.7	211	1
9 48	M	B	N	Y	N	N	N	. . . 0.9
10 38	F	B	N	Y	N	Y	Y	11.1 11.8 43 7.4
;
*****************************************************************;
proc print data= dat_file.sasdatafile_3;
	title 'Tabulation of data from sasdatafile_3';
run;

proc freq data= dat_file.sasdatafile_3;
	title 'Output from Proc Freq on sasdatafile_3';
	tables sex race employ insuaran dm ht chd;
run;

proc means data= dat_file.sasdatafile_3 maxdec=2;
	title 'Output from Proc Means on sasdatafile_3';
	var age hb wbc pl creat;
run;
*****************************************************************;
 
