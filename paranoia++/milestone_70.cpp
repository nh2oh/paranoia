#include "paranoiapp.h"
#include <iostream>
#include <string>
#include <cmath>

//
//
// Sets globals:  
// 
// First use of...
//     
//
// Reads, but does not set:  
// 
//
// Calls sq_x_minx(int,double,double,double,,double,double,double), which replaces
//   void SqXMinX (int):  reads X,J,BInvrse,OneUlp,MinSqEr,MaxSqEr; sets J,SqErr,MinSqEr,MaxSqEr
//
//
//
void milestone_70(int num_trials, double u1, double u2, double radix,
				double b_inverse, double b_minus_u2) {
	double zero = 0;
	double one = 1;
	double two = one+one;
	double three = two+one;
	double nine = three*three;
	double half = one/two;
	double one_and_half = 1.5;


	std::cout << "\nRunning test of square root(x).\n";
	if ((zero!=std::sqrt(zero)) || ((-zero)!=std::sqrt(- zero))
				|| (one!=std::sqrt(one))) {
		g_error_count[Failure] += 1;
		std::cout << print_error(Failure, "Square root of 0.0, -0.0 or 1.0 wrong\n");
	}
	//TstCond (Failure, (zero == std::sqrt(zero))
	//	&& (- zero == std::sqrt(- zero))
	//	&& (one == std::sqrt(one)), "Square root of 0.0, -0.0 or 1.0 wrong");
	
	double min_sq_err = zero;
	double max_sq_err = zero;
	double j = zero;
	double x = radix;
	double one_ulp = u2;
	auto sxmx_res = sq_x_minx(Serious,x,j,b_inverse,one_ulp,min_sq_err,max_sq_err);
	x = b_inverse;
	one_ulp = b_inverse*u1;
	// TODO:  Need to obtain new inputs from sxmx_res
	sq_x_minx(Serious,x,j,b_inverse,one_ulp,min_sq_err,max_sq_err);  // Reads X,J,BInvrse,OneUlp,MinSqEr,MaxSqEr; sets J,SqErr,MinSqEr,MaxSqEr
	x = u1;
	one_ulp = u1*u1;
	// TODO:  Need to obtain new inputs from sxmx_res
	sq_x_minx(Serious,x,j,b_inverse,one_ulp,min_sq_err,max_sq_err);
	if (j != zero) { 
		Pause();
	}
	std::cout << "Testing if sqrt(x*x)==x for " << std::to_string(num_trials) << " Integers x.\n";
	j = zero;
	x = two;
	double y = radix;
	if (radix!=one) {
		do {
			x = y;
			y = radix*y;
		} while (!((y-x >= num_trials)));
	}
	one_ulp = x*u2;
	int i = 1;
	while (i<=num_trials) {
		x = x + one;
		sq_x_minx(Defect,x,j,b_inverse,one_ulp,min_sq_err,max_sq_err);  // TODO:  Need to obtain new inputs from sxmx_res
		if (j > zero) { break; }
		i = i + 1;
	}
	printf("Test for sqrt monotonicity.\n");
	i = -1;
	x = b_minus_u2;
	y = radix;
	double z = radix + radix * u2;
	int not_monot = 0;  // = False;
	int monot = 0;  // = False;
	double q {0.0};
	while (!(not_monot || monot)) {
		i = i + 1;
		x = std::sqrt(x);
		q = std::sqrt(y);
		z = std::sqrt(z);
		if ((x>q) || (q>z)) {
			not_monot = 1;  //True;
		} else {
			q = std::floor(q+half);
			if (!(i>0 || radix==q*q)) { 
				monot = 1;  //True;
			} else if (i>0) {
				if (i > 1) {
					monot = 1;  //True;
				} else {
					y = y*b_inverse;
					x = y-u1;
					z = y+u1;
				}
			} else {
				y = q;
				x = y-u2;
				z = y+u2;
			}
		}
	}

	if (monot) {
		printf("sqrt has passed a test for monotonicity.\n");
	} else {
		BadCond(Defect, "");
		printf("sqrt(x) is non-monotonic for x near %.7e .\n", Y);
	}

}


//
// Replaces the following section in the body of main():
//
//
//
//printf("\nRunning test of square root(x).\n");
//TstCond (Failure, (Zero == std::sqrt(Zero))
//	&& (- Zero == std::sqrt(- Zero))
//	&& (One == std::sqrt(One)), "Square root of 0.0, -0.0 or 1.0 wrong");
//MinSqEr = Zero;
//MaxSqEr = Zero;
//J = Zero;
//X = Radix;
//OneUlp = U2;
//SqXMinX (Serious);
//X = BInvrse;
//OneUlp = BInvrse * U1;
//SqXMinX (Serious);
//X = U1;
//OneUlp = U1 * U1;
//SqXMinX (Serious);
//if (J != Zero) Pause();
//printf("Testing if sqrt(X * X) == X for %d Integers X.\n", NoTrials);
//J = Zero;
//X = Two;
//Y = Radix;
//if ((Radix != One)) do  {
//	X = Y;
//	Y = Radix * Y;
//} while ( ! ((Y - X >= NoTrials)));
//OneUlp = X * U2;
//I = 1;
//while (I <= NoTrials) {
//	X = X + One;
//	SqXMinX (Defect);
//	if (J > Zero) break;
//	I = I + 1;
//}
//printf("Test for sqrt monotonicity.\n");
//I = - 1;
//X = BMinusU2;
//Y = Radix;
//Z = Radix + Radix * U2;
//NotMonot = False;
//Monot = False;
//while ( ! (NotMonot || Monot)) {
//	I = I + 1;
//	X = std::sqrt(X);
//	Q = std::sqrt(Y);
//	Z = std::sqrt(Z);
//	if ((X > Q) || (Q > Z)) NotMonot = True;
//	else {
//		Q = std::floor(Q + Half);
//		if (!(I > 0 || Radix == Q * Q)) Monot = True;
//		else if (I > 0) {
//			if (I > 1) Monot = True;
//			else {
//				Y = Y * BInvrse;
//				X = Y - U1;
//				Z = Y + U1;
//			}
//		}
//		else {
//			Y = Q;
//			X = Y - U2;
//			Z = Y + U2;
//		}
//	}
//}
//if (Monot) printf("sqrt has passed a test for Monotonicity.\n");
//else {
//	BadCond(Defect, "");
//	printf("sqrt(X) is non-monotonic for X near %.7e .\n", Y);
//}
//

