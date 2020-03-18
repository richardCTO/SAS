***********************************************************************
Example 9:	Use of @@ to read multiple observations that are on the same line.
	
1. Sometimes multiple observations are placed on the same data line.
2. For example, in this data set there are only 5 variables but on each line you see more than 5 pieces of data.
3. In order to make SAS understand that there are multiple observations on the same line and to make it
   allocate first 5 pieces of data as one record, the next 5 pieces of data as the second record and so on,
   we use two @ symbols as @@ at the end of the INPUT statement.
4. There are five variable in the INPUT statement. The symbol @@ allows SAS to read the following data
5. Note that there are 4 records per child, and there are 10 children. There should be a total of 40 records.

6. Note:	If you run the program without @@ symbol, then, the program reads the first 5 pieces
			of data as one record, and ignores the rest of the data.

			Please note that the program does not give you any error.
7. Name of the program is EXAMPLE9.SAS
*******************************************************************;
data example9;							
input number child age distance gender @@;
datalines;
1 1 8 21 0 2 1 10 20 0 3 1 12 21.5 0 4 1 14 23 0 5 2 8 21 0 6 2 10 21.5 0 7 2 12 24 0 8 2 14 25.5 0 9 3 8 20.5 0 10 3 10 24 0 11 3 12 24.5 0 12 3 14 26 0 13 4 8 23.5 0 14 4 10 24.5 0 15 4 12 25 0 16 4 14 26.5 0 17 5 8 21.5 0 18 5 10 23 0 19 5 12 22.5 0 20 5 14 23.5 0 21 6 8 20 0 22 6 10 21 0 23 6 12 21 0 24 6 14 22.5 0 25 7 8 21.5 0 26 7 10 22.5 0 27 7 12 23 0 28 7 14 25 0 29 8 8 23 0 30 8 10 23 0 31 8 12 23.5 0 32 8 14 24 0 33 9 8 20 0 34 9 10 21 0 35 9 12 22 0 36 9 14 21.5 0 37 10 8 16.5 0 38 10 10 19 0 39 10 12 19 0 40 10 14 19.5 0
;
run;
***************************************************************;  
proc print data=example9;
	title "Use of @@ to read the data set that has multiple";
	title2 "observations placed on the same line";
run;
***************************************************************;

