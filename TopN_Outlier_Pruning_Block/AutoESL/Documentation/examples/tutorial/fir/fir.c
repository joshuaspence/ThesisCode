#include "fir.h"

void fir (
  data_t *y,
  coef_t c[N],
  data_t x
  ) {

  static data_t shift_reg[N];
  acc_t acc;
  int i;
  
  acc=0;
  Shift_Accum_Loop: for (i=N-1;i>=0;i--) {
     if (i==0) {
       acc+=x*c[0];
       shift_reg[0]=x;
     } else {
			shift_reg[i]=shift_reg[i-1];
			acc+=shift_reg[i]*c[i];       
     }
  }
  *y=acc;
}
