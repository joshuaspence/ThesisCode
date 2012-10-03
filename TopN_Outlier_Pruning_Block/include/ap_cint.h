/* ap_cint.h */
/*
 * Copyright (C) 2011 XILINX, Inc. 
 *
 * $Id$
 */


#ifndef _AUTOPILOT_CINT_H_
#define _AUTOPILOT_CINT_H_

#if (defined __llvm__) || \
    (defined AESL_TB) || (defined AUTOPILOT_BC_SIM) || (__RTL_SIMULATION__)

#include <string.h>
#include <stdio.h>

#ifdef __CYGWIN__
#  ifdef feof
#    undef feof
#  endif

#  ifdef ferror
#    undef ferror
#  endif
#endif


#include "etc/autopilot_apint.h"

#else

#error autocc is required to include this header file
#endif /* SYN or AUTOCC */
#endif /* #ifndef _AUTOPILOT_CINT_H_ */
