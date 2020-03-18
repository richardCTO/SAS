*****************************************************************************
* 			                      EXAMPLE23.SAS
*******************************************************************************;
*	Following are the SAS codes to convert a .TXT data file (with each variable
    data separated by a “SPACE”) using PROC IMPORT into a SAS data file.;

*	SDFILE.TXT file in which the data values are separated by a SPACE;
Options nodate nonumber;		
PROC IMPORT OUT= sdfile 
     DATAFILE= "c:\caph\DAT_FILE\sdfile.txt" 
     DBMS=DLM REPLACE;

		*	Please note that the above three lines become just 1 SAS statement.

	 		Starts with the SAS key word PROC followed by the procedure name IMPORT.

	 		Creates a SAS data file called SDFILE that is specified in the OUT= statement
			using the data file, SDFILE.TXT, that is specified in the DATAFILE= statement.
			The SDFILE.TXT is in C:\CAPH\DAT_FILE\.
		
	 	*	DLM represent “delimiters other than commas or tabs”

	 	*	REPLACE – this says to replace the existing SAS data file by this
			SAS data file, SDFILE; 

     GETNAMES=YES;

		*	Note that the variables names are in the first row of the SDFILE.TXT.
			Hence, the above SAS statement GETNAMES= YES is needed;
     
	DATAROW=2; 

		*	Note that the data starts from the second row of the SDFILE.TXT.
			Hence, the above SAS statement DATAROW=2 is needed;
RUN;
Proc print data=sdfile;
	title 'Tabulation of data from SDFILE.SAS7BDAT';
	title2 'The .TXT (SPACE separated file) was converted into SAS data file using PROC IMPORT';
Run;
******************************************************************************;
******************************************************************************;
*	Following are the SAS codes to convert a .CSV data file (with each variable
	data separated by a “COMMA”) using PROC IMPORT into a SAS data file.

*	CSV_FILE.CSV is a “COMMA SEPARATED VALUES (CSV)” file;
Options nodate nonumber;		
PROC IMPORT OUT = csv_file 
     	DATAFILE= "c:\caph\dat_file\csv_file.csv" 
     	DBMS= CSV REPLACE;
 GETNAMES=YES;
 DATAROW=2; 
RUN;
Proc print data=csv_file;
	title 'Tabulation of data from CSV_FILE.SAS7BDAT';
	title2 'The .CSV (COMMA separated file) was converted into SAS data file using PROC IMPORT';
Run;
*****************************************************************************;
*****************************************************************************;
*	Following are the SAS codes to convert a .TXT data file (with each variable
	data separated by a “TAB”) using PROC IMPORT into a SAS data file.

*	TAB_FILE.TXT is a file in which the data values are separated by a TAB;

Options nodate nonumber;		
PROC IMPORT OUT = tab_file 
     		DATAFILE= "c:\caph\DAT_FILE\tab_file.txt" 
     		DBMS= TAB REPLACE;
     GETNAMES=YES;
     DATAROW=2; 
RUN;

Proc print data=tab_file;
	title 'Tabulation of data from TAB_FILE.SAS7BDAT';
	title2 'The .TXT (TAB separated file) was converted into SAS data file using PROC IMPORT';
Run;
****************************************************************************;
****************************************************************************;
 
