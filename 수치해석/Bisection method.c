/*
   이분법(Bisection method)
*/

#include <stdio.h>
#include <math.h>

double f(double);
int sign(double);

main()
{
	double a, b, c, eps, root, fa, fb, fc;
	int sfa, sfb, sfc, n;

	printf("a,b,epsilon 값 입력:\n");
	scanf("%lf %lf %lf", &a, &b, &eps);

	fa = f(a);
	fb = f(b);
	sfa = sign(fa);
	sfb = sign(fb);
	n = 0;
	if (sfa*sfb > 0)
	{
		printf("\n오류: 근을 찾을 수 없음\n");
		return;
	}

	while (1) {
		n++;
		c = (a + b) / 2.;
		if (b - c <= eps) {
			root = c;
			break;
		}
		fc = f(c);
		if (fabs(fc) <= 1e-30) {
			root = c;
			break;
		}
		sfc = sign(fc);
		if (sfb*sfc < 0) {
			a = c;
			sfa = sfc;
		}
		else {
			b = c;
			sfb = sfc;
		}
	}
	printf("\n==> 근 = %.7f     n = %d \n", root, n);
}

double f(double x)
{
	return e^(-x) - 2*x;
}

int sign(double a)
{
	if (a < 0.)
		return -1;
	else
		return 1;
}
