/* ap_utils.h */
/*
 * Copyright (C) 2011 XILINX, Inc. 
 *
 * $Id$
 */


#ifndef _AUTOPILOT_UTILS_H_
#define _AUTOPILOT_UTILS_H_


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


#include "etc/autopilot_enum.h"
#include "etc/autopilot_ssdm_op.h"


#endif /* #ifndef _AUTOPILOT_UTILS_H_ */
