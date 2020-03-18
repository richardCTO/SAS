*******************************************************************
Name of the program is EXAMPLE13A.SAS;

libname dat_file 'c:\dat_file\';	

	* The libref is the folder called DAT_FILE in which the file will be stored and the 
      SAS-data-library is c:\dat_file\.;

data dat_file.sasdatafile_1;

	* This statement creates a permanent SAS data set called SASDATAFILE_1 and is stored in the folder, DAT_FILE.
	* Note that for this statement to run correctly, you must have the LIBNAME statement created above this statement;

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

filename temp 'c:\dat_file\example13a.txt';
infile temp;

	* The fileref is a temporary name TEMP for an external data file which is EXAMPLE13A.TXT in this program.
  	* This external data file has an extension.TXT. That is, it is a text file.
	* filename is the fully qualified name or location of the external file which, in this program, is
		'c:\dat_file\example13a.txt';
	*(Note that DAT_FILE is a subfolder in C:\);

input Num age sex $ race $ employ $ insuaran $ DM $ HT $ CHD $ Hb WBC PL Creat;
run;
*****************************************************************;
proc print data= dat_file.sasdatafile_1;
	title 'Tabulation of data from sasdatafile_1';
run;

proc freq data= dat_file.sasdatafile_1;
	title 'Output from Proc Freq on sasdatafile_1';
	tables sex race employ insuaran dm ht chd;
run;

proc means data= dat_file.sasdatafile_1 maxdec=2;
	title 'Output from Proc Means on sasdatafile_1';
	var age hb wbc pl creat;
run;
*******************************************************************
What does EXAMPLE13A do?
	It takes an external data file called EXAMPLE13A.TXT which is stored in DAT_FILE,
	and converts it to a SAS data file called SASDATAFILE_1, and then, stores it
	in the folder, DAT_FILE;
