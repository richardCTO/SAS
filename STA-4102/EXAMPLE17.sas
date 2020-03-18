options nodate nonumber; 

Proc format;
	Value groupf	0 = "CONTROL"
					1 = "TREATMENT";
run;

data example17;
	input id name $25.;
	group = ranuni(0);	* Seed is 0. Therefore, every time the program is run, we get a different
        				  randomization;
datalines;
1 John, Smith
2 Amy, Burns
3 Kimberly, Clark
4 Eugene, Johns
5 Ana, Tran
6 Paula, Wolfgang
7 Rupert, Murdock
8 Issac, Newton
9 Jones, Patricia
10 George, Confused
;
proc rank data= example17 groups = 2 out = new;
	var group;
run;

proc print data = new;	* Run up to this point and see what output you get;
run;
		* It allocates equal number of participants to each group.
		* Suppose you add an 11th person, there will be unequal number of participants
		  in groups;

proc sort data=new;
	by name;
run;

proc print data=new;
title 'Random allocation of subjects to TREATMENT or CONTROL
       group';
var id name group;
format group groupf.;
run;
