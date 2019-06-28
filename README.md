Paranoia++:  C++ port of William Kahan's Paranoia 
==================================================

This is an in-progress port of William Kahan's Paranoia to C++.  It is based on the original BASIC source by Kahan as well as the widely available (see below) C translation.  

Paranoia is a program written in MS BASIC by William Kahan (UC Berkeley) around 1982 to diagnose problems with hardware floating point implementations.  It was rewritten in Pascal in 1985 by B.A. Wichmann (National Physical Laboratory, Teddington Middx, UK).  Around the same time (1985/1986), Thos Sumner (UCSF) and David Gay (AT&T Bell Labs) produced a C implementation.  These versions are all available on [netlib: http://www.netlib.org/paranoia/](http://www.netlib.org/paranoia/).  

The program divides its various tests into numbered test-groups referred to as "milestones," which are executed in numerical order.  Rather than divide each milestone into a separate function with locally scoped variables, C program consists of a single translation unit containing all milestones at the same scope.  Approximately 100 (cryptically named) global variables are read from and written to by the tests in each milestone (as necessary).  Usually, higher-numbered milestones ignore and overwrite the values set by earlier milestones, however, in many cases, values set by early milestones are relied upon by later milestones.  None of these inter-milestone dependencies are documented, and there appear to be at least a few differences (bugs?) between the C and original BASIC program in the way milestones interact with one another through these globals.  

The first step in this project (presently ongoing) is a decomposition of the single-TU C program into a separate function for each milestone.  This requires careful comparison of the C source with the original BASIC source to determine which globals in the C version are needed as arguments to each milestone, and which need to be returned for use by higher-numbered milestones.  

