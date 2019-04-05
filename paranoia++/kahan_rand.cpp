#include "paranoiapp.h"
#include <cmath>  // std::floor()


//
// Replaces Random(), which
//     => Reads globals:  Random1,Random9
//     => Modifies globals:  Random1
//     => Returns:  Random1 (even though this is a global)
//     Computes:
//     X = (Random1 + Random9)^5
//     Random1 = X - FLOOR(X) + 0.000005 * X;
//     and returns the new value of Random1
//
// The present function does not access or modify global state
//
double kahan_rand(double random_1, double random_9) {
	double x {0.0};
	double y {0.0};
	x = random_1 + random_9;
	y = x*x;
	y = y*y;  // y==x^4
	x = x*y;  // x==x^5
	y = x - std::floor(x);
	random_1 = y + x*0.000005;

	return random_1;
}

// Random() computes
//    X = (Random1 + Random9)^5
//    Random1 = X - FLOOR(X) + 0.000005 * X;
//   and returns the new value of Random1
//double Random() {
//	double X, Y;
//	X = Random1 + Random9;
//	Y = X * X;
//	Y = Y * Y;
//	X = X * Y;
//	Y = X - std::floor(X);
//	Random1 = Y + X * 0.000005;
//	return(Random1);
//}
//

