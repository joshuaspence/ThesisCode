/*
 * Copyright 2012 Xilinx, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef _AUTOPILOT_CINT_H_
#define _AUTOPILOT_CINT_H_

#if (defined __llvm__) || \
    (defined AESL_TB) || (defined AUTOPILOT_BC_SIM) || (__RTL_SIMULATION__)

#include <string.h>
#include <stdio.h>

#ifdef __CYGWIN__
    #ifdef feof
        #undef feof
    #endif /* #ifdef feof */

    #ifdef ferror
        #undef ferror
    #endif /* #ifdef ferror */
#endif /* #ifdef __CYGWIN__ */

#include "etc/autopilot_apint.h"

#else
#error autocc is required to include this header file
#endif /* #if (defined __llvm__) || (defined AESL_TB) || (defined AUTOPILOT_BC_SIM) || (__RTL_SIMULATION__) */
#endif /* #ifndef _AUTOPILOT_CINT_H_ */