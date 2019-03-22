#include "paranoiapp.h"
#include <iostream>
#include <string>
#include <array>

//
//
//
//
void milestone_7() {
	double zero = 0;
	double one = 1;
	double two = one+one;
	double three = two + one;
	double four = three + one;
	double minus_one = -one;
	double half = one/two;

	if ((zero+zero!=zero) || (one-one!=zero) || (one<=zero) || (one+one!=two)) {
		g_error_count[Failure]+=1;
		std::cout << print_error(Failure,"0+0 != 0, 1-1 != 0, 1 <= 0, or 1+1 != 2");
	}

	double z = -zero;
	if (z!=0.0) {
		g_error_count[Failure] += 1;
		printf("Comparison alleges that -0.0 is Non-zero!\n");
		double u2 = 0.001;  double radix = 1;
		test_partial_underflow(z,u2,radix);
		// Old:  U2 = 0.001; Radix = 1;	TstPtUf();
	}

	if ((three!=(two+one)) || (four!=(three+one)) 
				|| ((four+(two*(-two)))!=zero) || ((four-three-one)!=zero)) {
		g_error_count[Failure] += 1;
		std::cout << print_error(Failure,
			"3 != 2+1, 4 != 3+1, 4+2*(-2) != 0, or 4-3-1 != 0");
	}

	if ((minus_one!=(0-one)) || (minus_one+one!=zero) || (one+minus_one!=zero)
				|| (minus_one + std::fabs(one)!=zero)
				|| (minus_one+minus_one*minus_one != zero)) {
		g_error_count[Failure] += 1;
		std::cout << print_error(Failure,
			"-1+1 != 0, (-1)+abs(1) != 0, or -1+(-1)*(-1) != 0");
	}

	if (half+minus_one+half!=zero) {
		g_error_count[Failure] += 1;
		std::cout << print_error(Failure,"1/2 + (-1) + 1/2 != 0");
	}

	std::cout << std::endl;
}

//
// Replaces the following section in the body of main():
//

	///*=============================================*/
	//Milestone = 7;
	///*=============================================*/
	//std::cout << "Program is now RUNNING tests on small integers:" << std::endl;
	//
	//if ((Zero+Zero!=Zero) || (One-One!=Zero) || (One<=Zero) || (One+One!=Two)) {
	//	g_error_count[Failure]+=1;
	//	std::cout << print_error(Failure,"0+0 != 0, 1-1 != 0, 1 <= 0, or 1+1 != 2");
	//}

	////TstCond (Failure, (Zero + Zero == Zero) && (One - One == Zero)
	////	   && (One > Zero) && (One + One == Two),
	////		"0+0 != 0, 1-1 != 0, 1 <= 0, or 1+1 != 2");
	//Z = - Zero;
	//if (Z != 0.0) {
	//	ErrCnt[Failure] = ErrCnt[Failure] + 1;
	//	printf("Comparison alleges that -0.0 is Non-zero!\n");
	//	U2 = 0.001;
	//	Radix = 1;
	//	TstPtUf();
	//	}
	//TstCond (Failure, (Three == Two + One) && (Four == Three + One)
	//	   && (Four + Two * (- Two) == Zero)
	//	   && (Four - Three - One == Zero),
	//	   "3 != 2+1, 4 != 3+1, 4+2*(-2) != 0, or 4-3-1 != 0");
	//TstCond (Failure, (MinusOne == (0 - One))
	//	   && (MinusOne + One == Zero ) && (One + MinusOne == Zero)
	//	   && (MinusOne + std::fabs(One) == Zero)
	//	   && (MinusOne + MinusOne * MinusOne == Zero),
	//	   "-1+1 != 0, (-1)+abs(1) != 0, or -1+(-1)*(-1) != 0");
	//TstCond (Failure, Half + MinusOne + Half == Zero,
	//	  "1/2 + (-1) + 1/2 != 0");





