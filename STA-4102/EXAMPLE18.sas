options nodate nonumber;	
Data example18;

label	state = "State code"
		county = "County code"
		tractnum = "Tract number"
		blocknum = "Block number"
		age60_74 = "Number in 60 - 74 age range"
		age75_84 = "Number in 75 - 84 age range"
		totalnum = "Total number in each block";

	infile '//Client/A$/home/richard/Documents/SAS/R4102/dat_file/example18.dat';
			*Note the use of INFILE statement to refer to external data file;
	input state county tractnum blocknum age60_74 age75_84 totalnum;

x=ranuni(0);
			*Random numbers generated were stored in the variable X
			These numbers fall between 0 and 1 since we have used
			the uniform distribution
*********************************************************************;
** In the SAS function, RANUNI(0), the argument 0 is called the seed.
   The value for the seed should be 0 in order to get a different
   series of random numbers each time the program is run.

   If we need the repeatble series of random numbers, then we need to
   give a 5- or 6- or 7-digit odd number as the value for the seed;
*********************************************************************;
y=x*100000;
	*	Random numbers stored in X are all decimal numbers.
		In this statement we create a new variable Y that stores the values of X
		multiplied by 100000. This helps to look at the large numbers rather
		than decimal numbers. This statement is completely optional. 
		Please run the program to print X as well as Y and see which one is easier
		to look at.;

proc sort;
	by x;
run;

proc print data=example18 (obs=20); * This prints the first 20 records;

title ' Random Selection of Blocks from Tract 212';
var county tractnum blocknum age60_74 age75_84 x totalnum;
format y 7.;
run;
*********************************************************************;
