#pragma line 1 "distance_squared.c"
#pragma line 1 "<built-in>"
#pragma line 1 "<command-line>"
#pragma line 1 "C:/Xilinx/2012.1/AutoESL/common/technology/autopilot/etc/autopilot_ssdm_op.h" 1
/* autopilot_ssdm_op.h*/
/*
 * Copyright (C) 2011 XILINX, Inc. 
 *
 * $Id$
 */
#pragma line 222 "C:/Xilinx/2012.1/AutoESL/common/technology/autopilot/etc/autopilot_ssdm_op.h"
/*#define _ssdm_op_WaitUntil(X) while (!(X)) _ssdm_op_Wait(1);
#define _ssdm_op_Delayed(X) X */
#pragma line 1 "<command-line>" 2
#pragma line 1 "distance_squared.c"
#pragma line 1 "distance_squared.h" 1
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma line 1 "c:/xilinx/2012.1/autoesl/win_x86/tools/llvm_gcc/bin/../lib/gcc/i686-pc-mingw32/4.2.1/../../../../include/stdlib.h" 1 3
/*
 * stdlib.h
 * This file has no copyright assigned and is placed in the Public Domain.
 * This file is a part of the mingw-runtime package.
 * No warranty is given; refer to the file DISCLAIMER within the package.
 *
 * Definitions for common types, variables, and functions.
 *
 */
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
/* All the headers include this file. */
#pragma line 1 "c:/xilinx/2012.1/autoesl/win_x86/tools/llvm_gcc/bin/../lib/gcc/i686-pc-mingw32/4.2.1/../../../../include/_mingw.h" 1 3
#pragma empty_line
/*
 * _mingw.h
 *
 * Mingw specific macros included by ALL include files.
 *
 * This file is part of the Mingw32 package.
 *
 * Contributors:
 *  Created by Mumit Khan  <khan@xraylith.wisc.edu>
 *
 *  THIS SOFTWARE IS NOT COPYRIGHTED
 *
 *  This source code is offered for use in the public domain. You may
 *  use, modify or distribute it freely.
 *
 *  This code is distributed in the hope that it will be useful but
 *  WITHOUT ANY WARRANTY. ALL WARRANTIES, EXPRESS OR IMPLIED ARE HEREBY
 *  DISCLAIMED. This includes but is not limited to warranties of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 *
 */
#pragma line 31 "c:/xilinx/2012.1/autoesl/win_x86/tools/llvm_gcc/bin/../lib/gcc/i686-pc-mingw32/4.2.1/../../../../include/_mingw.h" 3
#pragma empty_line
#pragma line 32 "c:/xilinx/2012.1/autoesl/win_x86/tools/llvm_gcc/bin/../lib/gcc/i686-pc-mingw32/4.2.1/../../../../include/_mingw.h" 3
#pragma empty_line
#pragma empty_line
/* These are defined by the user (or the compiler)
   to specify how identifiers are imported from a DLL.
#pragma empty_line
   __DECLSPEC_SUPPORTED            Defined if dllimport attribute is supported.
   __MINGW_IMPORT                  The attribute definition to specify imported
                                   variables/functions.
   _CRTIMP                         As above.  For MS compatibility.
   __MINGW32_VERSION               Runtime version.
   __MINGW32_MAJOR_VERSION         Runtime major version.
   __MINGW32_MINOR_VERSION         Runtime minor version.
   __MINGW32_BUILD_DATE            Runtime build date.
#pragma empty_line
   Macros to enable MinGW features which deviate from standard MSVC
   compatible behaviour; these may be specified directly in user code,
   activated implicitly, (e.g. by specifying _POSIX_C_SOURCE or such),
   or by inclusion in __MINGW_FEATURES__:
#pragma empty_line
   __USE_MINGW_ANSI_STDIO          Select a more ANSI C99 compatible
                                   implementation of printf() and friends.
#pragma empty_line
   Other macros:
#pragma empty_line
   __int64                         define to be long long.  Using a typedef
                                   doesn't work for "unsigned __int64"
#pragma empty_line
   All headers should include this first, and then use __DECLSPEC_SUPPORTED
   to choose between the old ``__imp__name'' style or __MINGW_IMPORT
   style declarations.  */
#pragma empty_line
#pragma empty_line
/* Manifest definitions identifying the flag bits, controlling activation
 * of MinGW features, as specified by the user in __MINGW_FEATURES__.
 */
#pragma empty_line
/*
 * The following three are not yet formally supported; they are
 * included here, to document anticipated future usage.
 */
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
/* Try to avoid problems with outdated checks for GCC __attribute__ support.  */
#pragma line 121 "c:/xilinx/2012.1/autoesl/win_x86/tools/llvm_gcc/bin/../lib/gcc/i686-pc-mingw32/4.2.1/../../../../include/_mingw.h" 3
   /* Note the extern. This is needed to work around GCC's
      limitations in handling dllimport attribute.  */
#pragma line 140 "c:/xilinx/2012.1/autoesl/win_x86/tools/llvm_gcc/bin/../lib/gcc/i686-pc-mingw32/4.2.1/../../../../include/_mingw.h" 3
/*
 * The next two defines can cause problems if user code adds the
 * __cdecl attribute like so:
 * void __attribute__ ((__cdecl)) foo(void); 
 */
#pragma line 230 "c:/xilinx/2012.1/autoesl/win_x86/tools/llvm_gcc/bin/../lib/gcc/i686-pc-mingw32/4.2.1/../../../../include/_mingw.h" 3
/* Attribute `nonnull' was valid as of gcc 3.3.  We don't use GCC's
   variadiac macro facility, because variadic macros cause syntax
   errors with  --traditional-cpp.  */
#pragma line 252 "c:/xilinx/2012.1/autoesl/win_x86/tools/llvm_gcc/bin/../lib/gcc/i686-pc-mingw32/4.2.1/../../../../include/_mingw.h" 3
/* TODO: Mark (almost) all CRT functions as __MINGW_NOTHROW.  This will
allow GCC to optimize away some EH unwind code, at least in DW2 case.  */
#pragma empty_line
#pragma empty_line
/*  High byte is the major version, low byte is the minor. */
#pragma empty_line
#pragma empty_line
#pragma empty_line
/* Activation of MinGW specific extended features:
 */
#pragma empty_line
/*
 * If user didn't specify it explicitly...
 */
#pragma line 277 "c:/xilinx/2012.1/autoesl/win_x86/tools/llvm_gcc/bin/../lib/gcc/i686-pc-mingw32/4.2.1/../../../../include/_mingw.h" 3
   /*
    * otherwise use whatever __MINGW_FEATURES__ specifies...
    */
#pragma line 16 "c:/xilinx/2012.1/autoesl/win_x86/tools/llvm_gcc/bin/../lib/gcc/i686-pc-mingw32/4.2.1/../../../../include/stdlib.h" 2 3
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma line 1 "c:/xilinx/2012.1/autoesl/win_x86/tools/llvm_gcc/bin/../lib/gcc/i686-pc-mingw32/4.2.1/include/stddef.h" 1 3 4
/* Copyright (C) 1989, 1997, 1998, 1999, 2000, 2002, 2004
   Free Software Foundation, Inc.
#pragma empty_line
This file is part of GCC.
#pragma empty_line
GCC is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2, or (at your option)
any later version.
#pragma empty_line
GCC is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.
#pragma empty_line
You should have received a copy of the GNU General Public License
along with GCC; see the file COPYING.  If not, write to
the Free Software Foundation, 51 Franklin Street, Fifth Floor,
Boston, MA 02110-1301, USA.  */
#pragma empty_line
/* As a special exception, if you include this header file into source
   files compiled by GCC, this header file does not by itself cause
   the resulting executable to be covered by the GNU General Public
   License.  This exception does not however invalidate any other
   reasons why the executable file might be covered by the GNU General
   Public License.  */
#pragma empty_line
/*
 * ISO C Standard:  7.17  Common definitions  <stddef.h>
 */
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
/* Any one of these symbols __need_* means that GNU libc
   wants us just to define one data type.  So don't define
   the symbols that indicate this file's entire job has been done.  */
#pragma line 52 "c:/xilinx/2012.1/autoesl/win_x86/tools/llvm_gcc/bin/../lib/gcc/i686-pc-mingw32/4.2.1/include/stddef.h" 3 4
/* This avoids lossage on SunOS but only if stdtypes.h comes first.
   There's no way to win with the other order!  Sun lossage.  */
#pragma empty_line
/* On 4.3bsd-net2, make sure ansi.h is included, so we have
   one less case to deal with in the following.  */
#pragma empty_line
#pragma empty_line
#pragma empty_line
/* On FreeBSD 5, machine/ansi.h does not exist anymore... */
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
/* In 4.3bsd-net2, machine/ansi.h defines these symbols, which are
   defined if the corresponding type is *not* defined.
   FreeBSD-2.1 defines _MACHINE_ANSI_H_ instead of _ANSI_H_ */
#pragma line 97 "c:/xilinx/2012.1/autoesl/win_x86/tools/llvm_gcc/bin/../lib/gcc/i686-pc-mingw32/4.2.1/include/stddef.h" 3 4
/* Sequent's header files use _PTRDIFF_T_ in some conflicting way.
   Just ignore it.  */
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
/* On VxWorks, <type/vxTypesBase.h> may have defined macros like
   _TYPE_size_t which will typedef size_t.  fixincludes patched the
   vxTypesBase.h so that this macro is only defined if _GCC_SIZE_T is
   not defined, and so that defining this macro defines _GCC_SIZE_T.
   If we find that the macros are still defined at this point, we must
   invoke them so that the type is defined as expected.  */
#pragma line 122 "c:/xilinx/2012.1/autoesl/win_x86/tools/llvm_gcc/bin/../lib/gcc/i686-pc-mingw32/4.2.1/include/stddef.h" 3 4
/* In case nobody has defined these types, but we aren't running under
   GCC 2.00, make sure that __PTRDIFF_TYPE__, __SIZE_TYPE__, and
   __WCHAR_TYPE__ have reasonable values.  This can happen if the
   parts of GCC is compiled by an older compiler, that actually
   include gstddef.h, such as collect2.  */
#pragma empty_line
/* Signed type of difference of two pointers.  */
#pragma empty_line
/* Define this type if we are doing the whole job,
   or if we want this type in particular.  */
#pragma line 167 "c:/xilinx/2012.1/autoesl/win_x86/tools/llvm_gcc/bin/../lib/gcc/i686-pc-mingw32/4.2.1/include/stddef.h" 3 4
/* Unsigned type of `sizeof' something.  */
#pragma empty_line
/* Define this type if we are doing the whole job,
   or if we want this type in particular.  */
#pragma line 214 "c:/xilinx/2012.1/autoesl/win_x86/tools/llvm_gcc/bin/../lib/gcc/i686-pc-mingw32/4.2.1/include/stddef.h" 3 4
typedef unsigned int size_t;
#pragma line 240 "c:/xilinx/2012.1/autoesl/win_x86/tools/llvm_gcc/bin/../lib/gcc/i686-pc-mingw32/4.2.1/include/stddef.h" 3 4
/* Wide character type.
   Locale-writers should change this as necessary to
   be big enough to hold unique values not between 0 and 127,
   and not (wchar_t) -1, for each defined multibyte character.  */
#pragma empty_line
/* Define this type if we are doing the whole job,
   or if we want this type in particular.  */
#pragma line 281 "c:/xilinx/2012.1/autoesl/win_x86/tools/llvm_gcc/bin/../lib/gcc/i686-pc-mingw32/4.2.1/include/stddef.h" 3 4
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
#pragma line 308 "c:/xilinx/2012.1/autoesl/win_x86/tools/llvm_gcc/bin/../lib/gcc/i686-pc-mingw32/4.2.1/include/stddef.h" 3 4
/* FreeBSD 5 can't be handled well using "traditional" logic above
   since it no longer defines _BSD_RUNE_T_ yet still desires to export
   rune_t in some cases... */
#pragma line 326 "c:/xilinx/2012.1/autoesl/win_x86/tools/llvm_gcc/bin/../lib/gcc/i686-pc-mingw32/4.2.1/include/stddef.h" 3 4
typedef short unsigned int wchar_t;
#pragma line 360 "c:/xilinx/2012.1/autoesl/win_x86/tools/llvm_gcc/bin/../lib/gcc/i686-pc-mingw32/4.2.1/include/stddef.h" 3 4
/*  In 4.3bsd-net2, leave these undefined to indicate that size_t, etc.
    are already defined.  */
/*  BSD/OS 3.1 and FreeBSD [23].x require the MACHINE_ANSI_H check here.  */
#pragma line 395 "c:/xilinx/2012.1/autoesl/win_x86/tools/llvm_gcc/bin/../lib/gcc/i686-pc-mingw32/4.2.1/include/stddef.h" 3 4
/* A null pointer constant.  */
#pragma line 22 "c:/xilinx/2012.1/autoesl/win_x86/tools/llvm_gcc/bin/../lib/gcc/i686-pc-mingw32/4.2.1/../../../../include/stdlib.h" 2 3
#pragma empty_line
#pragma empty_line
/*
 * RAND_MAX is the maximum value that may be returned by rand.
 * The minimum is zero.
 */
#pragma empty_line
#pragma empty_line
/*
 * These values may be used as exit status codes.
 */
#pragma empty_line
#pragma empty_line
#pragma empty_line
/*
 * Definitions for path name functions.
 * NOTE: All of these values have simply been chosen to be conservatively high.
 *       Remember that with long file names we can no longer depend on
 *       extensions being short.
 */
#pragma line 65 "c:/xilinx/2012.1/autoesl/win_x86/tools/llvm_gcc/bin/../lib/gcc/i686-pc-mingw32/4.2.1/../../../../include/stdlib.h" 3
/*
 * This seems like a convenient place to declare these variables, which
 * give programs using WinMain (or main for that matter) access to main-ish
 * argc and argv. environ is a pointer to a table of environment variables.
 * NOTE: Strings in _argv and environ are ANSI strings.
 */
extern int _argc;
extern char** _argv;
#pragma empty_line
/* imports from runtime dll of the above variables */
#pragma empty_line
#pragma empty_line
extern int* __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) __p___argc(void);
extern char*** __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) __p___argv(void);
extern wchar_t*** __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) __p___wargv(void);
#pragma line 105 "c:/xilinx/2012.1/autoesl/win_x86/tools/llvm_gcc/bin/../lib/gcc/i686-pc-mingw32/4.2.1/../../../../include/stdlib.h" 3
/*
 * Also defined in ctype.h.
 */
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
   extern __attribute__ ((__dllimport__)) int __mb_cur_max;
#pragma line 129 "c:/xilinx/2012.1/autoesl/win_x86/tools/llvm_gcc/bin/../lib/gcc/i686-pc-mingw32/4.2.1/../../../../include/stdlib.h" 3
/* 
 * MS likes to declare errno in stdlib.h as well. 
 */
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
 int* __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) _errno(void);
#pragma empty_line
#pragma empty_line
 int* __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) __doserrno(void);
#pragma empty_line
#pragma empty_line
#pragma empty_line
/*
 * Use environ from the DLL, not as a global. 
 */
#pragma empty_line
#pragma empty_line
  extern char *** __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) __p__environ(void);
  extern wchar_t *** __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) __p__wenviron(void);
#pragma line 166 "c:/xilinx/2012.1/autoesl/win_x86/tools/llvm_gcc/bin/../lib/gcc/i686-pc-mingw32/4.2.1/../../../../include/stdlib.h" 3
/* One of the MSVCRTxx libraries */
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
  extern __attribute__ ((__dllimport__)) int _sys_nerr;
#pragma line 196 "c:/xilinx/2012.1/autoesl/win_x86/tools/llvm_gcc/bin/../lib/gcc/i686-pc-mingw32/4.2.1/../../../../include/stdlib.h" 3
extern __attribute__ ((__dllimport__)) char* _sys_errlist[];
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
/*
 * OS version and such constants.
 */
#pragma empty_line
#pragma empty_line
/* msvcrtxx.dll */
#pragma empty_line
extern unsigned __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) int* __p__osver(void);
extern unsigned __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) int* __p__winver(void);
extern unsigned __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) int* __p__winmajor(void);
extern unsigned __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) int* __p__winminor(void);
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern __attribute__ ((__dllimport__)) unsigned int _osver;
extern __attribute__ ((__dllimport__)) unsigned int _winver;
extern __attribute__ ((__dllimport__)) unsigned int _winmajor;
extern __attribute__ ((__dllimport__)) unsigned int _winminor;
#pragma line 258 "c:/xilinx/2012.1/autoesl/win_x86/tools/llvm_gcc/bin/../lib/gcc/i686-pc-mingw32/4.2.1/../../../../include/stdlib.h" 3
/* although the _pgmptr is exported as DATA,
 * be safe and use the access function __p__pgmptr() to get it. */
 char** __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) __p__pgmptr(void);
#pragma empty_line
 wchar_t** __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) __p__wpgmptr(void);
#pragma line 275 "c:/xilinx/2012.1/autoesl/win_x86/tools/llvm_gcc/bin/../lib/gcc/i686-pc-mingw32/4.2.1/../../../../include/stdlib.h" 3
/*
 * This variable determines the default file mode.
 * TODO: Which flags work?
 */
#pragma line 293 "c:/xilinx/2012.1/autoesl/win_x86/tools/llvm_gcc/bin/../lib/gcc/i686-pc-mingw32/4.2.1/../../../../include/stdlib.h" 3
extern __attribute__ ((__dllimport__)) int _fmode;
#pragma line 303 "c:/xilinx/2012.1/autoesl/win_x86/tools/llvm_gcc/bin/../lib/gcc/i686-pc-mingw32/4.2.1/../../../../include/stdlib.h" 3
 double __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) atof (const char*);
 int __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) atoi (const char*);
 long __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) atol (const char*);
#pragma empty_line
 double __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) _wtof (const wchar_t *);
 int __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) _wtoi (const wchar_t *);
 long __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) _wtol (const wchar_t *);
#pragma empty_line
#pragma empty_line
double __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) __strtod (const char*, char**);
#pragma empty_line
#pragma empty_line
#pragma empty_line
static
#pragma empty_line
__inline__ double __attribute__((__cdecl__)) __attribute__ ((__nothrow__))
strtod (const char* __restrict__ __nptr, char** __restrict__ __endptr)
{
  return __strtod(__nptr, __endptr);
}
float __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) strtof (const char * __restrict__, char ** __restrict__);
long double __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) strtold (const char * __restrict__, char ** __restrict__);
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
 long __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) strtol (const char*, char**, int);
 unsigned long __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) strtoul (const char*, char**, int);
#pragma empty_line
#pragma empty_line
/*  also declared in wchar.h */
 long __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) wcstol (const wchar_t*, wchar_t**, int);
 unsigned long __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) wcstoul (const wchar_t*, wchar_t**, int);
 double __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) wcstod (const wchar_t*, wchar_t**);
#pragma empty_line
float __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) wcstof( const wchar_t * __restrict__, wchar_t ** __restrict__);
long double __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) wcstold (const wchar_t * __restrict__, wchar_t ** __restrict__);
#pragma empty_line
#pragma empty_line
 wchar_t* __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) _wgetenv(const wchar_t*);
 int __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) _wputenv(const wchar_t*);
 void __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) _wsearchenv(const wchar_t*, const wchar_t*, wchar_t*);
 int __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) _wsystem(const wchar_t*);
 void __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) _wmakepath(wchar_t*, const wchar_t*, const wchar_t*, const wchar_t*, const wchar_t*);
 void __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) _wsplitpath (const wchar_t*, wchar_t*, wchar_t*, wchar_t*, wchar_t*);
 wchar_t* __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) _wfullpath (wchar_t*, const wchar_t*, size_t);
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
 size_t __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) wcstombs (char*, const wchar_t*, size_t);
 int __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) wctomb (char*, wchar_t);
#pragma empty_line
 int __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) mblen (const char*, size_t);
 size_t __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) mbstowcs (wchar_t*, const char*, size_t);
 int __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) mbtowc (wchar_t*, const char*, size_t);
#pragma empty_line
 int __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) rand (void);
 void __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) srand (unsigned int);
#pragma empty_line
 void* __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) calloc (size_t, size_t) __attribute__ ((__malloc__));
 void* __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) malloc (size_t) __attribute__ ((__malloc__));
 void* __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) realloc (void*, size_t);
 void __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) free (void*);
 void __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) abort (void) __attribute__ ((__noreturn__));
 void __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) exit (int) __attribute__ ((__noreturn__));
#pragma empty_line
/* Note: This is in startup code, not imported directly from dll */
int __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) atexit (void (*)(void));
#pragma empty_line
 int __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) system (const char*);
 char* __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) getenv (const char*);
#pragma empty_line
/* bsearch and qsort are also in non-ANSI header search.h  */
 void* __attribute__((__cdecl__)) bsearch (const void*, const void*, size_t, size_t,
          int (*)(const void*, const void*));
 void __attribute__((__cdecl__)) qsort(void*, size_t, size_t,
      int (*)(const void*, const void*));
#pragma empty_line
 int __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) abs (int) __attribute__ ((__const__));
 long __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) labs (long) __attribute__ ((__const__));
#pragma empty_line
/*
 * div_t and ldiv_t are structures used to return the results of div and
 * ldiv.
 *
 * NOTE: div and ldiv appear not to work correctly unless
 *       -fno-pcc-struct-return is specified. This is included in the
 *       mingw32 specs file.
 */
typedef struct { int quot, rem; } div_t;
typedef struct { long quot, rem; } ldiv_t;
#pragma empty_line
 div_t __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) div (int, int) __attribute__ ((__const__));
 ldiv_t __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) ldiv (long, long) __attribute__ ((__const__));
#pragma empty_line
#pragma empty_line
#pragma empty_line
/*
 * NOTE: Officially the three following functions are obsolete. The Win32 API
 *       functions SetErrorMode, Beep and Sleep are their replacements.
 */
 void __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) _beep (unsigned int, unsigned int) __attribute__ ((__deprecated__));
/* Not to be confused with  _set_error_mode (int).  */
 void __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) _seterrormode (int) __attribute__ ((__deprecated__));
 void __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) _sleep (unsigned long) __attribute__ ((__deprecated__));
#pragma empty_line
 void __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) _exit (int) __attribute__ ((__noreturn__));
#pragma empty_line
/* _onexit is MS extension. Use atexit for portability.  */
/* Note: This is in startup code, not imported directly from dll */
typedef int (* _onexit_t)(void);
_onexit_t __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) _onexit( _onexit_t );
#pragma empty_line
 int __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) _putenv (const char*);
 void __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) _searchenv (const char*, const char*, char*);
#pragma empty_line
 char* __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) _ecvt (double, int, int*, int*);
 char* __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) _fcvt (double, int, int*, int*);
 char* __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) _gcvt (double, int, char*);
#pragma empty_line
 void __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) _makepath (char*, const char*, const char*, const char*, const char*);
 void __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) _splitpath (const char*, char*, char*, char*, char*);
 char* __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) _fullpath (char*, const char*, size_t);
#pragma empty_line
 char* __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) _itoa (int, char*, int);
 char* __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) _ltoa (long, char*, int);
 char* __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) _ultoa(unsigned long, char*, int);
 wchar_t* __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) _itow (int, wchar_t*, int);
 wchar_t* __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) _ltow (long, wchar_t*, int);
 wchar_t* __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) _ultow (unsigned long, wchar_t*, int);
#pragma empty_line
#pragma empty_line
 long long __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) _atoi64(const char *);
 char* __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) _i64toa(long long, char *, int);
 char* __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) _ui64toa(unsigned long long, char *, int);
 long long __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) _wtoi64(const wchar_t *);
 wchar_t* __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) _i64tow(long long, wchar_t *, int);
 wchar_t* __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) _ui64tow(unsigned long long, wchar_t *, int);
#pragma empty_line
 unsigned int __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) _rotl(unsigned int, int) __attribute__ ((__const__));
 unsigned int __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) _rotr(unsigned int, int) __attribute__ ((__const__));
 unsigned long __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) _lrotl(unsigned long, int) __attribute__ ((__const__));
 unsigned long __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) _lrotr(unsigned long, int) __attribute__ ((__const__));
#pragma empty_line
 int __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) _set_error_mode (int);
#pragma line 485 "c:/xilinx/2012.1/autoesl/win_x86/tools/llvm_gcc/bin/../lib/gcc/i686-pc-mingw32/4.2.1/../../../../include/stdlib.h" 3
 int __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) putenv (const char*);
 void __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) searchenv (const char*, const char*, char*);
#pragma empty_line
 char* __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) itoa (int, char*, int);
 char* __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) ltoa (long, char*, int);
#pragma empty_line
#pragma empty_line
 char* __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) ecvt (double, int, int*, int*);
 char* __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) fcvt (double, int, int*, int*);
 char* __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) gcvt (double, int, char*);
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
/* C99 names */
#pragma empty_line
#pragma empty_line
#pragma empty_line
/* C99 name for _exit */
void __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) _Exit(int) __attribute__ ((__noreturn__));
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
typedef struct { long long quot, rem; } lldiv_t;
#pragma empty_line
lldiv_t __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) lldiv (long long, long long) __attribute__ ((__const__));
#pragma empty_line
long long __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) llabs(long long);
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
long long __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) strtoll (const char* __restrict__, char** __restrict, int);
unsigned long long __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) strtoull (const char* __restrict__, char** __restrict__, int);
#pragma empty_line
#pragma empty_line
long long __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) atoll (const char *);
#pragma empty_line
#pragma empty_line
long long __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) wtoll (const wchar_t *);
char* __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) lltoa (long long, char *, int);
char* __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) ulltoa (unsigned long long , char *, int);
wchar_t* __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) lltow (long long, wchar_t *, int);
wchar_t* __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) ulltow (unsigned long long, wchar_t *, int);
#pragma empty_line
  /* inline using non-ansi functions */
#pragma line 5 "distance_squared.h" 2
#pragma empty_line
typedef double double_t;
#pragma empty_line
void distance_squared(
  const double_t * const vector1,
  const double_t * const vector2,
  const size_t vector_size,
  double_t * result
  );
#pragma line 2 "distance_squared.c" 2
#pragma empty_line
void distance_squared(const double * const vector1,
                const double * const vector2,
                const size_t vector_size,
                double * result) {
 *result = 0;
#pragma empty_line
 unsigned int i;
 for (i = 0; i < vector_size; i++) {
  const double val = vector1[i] - vector2[i];
  const double val_squared = val * val;
  *result = *result + val_squared;
 }
}
#pragma empty_line
int top_n_outlier_pruning_block(void * dummy) {
 return 0;
}
