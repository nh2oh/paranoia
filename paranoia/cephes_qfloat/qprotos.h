/*
 *   This file was automatically generated by version 1.7 of cextract.
 *   Manual editing not recommended.
 *
 *   Created: Sat Jun 15 14:56:30 1996
 */
extern int asctoq ( char *s, QELT *y );
extern int cmpm ( QELT *a, QELT *b );
extern int divm ( QELT a[], QELT b[] );
extern int dtoq ( unsigned short *d, QELT *y );
extern int e113toq ( unsigned short *e, QELT *y );
extern int e24toq ( unsigned short *pe, QELT *y );
extern int e64toq ( unsigned short *e, QELT *y );
extern int etoq ( unsigned short *e, QELT *y );
extern int ltoq ( long *lp, QELT y[] );
extern int mtherr ( char *name, int code );
extern int qabs ( QELT x[] );
extern int qacos ( QELT x[], QELT y[] );
extern int qacosh ( QELT x[], QELT y[] );
extern int qadd ( QELT *a, QELT *b, QELT *c );
extern int qairy ( QELT x[], QELT ai[], QELT aip[], QELT bi[], QELT bip[] );
extern int qasin ( QELT x[], QELT y[] );
extern int qasinh ( QELT x[], QELT y[] );
extern int qatanh ( QELT x[], QELT y[] );
extern int qatn ( QELT *x, QELT *y );
extern int qatn2 ( QELT x[], QELT y[], QELT z[] );
extern int qbdtr ( int k, int n, QELT p[], QELT y[] );
extern int qbdtrc ( int k, int n, QELT p[], QELT y[] );
extern int qbdtri ( int k, int n, QELT y[], QELT p[] );
extern int qbeta ( QELT a[], QELT b[], QELT y[] );
extern int qcabs ( qcmplx *a, QELT y[] );
extern int qcacos ( qcmplx *z, qcmplx *w );
extern int qcadd ( qcmplx *a, qcmplx *b, qcmplx *c );
extern int qcasin ( qcmplx *a, qcmplx *w );
extern int qcatan ( qcmplx *z, qcmplx *w );
extern int qcbrt ( QELT *xx, QELT *y );
extern int qccos ( qcmplx *a, qcmplx *c );
extern int qccot ( qcmplx *z, qcmplx *w );
extern int qcdiv ( qcmplx *a, qcmplx *b, qcmplx *c );
extern int qcexp ( qcmplx *a, qcmplx *c );
extern int qcgamma ( qcmplx *x, qcmplx *y );
extern int qchdtc ( QELT df[], QELT x[], QELT y[] );
extern int qchdti ( QELT df[], QELT y[], QELT x[] );
extern int qchdtr ( QELT df[], QELT x[], QELT y[] );
extern int qclear ( QELT *x );
extern int qclgam ( qcmplx *x, qcmplx *y );
extern int qclog ( qcmplx *a, qcmplx *c );
extern int qcmov ( qcmplx *a, qcmplx *b );
extern int qcmp ( QELT *p, QELT *q );
extern int qcmul ( qcmplx *a, qcmplx *b, qcmplx *c );
extern int qcneg ( qcmplx *a );
extern int qcos ( QELT *x, QELT *y );
extern int qcosdg ( QELT x[], QELT y[] );
extern int qcosh ( QELT x[], QELT y[] );
extern int qcosm1 ( QELT *x, QELT *y );
extern int qcot ( QELT x[], QELT y[] );
extern int qcpow ( qcmplx *x, qcmplx *y, qcmplx *z );
extern int qcsin ( qcmplx *a, qcmplx *c );
extern int qcsqrt ( qcmplx *z, qcmplx *w );
extern int qcsub ( qcmplx *a, qcmplx *b, qcmplx *c );
extern int qctan ( qcmplx *z, qcmplx *w );
extern int qcpolylog ( int n, qcmplx *x, qcmplx *y );
extern int qpolylog ( int n, QELT x[], QELT y[] );
extern int qdawsn ( QELT xx[], QELT y[] );
extern int qdiv ( QELT *a, QELT *b, QELT *c );
extern int qellie ( QELT phi[], QELT m[], QELT y[] );
extern int qellik ( QELT phi[], QELT m[], QELT y[] );
extern int qellpe ( QELT *x, QELT *y );
extern int qellpj ( QELT u[], QELT m[], QELT sn[], QELT cn[], QELT dn[], QELT ph[] );
extern int qellpk ( QELT *x, QELT *y );
extern int qerf ( QELT *x, QELT *y );
extern int qerfc ( QELT *x, QELT *y );
extern int qeuclid ( QELT *num, QELT *den, QELT *gcda );
extern int qexp ( QELT *x, QELT *y );
extern int qexp10 ( QELT x[], QELT y[] );
extern int qexp2 ( QELT x[], QELT y[] );
extern int qexpn ( int n, QELT x[], QELT yy[] );
extern int qfac ( QELT x[], QELT y[] );
extern int qfdtr ( int ia, int ib, QELT x[], QELT y[] );
extern int qfdtrc ( int ia, int ib, QELT x[], QELT y[] );
extern int qfdtri ( int ia, int ib, QELT y[], QELT x[] );
extern int qfloor ( QELT x[], QELT y[] );
extern int qfrexp ( QELT *x, long *e, QELT *y );
extern int qfresnl ( QELT x[], QELT ss[], QELT cc[] );
extern int qgamma ( QELT *xx, QELT *y );
extern int qgdtr ( QELT a[], QELT b[], QELT x[], QELT y[] );
extern int qgdtrc ( QELT a[], QELT b[], QELT x[], QELT y[] );
extern int qhy2f1 ( QELT a[], QELT b[], QELT c[], QELT x[], QELT y[] );
extern int qhyp ( QELT a[], QELT b[], QELT x[], QELT y[] );
extern int qi1 ( QELT *x, QELT *y );
extern int qifrac ( QELT x[], long *i, QELT frac[] );
extern int qigam ( QELT *a, QELT *x, QELT *y );
extern int qigamc ( QELT *a, QELT *x, QELT *y );
extern int qigami ( QELT a[], QELT y0[], QELT ans[] );
extern int qin ( QELT n[], QELT x[], QELT y[] );
extern int qincb ( QELT aa[], QELT bb[], QELT xx[], QELT y[] );
extern int qincbi ( QELT a[], QELT b[], QELT yy[], QELT ans[] );
extern int qincg ( QELT *a, QELT *x, QELT *y );
extern int qine ( QELT n[], QELT x[], QELT y[] );
extern int qinfin ( QELT *x );
extern int qisneg ( QELT x[] );
extern int qjn ( QELT nn[], QELT xx[], QELT y[] );
extern int qk0 ( QELT x[], QELT y[] );
extern int qkn ( int nn, QELT x[], QELT y[] );
extern int qkne ( int nn, QELT x[], QELT y[] );
extern int qldexp ( QELT *x, long n, QELT *y );
extern int qlgam ( QELT *x, QELT *y );
extern int qlog ( QELT *x, QELT *y );
extern int qlog1 ( QELT *x, QELT *y );
extern int qlog10 ( QELT x[], QELT y[] );
extern int qlogtwo ( QELT x[], QELT y[] );
extern int qmov ( QELT *a, QELT *b );
extern int qmul ( QELT *a, QELT *b, QELT *c );
extern int qmuli ( QELT *a, QELT *b, QELT *c );
extern int qnbdtc ( int k, int n, QELT p[], QELT y[] );
extern int qnbdtr ( int k, int n, QELT p[], QELT y[] );
extern int qndtr ( QELT *x, QELT *y );
extern int qndtri ( QELT *qy0, QELT *qx0 );
extern int qneg ( QELT x[] );
extern int qpdtr ( int k, QELT m[], QELT y[] );
extern int qpdtrc ( int k, QELT m[], QELT y[] );
extern int qpdtri ( int k, QELT y[], QELT m[] );
extern int qpow ( QELT *x, QELT *y, QELT *z );
extern int qpowi ( QELT x[], QELT y[], QELT z[] );
extern int qpsi ( QELT *x, QELT *y );
extern int qradd ( qfract *ff1, qfract *ff2, qfract *ff3 );
extern int qrand ( QELT q[] );
extern int qrdiv ( qfract *ff1, qfract *ff2, qfract *ff3 );
extern int qredpi ( QELT x[], QELT y[] );
extern int qremain ( QELT a[], QELT b[], QELT c[] );
extern int qrmul ( qfract *ff1, qfract *ff2, qfract *ff3 );
extern int qround ( QELT *x, QELT *y );
extern int qrsub ( qfract *ff1, qfract *ff2, qfract *ff3 );
extern int qshici ( QELT x[], QELT si[], QELT ci[] );
extern int qsici ( QELT x[], QELT si[], QELT ci[] );
extern int qsin ( QELT *x, QELT *y );
extern int qsindg ( QELT x[], QELT y[] );
extern int qsinh ( QELT *x, QELT *y );
extern int qspenc ( QELT x[], QELT y[] );
extern int qsqrt ( QELT *x, QELT *y );
extern int qstdtri ( int k, QELT p[], QELT t[] );
extern int qstudt ( int k, QELT t[], QELT y[] );
extern int qsub ( QELT *a, QELT *b, QELT *c );
extern int qtan ( QELT *x, QELT *y );
extern int qtandg ( QELT x[], QELT y[] );
extern int qtanh ( QELT *x, QELT *y );
extern int qtoasc ( QELT q[], char *string, int ndigs );
extern int qtod ( QELT *x, unsigned short *d );
extern int qtoe ( QELT *x, unsigned short *e );
extern int qtoe113 ( QELT *x, unsigned short *e );
extern int qtoe24 ( QELT *x, unsigned short *e );
extern int qtoe64 ( QELT *x, unsigned short *e );
extern int qyn ( QELT qn[], QELT x[], QELT y[] );
extern int qzetac ( QELT x[], QELT y[] );
extern int simq ( QELT A[], QELT B[], QELT X[], int n, int flag, int IPS[] );