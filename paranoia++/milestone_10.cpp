#include "paranoiapp.h"
#include <iostream>
#include <string>
#include <array>
#include <iomanip>  // std::setprecision()

//
// Overall objective seems to be to set the value of the globals
//   Radix, U1=1/B^p, U2=B/B^p, W=1/U1=B^p, F9=1-U1,
//   Precision => #B digits (if B=1 then P=0; line 6510 BASIC prog).  
//   The initial values of Radix, U1, U2 are effectively ignored.  
//
// Milestone 20 (which is the next one) uses F9, U2, but not Radix or
//   Precision.  Milestone 25 (next after 20) uses Radix, Precision,
//   and possibly others.  Milestone 85 appears to depend on this milestone
//   setting W.  
//
// Alters the globals W, Y, Z, Precision, Radix, U1
// E0, E1, E9, E3, X, F6
// F9
//
m10_result_t milestone_10() {
	double zero = 0;
	double one = 1;
	double two = one+one;
	double three = two+one;
	double four = three+one;
	double five = four+one;
	double eight = four+four;
	double nine = three*three;
	double twenty_seven = nine*three;
	double thirty_two = four*eight;
	double two_forty = four*five*three*four;
	double minus_one = -one;
	double half = one/two;

	if ((nine!=three*three) || (twenty_seven!=nine*three) || (eight!=four+four)
				|| (thirty_two!=eight*four) 
				|| (thirty_two-twenty_seven-four-one != zero)) {
		g_error_count[Failure]+=1;
		std::cout << print_error(Failure,
			"9 != 3*3, 27 != 9*3, 32 != 8*4, or 32-27-4-1 != 0");
	}

	if ((five!=four+one) || (two_forty!=four*five*three*four)
				|| (two_forty/three - four*four*five != zero)
				|| (two_forty/four - five*three*four != zero)
				|| (two_forty/five - four*three*four != zero)) {
		g_error_count[Failure]+=1;
		std::cout << print_error(Failure,
			"5 != 4+1, 240/3 != 80, 240/4 != 60, or 240/5 != 48");
	}

	if (g_error_count[Failure] == 0) {
		std::cout << "-1, 0, 1/2, 1, 2, 3, 4, 5, 9, 27, 32 & 240 are O.K."
			<< std::endl;
	}

	std::cout << "Searching for Radix and Precision." << std::endl;
	double w = one;
	double y;
	double z;
	do {
		w = w+w;
		y = w+one;
		z = y-w;
		y = z-one;
	} while (minus_one+std::fabs(y) < zero);
	// now w is just big enough that |((W+1)-W)-1| >= 1 ...

	double precision = zero;
	double radix;
	y = one;
	do {
		radix = w+y;
		y = y+y;
		radix = radix-w;
	} while (radix==zero);
	if (radix<two) {
		radix = one;
	}
	std::cout << "Radix = " << radix << std::endl;
	if (radix!=1) {
		w = one;
		do {
			precision = precision+one;
			w = w*radix;
			y = w+one;
		} while ((y-w)==one);
	}
	//... now w == radix^precision is barely too big to satisfy (W+1)-W == 1

	double u1 = one/w;
	double u2 = radix*u1;
	std::cout << "Closest relative separation found is u1 = "
		<< std::setprecision(8) << u1 << "\n\n"
		<< "Recalculating radix and precision"
		<< std::endl;

	// save old values
	double e0 = radix;
	double e1 = u1;
	double e9 = u2;
	double e3 = precision;
	
	double x = four/three;
	double third = x-one;
	double f6 = half-third;
	x = f6+f6;
	x = std::fabs(x-third);
	if (x<u2) {
		x=u2;
	}
	
	//... now x = (unknown no.) ulps of 1+...
	do {
		u2 = x;
		y = half*u2 + thirty_two*u2*u2;
		y = one+y;
		x = y-one;
	} while (!((u2<=x) || (x<=zero)));
	
	//... now u2 == 1 ulp of 1 + ... 
	x = two/three;
	f6 = x-half;
	third = f6+f6;
	x = third-half;
	x = std::fabs(x+f6);
	if (x < u1) {
		x = u1;
	}
	
	//... now  x == (unknown no.) ulps of 1 -...
	do {
		u1 = x;
		y = half*u1 + thirty_two*u1*u1;
		y = half-y;
		x = half+y;
		y = half - x;
		x = half + y;
	} while (!((u1<=x) || (x<=zero)));
	//... now u1 == 1 ulp of 1 - ... 

	if (u1==e1) {
		std::cout << "confirms closest relative separation u1 .";
	} else {
		std::cout << "gets better closest relative separation U1 = "
			<< std::setprecision(8) << u1;
	}
	std::cout << std::endl;

	w = one/u1;
	double f9 = (half-u1)+half;
	radix = std::floor(0.01+(u2/u1));
	if (radix == e0) {
		std::cout << "Radix confirmed.";
	} else {
	std::cout << "MYSTERY: recalculated Radix = "
		<< std::setprecision(8) << radix;
	}

	if (radix>(eight+eight)) {
		g_error_count[Defect]+=1;
		std::cout << print_error(Defect,
			"Radix is too big: roundoff problems");
	}

	if ((radix!=two) && (radix!=10) && (radix!=one)) {
		g_error_count[Flaw]+=1;
		std::cout << print_error(Flaw,
			"Radix is not as good as 2 or 10");
	}

	std::cout << std::endl;
	
	m10_result_t result {};
	result.radix=radix; result.precision=precision;
	result.u1=u1; result.u2=u2; result.f9=f9; result.w=w;
	return result;
}

//
// Replaces the following section in the body of main():
//
	//TstCond (Failure, (Nine == Three * Three)
	//	   && (TwentySeven == Nine * Three) && (Eight == Four + Four)
	//	   && (ThirtyTwo == Eight * Four)
	//	   && (ThirtyTwo - TwentySeven - Four - One == Zero),
	//	   "9 != 3*3, 27 != 9*3, 32 != 8*4, or 32-27-4-1 != 0");
	//TstCond (Failure, (Five == Four + One) &&
	//		(TwoForty == Four * Five * Three * Four)
	//	   && (TwoForty / Three - Four * Four * Five == Zero)
	//	   && ( TwoForty / Four - Five * Three * Four == Zero)
	//	   && ( TwoForty / Five - Four * Three * Four == Zero),
	//	  "5 != 4+1, 240/3 != 80, 240/4 != 60, or 240/5 != 48");
	//if (ErrCnt[Failure] == 0) {
	//	printf("-1, 0, 1/2, 1, 2, 3, 4, 5, 9, 27, 32 & 240 are O.K.\n");
	//	printf("\n");
	//	}
	//printf("Searching for Radix and Precision.\n");
	//W = One;
	//do  {
	//	W = W + W;
	//	Y = W + One;
	//	Z = Y - W;
	//	Y = Z - One;
	//	} while (MinusOne + std::fabs(Y) < Zero);
	///*.. now W is just big enough that |((W+1)-W)-1| >= 1 ...*/
	//Precision = Zero;
	//Y = One;
	//do  {
	//	Radix = W + Y;
	//	Y = Y + Y;
	//	Radix = Radix - W;
	//	} while ( Radix == Zero);
	//if (Radix < Two) Radix = One;
	//printf("Radix = %f .\n", Radix);
	//if (Radix != 1) {
	//	W = One;
	//	do  {
	//		Precision = Precision + One;
	//		W = W * Radix;
	//		Y = W + One;
	//		} while ((Y - W) == One);
	//	}
	///*... now W == Radix^Precision is barely too big to satisfy (W+1)-W == 1
	//		                              ...*/
	//U1 = One / W;
	//U2 = Radix * U1;
	//printf("Closest relative separation found is U1 = %.7e .\n\n", U1);
	//printf("Recalculating radix and precision\n ");
	//
	///*save old values*/
	//E0 = Radix;
	//E1 = U1;
	//E9 = U2;
	//E3 = Precision;
	//
	//X = Four / Three;
	//Third = X - One;
	//F6 = Half - Third;
	//X = F6 + F6;
	//X = std::fabs(X - Third);
	//if (X < U2) X = U2;
	//
	///*... now X = (unknown no.) ulps of 1+...*/
	//do  {
	//	U2 = X;
	//	Y = Half * U2 + ThirtyTwo * U2 * U2;
	//	Y = One + Y;
	//	X = Y - One;
	//	} while ( ! ((U2 <= X) || (X <= Zero)));
	//
	///*... now U2 == 1 ulp of 1 + ... */
	//X = Two / Three;
	//F6 = X - Half;
	//Third = F6 + F6;
	//X = Third - Half;
	//X = std::fabs(X + F6);
	//if (X < U1) X = U1;
	//
	///*... now  X == (unknown no.) ulps of 1 -... */
	//do  {
	//	U1 = X;
	//	Y = Half * U1 + ThirtyTwo * U1 * U1;
	//	Y = Half - Y;
	//	X = Half + Y;
	//	Y = Half - X;
	//	X = Half + Y;
	//	} while ( ! ((U1 <= X) || (X <= Zero)));
	///*... now U1 == 1 ulp of 1 - ... */
	//if (U1 == E1) printf("confirms closest relative separation U1 .\n");
	//else printf("gets better closest relative separation U1 = %.7e .\n", U1);
	//W = One / U1;
	//F9 = (Half - U1) + Half;
	//Radix = std::floor(0.01 + U2 / U1);
	//if (Radix == E0) printf("Radix confirmed.\n");
	//else printf("MYSTERY: recalculated Radix = %.7e .\n", Radix);
	//TstCond (Defect, Radix <= Eight + Eight,
	//	   "Radix is too big: roundoff problems");
	//TstCond (Flaw, (Radix == Two) || (Radix == 10)
	//	   || (Radix == One), "Radix is not as good as 2 or 10");
