#include "paranoiapp.h"
#include <cmath>  // std::sqrt()





sqxminx_return_type_t sq_x_minx(int err_kind, double x, double j, double b_inverse, double one_ulp, 
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
		printf("sqrt( %.17e) - %.17e  = %.17e\n", x*x, x, one_ulp*sq_err);
		printf("\tinstead of correct value 0 .\n");
	}

	sqxminx_return_type_t result;
	result.j=j;
	result.sq_err = sq_err;
	result.min_sq_err = min_sq_err;
	result.max_sq_err = max_sq_err;
	return result;

}

//
// Replaces:
//
//void SqXMinX (int ErrKind) {
//	double XA, XB;
//	XB = X * BInvrse;
//	XA = X - XB;
//	SqEr = ((std::sqrt(X * X) - XB) - XA) / OneUlp;
//	if (SqEr != Zero) {
//		if (SqEr < MinSqEr) { MinSqEr = SqEr; }
//		if (SqEr > MaxSqEr) { MaxSqEr = SqEr; }
//		J = J + 1.0;
//		BadCond(ErrKind, "\n");
//		printf("sqrt( %.17e) - %.17e  = %.17e\n", X * X, X, OneUlp * SqEr);
//		printf("\tinstead of correct value 0 .\n");
//	}
//}
//



