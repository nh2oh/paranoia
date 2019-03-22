#include "paranoiapp.h"
#include <iostream>
#include <string>
#include <array>


//
// Sets globals: X, I, Y, Z, but this does not appear significant (see 
// below).  
//
// At the bottom of the routine, I is reset to 0, however, the next time it
// is used is in milestone 60, where it is set to 1 before use.  However, 
// SR3750() and SR3980() both use I without first initializing the value.  
// SR3980() is called first durring milestone 90, but milestone 90 initializes I
// to 0.  SR3750() is called in milestone 85; here, I appears to be set to 0
// before any call to SR3750().  
//
// X is set to one+u2 at the bottom of the routine; the next uses of X are in
// milestone 25 and 30; x is reset in here before use.  Y, Z also appear to 
// be reset in milestones 25, 30 before their first use.  
//
//
//
void milestone_20(double f9, double u2) {
	double zero = 0;
	double one = 1;
	double two = one+one;
	double half = one/two;

	if ((f9-half)>=half) {
		g_error_count[Failure]+=1;
		std::cout << print_error(Failure,
			"(1-U1)-1/2 < 1/2 is FALSE, so this program may malfunction.");
	}

	double x = f9;
	int i = 1;
	double y = x-half;
	double z = y-half;
	if ((x==one)&&(z!=zero)) {  // TstCond(Failure,(X!=One)||(Z==Zero), "Compari...
		g_error_count[Failure]+=1;
		std::cout << print_error(Failure,
			"Comparison is fuzzy; X=1 but X-1/2-1/2 != 0");
	}

	//x = one + u2;
	//i = 0;
}

//
// Replaces the following section in the body of main():
//

	//TstCond (Failure, F9 - Half < Half,
	//	   "(1-U1)-1/2 < 1/2 is FALSE, prog. fails?");
	//X = F9;
	//I = 1;
	//Y = X - Half;
	//Z = Y - Half;
	//TstCond (Failure, (X != One)
	//	   || (Z == Zero), "Comparison is fuzzy,X=1 but X-1/2-1/2 != 0");
	//X = One + U2;
	//I = 0;

