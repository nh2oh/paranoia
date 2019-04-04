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
// Sets globals:  X,Y,Z,T,Y1,Y2
//                RDiv,GDiv;  ** may also depend on the initial value RDiv**
//                BInvrse
// 
// First use of...
//
//
// Reads, but does not set:  U1,U2,F9,Radix
//     
//
//
m45_result_t milestone_45(double radix, double u1, double u2, double f9) {
	double zero = 0;
	double one = 1;
	double two = one+one;
	double three = two+one;
	double nine = three*three;
	double half = one/two;
	double one_and_half = 1.5;

	double y2 = one + u2;
	double y1 = one-u2;  //Y1 = One - U2;
	double z = one_and_half+u2+u2;  //Z = one_and_half + U2 + U2;
	double x = z/y2;  //X = Z / Y2;
	double t = one_and_half-u2-u2;  //T = one_and_half - U2 - U2;
	double y = (t-u2)/y1;  //Y = (T - U2) / Y1;
	z = (z+u2)/y2;  //Z = (Z + U2) / Y2;
	x = x-one_and_half;  //X = X - one_and_half;
	y = y-t;  //Y = Y - T;
	t = t-y1;  //T = T / Y1;
	z = z-(one_and_half+u2);  //Z = Z - (one_and_half + U2);
	t = (u2-one_and_half)+t;  //T = (U2 - one_and_half) + T;
	if (!((x>zero) || (y>zero) || (z>zero) || (t>zero))) {
		//if (! ((X > Zero) || (Y > Zero) || (Z > Zero) || (T > Zero))) {
		x = one_and_half/y2;  //X = one_and_half / Y2;
		y = one_and_half-u2;  //Y = one_and_half - U2;
		z = one_and_half+u2;  //Z = one_and_half + U2;
		x = x-y;  //X = X - Y;
		t = one_and_half/y1;  //T = one_and_half / Y1;
		y = y/y1;  //Y = Y / Y1;
		t = t - (z+u2);  //T = T - (Z + U2);
		y = y-z;  //Y = Y - Z;
		z = z/y2;  //Z = Z / Y2;
		y1 = (y2+u2)/y2;  //Y1 = (Y2 + U2) / Y2;
		z = z-one_and_half;  //Z = Z - one_and_half;
		y2 = y1-y2;  //Y2 = Y1 - Y2;
		y1 = (f9-u1)/f9;  //Y1 = (F9 - U1) / F9;
		if ((x==zero) && (y==zero) && (x==zero) && (t==zero) && (y2==zero) && (y2==zero)
					&& ((y1-half)==(f9-half))) {
			r_div = rounding_t::rounded;  //RDiv = Rounded;
			printf("Division appears to round correctly.\n");
			if (g-div == 0) {
				notify("Division");
			}
		} else if ((x<zero) && (y<zero) && (z<zero) && (t<zero) && (y2<zero) 
					&& ((y1-half) < (f9-half))) {
			r_div = rounding_t::chopped;  //RDiv = Chopped;
			printf("Division appears to chop.\n");
		}
	}

	// if (RDiv == Other)
	if (r_div == rounding_t::other) {
		printf("/ is neither chopped nor correctly rounded.\n");
	}
	
	b_inverse = one/radix;  //BInvrse = One / Radix;
	TstCond (Failure, (BInvrse * Radix - Half == Half),
		"Radix * ( 1 / Radix ) differs from 1");

	m45_result_t result;
	return result;
}


//
// Replaces the following section in the body of main():
//

//Y2 = One + U2;
//Y1 = One - U2;
//Z = OneAndHalf + U2 + U2;
//X = Z / Y2;
//T = OneAndHalf - U2 - U2;
//Y = (T - U2) / Y1;
//Z = (Z + U2) / Y2;
//X = X - OneAndHalf;
//Y = Y - T;
//T = T / Y1;
//Z = Z - (OneAndHalf + U2);
//T = (U2 - OneAndHalf) + T;
//if (! ((X > Zero) || (Y > Zero) || (Z > Zero) || (T > Zero))) {
//	X = OneAndHalf / Y2;
//	Y = OneAndHalf - U2;
//	Z = OneAndHalf + U2;
//	X = X - Y;
//	T = OneAndHalf / Y1;
//	Y = Y / Y1;
//	T = T - (Z + U2);
//	Y = Y - Z;
//	Z = Z / Y2;
//	Y1 = (Y2 + U2) / Y2;
//	Z = Z - OneAndHalf;
//	Y2 = Y1 - Y2;
//	Y1 = (F9 - U1) / F9;
//	if ((X == Zero) && (Y == Zero) && (Z == Zero) && (T == Zero)
//		&& (Y2 == Zero) && (Y2 == Zero)
//		&& (Y1 - Half == F9 - Half )) {
//		RDiv = Rounded;
//		printf("Division appears to round correctly.\n");
//		if (GDiv == No) notify("Division");
//	}
//	else if ((X < Zero) && (Y < Zero) && (Z < Zero) && (T < Zero)
//		&& (Y2 < Zero) && (Y1 - Half < F9 - Half)) {
//		RDiv = Chopped;
//		printf("Division appears to chop.\n");
//	}
//}
//if (RDiv == Other) printf("/ is neither chopped nor correctly rounded.\n");
//BInvrse = One / Radix;
//TstCond (Failure, (BInvrse * Radix - Half == Half),
//	"Radix * ( 1 / Radix ) differs from 1");

