********************************************************************
* EXAMPLE24.SAS
* IMPORT OF EXCEL FILE (.XLSX) into a SAS data set;

* SAMPLEEXCELDATAFILE.XLSX is in the subfolder, DAT_FILE.

* The name of the TEMPORARY SAS data set created is XLS_SAS.SAS7BDAT
*********************************************************************;
Options nodate nonumber;

PROC IMPORT OUT = PROJECT_1 
     		DATAFILE= "/home/richard/Documents/SAS/R4102/dat_file/DataFor_Project_1.xlsx" 
     		DBMS= XLSX REPLACE;
     GETNAMES=YES;
RUN;

Proc print data= PROJECT_1.SAS7BDAT;
run;
