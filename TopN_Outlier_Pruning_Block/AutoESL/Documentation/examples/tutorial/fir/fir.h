#ifndef FIR_H_
#define FIR_H_
#define N	11

#ifdef BIT_ACCURATE
#include "ap_cint.h"
typedef int8	coef_t;
typedef int8	data_t;
typedef int8	acc_t;
#else
typedef int	coef_t;
typedef int	data_t;
typedef int	acc_t;
#endif

void fir (
  data_t *y,
  coef_t c[N+1],
  data_t x
  );

#endif
