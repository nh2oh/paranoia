#include "paranoiapp.h"
#include <iostream>
#include <string>
#include <cmath>
#include <iomanip>  // std::setprecision()

//
// Sets globals:  X,Y,Z,T,R;  GMult,GDiv,GAddSub;  StickyBit
// Reads, but does not set:  F9,U1,U2,W,Radix,BMinusU2
//
// First use of...
//     X, milestone 40, reset to Radix
//     Y, milestone 40, reset to Ainverse
//     Z, milestone 40, reset to X * Y - Half;
//     T, milestone 40, reset to Y * Y1;
//     R, milestone 120, reset to H+H || std::sqrt(Underflow/UfThold);
//         Both conditional on UfNGrad
//      , milestone 140, reset to Y + Q;  unconditional
//     Appears that the value of R set here in 35 is not important
// 
//     StickyBit, milestone 40, reset to Y * Y1;
//         Conditional on ((X == Zero) && (Y == Zero) && (Z == Zero) && (T <= Zero))
//     StickyBit, milestone 50, reset to Z + T;
//         Unconditional
//     Thus it appears that the state of StickyBit as set in milestone_35() is not
//     important.  
//
//     GMult is required by milestone 40
//     GDiv is required conditionally in milestone 45
//     GAddSub is required by milestone 50
//
m35_result_t milestone_35(double radix, double u1, double u2, double f9, double w, double b_minus_u2) {
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

	if (radix>=two) {
		double x = w/(radix*radix);
		double y = x+one;
		double z = y-x;
		double t = z+u2;
		x = t-z;
		if (x!=u2) {
			g_error_count[Failure] += 1;
			std::cout << print_error(Failure,
				"Subtraction is not normalized X=Y,X+Z != Y+Z!");
		} else {
			std::cout << "Subtraction appears to be normalized, as it should be.";
		}
	}


	std::cout << "\nChecking for guard digit in *, /, and -.\n";
	double y = f9*one;
	double z = one*f9;
	double x = f9-half;
	y = (y-half)-x;
	z = (z-half)-x;
	x = one+u2;
	double t = x*radix;
	double r = radix*x;
	x = t-radix;
	x = x-radix*u2;
	t = r-radix;
	t = t-radix*u2;
	x = x*(radix-one);
	t = t*(radix-one);
	int g_mult;
	if ((x==zero) && (y==zero) && (z==zero) && (t==zero)) {
		g_mult = 1;  // "yes"
	} else {
		g_mult = 0; // "no"
		g_error_count[Serious] += 1;
		std::cout << print_error(Serious, "* lacks a Guard Digit, so 1*X != X");
	}


	z = radix*u2;
	x = one+z;
	y = std::fabs((x+z)-x*x)-u2;
	x = one-u2;
	z = std::fabs((x-u2)-x*x)-u1;
	if ((y>zero) || (z>zero)) {
		g_error_count[Failure] += 1;
		std::cout << print_error(Failure, "* gets too many final digits wrong.\n");
	}


	y = one-u2;
	x = one+u2;
	z = one/y;
	y = z-x;
	x = one/three;
	z = three/nine;
	x = x-x;
	t = nine/twenty_seven;
	z = z-t;
	if ((x!=zero) || (y!=zero) || (z!=zero)) {
		g_error_count[Defect] += 1;
		std::cout << print_error(Defect, "Division lacks a Guard Digit, so error can exceed 1 ulp\nor  1/3  and  3/9  and  9/27 may disagree");
	}
	

	y = f9/one;
	x = f9-half;
	y = (y-half)-x;
	x = one+u2;
	t = x/one;
	x = t-x;
	int g_div;
	if ((x==zero) && (y==zero) && (z==zero)) {
		g_div = 1; // "Yes"
	} else {
		g_div = 0; // "no"
		g_error_count[Serious] += 1;
		std::cout << print_error(Serious, "Division lacks a Guard Digit, so X/1 != X");
	}


	x = one/(one+u2);
	y = x-half-half;
	if (y>=zero) {
		g_error_count[Serious] += 1;
		std::cout << print_error(Serious, "Computed value of 1/1.000..1 >= 1");
	}


	x = one-u2;
	y = one + radix*u2;
	z = x*radix;
	t = y*radix;
	r = z/radix;
	double sticky_bit = t/radix;
	x = r-x;
	y = sticky_bit - y;
	if ((x!=zero) || (y!=zero)) {
		g_error_count[Failure] += 1;
		std::cout << print_error(Failure, "* and/or / gets too many last digits wrong");
	}
	//TstCond (Failure, X == Zero && Y == Zero,
	//		"* and/or / gets too many last digits wrong");


	y = one-u1;
	x = one-f9;
	y = one-y;
	t = radix-u2;
	z = radix-b_minus_u2;
	t = radix-t;
	int g_add_sub {0};
	if ((x==u1) && (y==u1) && (z==u2) && (t==u2)) {
		g_add_sub = 1;  // "yes"
	} else {
		g_add_sub = 0;  // "no"
		g_error_count[Serious] += 1;
		std::cout << print_error(Serious, "- lacks Guard Digit, so cancellation is obscured");
		//TstCond (Serious, False,
		//	"- lacks Guard Digit, so cancellation is obscured");
	}
	if ((f9!=one) && ((f9-one)>=zero)) {
		//BadCond(Serious, "comparison alleges  (1-U1) < 1  although\n");
		g_error_count[Serious] += 1;
		std::cout << print_error(Serious, "comparison alleges: (1-u1)<1, although\n"
			"\tsubtraction yields (1-u1)-1==0, thereby vitiating\n"
			"\tsuch precautions against division by zero as\n"
			"\t...  if (X == 1.0) {.....} else {.../(X-1.0)...}\n");
	}
	
	if (g_mult == 1 && g_div == 1 && g_add_sub == 1) {
		std::cout << "*, /, and - appear to have guard digits, as they should.\n";
	}
	std::cout << std::endl;
	//if (GMult == Yes && GDiv == Yes && GAddSub == Yes) printf(
	//	"     *, /, and - appear to have guard digits, as they should.\n");

	m35_result_t result;
	result.g_add_sub = g_add_sub;
	result.g_div = g_div;
	result.g_mult = g_mult;

	return result;
}

//
// Replaces the following section in the body of main():
//

//
//if (Radix >= Two) {
//		X = W / (Radix * Radix);
//		Y = X + One;
//		Z = Y - X;
//		T = Z + U2;
//		X = T - Z;
//		TstCond (Failure, X == U2,
//			"Subtraction is not normalized X=Y,X+Z != Y+Z!");
//		if (X == U2) printf(
//			"Subtraction appears to be normalized, as it should be.");
//		}
//	printf("\nChecking for guard digit in *, /, and -.\n");
//	Y = F9 * One;
//	Z = One * F9;
//	X = F9 - Half;
//	Y = (Y - Half) - X;
//	Z = (Z - Half) - X;
//	X = One + U2;
//	T = X * Radix;
//	R = Radix * X;
//	X = T - Radix;
//	X = X - Radix * U2;
//	T = R - Radix;
//	T = T - Radix * U2;
//	X = X * (Radix - One);
//	T = T * (Radix - One);
//	if ((X == Zero) && (Y == Zero) && (Z == Zero) && (T == Zero)) GMult = Yes;
//	else {
//		GMult = No;
//		TstCond (Serious, False,
//			"* lacks a Guard Digit, so 1*X != X");
//		}
//	Z = Radix * U2;
//	X = One + Z;
//	Y = std::fabs((X + Z) - X * X) - U2;
//	X = One - U2;
//	Z = std::fabs((X - U2) - X * X) - U1;
//	TstCond (Failure, (Y <= Zero)
//		   && (Z <= Zero), "* gets too many final digits wrong.\n");
//	Y = One - U2;
//	X = One + U2;
//	Z = One / Y;
//	Y = Z - X;
//	X = One / Three;
//	Z = Three / Nine;
//	X = X - Z;
//	T = Nine / TwentySeven;
//	Z = Z - T;
//	TstCond(Defect, X == Zero && Y == Zero && Z == Zero,
//		"Division lacks a Guard Digit, so error can exceed 1 ulp\n\
//or  1/3  and  3/9  and  9/27 may disagree");
//	Y = F9 / One;
//	X = F9 - Half;
//	Y = (Y - Half) - X;
//	X = One + U2;
//	T = X / One;
//	X = T - X;
//	if ((X == Zero) && (Y == Zero) && (Z == Zero)) GDiv = Yes;
//	else {
//		GDiv = No;
//		TstCond (Serious, False,
//			"Division lacks a Guard Digit, so X/1 != X");
//		}
//	X = One / (One + U2);
//	Y = X - Half - Half;
//	TstCond (Serious, Y < Zero,
//		   "Computed value of 1/1.000..1 >= 1");
//	X = One - U2;
//	Y = One + Radix * U2;
//	Z = X * Radix;
//	T = Y * Radix;
//	R = Z / Radix;
//	StickyBit = T / Radix;
//	X = R - X;
//	Y = StickyBit - Y;
//	TstCond (Failure, X == Zero && Y == Zero,
//			"* and/or / gets too many last digits wrong");
//	Y = One - U1;
//	X = One - F9;
//	Y = One - Y;
//	T = Radix - U2;
//	Z = Radix - BMinusU2;
//	T = Radix - T;
//	if ((X == U1) && (Y == U1) && (Z == U2) && (T == U2)) GAddSub = Yes;
//	else {
//		GAddSub = No;
//		TstCond (Serious, False,
//			"- lacks Guard Digit, so cancellation is obscured");
//		}
//	if (F9 != One && F9 - One >= Zero) {
//		BadCond(Serious, "comparison alleges  (1-U1) < 1  although\n");
//		printf("  subtraction yields  (1-U1) - 1 = 0 , thereby vitiating\n");
//		printf("  such precautions against division by zero as\n");
//		printf("  ...  if (X == 1.0) {.....} else {.../(X-1.0)...}\n");
//		}
//	if (GMult == Yes && GDiv == Yes && GAddSub == Yes) printf(
//		"     *, /, and - appear to have guard digits, as they should.\n");
//
//

