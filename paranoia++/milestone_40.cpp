#include "paranoiapp.h"
#include <iostream>
#include <string>
#include <cmath>  // std::floor()

//
// Rounding RMult, RDiv, RAddSub, RSqrt;   Type is 'Rounding'
//     Rounding == (Chopped, Rounded, Other);
//     #define Chopped 2;  #define Rounded 1;  #define Other 0
//     Replaced here with enum class rounding_t
//
// Sets globals:  X,Y,Z,Y1,Y2,T,S
//                StickyBit (conditionally)
//                RMult, RDiv, RAddSub;
//                RRadixD2
//                A1, AInverse
//                Done
//                TODO:  Although r_div, r_add_sub are _initialized_ here, they are
//                   not subsequently modified by the routine; i can move their initializations
//                   to the routine where they are set, and i do not have to return them.  
//                TODO: radix_d2 is just set to radix/2
// 
// First use of...
//     X,Y,Z,Y1,Y2,T, milestone 45, all reset before use
//     S, milestone 50, reset before use
//     StickyBit, milestone 50, reset before use
//     Done is never used subsequent to milestone 40
//
//     RMult,RDiv,RAddSub,RadixD2, REQUIRED by milestone 50
//     A1, REQUIRED by milestone 85
//     AInvrse, REQUIRED by milestone 90
//     TODO:  Both these uses (A1,AInvrse) are suspicious; compare w/ basic version.
//
// Reads, but does not set:  radix, U2, GMult
//     
//
//
m40_result_t milestone_40(double radix, double u2, int g_mult) {
	double zero = 0;
	double one = 1;
	double two = one+one;
	double three = two+one;
	double nine = three*three;
	double half = one/two;
	double one_and_half = 1.5;

	std::cout << "Checking rounding on multiply, divide and add/subtract.\n";

	rounding_t r_mult {rounding_t::other}; //RMult = Other;
	rounding_t r_div {rounding_t::other}; // RDiv = Other;
	rounding_t r_add_sub {rounding_t::other}; //RAddSub = Other;
	double radix_d2 = radix/two; //RadixD2 = Radix / Two;
	double a1 = two;  //A1 = Two;
	int done {0};  //Done = False;
	double a_inverse {0.0};
	double x {0.0};
	do {
		a_inverse = radix; //AInvrse = Radix;
		do {
			x = a_inverse; //X = AInvrse;
			a_inverse = a_inverse/a1;  //AInvrse = AInvrse / A1;
		} while (!(std::floor(a_inverse)!=a_inverse));
		done = ((x==one) || (a1>three));
		if (!done) {
			a1 = nine + one;
		}
	} while (!(done));


	if (x==one) {
		a1 = radix;
	}
	a_inverse = one/a1; //AInvrse = One / A1;
	x = a1; //X = A1;
	double y = a_inverse; //Y = AInvrse;
	done = 0; //Done = False;
	double z {0.0};
	do {
		z = x*y - half;  //Z = X * Y - Half;
		if (z!=half) {
			g_error_count[Failure] += 1;
			std::cout << print_error(Failure,"x*(1/x) differs from 1\n");
		}
		//TstCond (Failure, Z == Half,"X * (1/X) differs from 1");
		done = (x==radix); //Done = X == Radix;
		x = radix; //X = Radix;
		y = one/x; //Y = One / X;
	} while (!(done));


	double y2 = one + u2;  //Y2 = One + U2;
	double y1 = one - u2;  //Y1 = One - U2;
	x = one_and_half - u2;  //X = OneAndHalf - U2;
	y = one_and_half + u2;  //Y = OneAndHalf + U2;
	z = (x-u2)*y2;  //Z = (X - U2) * Y2;
	double t = y*y1;  //T = Y * Y1;
	z = z - x;  //Z = Z - X;
	t = t - x;  //T = T - X;
	x = x*y2;  //X = X * Y2;
	y = (y+u2)*y1;  //Y = (Y + U2) * Y1;
	x = x - one_and_half;  //X = X - OneAndHalf;
	y = y - one_and_half;  //Y = Y - OneAndHalf;
	double sticky_bit {0.0};
	double s {0.0};
	if ((x==zero) && (y==zero) && (z==zero) && (t<=zero)) {
		x = (one_and_half + u2)*y2;  //	X = (OneAndHalf + U2) * Y2;
		y = one_and_half - u2 - u2;
		z = one_and_half + u2 + u2;
		t = (one_and_half - u2)*y1;
		x = x - (z + u2);
		sticky_bit = y*y1;
		s = z*y2;
		t = t - y;
		y = (u2 - y) + sticky_bit;
		z = s - (z + u2 + u2);
		sticky_bit = (y2 + u2)*y1;
		y1 = y2*y1;
		sticky_bit = sticky_bit - y2;
		y1 = y1 - half;
		if ((x==zero) && (y==zero) && (z==zero) && (t==zero)
					&& (sticky_bit==zero) && (y1==half)) {
			r_mult = rounding_t::rounded;  //RMult = Rounded;
			std::cout << "Multiplication appears to round correctly.\n";
		} else if ((x+u2 == zero) && (y<zero) && (z+u2 == zero)
					&& (t<zero) && (sticky_bit+u2 == zero)
					&& (y1<half)) {
			r_mult = rounding_t::chopped;  //RMult = Chopped;
			std::cout << "Multiplication appears to chop.\n";
		} else {
			std::cout << "* is neither chopped nor correctly rounded.\n";
		}

		if ((r_mult==rounding_t::rounded) && (g_mult==0)) {
			std::cout << "Multiplication test appears to be inconsistent...\n"
				<< "\tPLEASE NOTIFY KARPINKSI!\n";
		}
		//if ((RMult == Rounded) && (GMult == No)) notify("Multiplication");
	} else {
		std::cout << "* is neither chopped nor correctly rounded.\n";
	}

	m40_result_t result;
	result.a1 = a1;
	result.a_inverse = a_inverse;
	result.radix_d2 = radix_d2;
	result.r_add_sub = r_add_sub;
	result.r_div = r_div;
	result.r_mult = r_mult;

	return result;
}


//
// Replaces the following section in the body of main():
//


//
//Pause();
//printf("Checking rounding on multiply, divide and add/subtract.\n");
//RMult = Other;
//RDiv = Other;
//RAddSub = Other;
//RadixD2 = Radix / Two;
//A1 = Two;
//Done = False;
//do  {
//	AInvrse = Radix;
//	do  {
//		X = AInvrse;
//		AInvrse = AInvrse / A1;
//	} while ( ! (std::floor(AInvrse) != AInvrse));
//	Done = (X == One) || (A1 > Three);
//	if (! Done) A1 = Nine + One;
//} while ( ! (Done));
//if (X == One) A1 = Radix;
//AInvrse = One / A1;
//X = A1;
//Y = AInvrse;
//Done = False;
//do  {
//	Z = X * Y - Half;
//	TstCond (Failure, Z == Half,
//		"X * (1/X) differs from 1");
//	Done = X == Radix;
//	X = Radix;
//	Y = One / X;
//} while ( ! (Done));
//Y2 = One + U2;
//Y1 = One - U2;
//X = OneAndHalf - U2;
//Y = OneAndHalf + U2;
//Z = (X - U2) * Y2;
//T = Y * Y1;
//Z = Z - X;
//T = T - X;
//X = X * Y2;
//Y = (Y + U2) * Y1;
//X = X - OneAndHalf;
//Y = Y - OneAndHalf;
//if ((X == Zero) && (Y == Zero) && (Z == Zero) && (T <= Zero)) {
//	X = (OneAndHalf + U2) * Y2;
//	Y = OneAndHalf - U2 - U2;
//	Z = OneAndHalf + U2 + U2;
//	T = (OneAndHalf - U2) * Y1;
//	X = X - (Z + U2);
//	StickyBit = Y * Y1;
//	S = Z * Y2;
//	T = T - Y;
//	Y = (U2 - Y) + StickyBit;
//	Z = S - (Z + U2 + U2);
//	StickyBit = (Y2 + U2) * Y1;
//	Y1 = Y2 * Y1;
//	StickyBit = StickyBit - Y2;
//	Y1 = Y1 - Half;
//	if ((X == Zero) && (Y == Zero) && (Z == Zero) && (T == Zero)
//		&& ( StickyBit == Zero) && (Y1 == Half)) {
//		RMult = Rounded;
//		printf("Multiplication appears to round correctly.\n");
//	}
//	else	if ((X + U2 == Zero) && (Y < Zero) && (Z + U2 == Zero)
//		&& (T < Zero) && (StickyBit + U2 == Zero)
//		&& (Y1 < Half)) {
//		RMult = Chopped;
//		printf("Multiplication appears to chop.\n");
//	}
//	else printf("* is neither chopped nor correctly rounded.\n");
//	if ((RMult == Rounded) && (GMult == No)) notify("Multiplication");
//}
//else printf("* is neither chopped nor correctly rounded.\n");



