#include "paranoiapp.h"
#include <iostream>
#include <string>
#include <cmath>  // std::sqrt()
#include <random>
#include <limits>

//
// Calls Random()
//     => Reads globals:  Random1,Random9
//     => Modifies globals:  Random1
//     => Returns:  Random1 (even though this is a global)
//
// Sets globals:  X,Y,Z,Z9,I,Random9,Random1,Random2
// 
// First use of...
//     X,Y,I,Z milestone 70, reset before use
//     Z9, milestone 120, reset before use, but use is conditional, however, this is the 
//                        last use of Z9 in the program
//     Random1,Random9, are only used in Random(), which is only called by the present
//                      milestone (60)
//     Random2 is used only by TstPtUf(), which resets it before use
//
// Reads, but does not set:  NoTrials,U1,U2
// 
void milestone_60(int num_trials, double u1, double u2) {
	double zero = 0;
	double one = 1;
	double two = one+one;
	double three = two+one;
	double nine = three*three;
	double half = one/two;
	double one_and_half = 1.5;

	//std::random_device rd;
	//std::mt19937_64 re(rd());
	//std::uniform_real_distribution<double>
	//	//rdist(std::numeric_limits<double>::lowest()/3.0,std::numeric_limits<double>::max()/3.0);
	//	rdist(-1000.0,1000.0);

	std::cout << "Does Multiplication commute?\nTesting on " 
		<< std::to_string(num_trials) << " random pairs.\n" << std::endl;

	double z {0.0};
	double z9 {0.0};
	double x {0.0};
	double y {0.0};
	double random_9 = std::sqrt(3.0);
	double random_1 = one/three;  //rdist(re);  // Random1 = Third;
	// In the C version, 'Third' is at this point an uninitialized double; this is its
	// first point of use.  However, in the Basic version (see below), random_1 (X9)
	// appears to be initialized to one/three.  Neither this, nor sqrt(3.0) seems very 
	// random.  
	// TODO:  Investigate this; when i init random_1 using std::mt19937_64 re(rd());
	// std::uniform_real_distribution<double>, the tests fail.  
	int i = 1;
	do {
		x = kahan_rand(random_1,random_9);  //x = Random();
		random_1 = x;  // Random() modifies the global Random1 as well as returning its value
		y = kahan_rand(random_1,random_9);  //Y = Random();
		random_1 = y;  // Random() modifies the global Random1 as well as returning its value
		z9 = y*x;
		z = x*y;
		z9 = z-z9;
		i = i+1;
	} while (!((i>num_trials) || (z9!=zero)));


	if (i == num_trials) {
		random_1 = one + half/three;
		double random_2 = (u2+u1) + one;
		z = random_1*random_2;
		y = random_2*random_1;
		z9 = (one + half/three)*((u2+u1)+one) - (one + half/three)*((u2+u1) + one);
	}
	if (!((i==num_trials) || (z9==zero))) {
		g_error_count[Defect] += 1;
		std::cout << print_error(Defect, "x*y == y*x trial fails.\n") << std::endl;
	} else {
		std::cout << "\tNo failures found in " << std::to_string(num_trials) 
			<< " integer pairs." << std::endl;;
	}

}


//
// Replaces the following section in the body of main():
//
//
//
//printf("\n");
//printf("Does Multiplication commute?  ");
//printf("Testing on %d random pairs.\n", NoTrials);
//Random9 = std::sqrt(3.0);
//Random1 = Third;
//I = 1;
//do  {
//	X = Random();
//	Y = Random();
//	Z9 = Y * X;
//	Z = X * Y;
//	Z9 = Z - Z9;
//	I = I + 1;
//} while ( ! ((I > NoTrials) || (Z9 != Zero)));
//if (I == NoTrials) {
//	Random1 = One + Half / Three;
//	Random2 = (U2 + U1) + One;
//	Z = Random1 * Random2;
//	Y = Random2 * Random1;
//	Z9 = (One + Half / Three) * ((U2 + U1) + One) - (One + Half /
//		Three) * ((U2 + U1) + One);
//}
//if (! ((I == NoTrials) || (Z9 == Zero)))
//BadCond(Defect, "X * Y == Y * X trial fails.\n");
//else printf("     No failures found in %d integer pairs.\n", NoTrials);

//
// Basic version
//
//
//2910 L=60 : '=================================================================
//2920 PRINT : PRINT "Does Multiplication commute?  Testing if  X*Y = Y*X  for";I0;"random pairs:"
//2930 R9=SQR(3) : I=I0+1 : X9=O1/O3 : GOTO 2960
//2940 ' ____  Random Number Generator  ____
//2950 X=X9+R9 : Y=X*X : Y=Y*Y : X=X*Y : Y=X-INT(X) : X9=Y+X*.000005 : RETURN
//2960 GOSUB 2950 : Y9=X9 : GOSUB 2950 : Z=X9*Y9 : Y=Y9*X9 : Z9=Z-Y : I=I-1 : IF (I>0 AND Z9=O) THEN 2960
//2970 IF (I>0) THEN 3000
//2980 X9=O1+F2/O3 : Y9=(U2+U1)+O1 : Z=X9*Y9 : Y=Y9*X9 : Z9=(O1+F2/O3)*((U2+U1)+O1)-((U2+U1)+O1)*(O1+F2/O3) : IF NOT (Z9=O) THEN 3000
//2990 PRINT " **********  No failure found in ";I0;" randomly chosen pairs.  **********" : GOTO 3010
//3000 J2=J2+1 : PRINT "DEFECT:   X*Y = Y*X  violated at  X = ";X9;", Y = ";Y9 : PRINT " X*Y =";Z;",  Y*X =";Y;",  X*Y-Y*X =";Z9 : PRINT "   ... pair no.";I0-I+1

// 6440 ' I=scratch integer, I0=number of random trials X*Y=Y*X, I3=IEEE
// 6590 ' X=scratch, X1=..., X8=((-Z*Z)mod4D)/8, X9=random
