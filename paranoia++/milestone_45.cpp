#include "paranoiapp.h"
#include <iostream>
#include <string>

//
// Rounding RMult, RDiv, RAddSub, RSqrt;   Type is 'Rounding'
//     Rounding == (Chopped, Rounded, Other);
//     #define Chopped 2;  #define Rounded 1;  #define Other 0
//     Replaced here with enum class rounding_t
//
// Sets globals:  X,Y,Z,T,Y1,Y2
//                RDiv  ** may depend on the initial value RDiv**
//                BInvrse
// 
// First use of...
//     X,Y,Z,T, milestone 50, reset before use
//     Y1,Y2, milestone 85+later, *appear* to be reset before use...
//     
//     RDiv, milestone 50, does not reset before use
//     BInvrse, milestone 70, does not reset before use
//
// Reads, but does not set:  U1,U2,F9,Radix,g_div
// 
m45_result_t milestone_45(double radix, double u1, double u2, double f9, int g_div, rounding_t r_div) {
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
		if ((x==zero) && (y==zero) && (x==zero) && (t==zero) && (y2==zero) 
					&& ((y1-half)==(f9-half))) {
			r_div = rounding_t::rounded;  //RDiv = Rounded;
			std::cout << "Division appears to round correctly.\n";
			if (g_div == 0) {
				std::cout << "Division test appears to be inconsistent...\n";
				std::cout << "\tPLEASE NOTIFY KARPINKSI!\n";
			}
		} else if ((x<zero) && (y<zero) && (z<zero) && (t<zero) && (y2<zero) 
					&& ((y1-half) < (f9-half))) {
			r_div = rounding_t::chopped;  //RDiv = Chopped;
			std::cout << "Division appears to chop.\n";
		}
	}

	// if (RDiv == Other)
	if (r_div == rounding_t::other) {
		std::cout << "/ is neither chopped nor correctly rounded.\n";
	}
	
	double b_inverse = one/radix;  //BInvrse = One / Radix;
	if ((b_inverse*radix - half) != half) {
		g_error_count[Failure] += 1;
		std::cout << "Radix*(1/Radix ) differs from 1\n";
		//TstCond (Failure, (BInvrse * Radix - Half == Half),
		//	"Radix * ( 1 / Radix ) differs from 1");
	}

	m45_result_t result;
	result.r_div = r_div;
	result.b_inverse = b_inverse;
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



//
// From the Basic version:
//
//2470 L=45 : ' ================================================================
//2480 Y2=O1+U2 :Y1=O1-U2 : Z=T5+U2+U2 : X=Z/Y2 : T=T5-U2-U2 : Y=(T-U2)/Y1 : Z=(Z+U2)/Y2 : X=X-T5 : Y=Y-T : T=T/Y1 : Z=Z-(T5+U2) : T=(U2-T5)+T : IF ( X>O OR Y>O OR Z>O OR T>O ) THEN 2540
//2490 X=T5/Y2 : Y=T5-U2 : Z=T5+U2 : X=X-Y : T=T5/Y1 : Y=Y/Y1 : T=T-(Z+U2) : Y=Y-Z : Z=Z/Y2 : Y1=(Y2+U2)/Y2 : Z=Z-T5 : Y2=Y1-Y2 : Y1=(F9-U1)/F9 : IF ( X=O AND Y=O AND Z=O AND T=O AND Y2=O AND Y1-F2=F9-F2 ) THEN R2=O1
//2500 IF ( X<O AND Y<O AND Z<O AND T<O AND Y2<O AND Y1-F2<F9-F2 ) THEN R2=O
//	2510 IF (R2=O) THEN PRINT "  R2=0:";D$;E$;C$;"."
//	2520 IF (R2=O1) THEN PRINT "  R2=1:";D$;E$;B$
//	2530 IF (R2-G2=O1) THEN PRINT F$;D$;P$
//	2540 IF (R2=F1) THEN PRINT D$;H$;C$;" nor ";B$
//	2550 B1=O1/B : IF (B1*B-F2=F2) THEN 2580
//	2560 J0=J0+1
//	2570 PRINT F$;"  B*(1/B)  differs from  1."
//
//

