#include "paranoiapp.h"
#include <iostream>
#include <string>
#include <array>
#include <cmath>
#include <iomanip>  // std::setprecision()

//
// Sets globals:  X, X1, Y, Y1, Z, Z1, Z2
//
// X, Y, Z are reset in milestone 35 before first use.  
// X1, Y1, Z1, Z2 appear to be next used in milestone 85, which resets them 
// before use.  
// 
//
void milestone_30(double radix, double u1, double u2, double f9) {
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


	// Test for extra-precise subepressions
	double x = std::fabs(((four/three-one) - one/four)*three - one/four);
	double z2;
	double z1;
	do {
		z2 = x;
		x = (one + (half*z2 + thirty_two*z2*z2)) - one;
	} while (!((z2<=x) || (x<=zero)));
	
	x = std::fabs((three/four - two/three)*three - one/four);
	double y = x;
	double z = x;
	do {
		z1 = z;
		z = (one/two - ((one/two - (half*z1 + thirty_two*z1*z1))
			+ one/two)) + one/two;
	} while (!((z1<=z) || (z<=zero)));

	double y1;
	double x1;
	do {
		do {
			y1 = y;
			y = (half-((half-(half*y1 + thirty_two*y1*y1))+half))+half;
		} while (!((y1<=y) || (y<=zero)));
		x1 = x;
		x = ((half*x1 + thirty_two*x1*x1)-f9)+f9;
	} while (!((x1<=x) || (x<=zero)));

	if ((x1!=y1) || (x1!=z1)) {
		g_error_count[Serious]+=1;
		std::cout << print_error(Serious,"Disagreements among the values x1, y1, z1,\n");
		std::cout << "respectively  " << std::setprecision(8) << x1 << ", " << y1
			<< ", " << z1 << "\nare symptoms of inconsistencies introduced\n"
			<< "by extra-precise evaluation of arithmetic subexpressions.\n"
			<< "Possibly some part of this test appears to be inconsistent...\n"
			<< "   PLEASE NOTIFY KARPINKSI!"
			<< std::endl;
		if ((x1==u1) || (y1==u1) || (z1==u1)) {
			std::cout << "That feature is not tested further by this program.\n";
		}
	} else {  // else for:  if ((x1 != y1) || (x1 != z1))
		if ((z1!=u1) || (z2!=u2)) {
			if ((z1>=u1) || (z2>=u2)) {
				g_error_count[Failure]+=1;
				std::cout << print_error(Failure,"");
				std::cout << "Precision test appears to be inconsistent...\n"
					<< "   PLEASE NOTIFY KARPINKSI!\n"
					<< "\tu1 = " << u1 << ", z1-u1 = " << z1-u1
					<< "\tu2 = " << u2 << ", z2-u2 = " << z2-u2
					<< std::endl;
			} else {  // else for:  ((z1 >= u1) || (z2 >= u2))
				if ((z1<=zero) || (z2<=zero)) {
					std::cout << "Because of unusual Radix = " << radix
						<< ", or exact rational arithmetic a result\n"
						<< "z1 = " << z1 << ", or z2 = " << z2
						<< "of an\nextra-precision test appears to be inconsistent...\n"
						<< "   PLEASE NOTIFY KARPINKSI!\n"
						<< std::endl;
				}
				if ((z1!=z2) || (z1>zero)) {
					x = z1/u1;
					y = z2/u2;
					if (y>x) {
						x = y;
					}
					double Q = -std::log(x);
					std::cout << "Some subexpressions appear to be calculated extra\n"
						<< "precisely with about " << Q/std::log(radix) << " extra B-digits,"
						<< "i.e.\nroughly " << Q/std::log(radix) << " extra significant "
						<< "decimals.\n"
						<< std::endl;
				}
				std::cout << "That feature is not tested further by this program.\n";
			}
		}  // if ((z1!=u1) || (z2!=u2)) {
	}
	
}

//
// Replaces the following section in the body of main():
//

	///* Test for extra-precise subepressions */
	//x = std::fabs(((four / three - one) - one / four) * three - one / four);
	//do  {
	//	z2 = x;
	//	x = (one + (half * z2 + thirty_two * z2 * z2)) - one;
	//	} while ( ! ((z2 <= x) || (x <= Zero)));
	//x = y = Z = std::fabs((three / four - Two / three) * three - one / four);
	//do  {
	//	z1 = Z;
	//	Z = (one / Two - ((one / Two - (half * z1 + thirty_two * z1 * z1))
	//		+ one / Two)) + one / Two;
	//	} while ( ! ((z1 <= Z) || (Z <= Zero)));
	//do  {
	//	do  {
	//		y1 = y;
	//		y = (half - ((half - (half * y1 + thirty_two * y1 * y1)) + half
	//			)) + half;
	//		} while ( ! ((y1 <= y) || (y <= Zero)));
	//	x1 = x;
	//	x = ((half * x1 + thirty_two * x1 * x1) - F9) + F9;
	//	} while ( ! ((x1 <= x) || (x <= Zero)));
	//if ((x1 != y1) || (x1 != z1)) {
	//	BadCond(Serious, "Disagreements among the values x1, y1, z1,\n");
	//	printf("respectively  %.7e,  %.7e,  %.7e,\n", x1, y1, z1);
	//	printf("are symptoms of inconsistencies introduced\n");
	//	printf("by extra-precise evaluation of arithmetic subexpressions.\n");
	//	notify("Possibly some part of this");
	//	if ((x1 == u1) || (y1 == u1) || (z1 == u1))  printf(
	//		"That feature is not tested further by this program.\n") ;
	//	}
	//else  {
	//	if ((z1 != u1) || (z2 != u2)) {
	//		if ((z1 >= u1) || (z2 >= u2)) {
	//			BadCond(Failure, "");
	//			notify("Precision");
	//			printf("\tu1 = %.7e, z1 - u1 = %.7e\n",u1,z1-u1);
	//			printf("\tu2 = %.7e, z2 - u2 = %.7e\n",u2,z2-u2);
	//			}
	//		else {
	//			if ((z1 <= Zero) || (z2 <= Zero)) {
	//				printf("Because of unusual Radix = %f", Radix);
	//				printf(", or exact rational arithmetic a result\n");
	//				printf("z1 = %.7e, or z2 = %.7e ", z1, z2);
	//				notify("of an\nextra-precision");
	//				}
	//			if (z1 != z2 || z1 > Zero) {
	//				x = z1 / u1;
	//				y = z2 / u2;
	//				if (y > x) x = y;
	//				Q = - std::log(x);
	//				printf("Some subexpressions appear to be calculated extra\n");
	//				printf("precisely with about %g extra B-digits, i.e.\n",
	//					(Q / std::log(Radix)));
	//				printf("roughly %g extra significant decimals.\n",
	//					Q / std::log(10.));
	//				}
	//			printf("That feature is not tested further by this program.\n");
	//			}
	//		}
	//	}
	//Pause();



