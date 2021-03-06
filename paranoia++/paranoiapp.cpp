#include "paranoiapp.h"
#include <stdio.h>
#include <signal.h>
#include <setjmp.h>
#include <cmath>
#include <string>
#include <iostream>
#include <array>
#include <algorithm>

jmp_buf ovfl_buf;
Sig_type sigsave;


double Radix, BInvrse, RadixD2, BMinusU2;

// Small floating point constants.
double Zero = 0.0;
double Half = 0.5;
double One = 1.0;
double Two = 2.0;
double Three = 3.0;
double Four = 4.0;
double Five = 5.0;
double Eight = 8.0;
double Nine = 9.0;
double TwentySeven = 27.0;
double ThirtyTwo = 32.0;
double TwoForty = 240.0;
double MinusOne = -1.0;
double OneAndHalf = 1.5;
// Integer constants
int NoTrials = 20; /*Number of tests for commutativity. */
#define False 0
#define True 1

/* Definitions for declared types 
	Guard == (Yes, No);
	Rounding == (Chopped, Rounded, Other);
	Message == packed array [1..40] of char;
	Class == (Flaw, Defect, Serious, Failure);
	  */
#define Yes 1
#define No  0
#define Chopped 2
#define Rounded 1
#define Other   0

typedef int Guard, Rounding, Class;
typedef char Message;

/* Declarations of Variables */
int Indx;
char ch[8];
double AInvrse, A1;
double C, CInvrse;
double D, FourD;
double E0, E1, Exp2, E3, MinSqEr;
double SqEr, MaxSqEr, E9;
double Third;
double F6, F9;
double H, HInvrse;
int I;
double StickyBit, J;
double MyZero;
double Precision;
double Q, Q9;
double R, Random9;
double T, Underflow, S;
double OneUlp, UfThold, U1, U2;
double V, V0, V9;
double W;
double X, X1, X2, X8, Random1;
double Y, Y1, Y2, Random2;
double Z, PseudoZero, Z1, Z2, Z9;
std::array<int,4> ErrCnt {0,0,0,0};
std::array<int,4> g_error_count {0,0,0,0};
int fpecount;
int Milestone;
int PageNo;
int M, N, N1;
Guard GMult, GDiv, GAddSub;
Rounding RMult, RDiv, RAddSub, RSqrt;
int Break, Done, NotMonot, Monot, Anomaly, IEEE,
		SqRWrng, UfNGrad;
/* Computed constants. */
/*U1  gap below 1.0, i.e, 1.0-U1 is next number below 1.0 */
/*U2  gap above 1.0, i.e, 1.0+U2 is next number above 1.0 */

/* floating point exception receiver */
void sigfpe(int x) {
	fpecount++;
	printf("\n* * * FLOATING-POINT ERROR %d * * *\n", x);
	fflush(stdout);
	if (sigsave) {
		signal(SIGFPE, sigsave);
		sigsave = 0;
		longjmp(ovfl_buf, 1);
	}
	exit(1);
}

int main() {
	// First two assignments use integer right-hand sides.
	Zero = 0;
	One = 1;
	Two = One + One;
	Three = Two + One;
	Four = Three + One;
	Five = Four + One;
	Eight = Four + Four;
	Nine = Three * Three;
	TwentySeven = Nine * Three;
	ThirtyTwo = Four * Eight;
	TwoForty = Four * Five * Three * Four;
	MinusOne = -One;
	Half = One / Two;
	OneAndHalf = One + Half;
	ErrCnt[Failure] = 0;
	ErrCnt[Serious] = 0;
	ErrCnt[Defect] = 0;
	ErrCnt[Flaw] = 0;
	PageNo = 1;
	/*=============================================*/
	Milestone = 0;
	/*=============================================*/
	signal(SIGFPE, sigfpe);
	Instructions();
	Pause();
	Heading();
	Pause();
	Characteristics();
	Pause();
	History();
	Pause();

	/*=============================================*/
	Milestone = 7;
	/*=============================================*/
	std::cout << "Program is now RUNNING tests on small integers:" << std::endl;
	milestone_7();


	/*=============================================*/
	Milestone = 10;
	/*=============================================*/
	auto m10res = milestone_10();
	Radix = m10res.radix;
	Precision = m10res.precision;
	U1 = m10res.u1;
	U2 = m10res.u2;
	F9 = m10res.f9;
	W = m10res.w;
	if (std::any_of(g_error_count.begin(),g_error_count.end(),
		[](const int& nerrs)->bool {return nerrs!=0;})) {
		std::cout << "ERRORS !!" << std::endl;
	}

	/*=============================================*/
	Milestone = 20;
	/*=============================================*/
	milestone_20(F9,U2);
	if (std::any_of(g_error_count.begin(),g_error_count.end(),
		[](const int& nerrs)->bool {return nerrs!=0;})) {
		std::cout << "ERRORS !!" << std::endl;
	}


	/*=============================================*/
	Milestone = 25;
	/*=============================================*/
	auto m25res = milestone_25(Radix,Precision,U1,U2);
	Precision = m25res.precision;
	BMinusU2 = m25res.b_minus_u2;
	if (std::any_of(g_error_count.begin(),g_error_count.end(),
		[](const int& nerrs)->bool {return nerrs!=0;})) {
		std::cout << "ERRORS !!" << std::endl;
	}


	/*=============================================*/
	Milestone = 30;
	/*=============================================*/
	milestone_30(Radix,U1,U2,F9);
	Pause();
	if (std::any_of(g_error_count.begin(),g_error_count.end(),
		[](const int& nerrs)->bool {return nerrs!=0;})) {
		std::cout << "ERRORS !!" << std::endl;
	}


	/*=============================================*/
	Milestone = 35;
	/*=============================================*/
	auto m35res = milestone_35(Radix, U1, U2, F9, W, BMinusU2);
	GMult = m35res.g_mult;
	GDiv = m35res.g_div;
	GAddSub = m35res.g_add_sub;
	if (std::any_of(g_error_count.begin(),g_error_count.end(),
		[](const int& nerrs)->bool {return nerrs!=0;})) {
		std::cout << "ERRORS !!" << std::endl;
	}


	/*=============================================*/
	Milestone = 40;
	/*=============================================*/
	Pause();
	auto m40res = milestone_40(Radix,U2,GMult);
	RMult = static_cast<int>(m40res.r_mult);  // TODO:  static_cast... :(
	RDiv = static_cast<int>(m40res.r_div);
	RAddSub = static_cast<int>(m40res.r_add_sub);
	RadixD2 = m40res.radix_d2;
	A1 = m40res.a1;
	AInvrse = m40res.a_inverse;
	if (std::any_of(g_error_count.begin(),g_error_count.end(),
		[](const int& nerrs)->bool {return nerrs!=0;})) {
		std::cout << "ERRORS !!" << std::endl;
	}


	/*=============================================*/
	Milestone = 45;
	/*=============================================*/
	auto m45res = milestone_45(Radix,U1,U2,F9,GDiv,m40res.r_div);
	BInvrse = m45res.b_inverse;
	RDiv = static_cast<int>(m45res.r_div);
	if (std::any_of(g_error_count.begin(),g_error_count.end(),
		[](const int& nerrs)->bool {return nerrs!=0;})) {
		std::cout << "ERRORS !!" << std::endl;
	}


	/*=============================================*/
	Milestone = 50;
	/*=============================================*/
	auto m50res = milestone_50(BMinusU2,U1,U2,F9,Radix,RadixD2,
		m40res.r_add_sub, m40res.r_mult,  // NB:  r40res
		m45res.r_div,  // NB:  r45res
		GAddSub,GMult,GDiv);
	StickyBit = m50res.sticky_bit;
	RAddSub = static_cast<int>(m50res.r_add_sub);  // TODO:  static_cast... :(
	if (std::any_of(g_error_count.begin(),g_error_count.end(),
		[](const int& nerrs)->bool {return nerrs!=0;})) {
		std::cout << "ERRORS !!" << std::endl;
	}


	/*=============================================*/
	Milestone = 60;
	/*=============================================*/
	milestone_60(NoTrials,U1,U2);
	if (std::any_of(g_error_count.begin(),g_error_count.end(),
		[](const int& nerrs)->bool {return nerrs!=0;})) {
		std::cout << "ERRORS !!" << std::endl;
	}


	/*=============================================*/
	Milestone = 70;
	/*=============================================*/
	printf("\nRunning test of square root(x).\n");
	TstCond (Failure, (Zero == std::sqrt(Zero))
		   && (- Zero == std::sqrt(- Zero))
		   && (One == std::sqrt(One)), "Square root of 0.0, -0.0 or 1.0 wrong");
	MinSqEr = Zero;
	MaxSqEr = Zero;
	J = Zero;
	X = Radix;
	OneUlp = U2;
	SqXMinX (Serious);
	X = BInvrse;
	OneUlp = BInvrse * U1;
	SqXMinX (Serious);
	X = U1;
	OneUlp = U1 * U1;
	SqXMinX (Serious);
	if (J != Zero) Pause();
	printf("Testing if sqrt(X * X) == X for %d Integers X.\n", NoTrials);
	J = Zero;
	X = Two;
	Y = Radix;
	if ((Radix != One)) do  {
		X = Y;
		Y = Radix * Y;
		} while ( ! ((Y - X >= NoTrials)));
	OneUlp = X * U2;
	I = 1;
	while (I <= NoTrials) {
		X = X + One;
		SqXMinX (Defect);
		if (J > Zero) break;
		I = I + 1;
		}
	printf("Test for sqrt monotonicity.\n");
	I = - 1;
	X = BMinusU2;
	Y = Radix;
	Z = Radix + Radix * U2;
	NotMonot = False;
	Monot = False;
	while ( ! (NotMonot || Monot)) {
		I = I + 1;
		X = std::sqrt(X);
		Q = std::sqrt(Y);
		Z = std::sqrt(Z);
		if ((X > Q) || (Q > Z)) NotMonot = True;
		else {
			Q = std::floor(Q + Half);
			if (!(I > 0 || Radix == Q * Q)) Monot = True;
			else if (I > 0) {
			if (I > 1) Monot = True;
			else {
				Y = Y * BInvrse;
				X = Y - U1;
				Z = Y + U1;
				}
			}
			else {
				Y = Q;
				X = Y - U2;
				Z = Y + U2;
				}
			}
		}
	if (Monot) printf("sqrt has passed a test for Monotonicity.\n");
	else {
		BadCond(Defect, "");
		printf("sqrt(X) is non-monotonic for X near %.7e .\n", Y);
		}
	/*=============================================*/
	/*SPLIT
	}
#include "paranoia.h"
void part5(VOID){
*/
	Milestone = 80;
	/*=============================================*/
	MinSqEr = MinSqEr + Half;
	MaxSqEr = MaxSqEr - Half;
	Y = (std::sqrt(One + U2) - One) / U2;
	SqEr = (Y - One) + U2 / Eight;
	if (SqEr > MaxSqEr) MaxSqEr = SqEr;
	SqEr = Y + U2 / Eight;
	if (SqEr < MinSqEr) MinSqEr = SqEr;
	Y = ((std::sqrt(F9) - U2) - (One - U2)) / U1;
	SqEr = Y + U1 / Eight;
	if (SqEr > MaxSqEr) MaxSqEr = SqEr;
	SqEr = (Y + One) + U1 / Eight;
	if (SqEr < MinSqEr) MinSqEr = SqEr;
	OneUlp = U2;
	X = OneUlp;
	for( Indx = 1; Indx <= 3; ++Indx) {
		Y = std::sqrt((X + U1 + X) + F9);
		Y = ((Y - U2) - ((One - U2) + X)) / OneUlp;
		Z = ((U1 - X) + F9) * Half * X * X / OneUlp;
		SqEr = (Y + Half) + Z;
		if (SqEr < MinSqEr) MinSqEr = SqEr;
		SqEr = (Y - Half) + Z;
		if (SqEr > MaxSqEr) MaxSqEr = SqEr;
		if (((Indx == 1) || (Indx == 3))) 
			X = OneUlp * Sign (X) * std::floor(Eight / (Nine * std::sqrt(OneUlp)));
		else {
			OneUlp = U1;
			X = - OneUlp;
			}
		}
	/*=============================================*/
	Milestone = 85;
	/*=============================================*/
	SqRWrng = False;
	Anomaly = False;
	RSqrt = Other; /* ~dgh */
	if (Radix != One) {
		printf("Testing whether sqrt is rounded or chopped.\n");
		D = std::floor(Half + std::pow(Radix, One + Precision - std::floor(Precision)));
	/* ... == Radix^(1 + fract) if (Precision == Integer + fract. */
		X = D / Radix;
		Y = D / A1;
		if ((X != std::floor(X)) || (Y != std::floor(Y))) {
			Anomaly = True;
			}
		else {
			X = Zero;
			Z2 = X;
			Y = One;
			Y2 = Y;
			Z1 = Radix - One;
			FourD = Four * D;
			do  {
				if (Y2 > Z2) {
					Q = Radix;
					Y1 = Y;
					do  {
						X1 = std::fabs(Q + std::floor(Half - Q / Y1) * Y1);
						Q = Y1;
						Y1 = X1;
						} while ( ! (X1 <= Zero));
					if (Q <= One) {
						Z2 = Y2;
						Z = Y;
						}
					}
				Y = Y + Two;
				X = X + Eight;
				Y2 = Y2 + X;
				if (Y2 >= FourD) Y2 = Y2 - FourD;
				} while ( ! (Y >= D));
			X8 = FourD - Z2;
			Q = (X8 + Z * Z) / FourD;
			X8 = X8 / Eight;
			if (Q != std::floor(Q)) Anomaly = True;
			else {
				Break = False;
				do  {
					X = Z1 * Z;
					X = X - std::floor(X / Radix) * Radix;
					if (X == One) 
						Break = True;
					else
						Z1 = Z1 - One;
					} while ( ! (Break || (Z1 <= Zero)));
				if ((Z1 <= Zero) && (! Break)) Anomaly = True;
				else {
					if (Z1 > RadixD2) Z1 = Z1 - Radix;
					do  {
						NewD();
						} while ( ! (U2 * D >= F9));
					if (D * Radix - D != W - D) Anomaly = True;
					else {
						Z2 = D;
						I = 0;
						Y = D + (One + Z) * Half;
						X = D + Z + Q;
						SR3750();
						Y = D + (One - Z) * Half + D;
						X = D - Z + D;
						X = X + Q + X;
						SR3750();
						NewD();
						if (D - Z2 != W - Z2) Anomaly = True;
						else {
							Y = (D - Z2) + (Z2 + (One - Z) * Half);
							X = (D - Z2) + (Z2 - Z + Q);
							SR3750();
							Y = (One + Z) * Half;
							X = Q;
							SR3750();
							if (I == 0) Anomaly = True;
							}
						}
					}
				}
			}
		if ((I == 0) || Anomaly) {
			BadCond(Failure, "Anomalous arithmetic with Integer < ");
			printf("Radix^Precision = %.7e\n", W);
			printf(" fails test whether sqrt rounds or chops.\n");
			SqRWrng = True;
			}
		}
	if (! Anomaly) {
		if (! ((MinSqEr < Zero) || (MaxSqEr > Zero))) {
			RSqrt = Rounded;
			printf("Square root appears to be correctly rounded.\n");
			}
		else  {
			if ((MaxSqEr + U2 > U2 - Half) || (MinSqEr > Half)
				|| (MinSqEr + Radix < Half)) SqRWrng = True;
			else {
				RSqrt = Chopped;
				printf("Square root appears to be chopped.\n");
				}
			}
		}
	if (SqRWrng) {
		printf("Square root is neither chopped nor correctly rounded.\n");
		printf("Observed errors run from %.7e ", MinSqEr - Half);
		printf("to %.7e ulps.\n", Half + MaxSqEr);
		TstCond (Serious, MaxSqEr - MinSqEr < Radix * Radix,
			"sqrt gets too many last digits wrong");
		}
	/*=============================================*/
	Milestone = 90;
	/*=============================================*/
	Pause();
	printf("Testing powers Z^i for small Integers Z and i.\n");
	N = 0;
	/* ... test powers of zero. */
	I = 0;
	Z = -Zero;
	M = 3;
	Break = False;
	do  {
		X = One;
		SR3980();
		if (I <= 10) {
			I = 1023;
			SR3980();
			}
		if (Z == MinusOne) Break = True;
		else {
			Z = MinusOne;
			/* .. if(-1)^N is invalid, replace MinusOne by One. */
			I = - 4;
			}
		} while ( ! Break);
	PrintIfNPositive();
	N1 = N;
	N = 0;
	Z = A1;
	M = (int)std::floor(Two * std::log(W) / std::log(A1));
	Break = False;
	do  {
		X = Z;
		I = 1;
		SR3980();
		if (Z == AInvrse) Break = True;
		else Z = AInvrse;
		} while ( ! (Break));
	/*=============================================*/
		Milestone = 100;
	/*=============================================*/
	/*  Powers of Radix have been tested, */
	/*         next try a few primes     */
	M = NoTrials;
	Z = Three;
	do  {
		X = Z;
		I = 1;
		SR3980();
		do  {
			Z = Z + Two;
			} while ( Three * std::floor(Z / Three) == Z );
		} while ( Z < Eight * Three );
	if (N > 0) {
		printf("Errors like this may invalidate financial calculations\n");
		printf("\tinvolving interest rates.\n");
		}
	PrintIfNPositive();
	N += N1;
	if (N == 0) printf("... no discrepancies found.\n");
	if (N > 0) Pause();
	else printf("\n");
	/*=============================================*/
	/*SPLIT
	}
#include "paranoia.h"
void part6(VOID){
*/
	Milestone = 110;
	/*=============================================*/
	printf("Seeking Underflow thresholds UfThold and E0.\n");
	D = U1;
	if (Precision != std::floor(Precision)) {
		D = BInvrse;
		X = Precision;
		do  {
			D = D * BInvrse;
			X = X - One;
			} while ( X > Zero);
		}
	Y = One;
	Z = D;
	/* ... D is power of 1/Radix < 1. */
	do  {
		C = Y;
		Y = Z;
		Z = Y * Y;
		} while ((Y > Z) && (Z + Z > Z));
	Y = C;
	Z = Y * D;
	do  {
		C = Y;
		Y = Z;
		Z = Y * D;
		} while ((Y > Z) && (Z + Z > Z));
	if (Radix < Two) HInvrse = Two;
	else HInvrse = Radix;
	H = One / HInvrse;
	/* ... 1/HInvrse == H == Min(1/Radix, 1/2) */
	CInvrse = One / C;
	E0 = C;
	Z = E0 * H;
	/* ...1/Radix^(BIG Integer) << 1 << CInvrse == 1/C */
	do  {
		Y = E0;
		E0 = Z;
		Z = E0 * H;
		} while ((E0 > Z) && (Z + Z > Z));
	UfThold = E0;
	E1 = Zero;
	Q = Zero;
	E9 = U2;
	S = One + E9;
	D = C * S;
	if (D <= C) {
		E9 = Radix * U2;
		S = One + E9;
		D = C * S;
		if (D <= C) {
			BadCond(Failure, "multiplication gets too many last digits wrong.\n");
			Underflow = E0;
			Y1 = Zero;
			PseudoZero = Z;
			Pause();
			}
		}
	else {
		Underflow = D;
		PseudoZero = Underflow * H;
		UfThold = Zero;
		do  {
			Y1 = Underflow;
			Underflow = PseudoZero;
			if (E1 + E1 <= E1) {
				Y2 = Underflow * HInvrse;
				E1 = std::fabs(Y1 - Y2);
				Q = Y1;
				if ((UfThold == Zero) && (Y1 != Y2)) UfThold = Y1;
				}
			PseudoZero = PseudoZero * H;
			} while ((Underflow > PseudoZero)
				&& (PseudoZero + PseudoZero > PseudoZero));
		}
	/* Comment line 4530 .. 4560 */
	if (PseudoZero != Zero) {
		printf("\n");
		Z = PseudoZero;
	/* ... Test PseudoZero for "phoney- zero" violates */
	/* ... PseudoZero < Underflow or PseudoZero < PseudoZero + PseudoZero
		   ... */
		if (PseudoZero <= Zero) {
			BadCond(Failure, "Positive expressions can underflow to an\n");
			printf("allegedly negative value\n");
			printf("PseudoZero that prints out as: %g .\n", PseudoZero);
			X = - PseudoZero;
			if (X <= Zero) {
				printf("But -PseudoZero, which should be\n");
				printf("positive, isn't; it prints out as  %g .\n", X);
				}
			}
		else {
			BadCond(Flaw, "Underflow can stick at an allegedly positive\n");
			printf("value PseudoZero that prints out as %g .\n", PseudoZero);
			}
		TstPtUf();
		}
	/*=============================================*/
	Milestone = 120;
	/*=============================================*/
	if (CInvrse * Y > CInvrse * Y1) {
		S = H * S;
		E0 = Underflow;
		}
	if (! ((E1 == Zero) || (E1 == E0))) {
		BadCond(Defect, "");
		if (E1 < E0) {
			printf("Products underflow at a higher");
			printf(" threshold than differences.\n");
			if (PseudoZero == Zero) 
			E0 = E1;
			}
		else {
			printf("Difference underflows at a higher");
			printf(" threshold than products.\n");
			}
		}
	printf("Smallest strictly positive number found is E0 = %g .\n", E0);
	Z = E0;
	TstPtUf();
	Underflow = E0;
	if (N == 1) Underflow = Y;
	I = 4;
	if (E1 == Zero) I = 3;
	if (UfThold == Zero) I = I - 2;
	UfNGrad = True;
	switch (I)  {
		case	1:
		UfThold = Underflow;
		if ((CInvrse * Q) != ((CInvrse * Y) * S)) {
			UfThold = Y;
			BadCond(Failure, "Either accuracy deteriorates as numbers\n");
			printf("approach a threshold = %.17e\n", UfThold);;
			printf(" coming down from %.17e\n", C);
			printf(" or else multiplication gets too many last digits wrong.\n");
			}
		Pause();
		break;
	
		case	2:
		BadCond(Failure, "Underflow confuses Comparison, which alleges that\n");
		printf("Q == Y while denying that |Q - Y| == 0; these values\n");
		printf("print out as Q = %.17e, Y = %.17e .\n", Q, Y2);
		printf ("|Q - Y| = %.17e .\n" , std::fabs(Q - Y2));
		UfThold = Q;
		break;
	
		case	3:
		X = X;
		break;
	
		case	4:
		if ((Q == UfThold) && (E1 == E0)
			&& (std::fabs( UfThold - E1 / E9) <= E1)) {
			UfNGrad = False;
			printf("Underflow is gradual; it incurs Absolute Error =\n");
			printf("(roundoff in UfThold) < E0.\n");
			Y = E0 * CInvrse;
			Y = Y * (OneAndHalf + U2);
			X = CInvrse * (One + U2);
			Y = Y / X;
			IEEE = (Y == E0);
			}
		}
	if (UfNGrad) {
		printf("\n");
		sigsave = sigfpe;
		if (setjmp(ovfl_buf)) {
			printf("Underflow / UfThold failed!\n");
			R = H + H;
			}
		else R = std::sqrt(Underflow / UfThold);
		sigsave = 0;
		if (R <= H) {
			Z = R * UfThold;
			X = Z * (One + R * H * (One + H));
			}
		else {
			Z = UfThold;
			X = Z * (One + H * H * (One + H));
			}
		if (! ((X == Z) || (X - Z != Zero))) {
			BadCond(Flaw, "");
			printf("X = %.17e\n\tis not equal to Z = %.17e .\n", X, Z);
			Z9 = X - Z;
			printf("yet X - Z yields %.17e .\n", Z9);
			printf("    Should this NOT signal Underflow, ");
			printf("this is a SERIOUS DEFECT\nthat causes ");
			printf("confusion when innocent statements like\n");;
			printf("    if (X == Z)  ...  else");
			printf("  ... (f(X) - f(Z)) / (X - Z) ...\n");
			printf("encounter Division by Zero although actually\n");
			sigsave = sigfpe;
			if (setjmp(ovfl_buf)) printf("X / Z fails!\n");
			else printf("X / Z = 1 + %g .\n", (X / Z - Half) - Half);
			sigsave = 0;
			}
		}
	printf("The Underflow threshold is %.17e, %s\n", UfThold,
		   " below which");
	printf("calculation may suffer larger Relative error than ");
	printf("merely roundoff.\n");
	Y2 = U1 * U1;
	Y = Y2 * Y2;
	Y2 = Y * U1;
	if (Y2 <= UfThold) {
		if (Y > E0) {
			BadCond(Defect, "");
			I = 5;
			}
		else {
			BadCond(Serious, "");
			I = 4;
			}
		printf("Range is too narrow; U1^%d Underflows.\n", I);
		}
	/*=============================================*/
	/*SPLIT
	}
#include "paranoia.h"
void part7(VOID){
*/
	Milestone = 130;
	/*=============================================*/
	Y = - std::floor(Half - TwoForty * std::log(UfThold) / std::log(HInvrse)) / TwoForty;
	Y2 = Y + Y;
	printf("Since underflow occurs below the threshold\n");
	printf("UfThold = (%.17e) ^ (%.17e)\nonly underflow ", HInvrse, Y);
	printf("should afflict the expression\n\t(%.17e) ^ (%.17e);\n",
		HInvrse, Y2);
	printf("actually calculating yields:");
	if (setjmp(ovfl_buf)) {
		sigsave = 0;
		BadCond(Serious, "trap on underflow.\n");
		}
	else {
		sigsave = sigfpe;
		V9 = std::pow(HInvrse, Y2);
		sigsave = 0;
		printf(" %.17e .\n", V9);
		if (! ((V9 >= Zero) && (V9 <= (Radix + Radix + E9) * UfThold))) {
			BadCond(Serious, "this is not between 0 and underflow\n");
		printf("   threshold = %.17e .\n", UfThold);
		}
		else if (! (V9 > UfThold * (One + E9)))
			printf("This computed value is O.K.\n");
		else {
			BadCond(Defect, "this is not between 0 and underflow\n");
			printf("   threshold = %.17e .\n", UfThold);
			}
		}
	/*=============================================*/
	Milestone = 140;
	/*=============================================*/
	printf("\n");
	/* ...calculate Exp2 == exp(2) == 7.389056099... */
	X = Zero;
	I = 2;
	Y = Two * Three;
	Q = Zero;
	N = 0;
	do  {
		Z = X;
		I = I + 1;
		Y = Y / (I + I);
		R = Y + Q;
		X = Z + R;
		Q = (Z - X) + R;
		} while(X > Z);
	Z = (OneAndHalf + One / Eight) + X / (OneAndHalf * ThirtyTwo);
	X = Z * Z;
	Exp2 = X * X;
	X = F9;
	Y = X - U1;
	printf("Testing X^((X + 1) / (X - 1)) vs. exp(2) = %.17e as X -> 1.\n",
		Exp2);
	for(I = 1;;) {
		Z = X - BInvrse;
		Z = (X + One) / (Z - (One - BInvrse));
		Q = std::pow(X, Z) - Exp2;
		if (std::fabs(Q) > TwoForty * U2) {
			N = 1;
	 		V9 = (X - BInvrse) - (One - BInvrse);
			BadCond(Defect, "Calculated");
			printf(" %.17e for\n", std::pow(X,Z));
			printf("\t(1 + (%.17e) ^ (%.17e);\n", V9, Z);
			printf("\tdiffers from correct value by %.17e .\n", Q);
			printf("\tThis much error may spoil financial\n");
			printf("\tcalculations involving tiny interest rates.\n");
			break;
			}
		else {
			Z = (Y - X) * Two + Y;
			X = Y;
			Y = Z;
			Z = One + (X - F9)*(X - F9);
			if (Z > One && I < NoTrials) I++;
			else  {
				if (X > One) {
					if (N == 0)
					   printf("Accuracy seems adequate.\n");
					break;
					}
				else {
					X = One + U2;
					Y = U2 + U2;
					Y += X;
					I = 1;
					}
				}
			}
		}
	/*=============================================*/
	Milestone = 150;
	/*=============================================*/
	printf("Testing powers Z^Q at four nearly extreme values.\n");
	N = 0;
	Z = A1;
	Q = std::floor(Half - std::log(C) / std::log(A1));
	Break = False;
	do  {
		X = CInvrse;
		Y = std::pow(Z, Q);
		IsYeqX();
		Q = - Q;
		X = C;
		Y = std::pow(Z, Q);
		IsYeqX();
		if (Z < One) Break = True;
		else Z = AInvrse;
		} while ( ! (Break));
	PrintIfNPositive();
	if (N == 0) printf(" ... no discrepancies found.\n");
	printf("\n");
	
	/*=============================================*/
	Milestone = 160;
	/*=============================================*/
	Pause();
	printf("Searching for Overflow threshold:\n");
	printf("This may generate an error.\n");
	Y = - CInvrse;
	V9 = HInvrse * Y;
	sigsave = sigfpe;
	if (setjmp(ovfl_buf)) { I = 0; V9 = Y; goto overflow; }
	do {
		V = Y;
		Y = V9;
		V9 = HInvrse * Y;
		} while(V9 < Y);
	I = 1;
overflow:
	sigsave = 0;
	Z = V9;
	printf("Can `Z = -Y' overflow?\n");
	printf("Trying it on Y = %.17e .\n", Y);
	V9 = - Y;
	V0 = V9;
	if (V - Y == V + V0) printf("Seems O.K.\n");
	else {
		printf("finds a ");
		BadCond(Flaw, "-(-Y) differs from Y.\n");
		}
	if (Z != Y) {
		BadCond(Serious, "");
		printf("overflow past %.17e\n\tshrinks to %.17e .\n", Y, Z);
		}
	if (I) {
		Y = V * (HInvrse * U2 - HInvrse);
		Z = Y + ((One - HInvrse) * U2) * V;
		if (Z < V0) Y = Z;
		if (Y < V0) V = Y;
		if (V0 - V < V0) V = V0;
		}
	else {
		V = Y * (HInvrse * U2 - HInvrse);
		V = V + ((One - HInvrse) * U2) * Y;
		}
	printf("Overflow threshold is V  = %.17e .\n", V);
	if (I) printf("Overflow saturates at V0 = %.17e .\n", V0);
	else printf("There is no saturation value because \
the system traps on overflow.\n");
	V9 = V * One;
	printf("No Overflow should be signaled for V * 1 = %.17e\n", V9);
	V9 = V / One;
	printf("                           nor for V / 1 = %.17e .\n", V9);
	printf("Any overflow signal separating this * from the one\n");
	printf("above is a DEFECT.\n");
	/*=============================================*/
	Milestone = 170;
	/*=============================================*/
	if (!(-V < V && -V0 < V0 && -UfThold < V && UfThold < V)) {
		BadCond(Failure, "Comparisons involving ");
		printf("+-%g, +-%g\nand +-%g are confused by Overflow.",
			V, V0, UfThold);
		}
	/*=============================================*/
	Milestone = 175;
	/*=============================================*/
	printf("\n");
	for(Indx = 1; Indx <= 3; ++Indx) {
		switch (Indx)  {
			case 1: Z = UfThold; break;
			case 2: Z = E0; break;
			case 3: Z = PseudoZero; break;
			}
		if (Z != Zero) {
			V9 = std::sqrt(Z);
			Y = V9 * V9;
			if (Y / (One - Radix * E9) < Z
			   || Y > (One + Radix * E9) * Z) { /* dgh: + E9 --> * E9 */
				if (V9 > U1) BadCond(Serious, "");
				else BadCond(Defect, "");
				printf("Comparison alleges that what prints as Z = %.17e\n", Z);
				printf(" is too far from sqrt(Z) ^ 2 = %.17e .\n", Y);
				}
			}
		}
	/*=============================================*/
	Milestone = 180;
	/*=============================================*/
	for(Indx = 1; Indx <= 2; ++Indx) {
		if (Indx == 1) Z = V;
		else Z = V0;
		V9 = std::sqrt(Z);
		X = (One - Radix * E9) * V9;
		V9 = V9 * X;
		if (((V9 < (One - Two * Radix * E9) * Z) || (V9 > Z))) {
			Y = V9;
			if (X < W) BadCond(Serious, "");
			else BadCond(Defect, "");
			printf("Comparison alleges that Z = %17e\n", Z);
			printf(" is too far from sqrt(Z) ^ 2 (%.17e) .\n", Y);
			}
		}
	/*=============================================*/
	/*SPLIT
	}
#include "paranoia.h"
int part8(VOID){
*/
	Milestone = 190;
	/*=============================================*/
	Pause();
	X = UfThold * V;
	Y = Radix * Radix;
	if (X*Y < One || X > Y) {
		if (X * Y < U1 || X > Y/U1) BadCond(Defect, "Badly");
		else BadCond(Flaw, "");
			
		printf(" unbalanced range; UfThold * V = %.17e\n\t%s\n",
			X, "is too far from 1.\n");
		}
	/*=============================================*/
	Milestone = 200;
	/*=============================================*/
	for (Indx = 1; Indx <= 5; ++Indx)  {
		X = F9;
		switch (Indx)  {
			case 2: X = One + U2; break;
			case 3: X = V; break;
			case 4: X = UfThold; break;
			case 5: X = Radix;
			}
		Y = X;
		sigsave = sigfpe;
		if (setjmp(ovfl_buf))
			printf("  X / X  traps when X = %g\n", X);
		else {
			V9 = (Y / X - Half) - Half;
			if (V9 == Zero) continue;
			if (V9 == - U1 && Indx < 5) BadCond(Flaw, "");
			else BadCond(Serious, "");
			printf("  X / X differs from 1 when X = %.17e\n", X);
			printf("  instead, X / X - 1/2 - 1/2 = %.17e .\n", V9);
			}
		sigsave = 0;
		}
	/*=============================================*/
	Milestone = 210;
	/*=============================================*/
	MyZero = Zero;
	printf("\n");
	printf("What message and/or values does Division by Zero produce?\n") ;
#ifndef NOPAUSE
	printf("This can interupt your program.  You can ");
	printf("skip this part if you wish.\n");
	printf("Do you wish to compute 1 / 0? ");
	fflush(stdout);
	//read (0, ch, 8);  // dbk
	ch[0] = 'Y';
	if ((ch[0] == 'Y') || (ch[0] == 'y')) {
#endif
		sigsave = sigfpe;
		printf("    Trying to compute 1 / 0 produces ...");
		if (!setjmp(ovfl_buf)) printf("  %.7e .\n", One / MyZero);
		sigsave = 0;
#ifndef NOPAUSE
		}
	else printf("O.K.\n");
	printf("\nDo you wish to compute 0 / 0? ");
	fflush(stdout);
	//read (0, ch, 80);  // dbk
	ch[0] = 'Y';
	if ((ch[0] == 'Y') || (ch[0] == 'y')) {
#endif
		sigsave = sigfpe;
		printf("\n    Trying to compute 0 / 0 produces ...");
		if (!setjmp(ovfl_buf)) printf("  %.7e .\n", Zero / MyZero);
		sigsave = 0;
#ifndef NOPAUSE
		}
	else printf("O.K.\n");
#endif
	/*=============================================*/
	Milestone = 220;
	/*=============================================*/
	Pause();
	printf("\n");
	{
		static const char *msg[] = {  // dbk:  + const
			"FAILUREs  encountered =",
			"SERIOUS DEFECTs  discovered =",
			"DEFECTs  discovered =",
			"FLAWs  discovered =" };
		int i;
		for(i = 0; i < 4; i++) if (ErrCnt[i])
			printf("The number of  %-29s %d.\n",
				msg[i], ErrCnt[i]);
		}
	printf("\n");
	if ((ErrCnt[Failure] + ErrCnt[Serious] + ErrCnt[Defect]
			+ ErrCnt[Flaw]) > 0) {
		if ((ErrCnt[Failure] + ErrCnt[Serious] + ErrCnt[
			Defect] == 0) && (ErrCnt[Flaw] > 0)) {
			printf("The arithmetic diagnosed seems ");
			printf("Satisfactory though flawed.\n");
			}
		if ((ErrCnt[Failure] + ErrCnt[Serious] == 0)
			&& ( ErrCnt[Defect] > 0)) {
			printf("The arithmetic diagnosed may be Acceptable\n");
			printf("despite inconvenient Defects.\n");
			}
		if ((ErrCnt[Failure] + ErrCnt[Serious]) > 0) {
			printf("The arithmetic diagnosed has ");
			printf("unacceptable Serious Defects.\n");
			}
		if (ErrCnt[Failure] > 0) {
			printf("Potentially fatal FAILURE may have spoiled this");
			printf(" program's subsequent diagnoses.\n");
			}
		}
	else {
		printf("No failures, defects nor flaws have been discovered.\n");
		if (! ((RMult == Rounded) && (RDiv == Rounded)
			&& (RAddSub == Rounded) && (RSqrt == Rounded))) 
			printf("The arithmetic diagnosed seems Satisfactory.\n");
		else {
			if (StickyBit >= One &&
				(Radix - Two) * (Radix - Nine - One) == Zero) {
				printf("Rounding appears to conform to ");
				printf("the proposed IEEE standard P");
				if ((Radix == Two) &&
					 ((Precision - Four * Three * Two) *
					  ( Precision - TwentySeven -
					   TwentySeven + One) == Zero)) 
					printf("754");
				else printf("854");
				if (IEEE) printf(".\n");
				else {
					printf(",\nexcept for possibly Double Rounding");
					printf(" during Gradual Underflow.\n");
					}
				}
			printf("The arithmetic diagnosed appears to be Excellent!\n");
			}
		}
	if (fpecount)
		printf("\nA total of %d floating point exceptions were registered.\n",
			fpecount);
	printf("END OF TEST.\n");
	return 0;
	}

/*SPLIT subs.c
#include "paranoia.h"
*/

double Sign (double X) { 
	 return X >= 0. ? 1.0 : -1.0;
 }

void Pause() {
	char ch[8];
	printf("\nTo continue, press RETURN");
	fflush(stdout);
	//read(0, ch, 8);  // dbk
	printf("\nDiagnosis resumes after milestone Number %d", Milestone);
	printf("          Page: %d\n\n", PageNo);
	++Milestone;
	++PageNo;
}

std::string print_error(int err_class, const std::string& msg) {
	const char *errclass[] {"FAILURE","SERIOUS DEFECT","DEFECT","FLAW"};
	std::string s {};
	s += errclass[err_class];
	s += ":  ";
	s += msg;
	return s;
}


void TstCond (int K, int Valid, const char *T){ 
	if (!Valid) {
		BadCond(K,T); printf(".\n");
	}
}

void BadCond(int K, const char *T) {
	static const char *msg[] = { "FAILURE", "SERIOUS DEFECT", "DEFECT", "FLAW" };
	ErrCnt [K] = ErrCnt [K] + 1;
	printf("%s:  %s", msg[K], T);
}

// Random() computes
//    X = (Random1 + Random9)^5
//    Random1 = X - FLOOR(X) + 0.000005 * X;
//   and returns the new value of Random1
double Random() {  // see kahan_rand()
	double X, Y;
	X = Random1 + Random9;
	Y = X * X;
	Y = Y * Y;
	X = X * Y;
	Y = X - std::floor(X);
	Random1 = Y + X * 0.000005;
	return(Random1);
}

void SqXMinX (int ErrKind) {
	double XA, XB;
	XB = X * BInvrse;
	XA = X - XB;
	SqEr = ((std::sqrt(X * X) - XB) - XA) / OneUlp;
	if (SqEr != Zero) {
		if (SqEr < MinSqEr) { MinSqEr = SqEr; }
		if (SqEr > MaxSqEr) { MaxSqEr = SqEr; }
		J = J + 1.0;
		BadCond(ErrKind, "\n");
		printf("sqrt( %.17e) - %.17e  = %.17e\n", X * X, X, OneUlp * SqEr);
		printf("\tinstead of correct value 0 .\n");
	}
}

double sq_x_minx(int err_kind, double x, double j, double b_inverse, double one_ulp, 
				double min_sq_err, double max_sq_err) {
	double zero = 0;
	double xa {0.0};
	double xb {0.0};
	double sq_err {0.0};

	xb = x*b_inverse;
	xa = x-xb;
	sq_err = ((std::sqrt(x*x)-xb)-xa)/one_ulp;
	if (sq_err!=zero) {
		if (sq_err<min_sq_err) { min_sq_err=sq_err; }
		if (sq_err>max_sq_err) { max_sq_err=sq_err; }
		j = j + 1.0;
		BadCond(err_kind, "\n");
		printf("sqrt( %.17e) - %.17e  = %.17e\n", X * X, X, OneUlp * SqEr);
		printf("\tinstead of correct value 0 .\n");
	}
}


void NewD() {
	X = Z1 * Q;
	X = std::floor(Half - X / Radix) * Radix + X;
	Q = (Q - X * Z) / Radix + X * X * (D / Radix);
	Z = Z - Two * X * D;
	if (Z <= Zero) {
		Z = - Z;
		Z1 = - Z1;
	}
	D = Radix * D;
}

void SR3750() {
	if (! ((X - Radix < Z2 - Radix) || (X - Z2 > W - Z2))) {
		I = I + 1;
		X2 = std::sqrt(X * D);
		Y2 = (X2 - Z2) - (Y - Z2);
		X2 = X8 / (Y - Half);
		X2 = X2 - Half * X2 * X2;
		SqEr = (Y2 + Half) + (Half - X2);
		if (SqEr < MinSqEr) { MinSqEr = SqEr; }
		SqEr = Y2 - X2;
		if (SqEr > MaxSqEr) { MaxSqEr = SqEr; }
	}
}

void IsYeqX() {
	if (Y != X) {
		if (N <= 0) {
			if (Z == Zero && Q <= Zero) {
				printf("WARNING:  computing\n");
			} else {
				BadCond(Defect, "computing\n");
			}
			printf("\t(%.17e) ^ (%.17e)\n", Z, Q);
			printf("\tyielded %.17e;\n", Y);
			printf("\twhich compared unequal to correct %.17e ;\n",X);
			printf("\t\tthey differ by %.17e .\n", Y - X);
		}
		N = N + 1; /* ... count discrepancies. */
	}
}

void SR3980() {
	do {
		Q = (double) I;
		Y = std::pow(Z, Q);
		IsYeqX();
		if (++I > M) break;
		X = Z * X;
	} while (X < W);
}

void PrintIfNPositive() {
	if (N > 0) { printf("Similar discrepancies have occurred %d times.\n", N); }
}


void TstPtUf() {  // "Test partial underflow"
	N = 0;
	if (Z != Zero) {
		printf("Since comparison denies Z = 0, evaluating ");
		printf("(Z + Z) / Z should be safe.\n");
		sigsave = sigfpe;
		if (setjmp(ovfl_buf)) goto very_serious;
		Q9 = (Z + Z) / Z;
		printf("What the machine gets for (Z + Z) / Z is  %.17e .\n", Q9);
		if (std::fabs(Q9 - Two) < Radix * U2) {
			printf("This is O.K., provided Over/Underflow");
			printf(" has NOT just been signaled.\n");
		} else {
			if ((Q9 < One) || (Q9 > Two)) {
very_serious:
				N = 1;
				ErrCnt [Serious] = ErrCnt [Serious] + 1;
				printf("This is a VERY SERIOUS DEFECT!\n");
			} else {
				N = 1;
				ErrCnt [Defect] = ErrCnt [Defect] + 1;
				printf("This is a DEFECT!\n");
			}
		}
		sigsave = 0;
		V9 = Z * One;
		Random1 = V9;
		V9 = One * Z;
		Random2 = V9;
		V9 = Z / One;
		if ((Z == Random1) && (Z == Random2) && (Z == V9)) {
			if (N > 0) { Pause(); }
		} else {
			N = 1;
			BadCond(Defect, "What prints as Z = ");
			printf("%.17e\n\tcompares different from  ", Z);
			if (Z != Random1) { printf("Z * 1 = %.17e ", Random1); }
			if (! ((Z == Random2)
				|| (Random2 == Random1))) {
				printf("1 * Z == %g\n", Random2);
			}
			if (! (Z == V9)) { printf("Z / 1 = %.17e\n", V9); }
			if (Random2 != Random1) {
				ErrCnt [Defect] = ErrCnt [Defect] + 1;
				BadCond(Defect, "Multiplication does not commute!\n");
				printf("\tComparison alleges that 1 * Z = %.17e\n", Random2);
				printf("\tdiffers from Z * 1 = %.17e\n", Random1);
			}
			Pause();
		}
	}
}

void notify(const char *s) {
	printf("%s test appears to be inconsistent...\n", s);
	printf("   PLEASE NOTIFY KARPINKSI!\n");
}


void Instructions() {
	std::cout << "Lest this program stop prematurely, i.e. before displaying\n"
		<< "    `END OF TEST',\n"
		<< "try to persuade the computer NOT to terminate execution when an"
		<< "error like Over/Underflow or Division by Zero occurs, but rather"
		<< "to persevere with a surrogate value after, perhaps, displaying some"
		<< "warning.  If persuasion avails naught, don't despair but run this"
		<< "program anyway to see how many milestones it passes, and then"
		<< "amend it to make further progress.\n"
		<< "Answer questions with Y, y, N or n (unless otherwise indicated).\n";
	std::cout << std::endl;
}

void Heading() {
	std::cout << "Users are invited to help debug and augment this program so it will"
		<< "cope with unanticipated and newly uncovered arithmetic pathologies.\n"
		<< "Please send suggestions and interesting results to"
		<< "\tRichard Karpinski"
		<< "\tComputer Center U-76"
		<< "\tUniversity of California"
		<< "\tSan Francisco, CA 94143-0704, USA\n"
		<< "In doing so, please include the following information:"
		<< "\tPrecision:\tdouble;"
		<< "\tVersion:\t10 February 1989;"
		<< "\tComputer:\n"
		<< "\tCompiler:\n"
		<< "\tOptimization level:\n"
		<< "\tOther relevant compiler options:";
	std::cout << std::endl;

}

void Characteristics() {
	std::cout << "Running this program should reveal these characteristics:"
		<< "     Radix = 1, 2, 4, 8, 10, 16, 100, 256 ..."
		<< "     Precision = number of significant digits carried."
		<< "     U2 = Radix/Radix^Precision = One Ulp"
		<< "\t(OneUlpnit in the Last Place) of 1.000xxx ."
		<< "     U1 = 1/Radix^Precision = One Ulp of numbers a little less than 1.0 ."
		<< "     Adequacy of guard digits for Mult., Div. and Subt."
		<< "     Whether arithmetic is chopped, correctly rounded, or something else"
		<< "\tfor Mult., Div., Add/Subt. and Sqrt."
		<< "     Whether a Sticky Bit used correctly for rounding."
		<< "     UnderflowThreshold = an underflow threshold."
		<< "     E0 and PseudoZero tell whether underflow is abrupt, gradual, or fuzzy."
		<< "     V = an overflow threshold, roughly."
		<< "     V0  tells, roughly, whether  Infinity  is represented."
		<< "     Comparisions are checked for consistency with subtraction"
		<< "\tand for contamination with pseudo-zeros."
		<< "     Sqrt is tested.  Y^X is not tested."
		<< "     Extra-precise subexpressions are revealed but NOT YET tested."
		<< "     Decimal-Binary conversion is NOT YET tested for accuracy.";
	std::cout << std::endl;

}

void History() {  // History
	// Converted from Brian Wichmann's Pascal version to C by Thos Sumner,
	// with further massaging by David M. Gay.  
	// Converted from C to C++ by Ben Knowles

	std::cout << "The program attempts to discriminate among\n"
		<< "   FLAWs, like lack of a sticky bit,\n"
		<< "   Serious DEFECTs, like lack of a guard digit, and\n"
		<< "   FAILUREs, like 2+2 == 5 .\n"
		<< "Failures may confound subsequent diagnoses.\n"
		<< "The diagnostic capabilities of this program go beyond an earlier\n" 
		<< "program called `MACHAR', which can be found at the end of the\n"
		<< "book  `Software Manual for the Elementary Functions' (1980) by\n"
		<< "W. J. Cody and W. Waite. Although both programs try to discover\n"
		<< "the Radix, Precision and range (over/underflow thresholds)\n"
		<< "of the arithmetic, this program tries to cope with a wider variety"
		<< "of pathologies, and to say how well the arithmetic is implemented.\n"
		<< "The program is based upon a conventional radix representation for\n"
		<< "floating-point numbers, but also allows logarithmic encoding\n"
		<< "as used by certain early WANG machines.\n"
		<< "BASIC version of this program (C) 1983 by Prof. W. M. Kahan;\n"
		<< "see source comments for more history.\n";
	std::cout << std::endl;
}


