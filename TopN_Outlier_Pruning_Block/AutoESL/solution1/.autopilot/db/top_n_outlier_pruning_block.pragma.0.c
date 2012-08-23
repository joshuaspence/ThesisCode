#1 "source/top_n_outlier_pruning_block.c"
#1 "<built-in>"
#1 "<command-line>"
#1 "/opt/Xilinx/2012.1/AutoESL/common/technology/autopilot/etc/autopilot_ssdm_op.h" 1
/* autopilot_ssdm_op.h*/
/*
 * Copyright (C) 2011 XILINX, Inc. 
 *
 * $Id$
 */
#222 "/opt/Xilinx/2012.1/AutoESL/common/technology/autopilot/etc/autopilot_ssdm_op.h"
/*#define _ssdm_op_WaitUntil(X) while (!(X)) _ssdm_op_Wait(1);
#define _ssdm_op_Delayed(X) X */
#1 "<command-line>" 2
#1 "source/top_n_outlier_pruning_block.c"
/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
#1 "source/checks.h" 1
/*
 * This header files checks for invalid combinations of preprocessor macros. It
 * also ensures that required preprocessor macros have been defined.
 */




/*============================================================================*/
/* Architecture                                                               */
/*============================================================================*/


/* __C__ = Stand-alone C program */
#23 "source/checks.h"
/* __MEX__ = MEX file for MATLAB */
#32 "source/checks.h"
/* __AUTOESL__ = AutoESL project */
#44 "source/checks.h"
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* Insert type                                                                */
/*============================================================================*/


/* SORTED_INSERT */
#60 "source/checks.h"
/* UNSORTED_INSERT */
#72 "source/checks.h"
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* Stats                                                                      */
/*============================================================================*/



/*----------------------------------------------------------------------------*/
#5 "source/top_n_outlier_pruning_block.c" 2
#1 "source/arch.h" 1
/*
 * This header files enables and disables certain code features based on the
 * chosen architecture.
 *
 * The following architectures are available: C (__C__), MEX (__MEX__) and 
 * AutoESL (__AUTOESL__).
 */
#18 "source/arch.h"
/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
#1 "source/checks.h" 1
/*
 * This header files checks for invalid combinations of preprocessor macros. It
 * also ensures that required preprocessor macros have been defined.
 */
#22 "source/arch.h" 2
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* __C__ = Stand-alone C program                                              */
/*============================================================================*/
#35 "source/arch.h"
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* __MEX__ = MEX file for MATLAB                                              */
/*============================================================================*/
#53 "source/arch.h"
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* __AUTOESL__ = AutoESL project                                              */
/*============================================================================*/




#1 "/usr/include/stdio.h" 1 3 4
/* Define ISO C stdio on top of C++ iostreams.
   Copyright (C) 1991, 1994-2010, 2011 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */

/*
 *	ISO C99 Standard: 7.19 Input/output	<stdio.h>
 */





#1 "/opt/Xilinx/2012.1/AutoESL/Linux_x86_64/tools/llvm_gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include/features.h" 1 3 4
/*  DO NOT EDIT THIS FILE.

    It has been auto-edited by fixincludes from:

	"/usr/include/features.h"

    This had to be done to correct non-standard usages in the
    original, manufacturer supplied header file.  */

/* Copyright (C) 1991-1993,1995-2003,2004,2005 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */




/* These are defined by the user (or the compiler)
   to specify the desired environment:

   __STRICT_ANSI__	ISO Standard C.
   _ISOC99_SOURCE	Extensions to ISO C89 from ISO C99.
   _POSIX_SOURCE	IEEE Std 1003.1.
   _POSIX_C_SOURCE	If ==1, like _POSIX_SOURCE; if >=2 add IEEE Std 1003.2;
			if >=199309L, add IEEE Std 1003.1b-1993;
			if >=199506L, add IEEE Std 1003.1c-1995;
			if >=200112L, all of IEEE 1003.1-2004
   _XOPEN_SOURCE	Includes POSIX and XPG things.  Set to 500 if
			Single Unix conformance is wanted, to 600 for the
			upcoming sixth revision.
   _XOPEN_SOURCE_EXTENDED XPG things and X/Open Unix extensions.
   _LARGEFILE_SOURCE	Some more functions for correct standard I/O.
   _LARGEFILE64_SOURCE	Additional functionality from LFS for large files.
   _FILE_OFFSET_BITS=N	Select default filesystem interface.
   _BSD_SOURCE		ISO C, POSIX, and 4.3BSD things.
   _SVID_SOURCE		ISO C, POSIX, and SVID things.
   _GNU_SOURCE		All of the above, plus GNU extensions.
   _REENTRANT		Select additionally reentrant object.
   _THREAD_SAFE		Same as _REENTRANT, often used by other systems.
   _FORTIFY_SOURCE	If set to numeric value > 0 additional security
			measures are defined, according to level.

   The `-ansi' switch to the GNU C compiler defines __STRICT_ANSI__.
   If none of these are defined, the default is to have _SVID_SOURCE,
   _BSD_SOURCE, and _POSIX_SOURCE set to one and _POSIX_C_SOURCE set to
   199506L.  If more than one of these are defined, they accumulate.
   For example __STRICT_ANSI__, _POSIX_SOURCE and _POSIX_C_SOURCE
   together give you ISO C, 1003.1, and 1003.2, but nothing else.

   These are defined by this file and are used by the
   header files to decide what to declare or define:

   __USE_ISOC99		Define ISO C99 things.
   __USE_POSIX		Define IEEE Std 1003.1 things.
   __USE_POSIX2		Define IEEE Std 1003.2 things.
   __USE_POSIX199309	Define IEEE Std 1003.1, and .1b things.
   __USE_POSIX199506	Define IEEE Std 1003.1, .1b, .1c and .1i things.
   __USE_XOPEN		Define XPG things.
   __USE_XOPEN_EXTENDED	Define X/Open Unix things.
   __USE_UNIX98		Define Single Unix V2 things.
   __USE_XOPEN2K        Define XPG6 things.
   __USE_LARGEFILE	Define correct standard I/O things.
   __USE_LARGEFILE64	Define LFS things with separate names.
   __USE_FILE_OFFSET64	Define 64bit interface as default.
   __USE_BSD		Define 4.3BSD things.
   __USE_SVID		Define SVID things.
   __USE_MISC		Define things common to BSD and System V Unix.
   __USE_GNU		Define GNU extensions.
   __USE_REENTRANT	Define reentrant/thread-safe *_r functions.
   __USE_FORTIFY_LEVEL	Additional security measures used, according to level.
   __FAVOR_BSD		Favor 4.3BSD things in cases of conflict.

   The macros `__GNU_LIBRARY__', `__GLIBC__', and `__GLIBC_MINOR__' are
   defined by this file unconditionally.  `__GNU_LIBRARY__' is provided
   only for compatibility.  All new code should use the other symbols
   to test for features.

   All macros listed above as possibly being defined by this file are
   explicitly undefined if they are not explicitly defined.
   Feature-test macros that are not defined by the user or compiler
   but are implied by the other feature-test macros defined (or by the
   lack of any definitions) are defined by the file.  */


/* Undefine everything, so we get a clean slate.  */
#120 "/opt/Xilinx/2012.1/AutoESL/Linux_x86_64/tools/llvm_gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include/features.h" 3 4
/* Suppress kernel-name space pollution unless user expressedly asks
   for it.  */




/* Always use ISO C things.  */


/* Convenience macros to test the versions of glibc and gcc.
   Use them like this:
   #if __GNUC_PREREQ (2,8)
   ... code requiring gcc 2.8 or later ...
   #endif
   Note - they won't work for gcc1 or glibc1, since the _MINOR macros
   were not defined then.  */
#144 "/opt/Xilinx/2012.1/AutoESL/Linux_x86_64/tools/llvm_gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include/features.h" 3 4
/* If _BSD_SOURCE was defined by the user, favor BSD over POSIX.  */







/* If _GNU_SOURCE was defined by the user, turn on all the other features.  */
#172 "/opt/Xilinx/2012.1/AutoESL/Linux_x86_64/tools/llvm_gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include/features.h" 3 4
/* If nothing (other than _GNU_SOURCE) is defined,
   define _BSD_SOURCE and _SVID_SOURCE.  */
#182 "/opt/Xilinx/2012.1/AutoESL/Linux_x86_64/tools/llvm_gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include/features.h" 3 4
/* This is to enable the ISO C99 extension.  Also recognize the old macro
   which was used prior to the standard acceptance.  This macro will
   eventually go away and the features enabled by default once the ISO C99
   standard is widely adopted.  */





/* If none of the ANSI/POSIX macros are defined, use POSIX.1 and POSIX.2
   (and IEEE Std 1003.1b-1993 unless _XOPEN_SOURCE is defined).  */
#293 "/opt/Xilinx/2012.1/AutoESL/Linux_x86_64/tools/llvm_gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include/features.h" 3 4
/* We do support the IEC 559 math functionality, real and complex.  */



/* wchar_t uses ISO 10646-1 (2nd ed., published 2000-09-15) / Unicode 3.1.  */


/* This macro indicates that the installed library is the GNU C Library.
   For historic reasons the value now is 6 and this will stay from now
   on.  The use of this variable is deprecated.  Use __GLIBC__ and
   __GLIBC_MINOR__ now (see below) when you want to test for a specific
   GNU C library version and use the values in <gnu/lib-names.h> to get
   the sonames of the shared libraries.  */



/* Major and minor version number of the GNU C library package.  Use
   these macros to test for features in specific releases.  */






/* Decide whether a compiler supports the long long datatypes.  */







/* This is here only because every header file already includes this one.  */


#1 "/usr/include/sys/cdefs.h" 1 3 4
/* Copyright (C) 1992-2001, 2002, 2004, 2005, 2006, 2007, 2009, 2011
   Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */




/* We are almost always included from features.h. */




/* The GNU libc does not support any K&R compilers or the traditional mode
   of ISO C compilers anymore.  Check for some of the combinations not
   anymore supported.  */




/* Some user header file might have defined this before.  */





/* All functions, except those with callbacks or those that
   synchronize memory, are leaf functions.  */
#51 "/usr/include/sys/cdefs.h" 3 4
/* GCC can always grok prototypes.  For C++ programs we add throw()
   to help it optimize the function calls.  But this works only with
   gcc 2.8.x and egcs.  For gcc 3.2 and up we even mark C functions
   as non-throwing using a function attribute since programs can use
   the -fexceptions options for C code as well.  */
#86 "/usr/include/sys/cdefs.h" 3 4
/* These two macros are not used in glibc anymore.  They are kept here
   only because some other projects expect the macros to be defined.  */



/* For these things, GCC behaves the ANSI way normally,
   and the non-ANSI way under -traditional.  */




/* This is not a typedef so `const __ptr_t' does the right thing.  */




/* C++ needs to know that types and declarations are C, not C++.  */
#112 "/usr/include/sys/cdefs.h" 3 4
/* The standard library needs the functions from the ISO C90 standard
   in the std namespace.  At the same time we want to be safe for
   future changes and we include the ISO C99 code in the non-standard
   namespace __c99.  The C++ wrapper header take case of adding the
   definitions to the global namespace.  */
#125 "/usr/include/sys/cdefs.h" 3 4
/* For compatibility we do not add the declarations into any
   namespace.  They will end up in the global namespace which is what
   old code expects.  */
#137 "/usr/include/sys/cdefs.h" 3 4
/* Support for bounded pointers.  */







/* Fortify support.  */
#161 "/usr/include/sys/cdefs.h" 3 4
/* Support for flexible arrays.  */

/* GCC 2.97 supports C99 flexible array members.  */
#179 "/usr/include/sys/cdefs.h" 3 4
/* __asm__ ("xyz") is used throughout the headers to rename functions
   at the assembly language level.  This is wrapped by the __REDIRECT
   macro, in order to support compilers that can do this some other
   way.  When compilers don't support asm-names at all, we have to do
   preprocessor tricks instead (which don't have exactly the right
   semantics, but it's the best we can do).

   Example:
   int __REDIRECT(setpgrp, (__pid_t pid, __pid_t pgrp), setpgid); */
#206 "/usr/include/sys/cdefs.h" 3 4
/*
#elif __SOME_OTHER_COMPILER__

# define __REDIRECT(name, proto, alias) name proto; 	_Pragma("let " #name " = " #alias)
)
*/


/* GCC has various useful declarations that can be made with the
   `__attribute__' syntax.  All of the ways we use this do fine if
   they are omitted for compilers that don't understand it. */




/* At some point during the gcc 2.96 development the `malloc' attribute
   for functions was introduced.  We don't want to use it unconditionally
   (although this would be possible) since it generates warnings.  */






/* At some point during the gcc 2.96 development the `pure' attribute
   for functions was introduced.  We don't want to use it unconditionally
   (although this would be possible) since it generates warnings.  */






/* This declaration tells the compiler that the value is constant.  */






/* At some point during the gcc 3.1 development the `used' attribute
   for functions was introduced.  We don't want to use it unconditionally
   (although this would be possible) since it generates warnings.  */
#257 "/usr/include/sys/cdefs.h" 3 4
/* gcc allows marking deprecated functions.  */






/* At some point during the gcc 2.8 development the `format_arg' attribute
   for functions was introduced.  We don't want to use it unconditionally
   (although this would be possible) since it generates warnings.
   If several `format_arg' attributes are given for the same function, in
   gcc-3.0 and older, all but the last one are ignored.  In newer gccs,
   all designated arguments are considered.  */






/* At some point during the gcc 2.97 development the `strfmon' format
   attribute for functions was introduced.  We don't want to use it
   unconditionally (although this would be possible) since it
   generates warnings.  */







/* The nonull function attribute allows to mark pointer parameters which
   must not be NULL.  */






/* If fortification mode, we warn about unused results of certain
   function calls which can lead to problems.  */
#310 "/usr/include/sys/cdefs.h" 3 4
/* Forces a function to be always inlined.  */






/* GCC 4.3 and above with -std=c99 or -std=gnu99 implements ISO C99
   inline semantics, unless -fgnu89-inline is used.  */
#340 "/usr/include/sys/cdefs.h" 3 4
/* GCC 4.3 and above allow passing all anonymous arguments of an
   __extern_always_inline function to some other vararg function.  */





/* It is possible to compile containing GCC extensions even if GCC is
   run in pedantic mode if the uses are carefully marked using the
   `__extension__' keyword.  But this is not generally available before
   version 2.8.  */




/* __restrict is known in EGCS 1.2 and above. */




/* ISO C99 also allows to declare arrays as non-overlapping.  The syntax is
     array_name[restrict]
   GCC 3.1 supports this.  */
#378 "/usr/include/sys/cdefs.h" 3 4
#1 "/usr/include/bits/wordsize.h" 1 3 4
/* Determine the wordsize from the preprocessor defines.  */
#379 "/usr/include/sys/cdefs.h" 2 3 4
#329 "/opt/Xilinx/2012.1/AutoESL/Linux_x86_64/tools/llvm_gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include/features.h" 2 3 4


/* If we don't have __REDIRECT, prototypes will be missing if
   __USE_FILE_OFFSET64 but not __USE_LARGEFILE[64]. */







/* Decide whether we can define 'extern inline' functions in headers.  */






/* This is here only because every header file already includes this one.
   Get the definitions of all the appropriate `__stub_FUNCTION' symbols.
   <gnu/stubs.h> contains `#define __stub_FUNCTION' when FUNCTION is a stub
   that will always return failure (and set errno to ENOSYS).  */
#1 "/usr/include/gnu/stubs.h" 1 3 4
/* This file selects the right generated file of `__stub_FUNCTION' macros
   based on the architecture being compiled for.  */

#1 "/usr/include/bits/wordsize.h" 1 3 4
/* Determine the wordsize from the preprocessor defines.  */
#5 "/usr/include/gnu/stubs.h" 2 3 4




#1 "/usr/include/gnu/stubs-64.h" 1 3 4
/* This file is automatically generated.
   It defines a symbol `__stub_FUNCTION' for each function
   in the C library which is a stub, meaning it will fail
   every time called, usually setting errno to ENOSYS.  */
#10 "/usr/include/gnu/stubs.h" 2 3 4
#352 "/opt/Xilinx/2012.1/AutoESL/Linux_x86_64/tools/llvm_gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include/features.h" 2 3 4
#29 "/usr/include/stdio.h" 2 3 4





#1 "/opt/Xilinx/2012.1/AutoESL/Linux_x86_64/tools/llvm_gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include/stddef.h" 1 3 4
/* Copyright (C) 1989, 1997, 1998, 1999, 2000, 2002, 2004
   Free Software Foundation, Inc.

This file is part of GCC.

GCC is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2, or (at your option)
any later version.

GCC is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with GCC; see the file COPYING.  If not, write to
the Free Software Foundation, 51 Franklin Street, Fifth Floor,
Boston, MA 02110-1301, USA.  */

/* As a special exception, if you include this header file into source
   files compiled by GCC, this header file does not by itself cause
   the resulting executable to be covered by the GNU General Public
   License.  This exception does not however invalidate any other
   reasons why the executable file might be covered by the GNU General
   Public License.  */

/*
 * ISO C Standard:  7.17  Common definitions  <stddef.h>
 */






/* Any one of these symbols __need_* means that GNU libc
   wants us just to define one data type.  So don't define
   the symbols that indicate this file's entire job has been done.  */
#52 "/opt/Xilinx/2012.1/AutoESL/Linux_x86_64/tools/llvm_gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include/stddef.h" 3 4
/* This avoids lossage on SunOS but only if stdtypes.h comes first.
   There's no way to win with the other order!  Sun lossage.  */

/* On 4.3bsd-net2, make sure ansi.h is included, so we have
   one less case to deal with in the following.  */



/* On FreeBSD 5, machine/ansi.h does not exist anymore... */




/* In 4.3bsd-net2, machine/ansi.h defines these symbols, which are
   defined if the corresponding type is *not* defined.
   FreeBSD-2.1 defines _MACHINE_ANSI_H_ instead of _ANSI_H_ */
#97 "/opt/Xilinx/2012.1/AutoESL/Linux_x86_64/tools/llvm_gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include/stddef.h" 3 4
/* Sequent's header files use _PTRDIFF_T_ in some conflicting way.
   Just ignore it.  */




/* On VxWorks, <type/vxTypesBase.h> may have defined macros like
   _TYPE_size_t which will typedef size_t.  fixincludes patched the
   vxTypesBase.h so that this macro is only defined if _GCC_SIZE_T is
   not defined, and so that defining this macro defines _GCC_SIZE_T.
   If we find that the macros are still defined at this point, we must
   invoke them so that the type is defined as expected.  */
#122 "/opt/Xilinx/2012.1/AutoESL/Linux_x86_64/tools/llvm_gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include/stddef.h" 3 4
/* In case nobody has defined these types, but we aren't running under
   GCC 2.00, make sure that __PTRDIFF_TYPE__, __SIZE_TYPE__, and
   __WCHAR_TYPE__ have reasonable values.  This can happen if the
   parts of GCC is compiled by an older compiler, that actually
   include gstddef.h, such as collect2.  */

/* Signed type of difference of two pointers.  */

/* Define this type if we are doing the whole job,
   or if we want this type in particular.  */
#167 "/opt/Xilinx/2012.1/AutoESL/Linux_x86_64/tools/llvm_gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include/stddef.h" 3 4
/* Unsigned type of `sizeof' something.  */

/* Define this type if we are doing the whole job,
   or if we want this type in particular.  */
#214 "/opt/Xilinx/2012.1/AutoESL/Linux_x86_64/tools/llvm_gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include/stddef.h" 3 4
typedef long unsigned int size_t;
#240 "/opt/Xilinx/2012.1/AutoESL/Linux_x86_64/tools/llvm_gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include/stddef.h" 3 4
/* Wide character type.
   Locale-writers should change this as necessary to
   be big enough to hold unique values not between 0 and 127,
   and not (wchar_t) -1, for each defined multibyte character.  */

/* Define this type if we are doing the whole job,
   or if we want this type in particular.  */
#360 "/opt/Xilinx/2012.1/AutoESL/Linux_x86_64/tools/llvm_gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include/stddef.h" 3 4
/*  In 4.3bsd-net2, leave these undefined to indicate that size_t, etc.
    are already defined.  */
/*  BSD/OS 3.1 and FreeBSD [23].x require the MACHINE_ANSI_H check here.  */
#395 "/opt/Xilinx/2012.1/AutoESL/Linux_x86_64/tools/llvm_gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include/stddef.h" 3 4
/* A null pointer constant.  */
#35 "/usr/include/stdio.h" 2 3 4

#1 "/usr/include/bits/types.h" 1 3 4
/* bits/types.h -- definitions of __*_t types underlying *_t types.
   Copyright (C) 2002, 2003, 2004, 2005, 2007 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */

/*
 * Never include this file directly; use <sys/types.h> instead.
 */




#1 "/opt/Xilinx/2012.1/AutoESL/Linux_x86_64/tools/llvm_gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include/features.h" 1 3 4
/*  DO NOT EDIT THIS FILE.

    It has been auto-edited by fixincludes from:

	"/usr/include/features.h"

    This had to be done to correct non-standard usages in the
    original, manufacturer supplied header file.  */

/* Copyright (C) 1991-1993,1995-2003,2004,2005 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */
#28 "/usr/include/bits/types.h" 2 3 4
#1 "/usr/include/bits/wordsize.h" 1 3 4
/* Determine the wordsize from the preprocessor defines.  */
#29 "/usr/include/bits/types.h" 2 3 4

/* Convenience types.  */
typedef unsigned char __u_char;
typedef unsigned short int __u_short;
typedef unsigned int __u_int;
typedef unsigned long int __u_long;

/* Fixed-size types, underlying types depend on word size and compiler.  */
typedef signed char __int8_t;
typedef unsigned char __uint8_t;
typedef signed short int __int16_t;
typedef unsigned short int __uint16_t;
typedef signed int __int32_t;
typedef unsigned int __uint32_t;

typedef signed long int __int64_t;
typedef unsigned long int __uint64_t;





/* quad_t is also 64 bits.  */

typedef long int __quad_t;
typedef unsigned long int __u_quad_t;
#70 "/usr/include/bits/types.h" 3 4
/* The machine-dependent file <bits/typesizes.h> defines __*_T_TYPE
   macros for each of the OS types we define below.  The definitions
   of those macros must use the following macros for underlying types.
   We define __S<SIZE>_TYPE and __U<SIZE>_TYPE for the signed and unsigned
   variants of each of the following integer types on this machine.

	16		-- "natural" 16-bit type (always short)
	32		-- "natural" 32-bit type (always int)
	64		-- "natural" 64-bit type (long or long long)
	LONG32		-- 32-bit type, traditionally long
	QUAD		-- 64-bit type, always long long
	WORD		-- natural type of __WORDSIZE bits (int or long)
	LONGWORD	-- type of __WORDSIZE bits, traditionally long

   We distinguish WORD/LONGWORD, 32/LONG32, and 64/QUAD so that the
   conventional uses of `long' or `long long' type modifiers match the
   types we define, even when a less-adorned type would be the same size.
   This matters for (somewhat) portably writing printf/scanf formats for
   these types, where using the appropriate l or ll format modifiers can
   make the typedefs and the formats match up across all GNU platforms.  If
   we used `long' when it's 64 bits where `long long' is expected, then the
   compiler would warn about the formats not matching the argument types,
   and the programmer changing them to shut up the compiler would break the
   program's portability.

   Here we assume what is presently the case in all the GCC configurations
   we support: long long is always 64 bits, long is always word/address size,
   and int is always 32 bits.  */
#126 "/usr/include/bits/types.h" 3 4
/* No need to mark the typedef with __extension__.   */




#1 "/usr/include/bits/typesizes.h" 1 3 4
/* bits/typesizes.h -- underlying types for *_t.  Generic version.
   Copyright (C) 2002, 2003 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */
#27 "/usr/include/bits/typesizes.h" 3 4
/* See <bits/types.h> for the meaning of these macros.  This file exists so
   that <bits/types.h> need not vary across different GNU platforms.  */
#62 "/usr/include/bits/typesizes.h" 3 4
/* Number of descriptors that can fit in an `fd_set'.  */
#132 "/usr/include/bits/types.h" 2 3 4


typedef unsigned long int __dev_t; /* Type of device numbers.  */
typedef unsigned int __uid_t; /* Type of user identifications.  */
typedef unsigned int __gid_t; /* Type of group identifications.  */
typedef unsigned long int __ino_t; /* Type of file serial numbers.  */
typedef unsigned long int __ino64_t; /* Type of file serial numbers (LFS).*/
typedef unsigned int __mode_t; /* Type of file attribute bitmasks.  */
typedef unsigned long int __nlink_t; /* Type of file link counts.  */
typedef long int __off_t; /* Type of file sizes and offsets.  */
typedef long int __off64_t; /* Type of file sizes and offsets (LFS).  */
typedef int __pid_t; /* Type of process identifications.  */
typedef struct { int __val[2]; } __fsid_t; /* Type of file system IDs.  */
typedef long int __clock_t; /* Type of CPU usage counts.  */
typedef unsigned long int __rlim_t; /* Type for resource measurement.  */
typedef unsigned long int __rlim64_t; /* Type for resource measurement (LFS).  */
typedef unsigned int __id_t; /* General type for IDs.  */
typedef long int __time_t; /* Seconds since the Epoch.  */
typedef unsigned int __useconds_t; /* Count of microseconds.  */
typedef long int __suseconds_t; /* Signed count of microseconds.  */

typedef int __daddr_t; /* The type of a disk address.  */
typedef long int __swblk_t; /* Type of a swap block maybe?  */
typedef int __key_t; /* Type of an IPC key.  */

/* Clock ID used in clock and timer functions.  */
typedef int __clockid_t;

/* Timer ID returned by `timer_create'.  */
typedef void * __timer_t;

/* Type to represent block size.  */
typedef long int __blksize_t;

/* Types from the Large File Support interface.  */

/* Type to count number of disk blocks.  */
typedef long int __blkcnt_t;
typedef long int __blkcnt64_t;

/* Type to count file system blocks.  */
typedef unsigned long int __fsblkcnt_t;
typedef unsigned long int __fsblkcnt64_t;

/* Type to count file system nodes.  */
typedef unsigned long int __fsfilcnt_t;
typedef unsigned long int __fsfilcnt64_t;

typedef long int __ssize_t; /* Type of a byte count, or error.  */

/* These few don't really vary by system, they always correspond
   to one of the other defined types.  */
typedef __off64_t __loff_t; /* Type of file sizes and offsets (LFS).  */
typedef __quad_t *__qaddr_t;
typedef char *__caddr_t;

/* Duplicates info from stdint.h but this is used in unistd.h.  */
typedef long int __intptr_t;

/* Duplicate info from sys/socket.h.  */
typedef unsigned int __socklen_t;
#37 "/usr/include/stdio.h" 2 3 4







/* Define outside of namespace so the C++ is happy.  */
struct _IO_FILE;


/* The opaque type of streams.  This is the definition used elsewhere.  */
typedef struct _IO_FILE FILE;





#64 "/usr/include/stdio.h" 3 4
/* The opaque type of streams.  This is the definition used elsewhere.  */
typedef struct _IO_FILE __FILE;
#75 "/usr/include/stdio.h" 3 4
#1 "/usr/include/libio.h" 1 3 4
/* Copyright (C) 1991-1995,1997-2006,2007,2009,2011 Free Software Foundation, Inc.
   This file is part of the GNU C Library.
   Written by Per Bothner <bothner@cygnus.com>.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.

   As a special exception, if you link the code in this file with
   files compiled with a GNU compiler to produce an executable,
   that does not cause the resulting executable to be covered by
   the GNU Lesser General Public License.  This exception does not
   however invalidate any other reasons why the executable file
   might be covered by the GNU Lesser General Public License.
   This exception applies to code released by its copyright holders
   in files containing the exception.  */




#1 "/usr/include/_G_config.h" 1 3 4
/* This file is needed by libio to define various configuration parameters.
   These are always the same in the GNU C library.  */




/* Define types for libio in terms of the standard internal type names.  */

#1 "/usr/include/bits/types.h" 1 3 4
/* bits/types.h -- definitions of __*_t types underlying *_t types.
   Copyright (C) 2002, 2003, 2004, 2005, 2007 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */

/*
 * Never include this file directly; use <sys/types.h> instead.
 */
#10 "/usr/include/_G_config.h" 2 3 4





#1 "/opt/Xilinx/2012.1/AutoESL/Linux_x86_64/tools/llvm_gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include/stddef.h" 1 3 4
/* Copyright (C) 1989, 1997, 1998, 1999, 2000, 2002, 2004
   Free Software Foundation, Inc.

This file is part of GCC.

GCC is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2, or (at your option)
any later version.

GCC is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with GCC; see the file COPYING.  If not, write to
the Free Software Foundation, 51 Franklin Street, Fifth Floor,
Boston, MA 02110-1301, USA.  */

/* As a special exception, if you include this header file into source
   files compiled by GCC, this header file does not by itself cause
   the resulting executable to be covered by the GNU General Public
   License.  This exception does not however invalidate any other
   reasons why the executable file might be covered by the GNU General
   Public License.  */

/*
 * ISO C Standard:  7.17  Common definitions  <stddef.h>
 */






/* Any one of these symbols __need_* means that GNU libc
   wants us just to define one data type.  So don't define
   the symbols that indicate this file's entire job has been done.  */
#52 "/opt/Xilinx/2012.1/AutoESL/Linux_x86_64/tools/llvm_gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include/stddef.h" 3 4
/* This avoids lossage on SunOS but only if stdtypes.h comes first.
   There's no way to win with the other order!  Sun lossage.  */

/* On 4.3bsd-net2, make sure ansi.h is included, so we have
   one less case to deal with in the following.  */



/* On FreeBSD 5, machine/ansi.h does not exist anymore... */




/* In 4.3bsd-net2, machine/ansi.h defines these symbols, which are
   defined if the corresponding type is *not* defined.
   FreeBSD-2.1 defines _MACHINE_ANSI_H_ instead of _ANSI_H_ */
#97 "/opt/Xilinx/2012.1/AutoESL/Linux_x86_64/tools/llvm_gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include/stddef.h" 3 4
/* Sequent's header files use _PTRDIFF_T_ in some conflicting way.
   Just ignore it.  */




/* On VxWorks, <type/vxTypesBase.h> may have defined macros like
   _TYPE_size_t which will typedef size_t.  fixincludes patched the
   vxTypesBase.h so that this macro is only defined if _GCC_SIZE_T is
   not defined, and so that defining this macro defines _GCC_SIZE_T.
   If we find that the macros are still defined at this point, we must
   invoke them so that the type is defined as expected.  */
#122 "/opt/Xilinx/2012.1/AutoESL/Linux_x86_64/tools/llvm_gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include/stddef.h" 3 4
/* In case nobody has defined these types, but we aren't running under
   GCC 2.00, make sure that __PTRDIFF_TYPE__, __SIZE_TYPE__, and
   __WCHAR_TYPE__ have reasonable values.  This can happen if the
   parts of GCC is compiled by an older compiler, that actually
   include gstddef.h, such as collect2.  */

/* Signed type of difference of two pointers.  */

/* Define this type if we are doing the whole job,
   or if we want this type in particular.  */
#167 "/opt/Xilinx/2012.1/AutoESL/Linux_x86_64/tools/llvm_gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include/stddef.h" 3 4
/* Unsigned type of `sizeof' something.  */

/* Define this type if we are doing the whole job,
   or if we want this type in particular.  */
#240 "/opt/Xilinx/2012.1/AutoESL/Linux_x86_64/tools/llvm_gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include/stddef.h" 3 4
/* Wide character type.
   Locale-writers should change this as necessary to
   be big enough to hold unique values not between 0 and 127,
   and not (wchar_t) -1, for each defined multibyte character.  */

/* Define this type if we are doing the whole job,
   or if we want this type in particular.  */
#360 "/opt/Xilinx/2012.1/AutoESL/Linux_x86_64/tools/llvm_gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include/stddef.h" 3 4
/*  In 4.3bsd-net2, leave these undefined to indicate that size_t, etc.
    are already defined.  */
/*  BSD/OS 3.1 and FreeBSD [23].x require the MACHINE_ANSI_H check here.  */
#395 "/opt/Xilinx/2012.1/AutoESL/Linux_x86_64/tools/llvm_gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include/stddef.h" 3 4
/* A null pointer constant.  */
#16 "/usr/include/_G_config.h" 2 3 4




#1 "/usr/include/wchar.h" 1 3 4
/* Copyright (C) 1995-2008, 2009, 2010, 2011 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */

/*
 *      ISO C99 Standard: 7.24
 *	Extended multibyte and wide character utilities	<wchar.h>
 */
#82 "/usr/include/wchar.h" 3 4
/* Conversion state information.  */
typedef struct
{
  int __count;
  union
  {

    unsigned int __wch;



    char __wchb[4];
  } __value; /* Value so far.  */
} __mbstate_t;




/* The rest of the file is only used if used if __need_mbstate_t is not
   defined.  */
#894 "/usr/include/wchar.h" 3 4
/* Undefine all __need_* constants in case we are included to get those
   constants but the whole file was already read.  */
#21 "/usr/include/_G_config.h" 2 3 4

typedef struct
{
  __off_t __pos;
  __mbstate_t __state;
} _G_fpos_t;
typedef struct
{
  __off64_t __pos;
  __mbstate_t __state;
} _G_fpos64_t;
#53 "/usr/include/_G_config.h" 3 4
typedef int _G_int16_t __attribute__ ((__mode__ (__HI__)));
typedef int _G_int32_t __attribute__ ((__mode__ (__SI__)));
typedef unsigned int _G_uint16_t __attribute__ ((__mode__ (__HI__)));
typedef unsigned int _G_uint32_t __attribute__ ((__mode__ (__SI__)));




/* These library features are always available in the GNU C library.  */
#82 "/usr/include/_G_config.h" 3 4
/* This is defined by <bits/stat.h> if `st_blksize' exists.  */




/* These are the vtbl details for ELF.  */
#33 "/usr/include/libio.h" 2 3 4
/* ALL of these should be defined in _G_config.h */
#51 "/usr/include/libio.h" 3 4
/* This define avoids name pollution if we're using GNU stdarg.h */

#1 "/opt/Xilinx/2012.1/AutoESL/Linux_x86_64/tools/llvm_gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include/stdarg.h" 1 3 4
/* Copyright (C) 1989, 1997, 1998, 1999, 2000 Free Software Foundation, Inc.

This file is part of GCC.

GCC is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2, or (at your option)
any later version.

GCC is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with GCC; see the file COPYING.  If not, write to
the Free Software Foundation, 51 Franklin Street, Fifth Floor,
Boston, MA 02110-1301, USA.  */

/* As a special exception, if you include this header file into source
   files compiled by GCC, this header file does not by itself cause
   the resulting executable to be covered by the GNU General Public
   License.  This exception does not however invalidate any other
   reasons why the executable file might be covered by the GNU General
   Public License.  */

/*
 * ISO C Standard:  7.15  Variable arguments  <stdarg.h>
 */
#39 "/opt/Xilinx/2012.1/AutoESL/Linux_x86_64/tools/llvm_gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include/stdarg.h" 3 4
/* Define __gnuc_va_list.  */



typedef __builtin_va_list __gnuc_va_list;


/* Define the standard macros for the user,
   if this invocation was from the user program.  */
#54 "/usr/include/libio.h" 2 3 4
#74 "/usr/include/libio.h" 3 4
/* For backward compatibility */
#114 "/usr/include/libio.h" 3 4
/* Magic numbers and bits for the _flags field.
   The magic numbers use the high-order bits of _flags;
   the remaining bits are available for variable flags.
   Note: The magic numbers must all be negative if stdio
   emulation is desired. */
#152 "/usr/include/libio.h" 3 4
/* These are "formatting flags" matching the iostream fmtflags enum values. */
#172 "/usr/include/libio.h" 3 4
struct _IO_jump_t; struct _IO_FILE;

/* Handle lock.  */







typedef void _IO_lock_t;



/* A streammarker remembers a position in a buffer. */

struct _IO_marker {
  struct _IO_marker *_next;
  struct _IO_FILE *_sbuf;
  /* If _pos >= 0
 it points to _buf->Gbase()+_pos. FIXME comment */
  /* if _pos < 0, it points to _buf->eBptr()+_pos. FIXME comment */
  int _pos;
#205 "/usr/include/libio.h" 3 4
};

/* This is the structure from the libstdc++ codecvt class.  */
enum __codecvt_result
{
  __codecvt_ok,
  __codecvt_partial,
  __codecvt_error,
  __codecvt_noconv
};
#273 "/usr/include/libio.h" 3 4
struct _IO_FILE {
  int _flags; /* High-order word is _IO_MAGIC; rest is flags. */


  /* The following pointers correspond to the C++ streambuf protocol. */
  /* Note:  Tk uses the _IO_read_ptr and _IO_read_end fields directly. */
  char* _IO_read_ptr; /* Current read pointer */
  char* _IO_read_end; /* End of get area. */
  char* _IO_read_base; /* Start of putback+get area. */
  char* _IO_write_base; /* Start of put area. */
  char* _IO_write_ptr; /* Current put pointer. */
  char* _IO_write_end; /* End of put area. */
  char* _IO_buf_base; /* Start of reserve area. */
  char* _IO_buf_end; /* End of reserve area. */
  /* The following fields are used to support backing up and undo. */
  char *_IO_save_base; /* Pointer to start of non-current get area. */
  char *_IO_backup_base; /* Pointer to first valid character of backup area */
  char *_IO_save_end; /* Pointer to end of non-current get area. */

  struct _IO_marker *_markers;

  struct _IO_FILE *_chain;

  int _fileno;



  int _flags2;

  __off_t _old_offset; /* This used to be _offset but it's too small.  */


  /* 1+column number of pbase(); 0 is unknown. */
  unsigned short _cur_column;
  signed char _vtable_offset;
  char _shortbuf[1];

  /*  char* _save_gptr;  char* _save_egptr; */

  _IO_lock_t *_lock;
#321 "/usr/include/libio.h" 3 4
  __off64_t _offset;
#330 "/usr/include/libio.h" 3 4
  void *__pad1;
  void *__pad2;
  void *__pad3;
  void *__pad4;
  size_t __pad5;

  int _mode;
  /* Make sure we don't get into trouble again.  */
  char _unused2[15 * sizeof (int) - 4 * sizeof (void *) - sizeof (size_t)];

};


typedef struct _IO_FILE _IO_FILE;


struct _IO_FILE_plus;

extern struct _IO_FILE_plus _IO_2_1_stdin_;
extern struct _IO_FILE_plus _IO_2_1_stdout_;
extern struct _IO_FILE_plus _IO_2_1_stderr_;
#362 "/usr/include/libio.h" 3 4
/* Functions to do I/O and file management for a stream.  */

/* Read NBYTES bytes from COOKIE into a buffer pointed to by BUF.
   Return number of bytes read.  */
typedef __ssize_t __io_read_fn (void *__cookie, char *__buf, size_t __nbytes);

/* Write N bytes pointed to by BUF to COOKIE.  Write all N bytes
   unless there is an error.  Return number of bytes written, or -1 if
   there is an error without writing anything.  If the file has been
   opened for append (__mode.__append set), then set the file pointer
   to the end of the file and then do the write; if not, just write at
   the current file pointer.  */
typedef __ssize_t __io_write_fn (void *__cookie, __const char *__buf,
     size_t __n);

/* Move COOKIE's file position to *POS bytes from the
   beginning of the file (if W is SEEK_SET),
   the current position (if W is SEEK_CUR),
   or the end of the file (if W is SEEK_END).
   Set *POS to the new file position.
   Returns zero if successful, nonzero if not.  */
typedef int __io_seek_fn (void *__cookie, __off64_t *__pos, int __w);

/* Close COOKIE.  */
typedef int __io_close_fn (void *__cookie);
#418 "/usr/include/libio.h" 3 4
extern int __underflow (_IO_FILE *);
extern int __uflow (_IO_FILE *);
extern int __overflow (_IO_FILE *, int);
#462 "/usr/include/libio.h" 3 4
extern int _IO_getc (_IO_FILE *__fp);
extern int _IO_putc (int __c, _IO_FILE *__fp);
extern int _IO_feof (_IO_FILE *__fp) __attribute__ ((__nothrow__ ));
extern int _IO_ferror (_IO_FILE *__fp) __attribute__ ((__nothrow__ ));

extern int _IO_peekc_locked (_IO_FILE *__fp);

/* This one is for Emacs. */



extern void _IO_flockfile (_IO_FILE *) __attribute__ ((__nothrow__ ));
extern void _IO_funlockfile (_IO_FILE *) __attribute__ ((__nothrow__ ));
extern int _IO_ftrylockfile (_IO_FILE *) __attribute__ ((__nothrow__ ));
#492 "/usr/include/libio.h" 3 4
extern int _IO_vfscanf (_IO_FILE * __restrict, const char * __restrict,
   __gnuc_va_list, int *__restrict);
extern int _IO_vfprintf (_IO_FILE *__restrict, const char *__restrict,
    __gnuc_va_list);
extern __ssize_t _IO_padn (_IO_FILE *, int, __ssize_t);
extern size_t _IO_sgetn (_IO_FILE *, void *, size_t);

extern __off64_t _IO_seekoff (_IO_FILE *, __off64_t, int, int);
extern __off64_t _IO_seekpos (_IO_FILE *, __off64_t, int);

extern void _IO_free_backup_area (_IO_FILE *) __attribute__ ((__nothrow__ ));
#76 "/usr/include/stdio.h" 2 3 4
#108 "/usr/include/stdio.h" 3 4
/* The type of the second argument to `fgetpos' and `fsetpos'.  */


typedef _G_fpos_t fpos_t;








/* The possibilities for the third argument to `setvbuf'.  */





/* Default buffer size.  */





/* End of file character.
   Some things throughout the library rely on this being -1.  */





/* The possibilities for the third argument to `fseek'.
   These values should not be changed.  */
#151 "/usr/include/stdio.h" 3 4
/* Default path prefix for `tempnam' and `tmpnam'.  */




/* Get the values:
   L_tmpnam	How long an array of chars must be to be passed to `tmpnam'.
   TMP_MAX	The minimum number of unique filenames generated by tmpnam
		(and tempnam when it uses tmpnam's name space),
		or tempnam (the two are separate).
   L_ctermid	How long an array to pass to `ctermid'.
   L_cuserid	How long an array to pass to `cuserid'.
   FOPEN_MAX	Minimum number of files that can be open at once.
   FILENAME_MAX	Maximum length of a filename.  */
#1 "/usr/include/bits/stdio_lim.h" 1 3 4
/* Copyright (C) 1994, 1997, 1998, 1999, 2009 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */
#166 "/usr/include/stdio.h" 2 3 4


/* Standard streams.  */
extern struct _IO_FILE *stdin; /* Standard input stream.  */
extern struct _IO_FILE *stdout; /* Standard output stream.  */
extern struct _IO_FILE *stderr; /* Standard error output stream.  */
/* C89/C99 say they're macros.  Make them happy.  */





/* Remove file FILENAME.  */
extern int remove (__const char *__filename) __attribute__ ((__nothrow__ ));
/* Rename file OLD to NEW.  */
extern int rename (__const char *__old, __const char *__new) __attribute__ ((__nothrow__ ));









/* Create a temporary file and open it read/write.

   This function is a possible cancellation point and therefore not
   marked with __THROW.  */

extern FILE *tmpfile (void) /* Ignore */;
#209 "/usr/include/stdio.h" 3 4
/* Generate a temporary filename.  */
extern char *tmpnam (char *__s) __attribute__ ((__nothrow__ )) /* Ignore */;



/* This is the reentrant variant of `tmpnam'.  The only difference is
   that it does not allow S to be NULL.  */
extern char *tmpnam_r (char *__s) __attribute__ ((__nothrow__ )) /* Ignore */;




/* Generate a unique temporary filename using up to five characters of PFX
   if it is not NULL.  The directory to put this file in is searched for
   as follows: First the environment variable "TMPDIR" is checked.
   If it contains the name of a writable directory, that directory is used.
   If not and if DIR is not NULL, that value is checked.  If that fails,
   P_tmpdir is tried and finally "/tmp".  The storage for the filename
   is allocated by `malloc'.  */
extern char *tempnam (__const char *__dir, __const char *__pfx)
     __attribute__ ((__nothrow__ )) __attribute__ ((__malloc__)) /* Ignore */;




/* Close STREAM.

   This function is a possible cancellation point and therefore not
   marked with __THROW.  */
extern int fclose (FILE *__stream);
/* Flush STREAM, or all streams if STREAM is NULL.

   This function is a possible cancellation point and therefore not
   marked with __THROW.  */
extern int fflush (FILE *__stream);



/* Faster versions when locking is not required.

   This function is not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation it is a cancellation point and
   therefore not marked with __THROW.  */
extern int fflush_unlocked (FILE *__stream);
#267 "/usr/include/stdio.h" 3 4


/* Open a file and create a new stream for it.

   This function is a possible cancellation point and therefore not
   marked with __THROW.  */
extern FILE *fopen (__const char *__restrict __filename,
      __const char *__restrict __modes) /* Ignore */;
/* Open a file, replacing an existing stream with it.

   This function is a possible cancellation point and therefore not
   marked with __THROW.  */
extern FILE *freopen (__const char *__restrict __filename,
        __const char *__restrict __modes,
        FILE *__restrict __stream) /* Ignore */;
#296 "/usr/include/stdio.h" 3 4

#306 "/usr/include/stdio.h" 3 4
/* Create a new stream that refers to an existing system file descriptor.  */
extern FILE *fdopen (int __fd, __const char *__modes) __attribute__ ((__nothrow__ )) /* Ignore */;
#330 "/usr/include/stdio.h" 3 4

/* If BUF is NULL, make STREAM unbuffered.
   Else make it use buffer BUF, of size BUFSIZ.  */
extern void setbuf (FILE *__restrict __stream, char *__restrict __buf) __attribute__ ((__nothrow__ ));
/* Make STREAM use buffering mode MODE.
   If BUF is not NULL, use N bytes of it for buffering;
   else allocate an internal buffer N bytes long.  */
extern int setvbuf (FILE *__restrict __stream, char *__restrict __buf,
      int __modes, size_t __n) __attribute__ ((__nothrow__ ));



/* If BUF is NULL, make STREAM unbuffered.
   Else make it use SIZE bytes of BUF for buffering.  */
extern void setbuffer (FILE *__restrict __stream, char *__restrict __buf,
         size_t __size) __attribute__ ((__nothrow__ ));

/* Make STREAM line-buffered.  */
extern void setlinebuf (FILE *__stream) __attribute__ ((__nothrow__ ));




/* Write formatted output to STREAM.

   This function is a possible cancellation point and therefore not
   marked with __THROW.  */
extern int fprintf (FILE *__restrict __stream,
      __const char *__restrict __format, ...);
/* Write formatted output to stdout.

   This function is a possible cancellation point and therefore not
   marked with __THROW.  */
extern int printf (__const char *__restrict __format, ...);
/* Write formatted output to S.  */
extern int sprintf (char *__restrict __s,
      __const char *__restrict __format, ...) __attribute__ ((__nothrow__));

/* Write formatted output to S from argument list ARG.

   This function is a possible cancellation point and therefore not
   marked with __THROW.  */
extern int vfprintf (FILE *__restrict __s, __const char *__restrict __format,
       __gnuc_va_list __arg);
/* Write formatted output to stdout from argument list ARG.

   This function is a possible cancellation point and therefore not
   marked with __THROW.  */
extern int vprintf (__const char *__restrict __format, __gnuc_va_list __arg);
/* Write formatted output to S from argument list ARG.  */
extern int vsprintf (char *__restrict __s, __const char *__restrict __format,
       __gnuc_va_list __arg) __attribute__ ((__nothrow__));




/* Maximum chars of output to write in MAXLEN.  */
extern int snprintf (char *__restrict __s, size_t __maxlen,
       __const char *__restrict __format, ...)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 3, 4)));

extern int vsnprintf (char *__restrict __s, size_t __maxlen,
        __const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 3, 0)));

#426 "/usr/include/stdio.h" 3 4

/* Read formatted input from STREAM.

   This function is a possible cancellation point and therefore not
   marked with __THROW.  */
extern int fscanf (FILE *__restrict __stream,
     __const char *__restrict __format, ...) /* Ignore */;
/* Read formatted input from stdin.

   This function is a possible cancellation point and therefore not
   marked with __THROW.  */
extern int scanf (__const char *__restrict __format, ...) /* Ignore */;
/* Read formatted input from S.  */
extern int sscanf (__const char *__restrict __s,
     __const char *__restrict __format, ...) __attribute__ ((__nothrow__ ));
#469 "/usr/include/stdio.h" 3 4

#532 "/usr/include/stdio.h" 3 4

/* Read a character from STREAM.

   These functions are possible cancellation points and therefore not
   marked with __THROW.  */
extern int fgetc (FILE *__stream);
extern int getc (FILE *__stream);

/* Read a character from stdin.

   This function is a possible cancellation point and therefore not
   marked with __THROW.  */
extern int getchar (void);


/* The C standard explicitly says this is a macro, so we always do the
   optimization for it.  */



/* These are defined in POSIX.1:1996.

   These functions are possible cancellation points and therefore not
   marked with __THROW.  */
extern int getc_unlocked (FILE *__stream);
extern int getchar_unlocked (void);



/* Faster version when locking is not necessary.

   This function is not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation it is a cancellation point and
   therefore not marked with __THROW.  */
extern int fgetc_unlocked (FILE *__stream);




/* Write a character to STREAM.

   These functions are possible cancellation points and therefore not
   marked with __THROW.

   These functions is a possible cancellation point and therefore not
   marked with __THROW.  */
extern int fputc (int __c, FILE *__stream);
extern int putc (int __c, FILE *__stream);

/* Write a character to stdout.

   This function is a possible cancellation point and therefore not
   marked with __THROW.  */
extern int putchar (int __c);


/* The C standard explicitly says this can be a macro,
   so we always do the optimization for it.  */



/* Faster version when locking is not necessary.

   This function is not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation it is a cancellation point and
   therefore not marked with __THROW.  */
extern int fputc_unlocked (int __c, FILE *__stream);



/* These are defined in POSIX.1:1996.

   These functions are possible cancellation points and therefore not
   marked with __THROW.  */
extern int putc_unlocked (int __c, FILE *__stream);
extern int putchar_unlocked (int __c);





/* Get a word (int) from STREAM.  */
extern int getw (FILE *__stream);

/* Write a word (int) to STREAM.  */
extern int putw (int __w, FILE *__stream);




/* Get a newline-terminated string of finite length from STREAM.

   This function is a possible cancellation point and therefore not
   marked with __THROW.  */
extern char *fgets (char *__restrict __s, int __n, FILE *__restrict __stream)
     /* Ignore */;

/* Get a newline-terminated string from stdin, removing the newline.
   DO NOT USE THIS FUNCTION!!  There is no limit on how much it will read.

   This function is a possible cancellation point and therefore not
   marked with __THROW.  */
extern char *gets (char *__s) /* Ignore */;

#681 "/usr/include/stdio.h" 3 4

/* Write a string to STREAM.

   This function is a possible cancellation point and therefore not
   marked with __THROW.  */
extern int fputs (__const char *__restrict __s, FILE *__restrict __stream);

/* Write a string, followed by a newline, to stdout.

   This function is a possible cancellation point and therefore not
   marked with __THROW.  */
extern int puts (__const char *__s);


/* Push a character back onto the input buffer of STREAM.

   This function is a possible cancellation point and therefore not
   marked with __THROW.  */
extern int ungetc (int __c, FILE *__stream);


/* Read chunks of generic data from STREAM.

   This function is a possible cancellation point and therefore not
   marked with __THROW.  */
extern size_t fread (void *__restrict __ptr, size_t __size,
       size_t __n, FILE *__restrict __stream) /* Ignore */;
/* Write chunks of generic data to STREAM.

   This function is a possible cancellation point and therefore not
   marked with __THROW.  */
extern size_t fwrite (__const void *__restrict __ptr, size_t __size,
        size_t __n, FILE *__restrict __s);

#728 "/usr/include/stdio.h" 3 4
/* Faster versions when locking is not necessary.

   These functions are not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation they are cancellation points and
   therefore not marked with __THROW.  */
extern size_t fread_unlocked (void *__restrict __ptr, size_t __size,
         size_t __n, FILE *__restrict __stream) /* Ignore */;
extern size_t fwrite_unlocked (__const void *__restrict __ptr, size_t __size,
          size_t __n, FILE *__restrict __stream);




/* Seek to a certain position on STREAM.

   This function is a possible cancellation point and therefore not
   marked with __THROW.  */
extern int fseek (FILE *__stream, long int __off, int __whence);
/* Return the current position of STREAM.

   This function is a possible cancellation point and therefore not
   marked with __THROW.  */
extern long int ftell (FILE *__stream) /* Ignore */;
/* Rewind to the beginning of STREAM.

   This function is a possible cancellation point and therefore not
   marked with __THROW.  */
extern void rewind (FILE *__stream);


/* The Single Unix Specification, Version 2, specifies an alternative,
   more adequate interface for the two functions above which deal with
   file offset.  `long int' is not the right type.  These definitions
   are originally defined in the Large File Support API.  */
#789 "/usr/include/stdio.h" 3 4


/* Get STREAM's position.

   This function is a possible cancellation point and therefore not
   marked with __THROW.  */
extern int fgetpos (FILE *__restrict __stream, fpos_t *__restrict __pos);
/* Set STREAM's position.

   This function is a possible cancellation point and therefore not
   marked with __THROW.  */
extern int fsetpos (FILE *__stream, __const fpos_t *__pos);
#812 "/usr/include/stdio.h" 3 4

#821 "/usr/include/stdio.h" 3 4

/* Clear the error and EOF indicators for STREAM.  */
extern void clearerr (FILE *__stream) __attribute__ ((__nothrow__ ));
/* Return the EOF indicator for STREAM.  */
extern int feof (FILE *__stream) __attribute__ ((__nothrow__ )) /* Ignore */;
/* Return the error indicator for STREAM.  */
extern int ferror (FILE *__stream) __attribute__ ((__nothrow__ )) /* Ignore */;



/* Faster versions when locking is not required.  */
extern void clearerr_unlocked (FILE *__stream) __attribute__ ((__nothrow__ ));
extern int feof_unlocked (FILE *__stream) __attribute__ ((__nothrow__ )) /* Ignore */;
extern int ferror_unlocked (FILE *__stream) __attribute__ ((__nothrow__ )) /* Ignore */;




/* Print a message describing the meaning of the value of errno.

   This function is a possible cancellation point and therefore not
   marked with __THROW.  */
extern void perror (__const char *__s);


/* Provide the declarations for `sys_errlist' and `sys_nerr' if they
   are available on this system.  Even if available, these variables
   should not be used directly.  The `strerror' function provides
   all the necessary functionality.  */
#1 "/usr/include/bits/sys_errlist.h" 1 3 4
/* Declare sys_errlist and sys_nerr, or don't.  Compatibility (do) version.
   Copyright (C) 2002 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */





/* sys_errlist and sys_nerr are deprecated.  Use strerror instead.  */


extern int sys_nerr;
extern __const char *__const sys_errlist[];
#851 "/usr/include/stdio.h" 2 3 4



/* Return the system file descriptor for STREAM.  */
extern int fileno (FILE *__stream) __attribute__ ((__nothrow__ )) /* Ignore */;



/* Faster version when locking is not required.  */
extern int fileno_unlocked (FILE *__stream) __attribute__ ((__nothrow__ )) /* Ignore */;





/* Create a new stream connected to a pipe running the given command.

   This function is a possible cancellation point and therefore not
   marked with __THROW.  */
extern FILE *popen (__const char *__command, __const char *__modes) /* Ignore */;

/* Close a stream opened by popen and return the status of its child.

   This function is a possible cancellation point and therefore not
   marked with __THROW.  */
extern int pclose (FILE *__stream);




/* Return the name of the controlling terminal.  */
extern char *ctermid (char *__s) __attribute__ ((__nothrow__ ));
#907 "/usr/include/stdio.h" 3 4
/* These are defined in POSIX.1:1996.  */

/* Acquire ownership of STREAM.  */
extern void flockfile (FILE *__stream) __attribute__ ((__nothrow__ ));

/* Try to acquire ownership of STREAM but do not block if it is not
   possible.  */
extern int ftrylockfile (FILE *__stream) __attribute__ ((__nothrow__ )) /* Ignore */;

/* Relinquish the ownership granted for STREAM.  */
extern void funlockfile (FILE *__stream) __attribute__ ((__nothrow__ ));
#928 "/usr/include/stdio.h" 3 4
/* If we are compiling with optimizing read this file.  It contains
   several optimizing inline functions and macros.  */
#940 "/usr/include/stdio.h" 3 4

#63 "source/arch.h" 2



/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* MEMSET and MEMCPY macros                                                   */
/*============================================================================*/

#1 "/usr/include/string.h" 1 3 4
/* Copyright (C) 1991-1993,1995-2004,2007,2009,2010
   Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */

/*
 *	ISO C99 Standard: 7.21 String handling	<string.h>
 */




#1 "/opt/Xilinx/2012.1/AutoESL/Linux_x86_64/tools/llvm_gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include/features.h" 1 3 4
/*  DO NOT EDIT THIS FILE.

    It has been auto-edited by fixincludes from:

	"/usr/include/features.h"

    This had to be done to correct non-standard usages in the
    original, manufacturer supplied header file.  */

/* Copyright (C) 1991-1993,1995-2003,2004,2005 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */
#28 "/usr/include/string.h" 2 3 4



/* Get size_t and NULL from <stddef.h>.  */


#1 "/opt/Xilinx/2012.1/AutoESL/Linux_x86_64/tools/llvm_gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include/stddef.h" 1 3 4
/* Copyright (C) 1989, 1997, 1998, 1999, 2000, 2002, 2004
   Free Software Foundation, Inc.

This file is part of GCC.

GCC is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2, or (at your option)
any later version.

GCC is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with GCC; see the file COPYING.  If not, write to
the Free Software Foundation, 51 Franklin Street, Fifth Floor,
Boston, MA 02110-1301, USA.  */

/* As a special exception, if you include this header file into source
   files compiled by GCC, this header file does not by itself cause
   the resulting executable to be covered by the GNU General Public
   License.  This exception does not however invalidate any other
   reasons why the executable file might be covered by the GNU General
   Public License.  */

/*
 * ISO C Standard:  7.17  Common definitions  <stddef.h>
 */






/* Any one of these symbols __need_* means that GNU libc
   wants us just to define one data type.  So don't define
   the symbols that indicate this file's entire job has been done.  */
#52 "/opt/Xilinx/2012.1/AutoESL/Linux_x86_64/tools/llvm_gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include/stddef.h" 3 4
/* This avoids lossage on SunOS but only if stdtypes.h comes first.
   There's no way to win with the other order!  Sun lossage.  */

/* On 4.3bsd-net2, make sure ansi.h is included, so we have
   one less case to deal with in the following.  */



/* On FreeBSD 5, machine/ansi.h does not exist anymore... */




/* In 4.3bsd-net2, machine/ansi.h defines these symbols, which are
   defined if the corresponding type is *not* defined.
   FreeBSD-2.1 defines _MACHINE_ANSI_H_ instead of _ANSI_H_ */
#97 "/opt/Xilinx/2012.1/AutoESL/Linux_x86_64/tools/llvm_gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include/stddef.h" 3 4
/* Sequent's header files use _PTRDIFF_T_ in some conflicting way.
   Just ignore it.  */




/* On VxWorks, <type/vxTypesBase.h> may have defined macros like
   _TYPE_size_t which will typedef size_t.  fixincludes patched the
   vxTypesBase.h so that this macro is only defined if _GCC_SIZE_T is
   not defined, and so that defining this macro defines _GCC_SIZE_T.
   If we find that the macros are still defined at this point, we must
   invoke them so that the type is defined as expected.  */
#122 "/opt/Xilinx/2012.1/AutoESL/Linux_x86_64/tools/llvm_gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include/stddef.h" 3 4
/* In case nobody has defined these types, but we aren't running under
   GCC 2.00, make sure that __PTRDIFF_TYPE__, __SIZE_TYPE__, and
   __WCHAR_TYPE__ have reasonable values.  This can happen if the
   parts of GCC is compiled by an older compiler, that actually
   include gstddef.h, such as collect2.  */

/* Signed type of difference of two pointers.  */

/* Define this type if we are doing the whole job,
   or if we want this type in particular.  */
#167 "/opt/Xilinx/2012.1/AutoESL/Linux_x86_64/tools/llvm_gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include/stddef.h" 3 4
/* Unsigned type of `sizeof' something.  */

/* Define this type if we are doing the whole job,
   or if we want this type in particular.  */
#240 "/opt/Xilinx/2012.1/AutoESL/Linux_x86_64/tools/llvm_gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include/stddef.h" 3 4
/* Wide character type.
   Locale-writers should change this as necessary to
   be big enough to hold unique values not between 0 and 127,
   and not (wchar_t) -1, for each defined multibyte character.  */

/* Define this type if we are doing the whole job,
   or if we want this type in particular.  */
#360 "/opt/Xilinx/2012.1/AutoESL/Linux_x86_64/tools/llvm_gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include/stddef.h" 3 4
/*  In 4.3bsd-net2, leave these undefined to indicate that size_t, etc.
    are already defined.  */
/*  BSD/OS 3.1 and FreeBSD [23].x require the MACHINE_ANSI_H check here.  */
#395 "/opt/Xilinx/2012.1/AutoESL/Linux_x86_64/tools/llvm_gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include/stddef.h" 3 4
/* A null pointer constant.  */
#35 "/usr/include/string.h" 2 3 4

/* Tell the caller that we provide correct C++ prototypes.  */






/* Copy N bytes of SRC to DEST.  */
extern void *memcpy (void *__restrict __dest,
       __const void *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));
/* Copy N bytes of SRC to DEST, guaranteeing
   correct behavior for overlapping strings.  */
extern void *memmove (void *__dest, __const void *__src, size_t __n)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));


/* Copy no more than N bytes of SRC to DEST, stopping when C is found.
   Return the position in DEST one byte past where C was copied,
   or NULL if C was not found in the first N bytes of SRC.  */

extern void *memccpy (void *__restrict __dest, __const void *__restrict __src,
        int __c, size_t __n)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));




/* Set N bytes of S to C.  */
extern void *memset (void *__s, int __c, size_t __n) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));

/* Compare N bytes of S1 and S2.  */
extern int memcmp (__const void *__s1, __const void *__s2, size_t __n)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

/* Search N bytes of S for C.  */
#95 "/usr/include/string.h" 3 4
extern void *memchr (__const void *__s, int __c, size_t __n)
      __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));


#126 "/usr/include/string.h" 3 4

/* Copy SRC to DEST.  */
extern char *strcpy (char *__restrict __dest, __const char *__restrict __src)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));
/* Copy no more than N characters of SRC to DEST.  */
extern char *strncpy (char *__restrict __dest,
        __const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));

/* Append SRC onto DEST.  */
extern char *strcat (char *__restrict __dest, __const char *__restrict __src)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));
/* Append no more than N characters from SRC onto DEST.  */
extern char *strncat (char *__restrict __dest, __const char *__restrict __src,
        size_t __n) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));

/* Compare S1 and S2.  */
extern int strcmp (__const char *__s1, __const char *__s2)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
/* Compare N characters of S1 and S2.  */
extern int strncmp (__const char *__s1, __const char *__s2, size_t __n)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

/* Compare the collated forms of S1 and S2.  */
extern int strcoll (__const char *__s1, __const char *__s2)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
/* Put a transformation of SRC into no more than N bytes of DEST.  */
extern size_t strxfrm (char *__restrict __dest,
         __const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (2)));

#174 "/usr/include/string.h" 3 4
/* Duplicate S, returning an identical malloc'd string.  */
extern char *strdup (__const char *__s)
     __attribute__ ((__nothrow__ )) __attribute__ ((__malloc__)) __attribute__ ((__nonnull__ (1)));


/* Return a malloc'd copy of at most N bytes of STRING.  The
   resultant string is terminated even if no null terminator
   appears before STRING[N].  */
#210 "/usr/include/string.h" 3 4

/* Find the first occurrence of C in S.  */
#235 "/usr/include/string.h" 3 4
extern char *strchr (__const char *__s, int __c)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));

/* Find the last occurrence of C in S.  */
#262 "/usr/include/string.h" 3 4
extern char *strrchr (__const char *__s, int __c)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));


#281 "/usr/include/string.h" 3 4

/* Return the length of the initial segment of S which
   consists entirely of characters not in REJECT.  */
extern size_t strcspn (__const char *__s, __const char *__reject)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
/* Return the length of the initial segment of S which
   consists entirely of characters in ACCEPT.  */
extern size_t strspn (__const char *__s, __const char *__accept)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
/* Find the first occurrence in S of any character in ACCEPT.  */
#314 "/usr/include/string.h" 3 4
extern char *strpbrk (__const char *__s, __const char *__accept)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

/* Find the first occurrence of NEEDLE in HAYSTACK.  */
#342 "/usr/include/string.h" 3 4
extern char *strstr (__const char *__haystack, __const char *__needle)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));



/* Divide S into tokens separated by characters in DELIM.  */
extern char *strtok (char *__restrict __s, __const char *__restrict __delim)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (2)));


/* Divide S into tokens separated by characters in DELIM.  Information
   passed between calls are stored in SAVE_PTR.  */
extern char *__strtok_r (char *__restrict __s,
    __const char *__restrict __delim,
    char **__restrict __save_ptr)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (2, 3)));

extern char *strtok_r (char *__restrict __s, __const char *__restrict __delim,
         char **__restrict __save_ptr)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (2, 3)));
#397 "/usr/include/string.h" 3 4

/* Return the length of S.  */
extern size_t strlen (__const char *__s)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));

#411 "/usr/include/string.h" 3 4

/* Return a string describing the meaning of the `errno' code in ERRNUM.  */
extern char *strerror (int __errnum) __attribute__ ((__nothrow__ ));


/* Reentrant version of `strerror'.
   There are 2 flavors of `strerror_r', GNU which returns the string
   and may or may not use the supplied temporary buffer and POSIX one
   which fills the string into the buffer.
   To use the POSIX version, -D_XOPEN_SOURCE=600 or -D_POSIX_C_SOURCE=200112L
   without -D_GNU_SOURCE is needed, otherwise the GNU version is
   preferred.  */
#436 "/usr/include/string.h" 3 4
/* If a temporary buffer is required, at most BUFLEN bytes of BUF will be
   used.  */
extern char *strerror_r (int __errnum, char *__buf, size_t __buflen)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (2)));
#449 "/usr/include/string.h" 3 4
/* We define this function always since `bzero' is sometimes needed when
   the namespace rules does not allow this.  */
extern void __bzero (void *__s, size_t __n) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));


/* Copy N bytes of SRC to DEST (like memmove, but args reversed).  */
extern void bcopy (__const void *__src, void *__dest, size_t __n)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));

/* Set N bytes of S to 0.  */
extern void bzero (void *__s, size_t __n) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));

/* Compare N bytes of S1 and S2 (same as memcmp).  */
extern int bcmp (__const void *__s1, __const void *__s2, size_t __n)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

/* Find the first occurrence of C in S (same as strchr).  */
#489 "/usr/include/string.h" 3 4
extern char *index (__const char *__s, int __c)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));


/* Find the last occurrence of C in S (same as strrchr).  */
#517 "/usr/include/string.h" 3 4
extern char *rindex (__const char *__s, int __c)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));


/* Return the position of the first bit set in I, or 0 if none are set.
   The least-significant bit is position 1, the most-significant 32.  */
extern int ffs (int __i) __attribute__ ((__nothrow__ )) __attribute__ ((__const__));

/* The following two functions are non-standard but necessary for non-32 bit
   platforms.  */
#535 "/usr/include/string.h" 3 4
/* Compare S1 and S2, ignoring case.  */
extern int strcasecmp (__const char *__s1, __const char *__s2)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

/* Compare no more than N chars of S1 and S2, ignoring case.  */
extern int strncasecmp (__const char *__s1, __const char *__s2, size_t __n)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
#557 "/usr/include/string.h" 3 4
/* Return the next DELIM-delimited token from *STRINGP,
   terminating it with a '\0', and update *STRINGP to point past it.  */
extern char *strsep (char **__restrict __stringp,
       __const char *__restrict __delim)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));
#646 "/usr/include/string.h" 3 4

#73 "source/arch.h" 2
#96 "source/arch.h"
/*----------------------------------------------------------------------------*/
#6 "source/top_n_outlier_pruning_block.c" 2

#1 "source/stats.h" 1
#8 "source/top_n_outlier_pruning_block.c" 2
#1 "source/top_n_outlier_pruning_block.h" 1



/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
#1 "source/utility.h" 1



/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
#1 "source/checks.h" 1
/*
 * This header files checks for invalid combinations of preprocessor macros. It
 * also ensures that required preprocessor macros have been defined.
 */
#8 "source/utility.h" 2
#1 "source/arch.h" 1
/*
 * This header files enables and disables certain code features based on the
 * chosen architecture.
 *
 * The following architectures are available: C (__C__), MEX (__MEX__) and 
 * AutoESL (__AUTOESL__).
 */
#9 "source/utility.h" 2

#1 "/usr/include/assert.h" 1 3 4
/* Copyright (C) 1991,1992,1994-2001,2003,2004,2007
   Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */

/*
 *	ISO C99 Standard: 7.2 Diagnostics	<assert.h>
 */
#37 "/usr/include/assert.h" 3 4
#1 "/opt/Xilinx/2012.1/AutoESL/Linux_x86_64/tools/llvm_gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include/features.h" 1 3 4
/*  DO NOT EDIT THIS FILE.

    It has been auto-edited by fixincludes from:

	"/usr/include/features.h"

    This had to be done to correct non-standard usages in the
    original, manufacturer supplied header file.  */

/* Copyright (C) 1991-1993,1995-2003,2004,2005 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */
#38 "/usr/include/assert.h" 2 3 4







/* void assert (int expression);

   If NDEBUG is defined, do nothing.
   If not, and EXPRESSION is zero, print an error message and abort.  */
#68 "/usr/include/assert.h" 3 4


/* This prints an "Assertion failed" message and aborts.  */
extern void __assert_fail (__const char *__assertion, __const char *__file,
      unsigned int __line, __const char *__function)
     __attribute__ ((__nothrow__ )) __attribute__ ((__noreturn__));

/* Likewise, but prints the error text for ERRNUM.  */
extern void __assert_perror_fail (int __errnum, __const char *__file,
      unsigned int __line,
      __const char *__function)
     __attribute__ ((__nothrow__ )) __attribute__ ((__noreturn__));


/* The following is not at all used here but needed for standard
   compliance.  */
extern void __assert (const char *__assertion, const char *__file, int __line)
     __attribute__ ((__nothrow__ )) __attribute__ ((__noreturn__));



#103 "/usr/include/assert.h" 3 4
/* Version 2.4 and later of GCC define a magical variable `__PRETTY_FUNCTION__'
   which contains the name of the function currently being defined.
   This is broken in G++ before version 2.6.
   C9x has a similar variable called __func__, but prefer the GCC one since
   it demangles C++ function names.  */
#11 "source/utility.h" 2
#1 "/opt/Xilinx/2012.1/AutoESL/Linux_x86_64/tools/llvm_gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include/stddef.h" 1 3 4
/* Copyright (C) 1989, 1997, 1998, 1999, 2000, 2002, 2004
   Free Software Foundation, Inc.

This file is part of GCC.

GCC is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2, or (at your option)
any later version.

GCC is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with GCC; see the file COPYING.  If not, write to
the Free Software Foundation, 51 Franklin Street, Fifth Floor,
Boston, MA 02110-1301, USA.  */

/* As a special exception, if you include this header file into source
   files compiled by GCC, this header file does not by itself cause
   the resulting executable to be covered by the GNU General Public
   License.  This exception does not however invalidate any other
   reasons why the executable file might be covered by the GNU General
   Public License.  */

/*
 * ISO C Standard:  7.17  Common definitions  <stddef.h>
 */






/* Any one of these symbols __need_* means that GNU libc
   wants us just to define one data type.  So don't define
   the symbols that indicate this file's entire job has been done.  */





/* snaroff@next.com says the NeXT needs this.  */

/* Irix 5.1 needs this.  */




/* This avoids lossage on SunOS but only if stdtypes.h comes first.
   There's no way to win with the other order!  Sun lossage.  */

/* On 4.3bsd-net2, make sure ansi.h is included, so we have
   one less case to deal with in the following.  */



/* On FreeBSD 5, machine/ansi.h does not exist anymore... */




/* In 4.3bsd-net2, machine/ansi.h defines these symbols, which are
   defined if the corresponding type is *not* defined.
   FreeBSD-2.1 defines _MACHINE_ANSI_H_ instead of _ANSI_H_ */
#97 "/opt/Xilinx/2012.1/AutoESL/Linux_x86_64/tools/llvm_gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include/stddef.h" 3 4
/* Sequent's header files use _PTRDIFF_T_ in some conflicting way.
   Just ignore it.  */




/* On VxWorks, <type/vxTypesBase.h> may have defined macros like
   _TYPE_size_t which will typedef size_t.  fixincludes patched the
   vxTypesBase.h so that this macro is only defined if _GCC_SIZE_T is
   not defined, and so that defining this macro defines _GCC_SIZE_T.
   If we find that the macros are still defined at this point, we must
   invoke them so that the type is defined as expected.  */
#122 "/opt/Xilinx/2012.1/AutoESL/Linux_x86_64/tools/llvm_gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include/stddef.h" 3 4
/* In case nobody has defined these types, but we aren't running under
   GCC 2.00, make sure that __PTRDIFF_TYPE__, __SIZE_TYPE__, and
   __WCHAR_TYPE__ have reasonable values.  This can happen if the
   parts of GCC is compiled by an older compiler, that actually
   include gstddef.h, such as collect2.  */

/* Signed type of difference of two pointers.  */

/* Define this type if we are doing the whole job,
   or if we want this type in particular.  */
#152 "/opt/Xilinx/2012.1/AutoESL/Linux_x86_64/tools/llvm_gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include/stddef.h" 3 4
typedef long int ptrdiff_t;
#162 "/opt/Xilinx/2012.1/AutoESL/Linux_x86_64/tools/llvm_gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include/stddef.h" 3 4
/* If this symbol has done its job, get rid of it.  */




/* Unsigned type of `sizeof' something.  */

/* Define this type if we are doing the whole job,
   or if we want this type in particular.  */
#240 "/opt/Xilinx/2012.1/AutoESL/Linux_x86_64/tools/llvm_gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include/stddef.h" 3 4
/* Wide character type.
   Locale-writers should change this as necessary to
   be big enough to hold unique values not between 0 and 127,
   and not (wchar_t) -1, for each defined multibyte character.  */

/* Define this type if we are doing the whole job,
   or if we want this type in particular.  */
#281 "/opt/Xilinx/2012.1/AutoESL/Linux_x86_64/tools/llvm_gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include/stddef.h" 3 4
/* On BSD/386 1.1, at least, machine/ansi.h defines _BSD_WCHAR_T_
   instead of _WCHAR_T_, and _BSD_RUNE_T_ (which, unlike the other
   symbols in the _FOO_T_ family, stays defined even after its
   corresponding type is defined).  If we define wchar_t, then we
   must undef _WCHAR_T_; for BSD/386 1.1 (and perhaps others), if
   we undef _WCHAR_T_, then we must also define rune_t, since 
   headers like runetype.h assume that if machine/ansi.h is included,
   and _BSD_WCHAR_T_ is not defined, then rune_t is available.
   machine/ansi.h says, "Note that _WCHAR_T_ and _RUNE_T_ must be of
   the same type." */
#308 "/opt/Xilinx/2012.1/AutoESL/Linux_x86_64/tools/llvm_gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include/stddef.h" 3 4
/* FreeBSD 5 can't be handled well using "traditional" logic above
   since it no longer defines _BSD_RUNE_T_ yet still desires to export
   rune_t in some cases... */
#326 "/opt/Xilinx/2012.1/AutoESL/Linux_x86_64/tools/llvm_gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include/stddef.h" 3 4
typedef int wchar_t;
#360 "/opt/Xilinx/2012.1/AutoESL/Linux_x86_64/tools/llvm_gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include/stddef.h" 3 4
/*  In 4.3bsd-net2, leave these undefined to indicate that size_t, etc.
    are already defined.  */
/*  BSD/OS 3.1 and FreeBSD [23].x require the MACHINE_ANSI_H check here.  */
#395 "/opt/Xilinx/2012.1/AutoESL/Linux_x86_64/tools/llvm_gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include/stddef.h" 3 4
/* A null pointer constant.  */
#413 "/opt/Xilinx/2012.1/AutoESL/Linux_x86_64/tools/llvm_gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include/stddef.h" 3 4
/* Offset of member MEMBER in a struct of type TYPE. */
#12 "source/utility.h" 2
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* General purpose utility macros                                             */
/*============================================================================*/



/* An empty statement to force the use of a semicolon. */


/* Create an assertion. */




/* Assert that a variable is not null. */
#37 "source/utility.h"
/* Declare an unused variable. */
#47 "source/utility.h"
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* Boolean type                                                               */
/*============================================================================*/
typedef int boolean;
#61 "source/utility.h"
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* Types                                                                      */
/*============================================================================*/
typedef int int_t;
typedef unsigned int uint_t;
typedef size_t index_t; /* a type to index into arrays */
typedef double double_t;
typedef unsigned long long lint_t; /* large integer type */

static const index_t null_index = 0;
static const index_t start_index = 1;
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* Return values                                                              */
/*============================================================================*/





/*----------------------------------------------------------------------------*/
#8 "source/top_n_outlier_pruning_block.h" 2
#1 "/opt/Xilinx/2012.1/AutoESL/Linux_x86_64/tools/llvm_gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include/stddef.h" 1 3 4
/* Copyright (C) 1989, 1997, 1998, 1999, 2000, 2002, 2004
   Free Software Foundation, Inc.

This file is part of GCC.

GCC is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2, or (at your option)
any later version.

GCC is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with GCC; see the file COPYING.  If not, write to
the Free Software Foundation, 51 Franklin Street, Fifth Floor,
Boston, MA 02110-1301, USA.  */

/* As a special exception, if you include this header file into source
   files compiled by GCC, this header file does not by itself cause
   the resulting executable to be covered by the GNU General Public
   License.  This exception does not however invalidate any other
   reasons why the executable file might be covered by the GNU General
   Public License.  */

/*
 * ISO C Standard:  7.17  Common definitions  <stddef.h>
 */
#9 "source/top_n_outlier_pruning_block.h" 2
/*----------------------------------------------------------------------------*/

void top_n_outlier_pruning_block(
    const size_t num_vectors,
    const size_t vector_dims,
    const double_t (* const data)[num_vectors][vector_dims],
    const size_t k,
    const size_t N,
    const __attribute__((unused)) size_t default_block_size,
    index_t (* const outliers)[N],
    double_t (* const outlier_scores)[N]
    );
#9 "source/top_n_outlier_pruning_block.c" 2


#1 "/opt/Xilinx/2012.1/AutoESL/Linux_x86_64/tools/llvm_gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include/float.h" 1 3 4
/* Copyright (C) 2002 Free Software Foundation, Inc.

This file is part of GCC.

GCC is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2, or (at your option)
any later version.

GCC is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with GCC; see the file COPYING.  If not, write to
the Free Software Foundation, 51 Franklin Street, Fifth Floor,
Boston, MA 02110-1301, USA.  */

/* As a special exception, if you include this header file into source
   files compiled by GCC, this header file does not by itself cause
   the resulting executable to be covered by the GNU General Public
   License.  This exception does not however invalidate any other
   reasons why the executable file might be covered by the GNU General
   Public License.  */

/*
 * ISO C Standard:  5.2.4.2.2  Characteristics of floating types <float.h>
 */




/* Radix of exponent representation, b. */



/* Number of base-FLT_RADIX digits in the significand, p.  */







/* Number of decimal digits, q, such that any floating-point number with q
   decimal digits can be rounded into a floating-point number with p radix b
   digits and back again without change to the q decimal digits,

	p * log10(b)			if b is a power of 10
	floor((p - 1) * log10(b))	otherwise
*/







/* Minimum int x such that FLT_RADIX**(x-1) is a normalized float, emin */







/* Minimum negative integer such that 10 raised to that power is in the
   range of normalized floating-point numbers,

	ceil(log10(b) * (emin - 1))
*/







/* Maximum int x such that FLT_RADIX**(x-1) is a representable float, emax.  */







/* Maximum integer such that 10 raised to that power is in the range of
   representable finite floating-point numbers,

	floor(log10((1 - b**-p) * b**emax))
*/







/* Maximum representable finite floating-point number,

	(1 - b**-p) * b**emax
*/







/* The difference between 1 and the least value greater than 1 that is
   representable in the given floating point type, b**1-p.  */







/* Minimum normalized positive floating-point number, b**(emin - 1).  */







/* Addition rounds to 0: zero, 1: nearest, 2: +inf, 3: -inf, -1: unknown.  */
/* APPLE LOCAL begin 3399553 */
/* This changes with calls to fesetround in <fenv.h>.  */


/* APPLE LOCAL end 3399553 */
#12 "source/top_n_outlier_pruning_block.c" 2
#1 "/opt/Xilinx/2012.1/AutoESL/Linux_x86_64/tools/llvm_gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include/stddef.h" 1 3 4
/* Copyright (C) 1989, 1997, 1998, 1999, 2000, 2002, 2004
   Free Software Foundation, Inc.

This file is part of GCC.

GCC is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2, or (at your option)
any later version.

GCC is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with GCC; see the file COPYING.  If not, write to
the Free Software Foundation, 51 Franklin Street, Fifth Floor,
Boston, MA 02110-1301, USA.  */

/* As a special exception, if you include this header file into source
   files compiled by GCC, this header file does not by itself cause
   the resulting executable to be covered by the GNU General Public
   License.  This exception does not however invalidate any other
   reasons why the executable file might be covered by the GNU General
   Public License.  */

/*
 * ISO C Standard:  7.17  Common definitions  <stddef.h>
 */
#13 "source/top_n_outlier_pruning_block.c" 2
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* Forward declarations                                                       */
/*============================================================================*/
static inline double_t distance_squared(
    const size_t vector_dims,
    const double_t (* const vector1)[vector_dims],
    const double_t (* const vector2)[vector_dims]
    );
static inline double_t insert(
    const size_t k,
    index_t (* const neighbours)[k],
    double_t (* const neighbours_dist)[k],
    uint_t * const found,
    const index_t new_neighbour,
    const double_t new_neighbour_dist
    );
static inline void best_outliers(
    const size_t N,
    size_t * const outliers_size,
    index_t (* const outliers)[N],
    double_t (* const outlier_scores)[N],
    const size_t block_size,
    index_t (* const current_block)[block_size],
    double_t (* const scores)[block_size]
    );
static inline void sort_vectors_descending(
    const size_t size,
    index_t (* const indexes)[size],
    double_t (* const values)[size]
    );
static inline void merge(
    const size_t N,
    const size_t global_outliers_size,
    index_t (* const global_outliers)[N],
    double_t (* const global_outlier_scores)[N],
    const size_t block_size,
    index_t (* const local_outliers)[block_size],
    double_t (* const local_outlier_scores)[block_size],
    size_t * const new_outliers_size,
    index_t (* const new_outliers)[N],
    double_t (* const new_outlier_scores)[N]
    );
/*----------------------------------------------------------------------------*/

/*
 * Calculate the square of the Euclidean distance between two vectors (i.e. the
 * sum of the squares of the distance in each dimension).
 *
 * Parameters:
 *     - vector_dims: The dimensionality of the vectors.
 *     - vectors: The array containg the vectors between which to calculate the
 *           distance.
 *     - vector1: An array of floating point numbers representing the first 
 *           vector.
 *     - vector1: An array of floating point numbers representing the second 
 *           vector.
 *
 * Return:
 *    The square of the distance between the two vectors.
 */
static inline double_t distance_squared(const size_t vector_dims,
                                        const double_t (* const vector1)[vector_dims],
                                        const double_t (* const vector2)[vector_dims]) {_ssdm_SpecArrayDimSize(vector1,vector_dims);_ssdm_SpecArrayDimSize(vector2,vector_dims);
    do {} while (0);
    do {} while (0);
    ((vector_dims > 0) ? (void) (0) : __assert_fail ("vector_dims > 0", "source/top_n_outlier_pruning_block.c", 80, __PRETTY_FUNCTION__));

    do {} while (0);

    double_t sum_of_squares = 0;

    uint_t dim;
    for (dim = 0; dim < vector_dims; dim++) {
        const double_t val = (*vector1)[dim] - (*vector2)[dim];
        const double_t val_squared = val * val;
        sum_of_squares += val_squared;
    }

    return sum_of_squares;
}

/*
 * Insert a neighbouring vector into the k nearest neighbours array for a 
 * particular vector. Returns the distance value that was removed from the 
 * "neighbours_dist" vector, else -1 if no vector was removed.
 *
 * Parameters:
 *     - k: The number of neighbours to keep track of for each vector.
 *     - neighbours: The k nearest neighbours for the current vector.
 *     - neighbours_dist: The distances to the k nearest neighbours for the 
 *           current vector.
 *     - found: The number of initialised entries in the neighbours and 
 *           neighbours_dist arrays.
 *     - new_neighbour: The new value to be inserted into the neighbours array.
 *     - new_neighbour_dist: The new value to be inserted into the 
 *           neighbours_dist array.
 */
static inline double_t insert(const size_t k,
                              index_t (* const neighbours)[k],
                              double_t (* const neighbours_dist)[k],
                              uint_t * const found,
                              const index_t new_neighbour,
                              const double_t new_neighbour_dist) {_ssdm_SpecArrayDimSize(neighbours,k);_ssdm_SpecArrayDimSize(neighbours_dist,k);
    /* Error checking. */
    do {} while (0);
    do {} while (0);
    ((k > 0) ? (void) (0) : __assert_fail ("k > 0", "source/top_n_outlier_pruning_block.c", 121, __PRETTY_FUNCTION__));
    do {} while (0);
    ((*found <= k) ? (void) (0) : __assert_fail ("*found <= k", "source/top_n_outlier_pruning_block.c", 123, __PRETTY_FUNCTION__));
    ((new_neighbour >= start_index) ? (void) (0) : __assert_fail ("new_neighbour >= start_index", "source/top_n_outlier_pruning_block.c", 124, __PRETTY_FUNCTION__));

    int_t insert_index = -1; /* the index at which the new outlier will be inserted */
    double_t removed_value = -1; /* the value that was removed from the neighbours_dist array */


    /*
     * Shuffle array elements from front to back. Elements greater than the new
     * value will be right-shifted by one index in the array.
     *
     * Note that uninitialised values in the array will appear on the left. That
     * is, if the array is incomplete (has a size n < N) then the data in the
     * array is stored in the rightmost n indexes.
     */

    if (*found < k) {
        /* Special handling required if the array is incomplete. */

        uint_t i;
        for (i = k - *found - 1; i < k; i++) {
            if (new_neighbour_dist > (*neighbours_dist)[i] || i == (k - *found - 1)) {
                /* Shuffle values down the array. */
                if (i > 0) {
                    (*neighbours )[i-1] = (*neighbours )[i];
                    (*neighbours_dist)[i-1] = (*neighbours_dist)[i];
                }
                insert_index = i;
                removed_value = 0;
            } else {
                /* We have found the insertion point. */
                break;
            }
        }
    } else {
        int_t i;
        for (i = k-1; i >= 0; i--) {
            if (new_neighbour_dist < (*neighbours_dist)[i]) {
                if ((unsigned) i == k - 1)
                    /*
                     * The removed value is the value of the last element in the
                     * array.
                     */
                    removed_value = (*neighbours_dist)[i];
                /* Shuffle values down the array. */
                if (i > 0) {
                    (*neighbours )[i] = (*neighbours )[i-1];
                    (*neighbours_dist)[i] = (*neighbours_dist)[i-1];
                }
                insert_index = i;
            } else {
                /* We have found the insertion point. */
                break;
            }
        }
    }
#202 "source/top_n_outlier_pruning_block.c"
    /*
     * Insert the new pair and increment the current_size of the array (if
     * necessary).
     */
    if (insert_index >= 0) {
        (*neighbours )[insert_index] = new_neighbour;
        (*neighbours_dist)[insert_index] = new_neighbour_dist;

        if (*found < k)
            (*found)++;
    }

    return removed_value;
}

/*
 * Take the top N outliers based on the global outliers (identified by the
 * (outliers, outlier_scores) pairs) and the new outliers from the current block
 * (identified by the (current_block, scores) pairs).
 *
 * Note that the (outliers, outlier_scores) vectors should already be sorted.
 * The (current_block, scores) vector need not be sorted.
 *
 * Parameters:
 *     - N: The number of outliers to locate.
 *     - outliers_size: The number of initialised entries in the outliers and 
 *           outlier_scores arrays.
 *     - outliers: A vector containing the indexes of the current global 
 *           outliers.
 *     - outlier_scores: A vector containing the scores of the current global 
 *           outliers.
 *     - block_size: The number of vectors in the current block.
 *     - current_block: An array containing the indexes of the vectors in the
             current block.
 *     - scores: A vector containing the outlier scores for each element in the 
 *           current block.
 */
static inline void best_outliers(const size_t N, size_t * outliers_size,
                                 index_t (*const outliers)[N],
                                 double_t (*const outlier_scores)[N],
                                 const size_t block_size,
                                 index_t (* const current_block)[block_size],
                                 double_t (* const scores)[block_size]
                                 ) {_ssdm_SpecArrayDimSize(outlier_scores,N);_ssdm_SpecArrayDimSize(outliers,N);_ssdm_SpecArrayDimSize(scores,block_size);_ssdm_SpecArrayDimSize(current_block,block_size);
    /* Error checking. */
    do {} while (0);
    do {} while (0);
    do {} while (0);
    ((*outliers_size <= N) ? (void) (0) : __assert_fail ("*outliers_size <= N", "source/top_n_outlier_pruning_block.c", 250, __PRETTY_FUNCTION__));
    ((N > 0) ? (void) (0) : __assert_fail ("N > 0", "source/top_n_outlier_pruning_block.c", 251, __PRETTY_FUNCTION__));
    do {} while (0);
    do {} while (0);
    ((block_size > 0) ? (void) (0) : __assert_fail ("block_size > 0", "source/top_n_outlier_pruning_block.c", 254, __PRETTY_FUNCTION__));

    /* Sort the (current_block, scores) vectors in descending order of value. */
    sort_vectors_descending(block_size, current_block, scores);

    /* Create two temporary vectors for the output of the "merge" function. */
    index_t new_outliers [N];
    double_t new_outlier_scores[N];
    size_t new_outliers_size = 0;

    memset(new_outliers, null_index, (N) * (sizeof(index_t)));
    memset(new_outlier_scores, 0, (N) * (sizeof(double_t)));

    /* Merge the two vectors. */
    merge(N, *outliers_size, outliers, outlier_scores, block_size, current_block, scores, &new_outliers_size, &new_outliers, &new_outlier_scores);

    /* Copy values from temporary vectors to real vectors. */
    memcpy(*outliers, new_outliers, (N) * (sizeof(index_t)));
    memcpy(*outlier_scores, new_outlier_scores, (N) * (sizeof(double_t)));
    *outliers_size = new_outliers_size;
}

/*
 * Sort paired vectors in descending order. This function uses bubble sort.
 *
 * Parameters:
 *     - size: The number of elements in the indexes and values arrays.
 *     - indexes: A vector containing the indexes of the paired vectors.
 *     - values: A vector containing the values of the paired vectors.
 */
static inline void sort_vectors_descending(const size_t size,
                                           index_t (* const indexes)[size],
                                           double_t (* const values)[size]) {_ssdm_SpecArrayDimSize(values,size);_ssdm_SpecArrayDimSize(indexes,size);
    /* Error checking. */
    do {} while (0);
    do {} while (0);
    ((size > 0) ? (void) (0) : __assert_fail ("size > 0", "source/top_n_outlier_pruning_block.c", 290, __PRETTY_FUNCTION__));

    uint_t i;
    for (i = 0; i < size; i++) {
     int_t j;
     index_t ind = (*indexes)[i];
        double_t val = (*values )[i];
        for (j = i-1; j >= 0; j--) {
            if ((*values)[j] >= val)
                break;
            (*indexes)[j+1] = (*indexes)[j];
            (*values )[j+1] = (*values )[j];
        }
        (*indexes)[j+1] = ind;
        (*values )[j+1] = val;
    }
}

/*
 * Merge two sorted vector in descending order. Takes two pairs of vectors and
 * and returns a (sorted) pair of vectors.
 *
 * Parameters:
 *     - N: The number of outliers to keep track of.
 *     - global_outliers_size: The number of initialised elements in the 
 *           current_outliers and current_outlier_scores arrays.
 *     - global_outliers: The indexes of the current global outliers.
 *     - global_outlier_scores: The sccores associated with the current global
 *           outliers.
 *     - block_size: The size of the current block.
 *     - local_outliers: The indexes of the outliers determined from the current
 *           block.
 *     - local_outlier_scores: The scores associated with the local outliers.
 *     - new_outliers_size: The size of the resultant merged outliers array.
 *     - new_outliers: The resultant merged outliers array.
 *     - new_outlier_scores: The scores associated with the resultant merged 
 *           outliers array.
 */
static inline void merge(const size_t N,
                         const size_t global_outliers_size, index_t (* const global_outliers)[N], double_t (* const global_outlier_scores)[N],
                         const size_t block_size, index_t (* const local_outliers)[block_size], double_t (* const local_outlier_scores)[block_size],
                         size_t * const new_outliers_size, index_t (* const new_outliers)[N], double_t (* const new_outlier_scores)[N]) {_ssdm_SpecArrayDimSize(local_outliers,block_size);_ssdm_SpecArrayDimSize(new_outliers,N);_ssdm_SpecArrayDimSize(global_outlier_scores,N);_ssdm_SpecArrayDimSize(global_outliers,N);_ssdm_SpecArrayDimSize(new_outlier_scores,N);_ssdm_SpecArrayDimSize(local_outlier_scores,block_size);
    /* Error checking. */
    do {} while (0);
    do {} while (0);
    ((global_outliers_size <= N) ? (void) (0) : __assert_fail ("global_outliers_size <= N", "source/top_n_outlier_pruning_block.c", 335, __PRETTY_FUNCTION__));
    ((N > 0) ? (void) (0) : __assert_fail ("N > 0", "source/top_n_outlier_pruning_block.c", 336, __PRETTY_FUNCTION__));
    do {} while (0);
    do {} while (0);
    ((block_size > 0) ? (void) (0) : __assert_fail ("block_size > 0", "source/top_n_outlier_pruning_block.c", 339, __PRETTY_FUNCTION__));
    do {} while (0);
    do {} while (0);
    do {} while (0);

    *new_outliers_size = 0;
    uint_t iter = 0; /* iterator through output array */
    uint_t global = 0; /* iterator through global array */
    uint_t local = 0; /* iterator through local array */
    while (iter < N && (global < global_outliers_size || local < block_size)) {
        if (global >= global_outliers_size && local < block_size) {
            /* There are no remaining elements in the global arrays. */
            (*new_outliers )[iter] = (*local_outliers )[local];
            (*new_outlier_scores)[iter] = (*local_outlier_scores)[local];
            local ++;
            global++;
        } else if (global < global_outliers_size && local >= block_size) {
            /* There are no remaining elements in the local arrays. */
            (*new_outliers )[iter] = (*global_outliers )[global];
            (*new_outlier_scores)[iter] = (*global_outlier_scores)[global];
            local ++;
            global++;
        } else if (global >= global_outliers_size && local >= block_size) {
            /*
             * There are no remaining elements in either the global or local 
             * arrays.
             */
            break;
        } else if ((*global_outlier_scores)[global] >= (*local_outlier_scores)[local]) {
            (*new_outliers )[iter] = (*global_outliers )[global];
            (*new_outlier_scores)[iter] = (*global_outlier_scores)[global];
            global++;
        } else if ((*global_outlier_scores)[global] <= (*local_outlier_scores)[local]) {
            (*new_outliers )[iter] = (*local_outliers )[local];
            (*new_outlier_scores)[iter] = (*local_outlier_scores)[local];
            local++;
        }

        iter++;
        (*new_outliers_size)++;
    }
}

/*
 * Examine a data set and find the top N outliers. Performs operations on the
 * data array in blocks of size block_size.
 *
 * Parameters:
 *     - num_vectors: The number of vectors contained in the data array.
 *     - vector_dims: The dimensionality of each vector contained in the data 
 *           array.
 *     - data: The input data set.
 *     - k: The number of k-nearest neighbours for outlier detection.
 *     - N: The top N outliers will be returned by this function.
 *     - default_block_size: The input data array will be processed in blocks of
 *           size block_size, where possible.
 *     - outliers: A vector used to store the top N outliers identified by this
 *           function. Each entry in this vector will be an index (to the data
 *           array) of the outlying vector.
 *     - outlier_scores: A vector used to score the score associated with
 *           each of the outliers stored in the outliers array.
 */
void top_n_outlier_pruning_block(const size_t num_vectors, const size_t vector_dims,
                                 const double_t (* const data)[num_vectors][vector_dims],
                                 const size_t k, const size_t N, const __attribute__((unused)) size_t default_block_size,
                                 index_t (* const outliers)[N], double_t (* const outlier_scores)[N]) {_ssdm_SpecArrayDimSize(outlier_scores,N);_ssdm_SpecArrayDimSize(outliers,N);_ssdm_SpecArrayDimSize(data,num_vectors);SSDM_KEEP_name(stderr._flags, &stderr->_flags); SSDM_KEEP_name(stderr._IO_read_ptr, &stderr->_IO_read_ptr); SSDM_KEEP_name(stderr._IO_read_end, &stderr->_IO_read_end); SSDM_KEEP_name(stderr._IO_read_base, &stderr->_IO_read_base); SSDM_KEEP_name(stderr._IO_write_base, &stderr->_IO_write_base); SSDM_KEEP_name(stderr._IO_write_ptr, &stderr->_IO_write_ptr); SSDM_KEEP_name(stderr._IO_write_end, &stderr->_IO_write_end); SSDM_KEEP_name(stderr._IO_buf_base, &stderr->_IO_buf_base); SSDM_KEEP_name(stderr._IO_buf_end, &stderr->_IO_buf_end); SSDM_KEEP_name(stderr._IO_save_base, &stderr->_IO_save_base); SSDM_KEEP_name(stderr._IO_backup_base, &stderr->_IO_backup_base); SSDM_KEEP_name(stderr._IO_save_end, &stderr->_IO_save_end); SSDM_KEEP_name(stderr._markers._next, &stderr->_markers->_next); SSDM_KEEP_name(stderr._markers._sbuf, &stderr->_markers->_sbuf); SSDM_KEEP_name(stderr._markers._pos, &stderr->_markers->_pos); SSDM_KEEP_name(stderr._chain, &stderr->_chain); SSDM_KEEP_name(stderr._fileno, &stderr->_fileno); SSDM_KEEP_name(stderr._flags2, &stderr->_flags2); SSDM_KEEP_name(stderr._old_offset, &stderr->_old_offset); SSDM_KEEP_name(stderr._cur_column, &stderr->_cur_column); SSDM_KEEP_name(stderr._vtable_offset, &stderr->_vtable_offset); SSDM_KEEP_name(stderr._shortbuf, &stderr->_shortbuf); SSDM_KEEP_name(stderr._lock, &stderr->_lock); SSDM_KEEP_name(stderr._offset, &stderr->_offset); SSDM_KEEP_name(stderr.__pad1, &stderr->__pad1); SSDM_KEEP_name(stderr.__pad2, &stderr->__pad2); SSDM_KEEP_name(stderr.__pad3, &stderr->__pad3); SSDM_KEEP_name(stderr.__pad4, &stderr->__pad4); SSDM_KEEP_name(stderr.__pad5, &stderr->__pad5); SSDM_KEEP_name(stderr._mode, &stderr->_mode); SSDM_KEEP_name(stderr._unused2, &stderr->_unused2); SSDM_KEEP_name(stdout._flags, &stdout->_flags); SSDM_KEEP_name(stdout._IO_read_ptr, &stdout->_IO_read_ptr); SSDM_KEEP_name(stdout._IO_read_end, &stdout->_IO_read_end); SSDM_KEEP_name(stdout._IO_read_base, &stdout->_IO_read_base); SSDM_KEEP_name(stdout._IO_write_base, &stdout->_IO_write_base); SSDM_KEEP_name(stdout._IO_write_ptr, &stdout->_IO_write_ptr); SSDM_KEEP_name(stdout._IO_write_end, &stdout->_IO_write_end); SSDM_KEEP_name(stdout._IO_buf_base, &stdout->_IO_buf_base); SSDM_KEEP_name(stdout._IO_buf_end, &stdout->_IO_buf_end); SSDM_KEEP_name(stdout._IO_save_base, &stdout->_IO_save_base); SSDM_KEEP_name(stdout._IO_backup_base, &stdout->_IO_backup_base); SSDM_KEEP_name(stdout._IO_save_end, &stdout->_IO_save_end); SSDM_KEEP_name(stdout._markers._next, &stdout->_markers->_next); SSDM_KEEP_name(stdout._markers._sbuf, &stdout->_markers->_sbuf); SSDM_KEEP_name(stdout._markers._pos, &stdout->_markers->_pos); SSDM_KEEP_name(stdout._chain, &stdout->_chain); SSDM_KEEP_name(stdout._fileno, &stdout->_fileno); SSDM_KEEP_name(stdout._flags2, &stdout->_flags2); SSDM_KEEP_name(stdout._old_offset, &stdout->_old_offset); SSDM_KEEP_name(stdout._cur_column, &stdout->_cur_column); SSDM_KEEP_name(stdout._vtable_offset, &stdout->_vtable_offset); SSDM_KEEP_name(stdout._shortbuf, &stdout->_shortbuf); SSDM_KEEP_name(stdout._lock, &stdout->_lock); SSDM_KEEP_name(stdout._offset, &stdout->_offset); SSDM_KEEP_name(stdout.__pad1, &stdout->__pad1); SSDM_KEEP_name(stdout.__pad2, &stdout->__pad2); SSDM_KEEP_name(stdout.__pad3, &stdout->__pad3); SSDM_KEEP_name(stdout.__pad4, &stdout->__pad4); SSDM_KEEP_name(stdout.__pad5, &stdout->__pad5); SSDM_KEEP_name(stdout._mode, &stdout->_mode); SSDM_KEEP_name(stdout._unused2, &stdout->_unused2); SSDM_KEEP_name(stdin._flags, &stdin->_flags); SSDM_KEEP_name(stdin._IO_read_ptr, &stdin->_IO_read_ptr); SSDM_KEEP_name(stdin._IO_read_end, &stdin->_IO_read_end); SSDM_KEEP_name(stdin._IO_read_base, &stdin->_IO_read_base); SSDM_KEEP_name(stdin._IO_write_base, &stdin->_IO_write_base); SSDM_KEEP_name(stdin._IO_write_ptr, &stdin->_IO_write_ptr); SSDM_KEEP_name(stdin._IO_write_end, &stdin->_IO_write_end); SSDM_KEEP_name(stdin._IO_buf_base, &stdin->_IO_buf_base); SSDM_KEEP_name(stdin._IO_buf_end, &stdin->_IO_buf_end); SSDM_KEEP_name(stdin._IO_save_base, &stdin->_IO_save_base); SSDM_KEEP_name(stdin._IO_backup_base, &stdin->_IO_backup_base); SSDM_KEEP_name(stdin._IO_save_end, &stdin->_IO_save_end); SSDM_KEEP_name(stdin._markers._next, &stdin->_markers->_next); SSDM_KEEP_name(stdin._markers._sbuf, &stdin->_markers->_sbuf); SSDM_KEEP_name(stdin._markers._pos, &stdin->_markers->_pos); SSDM_KEEP_name(stdin._chain, &stdin->_chain); SSDM_KEEP_name(stdin._fileno, &stdin->_fileno); SSDM_KEEP_name(stdin._flags2, &stdin->_flags2); SSDM_KEEP_name(stdin._old_offset, &stdin->_old_offset); SSDM_KEEP_name(stdin._cur_column, &stdin->_cur_column); SSDM_KEEP_name(stdin._vtable_offset, &stdin->_vtable_offset); SSDM_KEEP_name(stdin._shortbuf, &stdin->_shortbuf); SSDM_KEEP_name(stdin._lock, &stdin->_lock); SSDM_KEEP_name(stdin._offset, &stdin->_offset); SSDM_KEEP_name(stdin.__pad1, &stdin->__pad1); SSDM_KEEP_name(stdin.__pad2, &stdin->__pad2); SSDM_KEEP_name(stdin.__pad3, &stdin->__pad3); SSDM_KEEP_name(stdin.__pad4, &stdin->__pad4); SSDM_KEEP_name(stdin.__pad5, &stdin->__pad5); SSDM_KEEP_name(stdin._mode, &stdin->_mode); SSDM_KEEP_name(stdin._unused2, &stdin->_unused2); 
    /* Error checking. */
    do {} while (0);
    ((vector_dims > 0) ? (void) (0) : __assert_fail ("vector_dims > 0", "source/top_n_outlier_pruning_block.c", 407, __PRETTY_FUNCTION__));
    ((k > 0) ? (void) (0) : __assert_fail ("k > 0", "source/top_n_outlier_pruning_block.c", 408, __PRETTY_FUNCTION__));
    ((N > 0) ? (void) (0) : __assert_fail ("N > 0", "source/top_n_outlier_pruning_block.c", 409, __PRETTY_FUNCTION__));
    ((default_block_size > 0) ? (void) (0) : __assert_fail ("default_block_size > 0", "source/top_n_outlier_pruning_block.c", 410, __PRETTY_FUNCTION__));
    do {} while (0);
    do {} while (0);

    /* Set output to zero. */
    memset(*outliers, null_index, (N) * (sizeof(index_t)));
    memset(*outlier_scores, 0, (N) * (sizeof(double_t)));

    double_t cutoff = 0; /* vectors with a score less than the cutoff will be removed from the block */
    size_t outliers_found = 0; /* the number of initialised elements in the outliers array */


    index_t block_begin; /* the index of the first vector in the block currently being processed */
    size_t block_size; /* block_size may be smaller than devfault_block_size if "num_vectors mod default_block_size != 0" */

    for (block_begin = 0; block_begin < num_vectors; block_begin += block_size) { /* while there are still blocks to process */
        block_size = ((block_begin + default_block_size) < (num_vectors) ? (block_begin + default_block_size) : (num_vectors)) - block_begin; /* the number of vectors in the current block */
        ((block_size <= default_block_size) ? (void) (0) : __assert_fail ("block_size <= default_block_size", "source/top_n_outlier_pruning_block.c", 427, __PRETTY_FUNCTION__));

        index_t current_block[block_size]; /* the indexes of the vectors in the current block */
        index_t neighbours[block_size][k]; /* the "k" nearest neighbours for each vector in the current block */
        double_t neighbours_dist[block_size][k]; /* the distance of the "k" nearest neighbours for each vector in the current block */
        double_t score[block_size]; /* the average distance to the "k" neighbours */
        uint_t found[block_size]; /* how many nearest neighbours we have found, for each vector in the block */

        /* Reset array contents */
        do {
            uint_t i;
            for (i = 0; i < block_size; i++)
                current_block[i] = (index_t)((block_begin + i) + start_index);
        } while (0);
        memset(&neighbours, null_index, (block_size * k) * (sizeof(index_t)));
        memset(&neighbours_dist, 0, (block_size * k) * (sizeof(double_t)));
        memset(&score, 0, (block_size) * (sizeof(double_t)));
        memset(&found, 0, (block_size) * (sizeof(uint_t)));

        index_t vector1;
        for (vector1 = start_index; vector1 < num_vectors + start_index; vector1++) {
            uint_t block_index;
            for (block_index = 0; block_index < block_size; block_index++) {
                const index_t vector2 = current_block[block_index];

                if (vector1 != vector2 && vector2 >= start_index) {
                    /*
                     * Calculate the square of the distance between the two
                     * vectors (indexed by "vector1" and "vector2")
                     */
                    const double_t dist_squared = distance_squared(vector_dims, &((*data)[vector1-start_index]), &((*data)[vector2-start_index]));

                    /*
                     * Insert the new (index, distance) pair into the neighbours
                     * array for the current vector.
                     */

                    const double_t removed_distance = insert(k, &(neighbours[block_index]), &(neighbours_dist[block_index]), &(found[block_index]), vector1, dist_squared);

                    /*
                     * Update the score (if the neighbours array was changed).
                     */
                    if (removed_distance >= 0)
                        score[block_index] = (double_t) ((score[block_index] * k - removed_distance + dist_squared) / k);

                    /*
                     * If the score for this vector is less than the cutoff,
                     * then prune this vector from the block.
                     */
                    if (found[block_index] >= k && score[block_index] < cutoff) {
                        current_block[block_index] = null_index;
                        score [block_index] = 0;
                        do {} while (0);
                    }
                }
            }
        }

        /* Keep track of the top "N" outliers. */
        best_outliers(N, &outliers_found, outliers, outlier_scores, block_size, &current_block, &score);

        /*
         * Set "cutoff" to the score of the weakest outlier. There is no need to
         * store an outlier in future iterations if its score is better than the
         * cutoff.
         */
        cutoff = (*outlier_scores)[N-1];
    }
#554 "source/top_n_outlier_pruning_block.c"
}
