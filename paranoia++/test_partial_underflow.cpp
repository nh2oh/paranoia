#include "paranoiapp.h"
#include <iostream>
#include <string>

void test_partial_underflow(double zero_in, double radix, double u2) {
	
	double one = 1;
	double two = 2;
	int n = 0;
	if (zero_in != 0) {
		std::cout << "Since comparison denies Z = 0, evaluating ";
		std::cout << "(Z + Z) / Z should be safe."  << std::endl;
		//sigsave = sigfpe;
		//if (setjmp(ovfl_buf)) goto very_serious;
		double q9 = (zero_in+zero_in)/zero_in;
		printf("What the machine gets for (Z+Z)/Z is  %.17e .\n", q9);
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
		V9 = zero_in*one;
		Random1 = V9;
		V9 = one*zero_in;
		Random2 = V9;
		V9 = zero_in/one;
		if ((zero_in==Random1) && (zero_in==Random2) && (zero_in==V9)) {
			if (n>0) { Pause(); }
		} else {
			n = 1;
			BadCond(Defect, "What prints as Z = ");
			printf("%.17e\n\tcompares different from  ", zero_in);
			if (zero_in != Random1) {
				printf("Z * 1 = %.17e ", Random1);
			}
			if (!((zero_in==Random2) || (Random2==Random1))) {
				printf("1 * Z == %g\n", Random2);
			}
			if (!(zero_in==V9)) {
				printf("Z / 1 = %.17e\n", V9);
			}
			if (Random2!=Random1) {
				g_error_count[Defect] += 1;
				BadCond(Defect, "Multiplication does not commute!\n");
				printf("\tComparison alleges that 1 * Z = %.17e\n", Random2);
				printf("\tdiffers from Z * 1 = %.17e\n", Random1);
			}
			Pause();
		}
	}  // zero_in == zero;  Everything is ok

	N = 0;  // Not sure what the consequenes of this are
}



