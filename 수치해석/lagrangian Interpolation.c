#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>
#pragma warning(disable:4996)
double func(double *x, double *y, double a, int n) {
   int i, j;
   double c = 1, b = 1, lagr = 1, res = 0;
   for (i = 0; i < (n+1); i++) {
      lagr = 1;
      for (j = 0; j < (n+1); j++) {//라그랑주의 공식
         if (i == j) continue;
         c *= (a - x[i]);
      }
      for (j = 0; j < (n+1); j++) {
         if (i == j) continue;
         b *= (x[i] - x[j]);
      }
      lagr = c / b;
      res += y[i] * lagr;
   }
   return res;
}
int main() {
   double x[10], y[10], a;
   int n;
   scanf("%lf %d", &a, &n);
   for (int i = 0; i < (n+1); i++) {
      scanf("%lf %lf", x + i, y + i);
   }
   printf("%lf", func(x, y, a, n));
}
