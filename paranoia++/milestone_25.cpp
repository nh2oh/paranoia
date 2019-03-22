#include "paranoiapp.h"
#include <iostream>
#include <string>
#include <array>
#include <cmath>


//
// Sets globals:  BMinusU2, X, Y, Precision
//
// Both X, Y are reset before use in milestone 30.  The value for BMinusU2 set here
// is used by milestone 35
//
// V. surprising that Precision is set after it was determined in milestone_10()
//
m25_result_t milestone_25(double radix, double precision, double u1, double u2) {
	double zero = 0;
	double one = 1;
	double two = one+one;
	double three = two+one;
	double four = three+one;
	double five = four+one;
	double nine = three*three;
	double two_forty = four*five*three*four;
	double half = one/two;

	//... BMinusU2 = nextafter(radix, 0)
	double b_minus_u2 = radix-one;
	b_minus_u2 = (b_minus_u2-u2) + one;
	
	// Purify Integers
	if (radix!=one)  {
		double x = -two_forty*std::log(u1)/std::log(radix);
		double y = std::floor(half+x);
		if (std::fabs(x-y)*four < one) {
			x=y;
		}
		precision = x/two_forty;
		y = std::floor(half+precision);
		if (std::fabs(precision-y)*two_forty < half) {
			precision = y;
		}
	}

	if ((precision!=std::floor(precision)) || (radix==one)) {
		std::cout << "Precision cannot be characterized by an Integer number\n"
			<< "of significant digits but, by itself, this is a minor flaw."
			<< std::endl;
	}
	if (radix==one) {
		std::cout << "logarithmic encoding has precision characterized solely by u1.\n";
	} else {
		std::cout << "The number of significant digits of the Radix is "
			<< precision << "\n";
	}

	if (u2*nine*nine*two_forty >= one) {
		g_error_count[Serious]+=1;
		std::cout << print_error(Serious,
			"Precision worse than 5 decimal figures.");
	}

	std::cout << std::endl;

	m25_result_t result {};
	result.precision = precision;  result.b_minus_u2 = b_minus_u2;

	return result;
}

//
// Replaces the following section in the body of main():
//

	///*... BMinusU2 = nextafter(Radix, 0) */
	//BMinusU2 = Radix - One;
	//BMinusU2 = (BMinusU2 - U2) + One;
	///* Purify Integers */
	//if (Radix != One)  {
	//	X = - TwoForty * std::log(U1) / std::log(Radix);
	//	Y = std::floor(Half + X);
	//	if (std::fabs(X - Y) * Four < One) X = Y;
	//	Precision = X / TwoForty;
	//	Y = std::floor(Half + Precision);
	//	if (std::fabs(Precision - Y) * TwoForty < Half) Precision = Y;
	//	}
	//if ((Precision != std::floor(Precision)) || (Radix == One)) {
	//	printf("Precision cannot be characterized by an Integer number\n");
	//	printf("of significant digits but, by itself, this is a minor flaw.\n");
	//	}
	//if (Radix == One) 
	//	printf("logarithmic encoding has precision characterized solely by U1.\n");
	//else printf("The number of significant digits of the Radix is %f .\n",
	//		Precision);
	//TstCond (Serious, U2 * Nine * Nine * TwoForty < One,
	//	   "Precision worse than 5 decimal figures  ");

