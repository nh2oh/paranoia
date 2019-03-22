#include "paranoiapp.h"
#include <iostream>
#include <string>
#include <iomanip>  // std::setprecision()


//
// Sets globals:  N, Random1, Random2, V9, Q9, g_error_count[]
// if !(zero_in != 0), N=0 is the only global set, otherwise the other
//     globals listed above may or may not be set
// May call Pause(), which increments Milestone and PageNo
//
// I have commented out writes to sigsave and the test if(setjmp(ovfl_buf)) {...
//
void test_partial_underflow(double zero_in, double radix, double u2) {
	std::cout << std::setprecision(18);
	const double one = 1;
	const double two = 2;
	int n = 0;
	if (zero_in != 0) {
		std::cout << "Since comparison denies Z = 0, evaluating ";
		std::cout << "(Z+Z)/Z should be safe."  << std::endl;
		//sigsave = sigfpe;
		//if (setjmp(ovfl_buf)) goto very_serious;
		double q9 = (zero_in+zero_in)/zero_in;
		std::cout << "What the machine gets for (Z+Z)/Z is  " << q9 << std::endl;
		if (std::fabs(q9-two)<radix*u2) {
			std::cout << "This is O.K., provided Over/Underflow"
				<< " has NOT just been signaled.\n";
			std::cout << std::endl;
		} else {
			if ((q9<one) || (q9>two)) {
//very_serious:
				n=1;
				g_error_count[Serious] += 1;
				std::cout << "This is a VERY SERIOUS DEFECT!" << std::endl;
			} else {
				n=1;
				g_error_count[Defect] += 1;
				std::cout << "This is a DEFECT!" << std::endl;
			}
		}

		//sigsave = 0;
		double v9 = zero_in*one;
		double r1 = v9;
		v9 = one*zero_in;
		double r2 = v9;
		v9 = zero_in/one;
		if ((zero_in==r1) && (zero_in==r2) && (zero_in==v9)) {
			if (n>0) { Pause(); }
		} else {
			n = 1;
			g_error_count[Defect] += 1;
			std::cout << print_error(Defect, "What prints as Z = ");
			std::cout << zero_in << "compares different from:  ";
			if (zero_in != r1) {
				std::cout << "Z*1 == " << r1 << std::endl;
			}
			if (!((zero_in==r2) || (r2==r1))) {
				std::cout << "1*Z == " << r2 << std::endl;
			}
			if (!(zero_in==v9)) {
				std::cout << "Z/1 == " << v9 << std::endl;
			}
			if (r2!=r1) {
				g_error_count[Defect] += 1;
				std::cout << print_error(Defect, "Multiplication does not commute!\n");
				std::cout << "\tComparison alleges that 1*Z == " << r2;
				std::cout << "\tdiffers from Z*1 == " << r1;
			}
			Pause();
		}
	}  // zero_in == zero;  Everything is ok

}



