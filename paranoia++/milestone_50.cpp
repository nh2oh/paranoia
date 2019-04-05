#include "paranoiapp.h"
#include <iostream>
#include <string>
#include <cmath>  // std::floor()


//
//
// Sets globals:  X,Y,Z,S,T,Q,RAddSub,StickyBit
// 
// First use of...
//     X,Y,Z, milestone 60, reset before use
//     Q, milestone 70, reset before use
//     S, milestone 110, reset before use
//     T, appears to never be used again
//     RAddSub,StickyBit milestone 220, *not* reset before use
//
// Reads, but does not set:  BMinusU2,U1,U2,F9,Radix,RadixD2
// 
m50_result_t milestone_50(double b_minus_u2, double u1, double u2, double f9, double radix, double radix_d2,
						rounding_t r_add_sub, rounding_t r_mult, rounding_t r_div,
						int g_add_sub, int g_mult, int g_div) {
	double zero = 0;
	double one = 1;
	double two = one+one;
	double three = two+one;
	double nine = three*three;
	double half = one/two;
	double one_and_half = 1.5;


	if (((f9+u1)-half != half) || ((b_minus_u2+u2)-one != radix-one)) {
		g_error_count[Failure] += 1;
		std::cout << print_error(Failure,"Incomplete carry-propagation in Addition") << std::endl;
	}
	//TstCond (Failure, ((f9+u1)-half==half) && ((b_minus_u2+u2)-one==radix-one),
	//	"Incomplete carry-propagation in Addition");


	double x = one - u1*u1;
	double y = one + u2*(one-u2);
	double z = f9-half;
	x = (x-half)-z;
	y = y-one;
	if ((x==zero) && (y==zero)) {
		rounding_t r_add_sub = rounding_t::chopped;
		std::cout << "Add/Subtract appears to be chopped.\n";
	}


	// TODO:  For the case(s) where "Addition/Subtraction neither rounds nor chops.\n" is
	// printed, should not r_add_sub be set to rounding_t::other ???
	if (g_add_sub==1) {
		x = (half+u2)*u2;
		y = (half-u2)*u2;
		x = one+x;
		y = one+y;
		x = (one+u2)-x;
		y = one-y;
		if ((x==zero) && (y==zero)) {
			x = (half + u2)*u1;
			y = (half-u2)*u1;
			x = one-x;
			y = one-y;
			x = f9-x;
			y = one-y;  // TODO:  Repeat of 1 line above => suspicious
			if ((x==zero) && (y==zero)) {
				r_add_sub = rounding_t::rounded;
				std::cout << "Addition/Subtraction appears to round correctly.\n";
				if (g_add_sub==0) { //if (GAddSub==No) notify("Add/Subtract");
					std::cout << "Add/Subtract test appears to be inconsistent...\n";
					std::cout << "\tPLEASE NOTIFY KARPINKSI!\n";
				}
			} else {
				std::cout << "Addition/Subtraction neither rounds nor chops.\n";
			}
		} else {
			std::cout << "Addition/Subtraction neither rounds nor chops.\n";
		}
	} else {
		std::cout << "Addition/Subtraction neither rounds nor chops.\n";
	}


	double s = one;
	x = one + half*(one+half);
	y = (one+u2)*half;
	z = x-y;
	double t = y-x;
	double sticky_bit = z + t;
	if (sticky_bit!=zero) {
		s = zero;
		g_error_count[Flaw] += 1;
		std::cout << print_error(Flaw,"(x-Y) + (y-x) is non zero!\n");
		//BadCond(Flaw, "(x-Y) + (y-x) is non zero!\n");
	}


	sticky_bit = zero;
	if ((g_mult==1) && (g_div==1) && (g_add_sub==1)
				&& (r_mult==rounding_t::rounded) && (r_div==rounding_t::rounded)
				&& (r_add_sub==rounding_t::rounded) && (std::floor(radix_d2)==radix_d2)) {
		std::cout << "Checking for sticky bit.\n";
		x = (half+u1)*u2;
		y = half*u2;
		z = one + y;
		t = one + x;
		if ((z-one <= zero) && (t-one >= u2)) {
			z = t+y;
			y = z-x;
			if ((z-t >= u2) && (y-t == zero)) {
				x = (half+u1)*u1;
				y = half*u1;
				z = one-y;
				t = one-x;
				if ((z-one==zero) && (t-f9==zero)) {
					z = (half-u1) * u1;
					t = f9-z;
					double q = f9-y;
					if ((t-f9==zero) && (f9-u1-q==zero)) {
						z = (one+u2)*one_and_half;
						t = (one_and_half+u2) - z + u2;
						x = one + half/radix;
						y = one + radix*u2;
						z = x*y;
						if (t==zero && (x+radix*u2-z==zero)) {
							if (radix!=two) {
								x = two + u2;
								y = x/two;
								if (y-one==zero) {
									sticky_bit = s;
								}
							} else {
								sticky_bit = s;
							}
						}
					}  // if ((t-f9==zero) && (f9-u1-q==zero))
				}  // if ((z-one==zero) && (t-f9==zero))
			}  // if ((z-t >= u2) && (y-t == zero))
		}  // if ((z-one <= zero) && (t-one >= u2))
	}


	if (sticky_bit==one) {
		std::cout << "Sticky bit apparently used correctly.\n";
	} else {
		std::cout << "Sticky bit used incorrectly or not at all.\n";
	}


	if (g_mult==0 || g_div==0 || g_add_sub==0
				|| r_mult==rounding_t::other || r_div==rounding_t::other 
				|| r_add_sub==rounding_t::other) {
		g_error_count[Flaw] += 1;
		std::cout << print_error(Flaw, "lack(s) of guard digits or failure(s) to correctly"
			"round or chop\n\(noted above) count as one flaw in the final tally below\n");
	}
	//TstCond (Flaw, !(g_mult==No || G_div==No || GAddSub==No ||
	//	RMult==Other || RDiv==Other || RAddSub==Other),
	//	"lack(s) of guard digits or failure(s) to correctly round or chop\n\
	//	(noted above) count as one flaw in the final tally below");


	m50_result_t result;
	result.sticky_bit = sticky_bit;
	result.r_add_sub = r_add_sub;
	return result;
}


//
// Replaces the following section in the body of main():
//
//
//TstCond (Failure, ((F9 + U1) - Half == Half)
//	&& ((BMinusU2 + U2 ) - One == Radix - One),
//	"Incomplete carry-propagation in Addition");
//X = One - U1 * U1;
//Y = One + U2 * (One - U2);
//Z = F9 - Half;
//X = (X - Half) - Z;
//Y = Y - One;
//if ((X == Zero) && (Y == Zero)) {
//	RAddSub = Chopped;
//	printf("Add/Subtract appears to be chopped.\n");
//}
//if (GAddSub == Yes) {
//	X = (Half + U2) * U2;
//	Y = (Half - U2) * U2;
//	X = One + X;
//	Y = One + Y;
//	X = (One + U2) - X;
//	Y = One - Y;
//	if ((X == Zero) && (Y == Zero)) {
//		X = (Half + U2) * U1;
//		Y = (Half - U2) * U1;
//		X = One - X;
//		Y = One - Y;
//		X = F9 - X;
//		Y = One - Y;
//		if ((X == Zero) && (Y == Zero)) {
//			RAddSub = Rounded;
//			printf("Addition/Subtraction appears to round correctly.\n");
//			if (GAddSub == No) notify("Add/Subtract");
//		}
//		else printf("Addition/Subtraction neither rounds nor chops.\n");
//	}
//	else printf("Addition/Subtraction neither rounds nor chops.\n");
//}
//else printf("Addition/Subtraction neither rounds nor chops.\n");
//S = One;
//X = One + Half * (One + Half);
//Y = (One + U2) * Half;
//Z = X - Y;
//T = Y - X;
//StickyBit = Z + T;
//if (StickyBit != Zero) {
//	S = Zero;
//	BadCond(Flaw, "(X - Y) + (Y - X) is non zero!\n");
//}
//StickyBit = Zero;
//if ((GMult == Yes) && (GDiv == Yes) && (GAddSub == Yes)
//	&& (RMult == Rounded) && (RDiv == Rounded)
//	&& (RAddSub == Rounded) && (std::floor(RadixD2) == RadixD2)) {
//	printf("Checking for sticky bit.\n");
//	X = (Half + U1) * U2;
//	Y = Half * U2;
//	Z = One + Y;
//	T = One + X;
//	if ((Z - One <= Zero) && (T - One >= U2)) {
//		Z = T + Y;
//		Y = Z - X;
//		if ((Z - T >= U2) && (Y - T == Zero)) {
//			X = (Half + U1) * U1;
//			Y = Half * U1;
//			Z = One - Y;
//			T = One - X;
//			if ((Z - One == Zero) && (T - F9 == Zero)) {
//				Z = (Half - U1) * U1;
//				T = F9 - Z;
//				Q = F9 - Y;
//				if ((T - F9 == Zero) && (F9 - U1 - Q == Zero)) {
//					Z = (One + U2) * OneAndHalf;
//					T = (OneAndHalf + U2) - Z + U2;
//					X = One + Half / Radix;
//					Y = One + Radix * U2;
//					Z = X * Y;
//					if (T == Zero && X + Radix * U2 - Z == Zero) {
//						if (Radix != Two) {
//							X = Two + U2;
//							Y = X / Two;
//							if ((Y - One == Zero)) StickyBit = S;
//						}
//						else StickyBit = S;
//					}
//				}
//			}
//		}
//	}
//}
//if (StickyBit == One) printf("Sticky bit apparently used correctly.\n");
//else printf("Sticky bit used incorrectly or not at all.\n");
//TstCond (Flaw, !(GMult == No || GDiv == No || GAddSub == No ||
//	RMult == Other || RDiv == Other || RAddSub == Other),
//	"lack(s) of guard digits or failure(s) to correctly round or chop\n\
//(noted above) count as one flaw in the final tally below");





