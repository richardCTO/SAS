**************************************************************************
1. In EXAMPLE13A.SAS, we used a combination of FILENAME and INFILE to read an external data file.
2. In the following program, we shall use just the INFILE statement
3. Name of this program is
         EXAMPLE13B.SAS
*******************************************************************;
* Use of INFILE statement and an external file with extension .DAT;
*******************************************************************;
libname dat_file 'c:\dat_file\';

	* The explanation of the above statement is as before in EXAMPLE13A.SAS;
    *****************************************************************;
	*	The following segment of the program creates a PERMANENT SAS
	    data set by name SASDATAFILE_2 in the subdirectory, DAT_FILE.
	
	*	This segment also uses INFILE option to read the raw data
		from an external file EXAMPLE13B.DAT;
	****************************************************************;
data dat_file.sasdatafile_2; 

label	num = "Subjects ID"
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

infile 'c:\dat_file\example13b.dat';

	*	The syntax is:
		INFILE “file-specification”
				where file-specification can take the form “filename” to point to the actual name and location of the file

	*	In this SAS program, it refers to an external data file EXAMPLE13B.DAT that is stored in “c:\dat_file\ folder.;

input Num age sex $ race $ employ $ insuaran $ DM $ HT $ CHD $ Hb
      WBC PL Creat;
run;
*****************************************************************;
proc print data= dat_file.sasdatafile_2;
	title 'Tabulation of data from sasdatafile_2';
run;

proc freq data= dat_file.sasdatafile_2;
	title 'Output from Proc Freq on sasdatafile_2';
	tables sex race employ insuaran dm ht chd;
run;

proc means data= dat_file.sasdatafile_2 maxdec=2;
	title 'Output from Proc Means on sasdatafile_2';
	var age hb wbc pl creat;
run;
*****************************************************************;
*	What does EXAMPLE13B do?

	It takes an external data file called EXAMPLE13B.DAT and converts it to a SAS data file called SASDATAFILE_2 and
	then, stores it in the folder, DAT_FILE.

*	Therefore, DAT_FILE.SASDATAFILE_2 is a two-level name.
*******************************************************************;
